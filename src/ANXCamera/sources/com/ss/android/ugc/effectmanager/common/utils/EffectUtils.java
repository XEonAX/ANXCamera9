package com.ss.android.ugc.effectmanager.common.utils;

import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.MD5Exception;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class EffectUtils {
    public static boolean isUrlModelEmpty(UrlModel urlModel) {
        return urlModel == null || urlModel.getUrlList() == null || urlModel.getUrlList().isEmpty();
    }

    public static String convertStreamToString(InputStream inputStream) {
        StringBuilder stringBuilder = new StringBuilder();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    stringBuilder.append(readLine);
                } else {
                    try {
                        break;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            inputStream.close();
        } catch (IOException e2) {
            e2.printStackTrace();
            inputStream.close();
        } catch (Throwable th) {
            try {
                inputStream.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            throw th;
        }
        return stringBuilder.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0045 A:{SYNTHETIC, Splitter: B:30:0x0045} */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x004f A:{SYNTHETIC, Splitter: B:35:0x004f} */
    public static java.io.File convertStreamToFile(java.io.InputStream r5, java.lang.String r6) throws java.io.IOException {
        /*
        r0 = 0;
        r1 = new java.io.File;	 Catch:{ IOException -> 0x003b }
        r1.<init>(r6);	 Catch:{ IOException -> 0x003b }
        r2 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x003b }
        r2.<init>(r1);	 Catch:{ IOException -> 0x003b }
        r0 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0 = new byte[r0];	 Catch:{ IOException -> 0x0035, all -> 0x0032 }
    L_0x0011:
        r3 = r5.read(r0);	 Catch:{ IOException -> 0x0035, all -> 0x0032 }
        r4 = -1;
        if (r3 == r4) goto L_0x001d;
    L_0x0018:
        r4 = 0;
        r2.write(r0, r4, r3);	 Catch:{ IOException -> 0x0035, all -> 0x0032 }
        goto L_0x0011;
        if (r5 == 0) goto L_0x0028;
    L_0x0020:
        r5.close();	 Catch:{ IOException -> 0x0024 }
        goto L_0x0028;
    L_0x0024:
        r5 = move-exception;
        r5.printStackTrace();
        r2.close();	 Catch:{ IOException -> 0x002d }
        goto L_0x0031;
    L_0x002d:
        r5 = move-exception;
        r5.printStackTrace();
    L_0x0031:
        return r1;
    L_0x0032:
        r6 = move-exception;
        r0 = r2;
        goto L_0x0043;
    L_0x0035:
        r0 = move-exception;
        r1 = r0;
        r0 = r2;
        goto L_0x003c;
    L_0x0039:
        r6 = move-exception;
        goto L_0x0043;
    L_0x003b:
        r1 = move-exception;
    L_0x003c:
        r1.printStackTrace();	 Catch:{ all -> 0x0039 }
        com.ss.android.ugc.effectmanager.common.utils.FileUtils.removeFile(r6);	 Catch:{ all -> 0x0039 }
        throw r1;	 Catch:{ all -> 0x0039 }
    L_0x0043:
        if (r5 == 0) goto L_0x004d;
    L_0x0045:
        r5.close();	 Catch:{ IOException -> 0x0049 }
        goto L_0x004d;
    L_0x0049:
        r5 = move-exception;
        r5.printStackTrace();
    L_0x004d:
        if (r0 == 0) goto L_0x0057;
    L_0x004f:
        r0.close();	 Catch:{ IOException -> 0x0053 }
        goto L_0x0057;
    L_0x0053:
        r5 = move-exception;
        r5.printStackTrace();
    L_0x0057:
        throw r6;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.common.utils.EffectUtils.convertStreamToFile(java.io.InputStream, java.lang.String):java.io.File");
    }

    public static void throwIllegalNullException(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" should not null");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public static boolean isEffectValid(Effect effect) {
        if (effect == null) {
            return false;
        }
        return isUrlModelEmpty(effect.getFileUrl()) ^ 1;
    }

    public static List<String> getUrl(UrlModel urlModel) {
        if (urlModel == null || isUrlModelEmpty(urlModel)) {
            return new ArrayList();
        }
        return urlModel.getUrlList();
    }

    public static void downloadEffect(EffectConfiguration effectConfiguration, Effect effect) throws Exception {
        List url = getUrl(effect.getFileUrl());
        if (url == null || url.isEmpty() || isUrlModelEmpty(effect.getFileUrl())) {
            throw new Exception(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
        }
        int i = 0;
        while (i < url.size()) {
            try {
                String fileMD5 = MD5Utils.getFileMD5(download(effectConfiguration, (String) url.get(i), effect.getZipPath()));
                if (fileMD5.equals(effect.getFileUrl().getUri())) {
                    FileUtils.unZip(effect.getZipPath(), effect.getUnzipPath());
                    return;
                }
                FileUtils.removeFile(effect.getZipPath());
                if (i != url.size() - 1) {
                    i++;
                } else {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("downloadMD5: ");
                    stringBuilder.append(fileMD5);
                    stringBuilder.append(" expectMD5:");
                    stringBuilder.append(effect.getFileUrl().getUri());
                    throw new MD5Exception(stringBuilder.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
                if (i == url.size() - 1) {
                    throw e;
                }
            }
        }
    }

    private static File download(EffectConfiguration effectConfiguration, String str, String str2) throws Exception {
        InputStream execute = effectConfiguration.getEffectNetWorker().execute(new EffectRequest("GET", str));
        if (execute != null) {
            return convertStreamToFile(execute, str2);
        }
        throw new Exception(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
    }
}
