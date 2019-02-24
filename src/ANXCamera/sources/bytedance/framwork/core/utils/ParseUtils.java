package bytedance.framwork.core.utils;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

public class ParseUtils {
    public static boolean isMatch(String str, List<String> list, List<Pattern> list2) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        if (!ListUtils.isEmpty(list)) {
            for (String contains : list) {
                if (str.contains(contains)) {
                    return true;
                }
            }
        }
        try {
            CharSequence path = new URI(str).getPath();
            if (!ListUtils.isEmpty(list2)) {
                for (Pattern matcher : list2) {
                    if (matcher.matcher(path).matches()) {
                        return true;
                    }
                }
            }
        } catch (Throwable th) {
        }
        return false;
    }

    @Nullable
    public static List<String> parseList(JSONObject jSONObject, String str) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray(str);
            List<String> arrayList;
            if (optJSONArray == null || optJSONArray.length() <= 0) {
                String optString = jSONObject.optString(str);
                arrayList = new ArrayList(1);
                arrayList.add(optString);
                return arrayList;
            }
            int length = optJSONArray.length();
            arrayList = new ArrayList(length);
            for (int i = 0; i < length; i++) {
                CharSequence string = optJSONArray.getString(i);
                if (!TextUtils.isEmpty(string)) {
                    arrayList.add(string);
                }
            }
            return arrayList;
        } catch (Exception e) {
            return null;
        }
    }

    public static List<String> parseListFromStr(JSONObject jSONObject, String str) {
        Object optString = jSONObject.optString(str, "");
        if (TextUtils.isEmpty(optString)) {
            return Collections.EMPTY_LIST;
        }
        return Arrays.asList(optString.split(","));
    }

    @Nullable
    public static List<Pattern> parsePatterns(JSONObject jSONObject, String str) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray(str);
            if (optJSONArray != null && optJSONArray.length() > 0) {
                int length = optJSONArray.length();
                List<Pattern> arrayList = new ArrayList(length);
                for (int i = 0; i < length; i++) {
                    Object string = optJSONArray.getString(i);
                    if (!TextUtils.isEmpty(string)) {
                        arrayList.add(Pattern.compile(string));
                    }
                }
                return arrayList;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
