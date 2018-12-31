package com.android.camera.panorama;

import android.media.Image;
import android.os.Environment;
import com.android.camera.log.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class InputSave {
    public static final String TAG = "InputSave";
    private String FOLDER_PATH;
    private ExecutorService mExecutor = Executors.newSingleThreadExecutor();
    private String mFileNamePrefix;
    private int mIndex;

    private class InputSaveRunnable implements Runnable {
        final String imageFormat;
        CaptureImage srcImage;

        public InputSaveRunnable(CaptureImage captureImage, String str) {
            this.imageFormat = str;
            this.srcImage = captureImage;
        }

        public void run() {
            Image image = this.srcImage.image();
            if (image == null) {
                Log.w(InputSave.TAG, "save failed, image is null");
                return;
            }
            byte[] image2bytes;
            String str = InputSave.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(image.getWidth());
            stringBuilder.append("X");
            stringBuilder.append(image.getHeight());
            stringBuilder.append(", imageFormat = ");
            stringBuilder.append(this.imageFormat);
            Log.d(str, stringBuilder.toString());
            if (PanoramaGP3ImageFormat.YUV420_PLANAR.equals(this.imageFormat)) {
                image2bytes = new ConvertFromYuv420Planar().image2bytes(image);
            } else if (PanoramaGP3ImageFormat.YUV420_SEMIPLANAR.equals(this.imageFormat)) {
                image2bytes = new ConvertFromYuv420SemiPlanar().image2bytes(image);
            } else if (PanoramaGP3ImageFormat.YVU420_SEMIPLANAR.equals(this.imageFormat)) {
                image2bytes = new ConvertFromYvu420SemiPlanar().image2bytes(image);
            } else {
                Log.e(InputSave.TAG, "Image format error.");
                this.srcImage.close();
                return;
            }
            this.srcImage.close();
            InputSave.this.saveImage(image2bytes, this.imageFormat);
        }
    }

    public InputSave() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Environment.getExternalStorageDirectory());
        stringBuilder.append("/Panorama/");
        this.FOLDER_PATH = stringBuilder.toString();
        this.mFileNamePrefix = new SimpleDateFormat("yyyymmddhhmmss").format(new Date());
    }

    public void onSaveImage(CaptureImage captureImage, String str) {
        this.mExecutor.submit(new InputSaveRunnable(captureImage, str));
    }

    private void saveImage(byte[] bArr, String str) {
        Throwable th;
        this.mIndex++;
        str = String.format(Locale.US, "%06d.yuv", new Object[]{Integer.valueOf(this.mIndex)});
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.FOLDER_PATH);
        stringBuilder.append(this.mFileNamePrefix);
        str = generalFileName(stringBuilder.toString(), str);
        if (str == null) {
            Log.e("InputSaveState", "saveImage() error.");
        }
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(new File(str));
            fileOutputStream.write(bArr);
            fileOutputStream.flush();
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("write file success,  ");
            stringBuilder2.append(str);
            Log.d(str2, stringBuilder2.toString());
            fileOutputStream.close();
        } catch (Throwable th2) {
            Log.e("InputSaveState", "saveImage() error.", th2);
        } catch (Throwable th3) {
            th.addSuppressed(th3);
        }
    }

    public String generalFileName(String str, String str2) {
        File file = new File(str);
        if (!file.exists() && !file.mkdirs()) {
            return null;
        }
        file = new File(str, str2);
        int i = 0;
        while (file.exists()) {
            i++;
            String[] split = str2.split("\\.");
            String num = Integer.toString(i);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(split[0]);
            stringBuilder.append("-");
            stringBuilder.append(num);
            stringBuilder.append(".");
            stringBuilder.append(split[1]);
            String stringBuilder2 = stringBuilder.toString();
            File file2 = new File(str, stringBuilder2);
            num = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("NewFilename:");
            stringBuilder.append(stringBuilder2);
            Log.d(num, stringBuilder.toString());
            if (i >= 1000) {
                Log.e(TAG, "NewFilename 1000 count over!!");
                return null;
            }
            file = file2;
        }
        return file.getAbsolutePath();
    }
}
