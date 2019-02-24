package com.ss.android.ugc.effectmanager.effect.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import com.ss.android.ugc.effectmanager.common.utils.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class ComposerHelper {
    public static final String COMPOSER_CHILDREN = "nodes";
    public static final String COMPOSER_CONTENT = "content";
    public static final String COMPOSER_DEFAULT_VALUE = "default_value";
    public static final String COMPOSER_EXTRA_INFO = "extra_info";
    public static final String COMPOSER_ICON = "icon";
    public static final String COMPOSER_MAX_VALUE = "max_value";
    public static final String COMPOSER_MIN_VALUE = "min_value";
    public static final String COMPOSER_NODES = "nodes";
    public static final String COMPOSER_PATH = "file";
    public static final String COMPOSER_SWITCH_MODE = "switch_mode";
    public static final String COMPOSER_TAG_NAME = "tag_name";
    public static final String COMPOSER_TYPE = "type";
    public static final String COMPOSER_UI_NAME = "UI_name";
    public static final String COMPOSER_VERSION = "version";
    public static final String CONFIG_EFFECT = "effect";
    public static final String CONFIG_FILE_NAME = "config.json";
    public static final String CONFIG_LINK = "Link";
    public static final String CONFIG_PATH = "path";
    public static final String CONFIG_TYPE = "type";
    public static final String CONFIG_TYPE_COMPOSER = "composer";
    public static final String CONTENT_FILE_NAME = "content.json";
    public static final String DEFAULT_SERVER_URL1 = "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/";
    public static final String DEFAULT_SERVER_URL2 = "https://sf3-hscdn-tos.pstatp.com/obj/ies.fe.effect/";
    public static final String DEFAULT_SERVER_URL3 = "https://sf6-hscdn-tos.pstatp.com/obj/ies.fe.effect/";
    private static List<String> serverURLs = new ArrayList();

    static {
        serverURLs.add(DEFAULT_SERVER_URL1);
        serverURLs.add(DEFAULT_SERVER_URL2);
        serverURLs.add(DEFAULT_SERVER_URL3);
    }

    public static void setServerUrls(@NonNull List<String> list) {
        serverURLs = list;
    }

    @NonNull
    public static List<String> getServerUrls() {
        return serverURLs;
    }

    @Nullable
    public static ComposerNode parseComposerMaterial(@NonNull String str, @NonNull String str2, @NonNull String str3) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        stringBuilder.append(CONFIG_FILE_NAME);
        try {
            JSONArray jSONArray = new JSONObject(FileUtils.getFileContent(stringBuilder.toString())).getJSONObject(CONFIG_EFFECT).getJSONArray(CONFIG_LINK);
            if (jSONArray.length() <= 0) {
                return null;
            }
            int i = 0;
            String string = jSONArray.getJSONObject(0).getString(CONFIG_PATH);
            if (!jSONArray.getJSONObject(0).getString("type").toLowerCase().equals(CONFIG_TYPE_COMPOSER)) {
                return null;
            }
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(File.separator);
            stringBuilder.append(string);
            stringBuilder.append(CONTENT_FILE_NAME);
            JSONObject jSONObject = new JSONObject(FileUtils.getFileContent(stringBuilder.toString()));
            ComposerNode composerNode = new ComposerNode();
            composerNode.tag_name = "root";
            composerNode.UI_name = "Composer";
            composerNode.type = 4;
            jSONObject = jSONObject.getJSONObject(COMPOSER_CONTENT);
            composerNode.children = new ArrayList();
            jSONArray = jSONObject.getJSONArray("nodes");
            while (i < jSONArray.length()) {
                ComposerNode parseComposerNode = parseComposerNode(jSONArray.getJSONObject(i), str2, str3);
                if (parseComposerNode != null) {
                    parseComposerNode.parent = composerNode;
                }
                composerNode.children.add(parseComposerNode);
                i++;
            }
            return composerNode;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Nullable
    public static ComposerNode parseComposerNode(@NonNull JSONObject jSONObject, @NonNull String str, String str2) {
        try {
            ComposerNode composerNode = new ComposerNode();
            composerNode.type = jSONObject.getInt("type");
            composerNode.file = jSONObject.optString(COMPOSER_PATH, "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(DEFAULT_SERVER_URL1);
            stringBuilder.append(jSONObject.optString("icon", null));
            composerNode.icon = stringBuilder.toString();
            composerNode.UI_name = jSONObject.optString(COMPOSER_UI_NAME, null);
            composerNode.tag_name = jSONObject.getString(COMPOSER_TAG_NAME);
            composerNode.default_value = (float) jSONObject.optDouble(COMPOSER_DEFAULT_VALUE, 0.0d);
            composerNode.min_value = (float) jSONObject.optDouble(COMPOSER_MIN_VALUE, 0.0d);
            composerNode.max_value = (float) jSONObject.optDouble(COMPOSER_MAX_VALUE, 0.0d);
            composerNode.switch_mode = jSONObject.optInt(COMPOSER_SWITCH_MODE, 0);
            if (jSONObject.has("nodes")) {
                composerNode.children = new ArrayList();
                JSONArray jSONArray = jSONObject.getJSONArray("nodes");
                for (int i = 0; i < jSONArray.length(); i++) {
                    ComposerNode parseComposerNode = parseComposerNode(jSONArray.getJSONObject(i), str, str2);
                    if (parseComposerNode != null) {
                        parseComposerNode.parent = composerNode;
                        composerNode.children.add(parseComposerNode);
                    }
                }
                if (composerNode.children.size() == 0 || (composerNode.children.size() == 1 && ((ComposerNode) composerNode.children.get(0)).type == -1)) {
                    return null;
                }
            }
            List<String> serverUrls = getServerUrls();
            List arrayList = new ArrayList();
            for (String str3 : serverUrls) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(str3);
                stringBuilder2.append(composerNode.file);
                arrayList.add(stringBuilder2.toString());
            }
            UrlModel urlModel = new UrlModel();
            urlModel.setUrlList(arrayList);
            urlModel.setUri(composerNode.file);
            Effect effect = new Effect();
            effect.setFileUrl(urlModel);
            effect.setId(composerNode.file);
            effect.setEffectId(composerNode.file);
            stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(File.separator);
            stringBuilder.append(effect.getId());
            stringBuilder.append(com.android.camera.module.impl.component.FileUtils.SUFFIX);
            effect.setZipPath(stringBuilder.toString());
            stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(File.separator);
            stringBuilder.append(effect.getId());
            effect.setUnzipPath(stringBuilder.toString());
            composerNode.effect = effect;
            jSONObject = jSONObject.optJSONObject(COMPOSER_EXTRA_INFO);
            str2 = "0";
            if (jSONObject != null) {
                str2 = jSONObject.optString("version", "0");
            }
            if (versionCompare(str, str2) < 0) {
                return null;
            }
            return composerNode;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int versionCompare(@NonNull String str, @NonNull String str2) {
        String[] split = str.split("\\.");
        String[] split2 = str2.split("\\.");
        int i = 0;
        while (i < split.length && i < split2.length && split[i].equals(split2[i])) {
            i++;
        }
        if (i >= split.length || i >= split2.length) {
            return Integer.signum(split.length - split2.length);
        }
        return Integer.signum(Integer.valueOf(split[i]).compareTo(Integer.valueOf(split2[i])));
    }
}
