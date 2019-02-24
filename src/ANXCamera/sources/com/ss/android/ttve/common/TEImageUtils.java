package com.ss.android.ttve.common;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.android.camera.storage.Storage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class TEImageUtils {
    private static final String TAG = TEImageUtils.class.getSimpleName();

    public static void saveBitmap(Bitmap bitmap) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(System.currentTimeMillis());
        stringBuilder.append(Storage.JPEG_SUFFIX);
        saveBitmap(bitmap, stringBuilder.toString());
    }

    public static void saveBitmap(Bitmap bitmap, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(TEFileUtils.getPath());
        stringBuilder.append("/");
        stringBuilder.append(str);
        String stringBuilder2 = stringBuilder.toString();
        String str2 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("saving Bitmap : ");
        stringBuilder3.append(str);
        TELogUtil.i(str2, stringBuilder3.toString());
        try {
            OutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(stringBuilder2));
            bitmap.compress(CompressFormat.JPEG, 100, bufferedOutputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            String str3 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Bitmap ");
            stringBuilder.append(str);
            stringBuilder.append(" saved!");
            TELogUtil.i(str3, stringBuilder.toString());
        } catch (IOException e) {
            TELogUtil.e(TAG, "Err when saving bitmap...");
            e.printStackTrace();
        }
    }
}
