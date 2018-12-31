package com.android.camera.module.impl.component;

import android.content.Context;
import android.content.res.AssetManager;
import android.os.Environment;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtils {
    public static final String BEAUTY_12_DIR;
    public static final String BEAUTY_12_FILENAME = "Beauty_12.zip";
    public static final String CACHE;
    public static final String CONCAT_VIDEO_DIR;
    public static final String DOC;
    public static final String FACE_RESHAPE = "FaceReshape_V2.zip";
    public static final String FILTER;
    public static final String FILTER_DIR;
    public static final String MODELS_DIR;
    public static final String MUSIC;
    public static final String MUSIC_EFFECT_DIR = RESOURCE_DIR;
    public static final String MUSIC_LOCAL;
    public static final String MUSIC_ONLINE;
    public static final String RESHAPE_DIR_NAME;
    public static final String RESOURCE_DIR;
    public static final String ROOT_DIR;
    public static List<String> ResourcesList = new ArrayList();
    public static final String STICKER_RESOURCE_DIR;
    public static final String SUFFIX = ".zip";
    public static final String VIDEO_TMP;
    public static final List<String> musicList = new ArrayList();

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Environment.getExternalStorageDirectory().getPath());
        stringBuilder.append("/RecordDemo/");
        ROOT_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("resource/");
        RESOURCE_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(RESOURCE_DIR);
        stringBuilder.append("stickers/");
        STICKER_RESOURCE_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("algorithmResource/");
        MODELS_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("tmp/");
        VIDEO_TMP = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("video/");
        CONCAT_VIDEO_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("/cache/");
        CACHE = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("music/");
        MUSIC = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("doc/");
        DOC = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(RESOURCE_DIR);
        stringBuilder.append("filter/");
        FILTER_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(FILTER_DIR);
        stringBuilder.append("Filter_02/");
        FILTER = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(RESOURCE_DIR);
        stringBuilder.append("Beauty_12/");
        BEAUTY_12_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(RESOURCE_DIR);
        stringBuilder.append("FaceReshape_V2/");
        RESHAPE_DIR_NAME = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(MUSIC);
        stringBuilder.append("/local/");
        MUSIC_LOCAL = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(MUSIC);
        stringBuilder.append("/online/");
        MUSIC_ONLINE = stringBuilder.toString();
        ResourcesList.add("2D_angel");
        ResourcesList.add("2D_bubble");
        ResourcesList.add("E12_3D_Glass_Crystal_a02");
        ResourcesList.add("E12_3D_hat_fj_a01_155");
        ResourcesList.add("E12_D_Glass_Diamond_a01");
        ResourcesList.add("E12_D_glasses_cobain_a02");
        ResourcesList.add("05311139_wuyun");
        ResourcesList.add("05311201");
        ResourcesList.add("05311202");
        musicList.add("music00001.mp3");
        musicList.add("music00002.mp3");
        musicList.add("music00003.mp3");
        musicList.add("music00004.mp3");
    }

    public static void copyFile(File file, File file2) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        FileOutputStream fileOutputStream = new FileOutputStream(file2);
        FileChannel channel = fileInputStream.getChannel();
        channel.transferTo(0, channel.size(), fileOutputStream.getChannel());
        fileInputStream.close();
        fileOutputStream.close();
    }

    public static boolean copyFileIfNeed(Context context, String str, String str2) {
        return copyFileIfNeed(context, str, str2, str2);
    }

    private static boolean copyFileIfNeed(Context context, String str, String str2, String str3) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("live/");
        stringBuilder.append(str2);
        str2 = stringBuilder.toString();
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(str3);
        str = stringBuilder.toString();
        if (!str.isEmpty()) {
            File file2 = new File(str);
            if (!file2.exists()) {
                try {
                    file2.createNewFile();
                    InputStream open = context.getApplicationContext().getAssets().open(str2);
                    if (open == null) {
                        return false;
                    }
                    OutputStream fileOutputStream = new FileOutputStream(file2);
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
                } catch (IOException e) {
                    file2.delete();
                    return false;
                }
            }
        }
        return true;
    }

    public static boolean copyAssetsDirectory(Context context, String str, String str2) {
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        AssetManager assets = context.getAssets();
        try {
            int i = 0;
            if (str.endsWith("/")) {
                str = str.substring(0, str.length() - 1);
            }
            String[] list = assets.list(str);
            int length = list.length;
            while (i < length) {
                String str3 = list[i];
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(File.separator);
                stringBuilder.append(str3);
                String stringBuilder2 = stringBuilder.toString();
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(str2);
                stringBuilder3.append(File.separator);
                stringBuilder3.append(str3);
                String stringBuilder4 = stringBuilder3.toString();
                try {
                    InputStream open = assets.open(stringBuilder2);
                    StringBuilder stringBuilder5 = new StringBuilder();
                    stringBuilder5.append(str2);
                    stringBuilder5.append(File.separator);
                    copyFileIfNeed(context, stringBuilder5.toString(), stringBuilder2, str3);
                    open.close();
                } catch (FileNotFoundException e) {
                    copyAssetsDirectory(context, stringBuilder2, stringBuilder4);
                }
                i++;
            }
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return true;
    }

    public static File getOutputMediaFile() {
        File file = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "Camera");
        if (file.exists() || file.mkdirs()) {
            String format = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.CHINESE).format(new Date());
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(file.getPath());
            stringBuilder.append(File.separator);
            stringBuilder.append("IMG_");
            stringBuilder.append(format);
            stringBuilder.append(Storage.JPEG_SUFFIX);
            return new File(stringBuilder.toString());
        }
        Log.e("FileUtil", "failed to create directory");
        return null;
    }

    public static boolean makeDir(String str) {
        if (str.isEmpty()) {
            return false;
        }
        File file = new File(str);
        if (file.exists()) {
            return false;
        }
        return file.mkdirs();
    }

    public static boolean delDir(String str) {
        boolean z = false;
        if (str.isEmpty()) {
            return false;
        }
        File file = new File(str);
        if (!file.isFile() && file.exists() && deleteDir(file)) {
            z = true;
        }
        return z;
    }

    public static boolean hasDir(String str) {
        File file = new File(str);
        return file.exists() && file.isDirectory();
    }

    private static void doDeleteEmptyDir(String str) {
        PrintStream printStream;
        StringBuilder stringBuilder;
        if (new File(str).delete()) {
            printStream = System.out;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Successfully deleted empty directory: ");
            stringBuilder.append(str);
            printStream.println(stringBuilder.toString());
            return;
        }
        printStream = System.out;
        stringBuilder = new StringBuilder();
        stringBuilder.append("Failed to delete empty directory: ");
        stringBuilder.append(str);
        printStream.println(stringBuilder.toString());
    }

    private static boolean deleteDir(File file) {
        if (file.isDirectory()) {
            String[] list = file.list();
            for (String file2 : list) {
                if (!deleteDir(new File(file, file2))) {
                    return false;
                }
            }
        }
        return file.delete();
    }

    private static boolean hasParentDir(InputStream inputStream) throws IOException {
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        boolean z = true;
        while (true) {
            ZipEntry nextEntry = zipInputStream.getNextEntry();
            if (nextEntry == null) {
                zipInputStream.close();
                return z;
            } else if (nextEntry.getName().equals("config.json")) {
                z = false;
            }
        }
    }

    private static void UnZipFolder(InputStream inputStream, String str) throws Exception {
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        while (true) {
            ZipEntry nextEntry = zipInputStream.getNextEntry();
            if (nextEntry == null) {
                break;
            }
            String name = nextEntry.getName();
            if (nextEntry.isDirectory()) {
                String substring = name.substring(0, name.length() - 1);
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(File.separator);
                stringBuilder.append(substring);
                File file = new File(stringBuilder.toString());
                if (!file.exists()) {
                    file.mkdirs();
                }
            } else {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(str);
                stringBuilder2.append(File.separator);
                stringBuilder2.append(name);
                File file2 = new File(stringBuilder2.toString());
                if (file2.exists()) {
                    break;
                }
                file2.createNewFile();
                FileOutputStream fileOutputStream = new FileOutputStream(file2);
                byte[] bArr = new byte[1024];
                while (true) {
                    int read = zipInputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                    fileOutputStream.flush();
                }
                fileOutputStream.close();
            }
        }
        zipInputStream.close();
    }

    public static void UnZipAssetFolder(Context context, String str, String str2) throws Exception {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("live/");
        stringBuilder.append(str);
        str = stringBuilder.toString();
        InputStream open = context.getAssets().open(str);
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        } else if (file.isFile()) {
            file.delete();
            file.mkdirs();
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str2);
        stringBuilder2.append(File.separator);
        stringBuilder2.append(GetFileName(str));
        file = new File(stringBuilder2.toString());
        if (file.exists()) {
            deleteDir(file);
        }
        file.mkdirs();
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(str2);
        stringBuilder3.append(GetFileName(str));
        str2 = stringBuilder3.toString();
        open.close();
        UnZipFolder(context.getAssets().open(str), str2);
    }

    public static int UnZipFileFolder(String str, String str2) throws Exception {
        InputStream fileInputStream = new FileInputStream(new File(str));
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        } else if (file.isFile()) {
            file.delete();
            file.mkdirs();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append(File.separator);
        stringBuilder.append(GetFileName(str));
        file = new File(stringBuilder.toString());
        if (file.exists()) {
            deleteDir(file);
        }
        file.mkdirs();
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str2);
        stringBuilder2.append(File.separator);
        stringBuilder2.append(GetFileName(str));
        str2 = stringBuilder2.toString();
        fileInputStream.close();
        UnZipFolder(new FileInputStream(new File(str)), str2);
        return 0;
    }

    public static String GetFileName(String str) {
        int lastIndexOf = str.lastIndexOf("/");
        int lastIndexOf2 = str.lastIndexOf(".");
        if (lastIndexOf2 != -1) {
            return str.substring(lastIndexOf + 1, lastIndexOf2);
        }
        return null;
    }

    public static synchronized String createtFileName(String str, String str2) {
        synchronized (FileUtils.class) {
            String format = new SimpleDateFormat("MMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(format);
            stringBuilder.append('.');
            stringBuilder.append(str2);
            str = stringBuilder.toString();
        }
        return str;
    }

    public static void makeSureNoMedia(String str) {
        try {
            new File(str, Storage.AVOID_SCAN_FILE_NAME).createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
