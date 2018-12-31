package com.android.camera.panorama;

import android.media.Image;
import java.nio.ByteBuffer;

public class ConvertFromYuv420Planar implements IImage2BytesConverter {
    public byte[] image2bytes(Image image) {
        int width = image.getWidth();
        int height = image.getHeight();
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[1].getBuffer();
        ByteBuffer buffer3 = image.getPlanes()[2].getBuffer();
        int rowStride = image.getPlanes()[0].getRowStride();
        int rowStride2 = image.getPlanes()[1].getRowStride();
        int rowStride3 = image.getPlanes()[2].getRowStride();
        int remaining = buffer.remaining();
        int i = width * height;
        byte[] bArr = new byte[((i * 3) / 2)];
        if (width < rowStride) {
            for (remaining = 0; remaining < height; remaining++) {
                buffer.position(remaining * rowStride);
                buffer.get(bArr, remaining * width, width);
            }
        } else {
            buffer.get(bArr, 0, remaining);
        }
        width /= 2;
        for (rowStride = 0; rowStride < height / 2; rowStride++) {
            if (width < rowStride2) {
                buffer2.position(rowStride * rowStride2);
            }
            if (width < rowStride3) {
                buffer3.position(rowStride * rowStride3);
            }
            for (remaining = 0; remaining < width; remaining++) {
                bArr[i] = buffer2.get();
                bArr[i + 1] = buffer3.get();
                i += 2;
            }
        }
        buffer.clear();
        buffer2.clear();
        buffer3.clear();
        return bArr;
    }
}
