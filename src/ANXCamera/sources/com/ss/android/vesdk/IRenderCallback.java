package com.ss.android.vesdk;

public interface IRenderCallback {
    Texture onCreateTexture();

    boolean onDestroy();

    void onTextureCreated(Texture texture);
}
