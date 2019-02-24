package com.android.camera.animation;

import android.view.View;
import android.view.animation.Interpolator;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class AnimationDelegate {
    public static final int ANIMATE_TYPE_ALPHA_IN = 161;
    public static final int ANIMATE_TYPE_ALPHA_OUT = 162;
    public static final int ANIMATE_TYPE_NULL = -1;
    public static final int ANIMATE_TYPE_SCALE = 164;
    public static final int ANIMATE_TYPE_SLIDE_IN_BOTTOM = 167;
    public static final int ANIMATE_TYPE_SLIDE_LEFT = 165;
    public static final int ANIMATE_TYPE_SLIDE_OUT_BOTTOM = 168;
    public static final int ANIMATE_TYPE_SLIDE_RIGHT = 166;
    public static final int ANIMATE_TYPE_TRANSITION = 163;
    public static final int DEFAULT_ANIMATION_DURATION = 300;
    public static final Interpolator DEFAULT_INTERPOLATOR = new CubicEaseOutInterpolator();

    public interface AnimationResource {
        public static final int DATA_CHANGE_TYPE_CAMERA_ID = 2;
        public static final int DATA_CHANGE_TYPE_NULL = 1;
        public static final int DATA_CHANGE_TYPE_UI_STYLE = 3;

        @Retention(RetentionPolicy.SOURCE)
        public @interface DataChangeType {
        }

        boolean canProvide();

        boolean isEnableClick();

        boolean needViewClear();

        void notifyAfterFrameAvailable(int i);

        void notifyDataChanged(int i, int i2);

        void provideAnimateElement(int i, List<Completable> list, int i2);

        void provideRotateItem(List<View> list, int i);

        void setClickEnable(boolean z);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface AnimationType {
    }
}
