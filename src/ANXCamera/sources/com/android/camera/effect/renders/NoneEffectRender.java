package com.android.camera.effect.renders;

import com.android.gallery3d.ui.GLCanvas;

public class NoneEffectRender extends PixelEffectRender {
    private static final String FRAG = "precision mediump float; \nuniform float uAlpha; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() { \n    gl_FragColor = texture2D(sTexture, vTexCoord)*uAlpha; \n}";

    public NoneEffectRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public NoneEffectRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    public String getFragShaderString() {
        return FRAG;
    }
}
