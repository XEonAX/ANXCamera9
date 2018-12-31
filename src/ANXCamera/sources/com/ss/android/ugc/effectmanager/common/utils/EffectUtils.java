package com.ss.android.ugc.effectmanager.common.utils;

import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.MD5Exception;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static File convertStreamToFile(InputStream inputStream, String str) throws IOException {
        IOException e;
        Throwable th;
        OutputStream outputStream = null;
        try {
            File file = new File(str);
            OutputStream fileOutputStream = new FileOutputStream(file);
            try {
                byte[] bArr = new byte[4096];
                while (true) {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                }
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
                try {
                    fileOutputStream.close();
                } catch (IOException e22) {
                    e22.printStackTrace();
                }
                return file;
            } catch (IOException e3) {
                e = e3;
                outputStream = fileOutputStream;
                try {
                    e.printStackTrace();
                    FileUtils.removeFile(str);
                    throw e;
                } catch (Throwable th2) {
                    th = th2;
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e222) {
                            e222.printStackTrace();
                        }
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e2222) {
                            e2222.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                outputStream = fileOutputStream;
                if (inputStream != null) {
                }
                if (outputStream != null) {
                }
                throw th;
            }
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
            FileUtils.removeFile(str);
            throw e;
        }
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
