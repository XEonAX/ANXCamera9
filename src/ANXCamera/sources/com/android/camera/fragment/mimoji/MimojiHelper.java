package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.ImageFormat;
import android.graphics.Rect;
import android.media.Image;
import android.media.Image.Plane;
import android.os.Environment;
import com.android.camera.R;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class MimojiHelper {
    public static final int COLOR_FormatI420 = 1;
    public static final int COLOR_FormatNV21 = 2;
    public static final String MIMOJI_DIR;
    public static final String MODEL_PATH;
    public static final String ROOT_DIR;
    private static Context mContext;

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Environment.getExternalStorageDirectory().getPath());
        stringBuilder.append("/MIUI/Camera/");
        ROOT_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(ROOT_DIR);
        stringBuilder.append("mimoji/");
        MIMOJI_DIR = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(MIMOJI_DIR);
        stringBuilder.append("model/");
        MODEL_PATH = stringBuilder.toString();
    }

    /* JADX WARNING: Missing block: B:15:0x005a, code:
            r12 = r8;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static byte[] getDataFromImage(Image image, int i) {
        int i2 = i;
        int i3 = 2;
        int i4 = 1;
        if (i2 == 1 || i2 == 2) {
            Rect cropRect = image.getCropRect();
            int format = image.getFormat();
            int width = cropRect.width();
            int height = cropRect.height();
            Plane[] planes = image.getPlanes();
            int i5 = width * height;
            byte[] bArr = new byte[((ImageFormat.getBitsPerPixel(format) * i5) / 8)];
            int i6 = 0;
            byte[] bArr2 = new byte[planes[0].getRowStride()];
            int i7 = 1;
            int i8 = 0;
            int i9 = i8;
            while (i8 < planes.length) {
                Rect rect;
                switch (i8) {
                    case 0:
                        i7 = i4;
                        i9 = i6;
                        break;
                    case 1:
                        if (i2 != i4) {
                            if (i2 == i3) {
                                i9 = i5 + 1;
                                i7 = i3;
                                break;
                            }
                        }
                        i7 = i4;
                        break;
                    case 2:
                        if (i2 == i4) {
                            i9 = (int) (((double) i5) * 1.25d);
                            i7 = i4;
                            break;
                        } else if (i2 == i3) {
                            i7 = i3;
                        }
                        break;
                }
                ByteBuffer buffer = planes[i8].getBuffer();
                int rowStride = planes[i8].getRowStride();
                i3 = planes[i8].getPixelStride();
                int i10 = i8 == 0 ? i6 : i4;
                i6 = width >> i10;
                i4 = height >> i10;
                int i11 = width;
                buffer.position(((cropRect.top >> i10) * rowStride) + ((cropRect.left >> i10) * i3));
                i2 = 0;
                while (i2 < i4) {
                    if (i3 == 1 && i7 == 1) {
                        buffer.get(bArr, i9, i6);
                        i9 += i6;
                        rect = cropRect;
                        width = i6;
                    } else {
                        width = ((i6 - 1) * i3) + 1;
                        rect = cropRect;
                        buffer.get(bArr2, 0, width);
                        int i12 = i9;
                        for (i9 = 0; i9 < i6; i9++) {
                            bArr[i12] = bArr2[i9 * i3];
                            i12 += i7;
                        }
                        i9 = i12;
                    }
                    if (i2 < i4 - 1) {
                        buffer.position((buffer.position() + rowStride) - width);
                    }
                    i2++;
                    cropRect = rect;
                }
                rect = cropRect;
                i8++;
                i4 = 1;
                width = i11;
                i2 = i;
                i3 = 2;
                i6 = 0;
            }
            return bArr;
        }
        throw new IllegalArgumentException("only support COLOR_FormatI420 and COLOR_FormatNV21");
    }

    public static List<MimojiInfo> getMimojiInfoList() {
        File file = new File(MODEL_PATH);
        if (!file.exists()) {
            return null;
        }
        File[] listFiles = file.listFiles();
        String str = ".dat";
        List arrayList = new ArrayList();
        for (File absolutePath : listFiles) {
            String absolutePath2 = absolutePath.getAbsolutePath();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(absolutePath2);
            stringBuilder.append("/save");
            File file2 = new File(stringBuilder.toString());
            if (file2.exists()) {
                for (File file3 : file2.listFiles()) {
                    if (file3.getPath().substring(file3.getPath().length() - str.length()).equals(str)) {
                        MimojiInfo mimojiInfo = new MimojiInfo();
                        mimojiInfo.mAvatarTemplatePath = absolutePath2;
                        mimojiInfo.mConfigPath = file3.getAbsolutePath();
                    }
                }
            }
        }
        return arrayList;
    }

    public static int getTipsResId(int i) {
        switch (i) {
            case 0:
                return R.string.pref_camera_picture_format_entry_jpeg;
            case 1:
                return R.string.pref_camera_histogram_entry_disable;
            case 2:
                return R.string.pref_camera_focusmode_title;
            case 3:
                return R.string.pref_camera_focusmode_entry_manual;
            case 4:
                return R.string.pref_camera_front_bokeh_entry_on;
            case 5:
                return R.string.pref_camera_histogram_entry_enable;
            default:
                return 0;
        }
    }

    public static int getTipsResIdFace(int i) {
        switch (i) {
            case 3:
                return R.string.view_privacy_policy;
            case 4:
                return R.string.pref_camera_video_bokeh_off;
            case 5:
                return R.string.pref_camera_video_bokeh_on;
            default:
                return -1;
        }
    }

    public static void init(Context context) {
        mContext = context;
    }
}
