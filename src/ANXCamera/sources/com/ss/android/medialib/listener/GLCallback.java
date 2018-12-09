package com.ss.android.medialib.listener;

import com.ss.android.medialib.camera.TextureHolder.Texture;

public interface GLCallback {
    Texture onCreateTexture();

    boolean onDestroy();

    void onTextureCreated(Texture texture);
}
