package com.android.camera.sticker;

import android.content.Context;
import android.text.TextUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtils {
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0085 A:{SYNTHETIC, Splitter: B:52:0x0085} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x008f A:{SYNTHETIC, Splitter: B:57:0x008f} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x009e A:{SYNTHETIC, Splitter: B:66:0x009e} */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00a8 A:{SYNTHETIC, Splitter: B:71:0x00a8} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0085 A:{SYNTHETIC, Splitter: B:52:0x0085} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x008f A:{SYNTHETIC, Splitter: B:57:0x008f} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x009e A:{SYNTHETIC, Splitter: B:66:0x009e} */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00a8 A:{SYNTHETIC, Splitter: B:71:0x00a8} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean copyFileIfNeed(Context context, File file, String str) {
        InputStream inputStream;
        Throwable th;
        if (!(file == null || TextUtils.isEmpty(str))) {
            File parentFile = file.getParentFile();
            if (!parentFile.exists()) {
                parentFile.mkdirs();
            }
            if (!file.exists()) {
                OutputStream outputStream = null;
                InputStream open;
                OutputStream fileOutputStream;
                try {
                    if (file.exists()) {
                        file.delete();
                    }
                    file.createNewFile();
                    open = context.getAssets().open(str);
                    if (open == null) {
                        if (open != null) {
                            try {
                                open.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        return false;
                    }
                    try {
                        fileOutputStream = new FileOutputStream(file);
                        try {
                            byte[] bArr = new byte[4096];
                            while (true) {
                                int read = open.read(bArr);
                                if (read <= 0) {
                                    break;
                                }
                                fileOutputStream.write(bArr, 0, read);
                            }
                            open.close();
                            fileOutputStream.close();
                            if (open != null) {
                                try {
                                    open.close();
                                } catch (IOException e2) {
                                    e2.printStackTrace();
                                }
                            }
                            try {
                                fileOutputStream.close();
                            } catch (IOException e22) {
                                e22.printStackTrace();
                            }
                        } catch (IOException e3) {
                            inputStream = open;
                            try {
                                file.delete();
                                if (inputStream != null) {
                                }
                                if (fileOutputStream != null) {
                                }
                                return false;
                            } catch (Throwable th2) {
                                th = th2;
                                open = inputStream;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            outputStream = fileOutputStream;
                            if (open != null) {
                            }
                            if (outputStream != null) {
                            }
                            throw th;
                        }
                    } catch (IOException e4) {
                        fileOutputStream = null;
                        inputStream = open;
                        file.delete();
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e222) {
                                e222.printStackTrace();
                            }
                        }
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (IOException e2222) {
                                e2222.printStackTrace();
                            }
                        }
                        return false;
                    } catch (Throwable th4) {
                        th = th4;
                        if (open != null) {
                            try {
                                open.close();
                            } catch (IOException e22222) {
                                e22222.printStackTrace();
                            }
                        }
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e222222) {
                                e222222.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (IOException e5) {
                    fileOutputStream = null;
                    file.delete();
                    if (inputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    return false;
                } catch (Throwable th22) {
                    th = th22;
                    open = null;
                    if (open != null) {
                    }
                    if (outputStream != null) {
                    }
                    throw th;
                }
            }
        }
        return true;
    }
}
