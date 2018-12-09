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
import com.android.camera.log.Log;
import java.io.File;
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
        public boolean copyFile(java.lang.String r5, java.lang.String r6) {
            /*
            r4 = this;
            r0 = 0;
            r1 = 0;
            r2 = new java.io.FileInputStream;	 Catch:{ Exception -> 0x005a, all -> 0x0057 }
            r2.<init>(r5);	 Catch:{ Exception -> 0x005a, all -> 0x0057 }
            r5 = r4.getFileOutputStream(r6, r1);	 Catch:{ Exception -> 0x0053, all -> 0x004f }
            if (r5 != 0) goto L_0x0025;
            r2.close();	 Catch:{ Exception -> 0x0015 }
            goto L_0x0016;
        L_0x0015:
            r6 = move-exception;
        L_0x0016:
            if (r5 == 0) goto L_0x0024;
        L_0x0018:
            r5.close();	 Catch:{ Exception -> 0x001c }
            goto L_0x0024;
        L_0x001c:
            r5 = move-exception;
            r6 = "FileCompat";
            r0 = "copyFile error";
            com.android.camera.log.Log.w(r6, r0, r5);
        L_0x0024:
            return r1;
        L_0x0025:
            r6 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
            r6 = new byte[r6];	 Catch:{ Exception -> 0x004d, all -> 0x004b }
        L_0x0029:
            r0 = r2.read(r6);	 Catch:{ Exception -> 0x004d, all -> 0x004b }
            r3 = -1;
            if (r0 == r3) goto L_0x0034;
        L_0x0030:
            r5.write(r6, r1, r0);	 Catch:{ Exception -> 0x004d, all -> 0x004b }
            goto L_0x0029;
            r2.close();	 Catch:{ Exception -> 0x0039 }
            goto L_0x003a;
        L_0x0039:
            r6 = move-exception;
        L_0x003a:
            if (r5 == 0) goto L_0x0049;
        L_0x003c:
            r5.close();	 Catch:{ Exception -> 0x0040 }
        L_0x003f:
            goto L_0x0049;
        L_0x0040:
            r5 = move-exception;
            r6 = "FileCompat";
            r0 = "copyFile error";
            com.android.camera.log.Log.w(r6, r0, r5);
            goto L_0x003f;
        L_0x0049:
            r5 = 1;
            return r5;
        L_0x004b:
            r6 = move-exception;
            goto L_0x0051;
        L_0x004d:
            r6 = move-exception;
            goto L_0x0055;
        L_0x004f:
            r6 = move-exception;
            r5 = r0;
        L_0x0051:
            r0 = r2;
            goto L_0x007b;
        L_0x0053:
            r6 = move-exception;
            r5 = r0;
        L_0x0055:
            r0 = r2;
            goto L_0x005c;
        L_0x0057:
            r6 = move-exception;
            r5 = r0;
            goto L_0x007b;
        L_0x005a:
            r6 = move-exception;
            r5 = r0;
        L_0x005c:
            r2 = "FileCompat";
            r3 = "copyFile error";
            com.android.camera.log.Log.w(r2, r3, r6);	 Catch:{ all -> 0x007a }
            if (r0 == 0) goto L_0x006b;
        L_0x0066:
            r0.close();	 Catch:{ Exception -> 0x006a }
            goto L_0x006b;
        L_0x006a:
            r6 = move-exception;
        L_0x006b:
            if (r5 == 0) goto L_0x0079;
        L_0x006d:
            r5.close();	 Catch:{ Exception -> 0x0071 }
            goto L_0x0079;
        L_0x0071:
            r5 = move-exception;
            r6 = "FileCompat";
            r0 = "copyFile error";
            com.android.camera.log.Log.w(r6, r0, r5);
        L_0x0079:
            return r1;
        L_0x007a:
            r6 = move-exception;
        L_0x007b:
            if (r0 == 0) goto L_0x0082;
        L_0x007d:
            r0.close();	 Catch:{ Exception -> 0x0081 }
            goto L_0x0082;
        L_0x0081:
            r0 = move-exception;
        L_0x0082:
            if (r5 == 0) goto L_0x0090;
        L_0x0084:
            r5.close();	 Catch:{ Exception -> 0x0088 }
            goto L_0x0090;
        L_0x0088:
            r5 = move-exception;
            r0 = "FileCompat";
            r1 = "copyFile error";
            com.android.camera.log.Log.w(r0, r1, r5);
        L_0x0090:
            throw r6;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.FileCompat.BaseFileCompatImpl.copyFile(java.lang.String, java.lang.String):boolean");
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
        public android.support.v4.provider.DocumentFile getDocumentFileByPath(java.lang.String r11, boolean r12, java.lang.String r13, boolean r14) {
            /*
            r10 = this;
            r0 = com.android.camera.FileCompat.getSDPath(r11);
            r1 = 0;
            if (r0 != 0) goto L_0x0008;
        L_0x0007:
            return r1;
        L_0x0008:
            r2 = com.android.camera.FileCompat.getTreeUri(r0);
            if (r2 != 0) goto L_0x000f;
        L_0x000e:
            return r1;
        L_0x000f:
            r3 = com.android.camera.CameraAppImpl.getAndroidContext();
            r2 = android.support.v4.provider.DocumentFile.fromTreeUri(r3, r2);
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r3.append(r0);
            r0 = java.io.File.separator;
            r3.append(r0);
            r0 = android.os.Environment.DIRECTORY_DCIM;
            r3.append(r0);
            r0 = r3.toString();
            r3 = r11.equals(r0);
            if (r3 == 0) goto L_0x0034;
        L_0x0033:
            return r2;
        L_0x0034:
            r0 = r0.length();
            r3 = 1;
            r0 = r0 + r3;
            r11 = r11.substring(r0);
            r0 = android.text.TextUtils.isEmpty(r11);
            if (r0 == 0) goto L_0x0045;
        L_0x0044:
            return r1;
        L_0x0045:
            r0 = new java.lang.StringBuilder;
            r0.<init>();
            r4 = "\\";
            r0.append(r4);
            r4 = java.io.File.separator;
            r0.append(r4);
            r0 = r0.toString();
            r11 = r11.split(r0);
            r0 = r11.length;
            r0 = r0 - r3;
            r0 = new java.lang.String[r0];
            r4 = r11.length;
            r4 = r4 - r3;
            r5 = 0;
            java.lang.System.arraycopy(r11, r5, r0, r5, r4);
            r4 = r0.length;
            r6 = r2;
            r2 = r5;
            r7 = r2;
        L_0x006b:
            if (r2 >= r4) goto L_0x008e;
        L_0x006d:
            r8 = r0[r2];
            if (r6 != 0) goto L_0x0072;
        L_0x0071:
            goto L_0x008e;
        L_0x0072:
            if (r7 == 0) goto L_0x0079;
        L_0x0074:
            r6 = r6.createDirectory(r8);
            goto L_0x008b;
        L_0x0079:
            r9 = r6.findFile(r8);
            if (r9 != 0) goto L_0x0089;
        L_0x007f:
            if (r12 == 0) goto L_0x0088;
            r6 = r6.createDirectory(r8);
            r7 = r3;
            goto L_0x008b;
        L_0x0088:
            return r1;
            r6 = r9;
        L_0x008b:
            r2 = r2 + 1;
            goto L_0x006b;
        L_0x008e:
            if (r6 != 0) goto L_0x0091;
        L_0x0090:
            return r1;
        L_0x0091:
            r0 = r11.length;
            r0 = r0 - r3;
            r11 = r11[r0];
            r0 = r6.findFile(r11);
            if (r0 != 0) goto L_0x00de;
        L_0x009c:
            if (r12 == 0) goto L_0x00de;
        L_0x009e:
            if (r14 == 0) goto L_0x00ae;
        L_0x00a0:
            r11 = r6.createDirectory(r11);	 Catch:{ Exception -> 0x00a5 }
            return r11;
        L_0x00a5:
            r11 = move-exception;
            r12 = "FileCompat";
            r13 = "createFile error";
            com.android.camera.log.Log.w(r12, r13, r11);
            return r1;
            r12 = ".";
            r12 = r11.indexOf(r12);
            r14 = android.text.TextUtils.isEmpty(r13);
            if (r14 == 0) goto L_0x00cc;
        L_0x00bb:
            if (r12 <= 0) goto L_0x00cc;
        L_0x00bd:
            r13 = com.android.camera.FileCompat.getMimeTypeFromPath(r11);
            r14 = android.text.TextUtils.isEmpty(r13);
            if (r14 != 0) goto L_0x00cc;
        L_0x00c7:
            r12 = r11.substring(r5, r12);
            goto L_0x00cd;
        L_0x00cc:
            r12 = r1;
        L_0x00cd:
            if (r12 == 0) goto L_0x00d0;
        L_0x00cf:
            r11 = r12;
        L_0x00d0:
            r11 = r6.createFile(r13, r11);	 Catch:{ Exception -> 0x00d5 }
            return r11;
        L_0x00d5:
            r11 = move-exception;
            r12 = "FileCompat";
            r13 = "createFile error";
            com.android.camera.log.Log.w(r12, r13, r11);
            return r1;
        L_0x00de:
            return r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.FileCompat.LollipopFileCompatImpl.getDocumentFileByPath(java.lang.String, boolean, java.lang.String, boolean):android.support.v4.provider.DocumentFile");
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
