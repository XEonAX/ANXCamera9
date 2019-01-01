package com.android.camera;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import com.android.camera.log.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class FileCompat {
    static final FileCompatCommonImpl IMPL_COMMON;
    static final FileCompatOperateImpl IMPL_OPERATE;
    public static final int REQUEST_CODE_OPEN_EXTERNAL_DOCUMENT_PERMISSION = 161;
    public static final String TAG = "FileCompat";

    interface FileCompatOperateImpl {
        boolean copyFile(String str, String str2);

        boolean createNewFile(String str);

        String createNewFileFixPath(String str);

        FileWrapper createNewFileWrapper(String str);

        boolean deleteFile(String str);

        boolean exists(String str);

        OutputStream getFileOutputStream(String str, boolean z);

        ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException;

        boolean mkdirs(String str);

        boolean renameFile(String str, String str2) throws IOException;
    }

    static class BaseFileCompatImpl implements FileCompatOperateImpl {
        BaseFileCompatImpl() {
        }

        public boolean createNewFile(String str) {
            try {
                return new File(str).createNewFile();
            } catch (Throwable e) {
                Log.w(FileCompat.TAG, "createNewFile error", e);
                return false;
            }
        }

        public String createNewFileFixPath(String str) {
            return createNewFile(str) ? str : null;
        }

        public boolean deleteFile(String str) {
            return new File(str).delete();
        }

        public boolean renameFile(String str, String str2) throws IOException {
            return new File(str).renameTo(new File(str2));
        }

        public boolean mkdirs(String str) {
            return new File(str).mkdirs();
        }

        public OutputStream getFileOutputStream(String str, boolean z) {
            if (!z && !exists(str)) {
                return null;
            }
            try {
                return new FileOutputStream(new File(str));
            } catch (Exception e) {
                String str2 = FileCompat.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("getFileOutputStream error, path = ");
                stringBuilder.append(str);
                Log.w(str2, stringBuilder.toString());
                return null;
            }
        }

        public ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
            return CameraAppImpl.getAndroidContext().getContentResolver().openFileDescriptor(Uri.fromFile(new File(str)), "rw");
        }

        public boolean exists(String str) {
            return new File(str).exists();
        }

        /* JADX WARNING: Removed duplicated region for block: B:47:0x0066 A:{SYNTHETIC, Splitter: B:47:0x0066} */
        /* JADX WARNING: Removed duplicated region for block: B:51:0x006d A:{SYNTHETIC, Splitter: B:51:0x006d} */
        /* JADX WARNING: Removed duplicated region for block: B:58:0x007d A:{SYNTHETIC, Splitter: B:58:0x007d} */
        /* JADX WARNING: Removed duplicated region for block: B:62:0x0084 A:{SYNTHETIC, Splitter: B:62:0x0084} */
        /* JADX WARNING: Removed duplicated region for block: B:47:0x0066 A:{SYNTHETIC, Splitter: B:47:0x0066} */
        /* JADX WARNING: Removed duplicated region for block: B:51:0x006d A:{SYNTHETIC, Splitter: B:51:0x006d} */
        /* JADX WARNING: Removed duplicated region for block: B:58:0x007d A:{SYNTHETIC, Splitter: B:58:0x007d} */
        /* JADX WARNING: Removed duplicated region for block: B:62:0x0084 A:{SYNTHETIC, Splitter: B:62:0x0084} */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean copyFile(String str, String str2) {
            Throwable e;
            FileInputStream fileInputStream = null;
            OutputStream fileOutputStream;
            try {
                FileInputStream fileInputStream2 = new FileInputStream(str);
                try {
                    fileOutputStream = getFileOutputStream(str2, false);
                    if (fileOutputStream == null) {
                        try {
                            fileInputStream2.close();
                        } catch (Exception e2) {
                        }
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (Throwable e3) {
                                Log.w(FileCompat.TAG, "copyFile error", e3);
                            }
                        }
                        return false;
                    }
                    try {
                        byte[] bArr = new byte[4096];
                        while (true) {
                            int read = fileInputStream2.read(bArr);
                            if (read != -1) {
                                fileOutputStream.write(bArr, 0, read);
                            } else {
                                try {
                                    break;
                                } catch (Exception e4) {
                                }
                            }
                        }
                        fileInputStream2.close();
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (Throwable e32) {
                                Log.w(FileCompat.TAG, "copyFile error", e32);
                            }
                        }
                        return true;
                    } catch (Exception e5) {
                        e = e5;
                        fileInputStream = fileInputStream2;
                        try {
                            Log.w(FileCompat.TAG, "copyFile error", e);
                            if (fileInputStream != null) {
                            }
                            if (fileOutputStream != null) {
                            }
                            return false;
                        } catch (Throwable th) {
                            e = th;
                        }
                    } catch (Throwable th2) {
                        e = th2;
                        fileInputStream = fileInputStream2;
                        if (fileInputStream != null) {
                        }
                        if (fileOutputStream != null) {
                        }
                        throw e;
                    }
                } catch (Exception e6) {
                    e = e6;
                    fileOutputStream = null;
                    fileInputStream = fileInputStream2;
                    Log.w(FileCompat.TAG, "copyFile error", e);
                    if (fileInputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    return false;
                } catch (Throwable th3) {
                    e = th3;
                    fileOutputStream = null;
                    fileInputStream = fileInputStream2;
                    if (fileInputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    throw e;
                }
            } catch (Exception e7) {
                e = e7;
                fileOutputStream = null;
                Log.w(FileCompat.TAG, "copyFile error", e);
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (Exception e8) {
                    }
                }
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Throwable e322) {
                        Log.w(FileCompat.TAG, "copyFile error", e322);
                    }
                }
                return false;
            } catch (Throwable th4) {
                e = th4;
                fileOutputStream = null;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (Exception e9) {
                    }
                }
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Throwable e3222) {
                        Log.w(FileCompat.TAG, "copyFile error", e3222);
                    }
                }
                throw e;
            }
        }

        public FileWrapper createNewFileWrapper(String str) {
            return null;
        }
    }

    interface FileCompatCommonImpl {
        String getSDPath(String str);

        boolean getStorageAccessForLOLLIPOP(Activity activity, String str);

        Uri getTreeUri(String str);

        boolean handleActivityResult(Activity activity, int i, int i2, Intent intent);

        boolean hasStoragePermission(String str);

        boolean isExternalSDFile(String str);

        void updateSDPath();
    }

    static class FileWrapper {
        DocumentFile documentFile;
        File legacyFile;

        FileWrapper() {
        }

        public long getLength() {
            return this.legacyFile.length();
        }
    }

    static class KitKatFileCompatCommonImpl implements FileCompatCommonImpl {
        protected String accessSDPath;
        protected String[] sdPaths;

        public KitKatFileCompatCommonImpl() {
            update();
        }

        protected void update() {
            this.sdPaths = getExtSDCardPaths();
        }

        @TargetApi(19)
        protected String[] getExtSDCardPaths() {
            String[] strArr = new String[0];
            File[] externalFilesDirs = CameraAppImpl.getAndroidContext().getExternalFilesDirs("ExternalTest");
            if (externalFilesDirs == null) {
                return strArr;
            }
            String absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
            List arrayList = new ArrayList();
            for (File file : externalFilesDirs) {
                if (file != null) {
                    String absolutePath2 = file.getAbsolutePath();
                    int lastIndexOf = absolutePath2.lastIndexOf("/Android/data");
                    if (lastIndexOf > 0) {
                        absolutePath2 = absolutePath2.substring(0, lastIndexOf);
                        if (!absolutePath.startsWith(absolutePath2)) {
                            arrayList.add(absolutePath2);
                        }
                    }
                }
            }
            if (!arrayList.isEmpty()) {
                strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
            }
            return strArr;
        }

        public boolean isExternalSDFile(String str) {
            if (this.sdPaths == null) {
                return false;
            }
            for (String startsWith : this.sdPaths) {
                if (str.startsWith(startsWith)) {
                    return true;
                }
            }
            return false;
        }

        public String getSDPath(String str) {
            if (this.sdPaths == null) {
                return null;
            }
            for (String str2 : this.sdPaths) {
                if (str.startsWith(str2)) {
                    return str2;
                }
            }
            return null;
        }

        public boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
            return false;
        }

        public boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
            return false;
        }

        public Uri getTreeUri(String str) {
            return null;
        }

        public boolean hasStoragePermission(String str) {
            return true;
        }

        public void updateSDPath() {
            update();
        }
    }

    static class LollipopFileCompatCommonImpl extends KitKatFileCompatCommonImpl {
        private static final String SD_PATH_TREE_URI = "sd_path_tree_uri";

        public LollipopFileCompatCommonImpl() {
            update();
        }

        public Uri getTreeUri(String str) {
            str = CameraAppImpl.getAndroidContext().getSharedPreferences(SD_PATH_TREE_URI, 0).getString(str, null);
            if (str == null) {
                return null;
            }
            return Uri.parse(str);
        }

        @TargetApi(21)
        public boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
            String[] extSDCardPaths = getExtSDCardPaths();
            if (extSDCardPaths == null || extSDCardPaths.length == 0) {
                return false;
            }
            for (String str2 : extSDCardPaths) {
                if (str.startsWith(str2)) {
                    this.accessSDPath = str2;
                    break;
                }
            }
            List storageVolumes = ((StorageManager) activity.getSystemService("storage")).getStorageVolumes();
            if (storageVolumes.size() > 1) {
                Intent createAccessIntent = ((StorageVolume) storageVolumes.get(1)).createAccessIntent(Environment.DIRECTORY_DCIM);
                if (createAccessIntent == null) {
                    Log.w(FileCompat.TAG, "getStorageAccessForLOLLIPOP error, intent is null");
                    return false;
                }
                try {
                    activity.startActivityForResult(createAccessIntent, 161);
                } catch (Throwable e) {
                    Log.w(FileCompat.TAG, "getStorageAccessForLOLLIPOP error", e);
                }
            }
            return true;
        }

        @TargetApi(19)
        public boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
            if (i == 161 && i2 == -1) {
                Uri data = intent.getData();
                if (data == null) {
                    return false;
                }
                try {
                    activity.getContentResolver().takePersistableUriPermission(data, intent.getFlags() & 3);
                    activity.getSharedPreferences(SD_PATH_TREE_URI, 0).edit().putString(this.accessSDPath, data.toString()).apply();
                    return true;
                } catch (Throwable e) {
                    String str = FileCompat.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("cacheUri failed, uri = ");
                    stringBuilder.append(data);
                    Log.w(str, stringBuilder.toString(), e);
                    update();
                }
            }
            return false;
        }

        public boolean hasStoragePermission(String str) {
            if (!isExternalSDFile(str)) {
                return true;
            }
            str = super.getSDPath(str);
            boolean z = false;
            if (str == null || getTreeUri(str) == null) {
                return false;
            }
            DocumentFile fromTreeUri = DocumentFile.fromTreeUri(CameraAppImpl.getAndroidContext(), getTreeUri(str));
            String str2 = FileCompat.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("hasStoragePermission document = ");
            stringBuilder.append(fromTreeUri);
            Log.d(str2, stringBuilder.toString());
            if (fromTreeUri == null) {
                return false;
            }
            str2 = FileCompat.TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("hasStoragePermission document = ");
            stringBuilder.append(fromTreeUri.exists());
            stringBuilder.append(", ");
            stringBuilder.append(fromTreeUri.canRead());
            stringBuilder.append(", ");
            stringBuilder.append(fromTreeUri.canWrite());
            Log.d(str2, stringBuilder.toString());
            if (fromTreeUri.exists() && fromTreeUri.canRead() && fromTreeUri.canWrite()) {
                z = true;
            }
            return z;
        }
    }

    static class LollipopFileCompatImpl extends BaseFileCompatImpl {
        LollipopFileCompatImpl() {
        }

        /* JADX WARNING: Removed duplicated region for block: B:45:0x00cf  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public DocumentFile getDocumentFileByPath(String str, boolean z, String str2, boolean z2) {
            String access$000 = FileCompat.getSDPath(str);
            if (access$000 == null) {
                return null;
            }
            Uri access$100 = FileCompat.getTreeUri(access$000);
            if (access$100 == null) {
                return null;
            }
            DocumentFile fromTreeUri = DocumentFile.fromTreeUri(CameraAppImpl.getAndroidContext(), access$100);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(access$000);
            stringBuilder.append(File.separator);
            stringBuilder.append(Environment.DIRECTORY_DCIM);
            access$000 = stringBuilder.toString();
            if (str.equals(access$000)) {
                return fromTreeUri;
            }
            Object substring = str.substring(access$000.length() + 1);
            if (TextUtils.isEmpty(substring)) {
                return null;
            }
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("\\");
            stringBuilder2.append(File.separator);
            substring = substring.split(stringBuilder2.toString());
            Object obj = new String[(substring.length - 1)];
            System.arraycopy(substring, 0, obj, 0, substring.length - 1);
            int length = obj.length;
            DocumentFile documentFile = fromTreeUri;
            int i = 0;
            int i2 = i;
            while (i < length) {
                String str3 = obj[i];
                if (documentFile == null) {
                    break;
                }
                if (i2 != 0) {
                    documentFile = documentFile.createDirectory(str3);
                } else {
                    DocumentFile findFile = documentFile.findFile(str3);
                    if (findFile != null) {
                        documentFile = findFile;
                    } else if (!z) {
                        return null;
                    } else {
                        documentFile = documentFile.createDirectory(str3);
                        i2 = 1;
                    }
                }
                i++;
            }
            if (documentFile == null) {
                return null;
            }
            str = substring[substring.length - 1];
            DocumentFile findFile2 = documentFile.findFile(str);
            if (findFile2 != null || !z) {
                return findFile2;
            }
            if (z2) {
                try {
                    return documentFile.createDirectory(str);
                } catch (Throwable e) {
                    Log.w(FileCompat.TAG, "createFile error", e);
                    return null;
                }
            }
            String substring2;
            int indexOf = str.indexOf(".");
            if (TextUtils.isEmpty(str2) && indexOf > 0) {
                str2 = FileCompat.getMimeTypeFromPath(str);
                if (!TextUtils.isEmpty(str2)) {
                    substring2 = str.substring(0, indexOf);
                    if (substring2 != null) {
                        str = substring2;
                    }
                    return documentFile.createFile(str2, str);
                }
            }
            substring2 = null;
            if (substring2 != null) {
            }
            try {
                return documentFile.createFile(str2, str);
            } catch (Throwable e2) {
                Log.w(FileCompat.TAG, "createFile error", e2);
                return null;
            }
        }

        public OutputStream getFileOutputStream(String str, boolean z) {
            if (VERSION.SDK_INT < 28 || !FileCompat.isSDFile(str)) {
                OutputStream fileOutputStream = super.getFileOutputStream(str, z);
                if (fileOutputStream != null) {
                    return fileOutputStream;
                }
            }
            if (!FileCompat.isSDFile(str)) {
                return null;
            }
            OutputStream openOutputStream;
            DocumentFile documentFileByPath = getDocumentFileByPath(str, z, null, false);
            if (documentFileByPath != null) {
                try {
                    openOutputStream = CameraAppImpl.getAndroidContext().getContentResolver().openOutputStream(documentFileByPath.getUri());
                } catch (Throwable e) {
                    Log.w(FileCompat.TAG, "getFileOutputStream error", e);
                    return null;
                }
            }
            openOutputStream = null;
            return openOutputStream;
        }

        public ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
            if (!FileCompat.isSDFile(str)) {
                return super.getParcelFileDescriptor(str, z);
            }
            return CameraAppImpl.getAndroidContext().getContentResolver().openFileDescriptor(getDocumentFileByPath(str, z, FileCompat.getMimeTypeFromPath(str), false).getUri(), "rw");
        }

        public boolean exists(String str) {
            boolean z = true;
            if (super.exists(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, false, null, false) == null) {
                z = false;
            }
            return z;
        }

        public boolean createNewFile(String str) {
            boolean z = true;
            if (super.createNewFile(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, true, null, false) == null) {
                z = false;
            }
            return z;
        }

        public String createNewFileFixPath(String str) {
            if (super.createNewFile(str)) {
                return str;
            }
            if (!FileCompat.isSDFile(str)) {
                return null;
            }
            DocumentFile documentFileByPath = getDocumentFileByPath(str, true, null, false);
            if (documentFileByPath == null) {
                return null;
            }
            str = str.substring(0, str.lastIndexOf(File.separator));
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(File.separator);
            stringBuilder.append(documentFileByPath.getName());
            return stringBuilder.toString();
        }

        public boolean deleteFile(String str) {
            boolean z = true;
            if (super.deleteFile(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            DocumentFile documentFileByPath = getDocumentFileByPath(str, false, null, false);
            if (documentFileByPath != null) {
                z = documentFileByPath.delete();
            }
            return z;
        }

        public boolean renameFile(String str, String str2) throws IOException {
            if (super.renameFile(str, str2)) {
                return true;
            }
            if (new File(str).getParent().equalsIgnoreCase(new File(str2).getParent())) {
                str2 = new File(str2).getName();
                DocumentFile documentFileByPath = getDocumentFileByPath(str, false, null, false);
                if (documentFileByPath == null) {
                    return false;
                }
                try {
                    return documentFileByPath.renameTo(str2);
                } catch (Throwable e) {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("renameFile error, path = ");
                    stringBuilder.append(str);
                    throw new IOException(stringBuilder.toString(), e);
                }
            }
            Log.w(FileCompat.TAG, "only support renameto the same folder");
            return false;
        }

        public boolean mkdirs(String str) {
            boolean z = true;
            if (super.mkdirs(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, true, null, true) == null) {
                z = false;
            }
            return z;
        }

        public boolean copyFile(String str, String str2) {
            return super.copyFile(str, str2);
        }
    }

    static class MarshmallowFileCompatImpl extends LollipopFileCompatImpl {
        MarshmallowFileCompatImpl() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 28) {
            IMPL_COMMON = new LollipopFileCompatCommonImpl();
            IMPL_OPERATE = new MarshmallowFileCompatImpl();
            return;
        }
        IMPL_COMMON = new KitKatFileCompatCommonImpl();
        IMPL_OPERATE = new BaseFileCompatImpl();
    }

    public static boolean exists(String str) {
        return IMPL_OPERATE.exists(str);
    }

    public static String createNewFileFixPath(String str) {
        return IMPL_OPERATE.createNewFileFixPath(str);
    }

    public static boolean createNewFile(String str) {
        return IMPL_OPERATE.createNewFile(str);
    }

    public static boolean deleteFile(String str) {
        return IMPL_OPERATE.deleteFile(str);
    }

    public static boolean renameFile(String str, String str2) throws IOException {
        return IMPL_OPERATE.renameFile(str, str2);
    }

    public static boolean mkdirs(String str) {
        return IMPL_OPERATE.mkdirs(str);
    }

    public static OutputStream getFileOutputStream(String str, boolean z) {
        return IMPL_OPERATE.getFileOutputStream(str, z);
    }

    public static ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
        return IMPL_OPERATE.getParcelFileDescriptor(str, z);
    }

    public static boolean copyFile(String str, String str2) {
        return IMPL_OPERATE.copyFile(str, str2);
    }

    private static String getSDPath(String str) {
        return IMPL_COMMON.getSDPath(str);
    }

    private static Uri getTreeUri(String str) {
        return IMPL_COMMON.getTreeUri(str);
    }

    private static String getMimeTypeFromPath(String str) {
        int lastIndexOf = str.lastIndexOf(".");
        if (lastIndexOf < 0) {
            return null;
        }
        str = str.substring(lastIndexOf + 1).toLowerCase(Locale.ENGLISH);
        if ("jpg".equals(str) || "jpeg".equals(str)) {
            return "image/jpeg";
        }
        if ("png".equals(str)) {
            return "image/png";
        }
        if ("mp4".equals(str)) {
            return "video/mp4";
        }
        return null;
    }

    @TargetApi(19)
    public static boolean isSDFile(String str) {
        return IMPL_COMMON.isExternalSDFile(str);
    }

    @TargetApi(21)
    public static boolean hasStoragePermission(String str) {
        return IMPL_COMMON.hasStoragePermission(str);
    }

    @TargetApi(21)
    public static boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
        return IMPL_COMMON.getStorageAccessForLOLLIPOP(activity, str);
    }

    @TargetApi(21)
    public static boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
        return IMPL_COMMON.handleActivityResult(activity, i, i2, intent);
    }

    @TargetApi(21)
    public static void updateSDPath() {
        IMPL_COMMON.updateSDPath();
    }
}
