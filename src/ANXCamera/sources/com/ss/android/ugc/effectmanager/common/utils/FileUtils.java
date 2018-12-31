package com.ss.android.ugc.effectmanager.common.utils;

import android.os.Environment;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.exception.UnzipException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtils {
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0045 A:{SYNTHETIC, Splitter: B:32:0x0045} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void writeToExternal(String str, String str2) {
        IOException e;
        Exception e2;
        Throwable th;
        synchronized (FileUtils.class) {
            File file = new File(str2);
            if (!file.exists()) {
                createFile(file.getPath(), true);
            }
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(file);
                try {
                    fileOutputStream2.write(str.getBytes());
                    try {
                        fileOutputStream2.close();
                    } catch (IOException e3) {
                        e = e3;
                    }
                } catch (Exception e4) {
                    e2 = e4;
                    fileOutputStream = fileOutputStream2;
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Exception e5) {
                e2 = e5;
                try {
                    e2.printStackTrace();
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e6) {
                            e = e6;
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e7) {
                            e7.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        }
        e.printStackTrace();
    }

    public static File createFile(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.exists()) {
            if (z) {
                try {
                    File parentFile = file.getParentFile();
                    if (!parentFile.exists()) {
                        parentFile.mkdirs();
                    }
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                file.mkdirs();
            }
        }
        return file;
    }

    public static boolean isSdcardAvailable() {
        String externalStorageState = Environment.getExternalStorageState();
        return "mounted".equals(externalStorageState) || "mounted_ro".equals(externalStorageState);
    }

    public static boolean isSdcardWritable() {
        try {
            return "mounted".equals(Environment.getExternalStorageState());
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean ensureDirExists(File file) {
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.exists();
    }

    public static boolean checkFileExists(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return new File(str).exists();
    }

    public static boolean removeFile(String str) {
        boolean z = false;
        if (!isSdcardWritable() || TextUtils.isEmpty(str)) {
            return false;
        }
        File file = new File(str);
        if (file.exists() && file.canWrite() && file.delete()) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void unZip(String str, String str2) throws UnzipException {
        IOException e;
        Throwable th;
        BufferedOutputStream bufferedOutputStream = null;
        ZipInputStream zipInputStream;
        BufferedOutputStream bufferedOutputStream2;
        try {
            zipInputStream = new ZipInputStream(new BufferedInputStream(new FileInputStream(str)));
            while (true) {
                try {
                    ZipEntry nextEntry = zipInputStream.getNextEntry();
                    if (nextEntry != null) {
                        String name = nextEntry.getName();
                        StringBuilder stringBuilder;
                        if (nextEntry.isDirectory()) {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append(str2);
                            stringBuilder.append(File.separator);
                            stringBuilder.append(name);
                            new File(stringBuilder.toString()).mkdirs();
                        } else {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append(str2);
                            stringBuilder.append(File.separator);
                            stringBuilder.append(name);
                            File file = new File(stringBuilder.toString());
                            if (file.exists()) {
                                file.delete();
                            } else {
                                file.getParentFile().mkdirs();
                            }
                            file.createNewFile();
                            bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(file));
                            try {
                                byte[] bArr = new byte[2048];
                                while (true) {
                                    int read = zipInputStream.read(bArr);
                                    if (read == -1) {
                                        break;
                                    }
                                    bufferedOutputStream2.write(bArr, 0, read);
                                }
                                bufferedOutputStream2.flush();
                                bufferedOutputStream = bufferedOutputStream2;
                            } catch (IOException e2) {
                                e = e2;
                                bufferedOutputStream = zipInputStream;
                                try {
                                    throw new UnzipException(e.getMessage());
                                } catch (Throwable th2) {
                                    th = th2;
                                    zipInputStream = bufferedOutputStream;
                                    bufferedOutputStream = bufferedOutputStream2;
                                    if (zipInputStream != null) {
                                        try {
                                            zipInputStream.close();
                                        } catch (IOException e3) {
                                            e3.printStackTrace();
                                            throw th;
                                        }
                                    }
                                    if (bufferedOutputStream != null) {
                                        bufferedOutputStream.close();
                                    }
                                    throw th;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                bufferedOutputStream = bufferedOutputStream2;
                                if (zipInputStream != null) {
                                }
                                if (bufferedOutputStream != null) {
                                }
                                throw th;
                            }
                        }
                    }
                    try {
                        break;
                    } catch (IOException e4) {
                        e4.printStackTrace();
                        return;
                    }
                } catch (IOException e5) {
                    e4 = e5;
                    bufferedOutputStream2 = bufferedOutputStream;
                    bufferedOutputStream = zipInputStream;
                    throw new UnzipException(e4.getMessage());
                } catch (Throwable th4) {
                    th = th4;
                    if (zipInputStream != null) {
                    }
                    if (bufferedOutputStream != null) {
                    }
                    throw th;
                }
            }
            zipInputStream.close();
            if (bufferedOutputStream != null) {
                bufferedOutputStream.close();
            }
        } catch (IOException e6) {
            e4 = e6;
            bufferedOutputStream2 = null;
            throw new UnzipException(e4.getMessage());
        } catch (Throwable th5) {
            th = th5;
            zipInputStream = null;
            if (zipInputStream != null) {
            }
            if (bufferedOutputStream != null) {
            }
            throw th;
        }
    }

    public static String combineFilePath(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        if (TextUtils.isEmpty(str)) {
            str = "";
        }
        stringBuilder.append(str);
        if (TextUtils.isEmpty(str2)) {
            str2 = "";
        }
        stringBuilder.append(str2);
        return stringBuilder.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x0060 A:{SYNTHETIC, Splitter: B:32:0x0060} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x006a A:{SYNTHETIC, Splitter: B:37:0x006a} */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0072 A:{SYNTHETIC, Splitter: B:42:0x0072} */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x007c A:{SYNTHETIC, Splitter: B:47:0x007c} */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0060 A:{SYNTHETIC, Splitter: B:32:0x0060} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x006a A:{SYNTHETIC, Splitter: B:37:0x006a} */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0072 A:{SYNTHETIC, Splitter: B:42:0x0072} */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x007c A:{SYNTHETIC, Splitter: B:47:0x007c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static String getFileContent(String str) {
        Exception e;
        Throwable th;
        File file = new File(str);
        if (!checkFileExists(file.getPath())) {
            return "";
        }
        str = "";
        FileReader fileReader;
        BufferedReader bufferedReader;
        try {
            fileReader = new FileReader(file);
            try {
                bufferedReader = new BufferedReader(fileReader);
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine != null) {
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append(str);
                            stringBuilder.append(readLine);
                            str = stringBuilder.toString();
                        } else {
                            try {
                                break;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        try {
                            e.printStackTrace();
                            if (fileReader != null) {
                            }
                            if (bufferedReader != null) {
                            }
                            return str;
                        } catch (Throwable th2) {
                            th = th2;
                            if (fileReader != null) {
                            }
                            if (bufferedReader != null) {
                            }
                            throw th;
                        }
                    }
                }
                fileReader.close();
            } catch (Exception e4) {
                e = e4;
                bufferedReader = null;
                e.printStackTrace();
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (IOException e22) {
                        e22.printStackTrace();
                    }
                }
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                return str;
            } catch (Throwable th3) {
                th = th3;
                bufferedReader = null;
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (IOException e222) {
                        e222.printStackTrace();
                    }
                }
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                throw th;
            }
            try {
                bufferedReader.close();
            } catch (IOException e52) {
                e52.printStackTrace();
            }
        } catch (Exception e42) {
            fileReader = null;
            e = e42;
            bufferedReader = fileReader;
            e.printStackTrace();
            if (fileReader != null) {
            }
            if (bufferedReader != null) {
            }
            return str;
        } catch (Throwable th4) {
            th = th4;
            bufferedReader = null;
            fileReader = bufferedReader;
            if (fileReader != null) {
            }
            if (bufferedReader != null) {
            }
            throw th;
        }
        return str;
    }

    public static InputStream getFileStream(String str) {
        File file = new File(str);
        if (!checkFileExists(file.getPath())) {
            return null;
        }
        InputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (Exception e) {
            e.printStackTrace();
            fileInputStream = null;
        }
        return fileInputStream;
    }

    public static void removeDir(File file) {
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null && listFiles.length != 0) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        removeDir(file2);
                    } else {
                        file2.delete();
                    }
                }
            }
        }
    }
}
