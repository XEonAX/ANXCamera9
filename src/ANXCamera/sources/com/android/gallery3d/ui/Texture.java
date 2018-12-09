package com.android.gallery3d.ui;

public interface Texture {
    void draw(GLCanvas gLCanvas, int i, int i2);

    void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4);

    int getHeight();

    int getWidth();

    boolean isOpaque();
}
