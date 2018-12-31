package com.android.camera.panorama;

import android.media.Image;

interface IImage2BytesConverter {
    byte[] image2bytes(Image image);
}
