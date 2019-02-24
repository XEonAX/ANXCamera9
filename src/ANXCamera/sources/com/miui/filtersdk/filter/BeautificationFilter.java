package com.miui.filtersdk.filter;

import com.miui.filtersdk.filter.base.BaseBeautyFilter;
import com.miui.filtersdk.utils.OpenGlUtils;
import java.nio.FloatBuffer;

public class BeautificationFilter extends BaseBeautyFilter {
    private static final String TAG = "BeautificationFilter";
    private int mBeautyInputHeight;
    private int mBeautyInputWidth;
    private int[] mOutTexture = new int[]{-1};

    protected void onInit() {
        super.onInit();
        initBeauty();
    }

    public void initBeautyProcessor(int i, int i2) {
        if (this.mBeautyProcessor != null) {
            this.mBeautyInputWidth = i;
            this.mBeautyInputHeight = i2;
            this.mBeautyProcessor.init(i, i2);
        }
    }

    private void initBeauty() {
    }

    public int onDrawFrame(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        this.mTextureId = onDrawToTexture(i);
        return super.onDrawFrame(this.mTextureId, floatBuffer, floatBuffer2);
    }

    public int onDrawFrame(FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        return -1;
    }

    public int onDrawToTexture(int i) {
        OpenGlUtils.initEffectTexture(this.mBeautyInputWidth, this.mBeautyInputHeight, this.mOutTexture, 3553);
        this.mBeautyProcessor.beautify(i, this.mBeautyInputWidth, this.mBeautyInputHeight, this.mOutTexture[0]);
        return this.mOutTexture[0];
    }
}
