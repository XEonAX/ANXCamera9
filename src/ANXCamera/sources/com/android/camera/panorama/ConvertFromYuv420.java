package com.android.camera.panorama;

import android.media.Image;

public class ConvertFromYuv420 implements IImage2BytesConverter {
    private IImage2BytesConverter mImage2BytesConverter = new ConvertFromYuv420Null();

    private class ConvertFromYuv420Null implements IImage2BytesConverter {
        private ConvertFromYuv420Null() {
        }

        public byte[] image2bytes(Image image) {
            String imageFormat = PanoramaGP3ImageFormat.getImageFormat(image);
            if (PanoramaGP3ImageFormat.YUV420_PLANAR.equals(imageFormat)) {
                ConvertFromYuv420.this.mImage2BytesConverter = new ConvertFromYuv420Planar();
            } else if (PanoramaGP3ImageFormat.YUV420_SEMIPLANAR.equals(imageFormat)) {
                ConvertFromYuv420.this.mImage2BytesConverter = new ConvertFromYuv420SemiPlanar();
            } else if (!PanoramaGP3ImageFormat.YVU420_SEMIPLANAR.equals(imageFormat)) {
                return new byte[0];
            } else {
                ConvertFromYuv420.this.mImage2BytesConverter = new ConvertFromYvu420SemiPlanar();
            }
            return ConvertFromYuv420.this.mImage2BytesConverter.image2bytes(image);
        }
    }

    public byte[] image2bytes(Image image) {
        return this.mImage2BytesConverter.image2bytes(image);
    }
}
