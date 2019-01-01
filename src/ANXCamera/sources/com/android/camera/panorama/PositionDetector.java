package com.android.camera.panorama;

import android.graphics.Rect;
import android.graphics.RectF;
import android.provider.MiuiSettings.ScreenEffect;
import android.view.ViewGroup;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.panorama.MorphoPanoramaGP3.InitParam;

public class PositionDetector {
    public static final int COMPLETED = 1;
    public static final int ERROR_IDLE = -1;
    public static final int ERROR_REVERSE = -2;
    private static final int IDLE_THRES_RATIO = 2;
    private static final long IDLE_TIME = 3000000000L;
    public static final int OK = 0;
    private static final float PREVIEW_LONG_SIDE_CROP_RATIO = 0.8f;
    private static final int REVERSE_THRES_RATIO = 7;
    private static final int SPEED_CHECK_CONTINUOUSLY_TIMES = 5;
    private static final int SPEED_CHECK_IGNORE_TIMES = 15;
    private static final int SPEED_CHECK_MODE = 1;
    private static final int SPEED_CHECK_MODE_AVERAGE = 1;
    private static final String TAG = "PositionDetector";
    private static final double TOO_FAST_THRES_RATIO = 0.8d;
    private static final double TOO_SLOW_THRES_RATIO = 0.05d;
    public static final int WARNING_TOO_FAST = 2;
    public static final int WARNING_TOO_SLOW = 3;
    private long count;
    private volatile double cur_x;
    private volatile double cur_y;
    private final int direction;
    private final RectF frame_rect = new RectF();
    private RectF idle_rect = null;
    private long idle_start_time;
    private double idle_thres;
    private int mCameraOrientation;
    private final DiffManager mDiffManager = new DiffManager();
    private InitParam mInitParam;
    private boolean mIsFrontCamera;
    private ViewGroup mPreviewFrame;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private final int output_height;
    private final int output_width;
    private double peak;
    private double prev_x;
    private double prev_y;
    private boolean reset_idle_timer;
    private double reverse_thres;
    private double reverse_thres2;
    private int too_fast_count;
    private double too_fast_thres;
    private int too_slow_count;
    private double too_slow_thres;

    private static class DiffManager {
        private static final int NUM = 5;
        private int add_num;
        private double ave;
        private int index;
        private final double[] pos = new double[5];

        public DiffManager() {
            clear();
        }

        public void clear() {
            for (int i = 0; i < 5; i++) {
                this.pos[i] = 0.0d;
            }
            this.index = 0;
            this.add_num = 0;
        }

        public void add(double d) {
            this.pos[this.index] = d;
            this.index++;
            if (this.index >= 5) {
                this.index = 0;
            }
            if (this.add_num < 5) {
                this.add_num++;
            }
            calc();
        }

        private void calc() {
            double d = 0.0d;
            for (int i = 0; i < this.add_num; i++) {
                d += this.pos[i];
            }
            this.ave = d / ((double) this.add_num);
        }

        public double getDiff() {
            return this.ave;
        }
    }

    public PositionDetector(InitParam initParam, ViewGroup viewGroup, boolean z, int i, int i2, int i3, int i4, int i5, int i6) {
        this.mInitParam = initParam;
        this.mPreviewFrame = viewGroup;
        this.mIsFrontCamera = z;
        this.mCameraOrientation = i;
        this.mPreviewWidth = i2;
        this.mPreviewHeight = i3;
        this.count = 0;
        this.direction = i4;
        this.output_width = i5;
        this.output_height = i6;
        this.reset_idle_timer = true;
        this.too_fast_count = 0;
        this.too_slow_count = 0;
        this.prev_y = 0.0d;
        this.prev_x = 0.0d;
        this.cur_y = 0.0d;
        this.cur_x = 0.0d;
        float f;
        double d;
        switch (this.direction) {
            case 0:
                if ((this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180) {
                    this.peak = (double) i5;
                } else {
                    this.peak = 0.0d;
                }
                f = (float) i5;
                this.reverse_thres = (double) (0.07f * f);
                this.reverse_thres2 = (double) (PREVIEW_LONG_SIDE_CROP_RATIO * f);
                this.idle_thres = (double) (f * 0.02f);
                d = (double) i5;
                this.too_slow_thres = 5.0E-4d * d;
                this.too_fast_thres = d * 0.008d;
                return;
            case 1:
                if ((this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180) {
                    this.peak = 0.0d;
                } else {
                    this.peak = (double) i5;
                }
                f = (float) i5;
                this.reverse_thres = (double) (0.07f * f);
                this.reverse_thres2 = (double) (PREVIEW_LONG_SIDE_CROP_RATIO * f);
                this.idle_thres = (double) (f * 0.02f);
                d = (double) i5;
                this.too_slow_thres = 5.0E-4d * d;
                this.too_fast_thres = d * 0.008d;
                return;
            case 2:
                if ((this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180) {
                    this.peak = (double) i6;
                } else {
                    this.peak = 0.0d;
                }
                f = (float) i6;
                this.reverse_thres = (double) (0.07f * f);
                this.reverse_thres2 = (double) (PREVIEW_LONG_SIDE_CROP_RATIO * f);
                this.idle_thres = (double) (f * 0.02f);
                d = (double) i6;
                this.too_slow_thres = 5.0E-4d * d;
                this.too_fast_thres = d * 0.008d;
                return;
            case 3:
                if ((this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180) {
                    this.peak = 0.0d;
                } else {
                    this.peak = (double) i6;
                }
                f = (float) i6;
                this.reverse_thres = (double) (0.07f * f);
                this.reverse_thres2 = (double) (PREVIEW_LONG_SIDE_CROP_RATIO * f);
                this.idle_thres = (double) (f * 0.02f);
                d = (double) i6;
                this.too_slow_thres = 5.0E-4d * d;
                this.too_fast_thres = d * 0.008d;
                return;
            default:
                return;
        }
    }

    public int detect(double d, double d2) {
        this.count++;
        if (Util.isEqualsZero(this.cur_x) && Util.isEqualsZero(this.prev_x)) {
            this.prev_x = d;
            this.cur_x = d;
        } else {
            this.prev_x = this.cur_x;
            this.cur_x = d;
        }
        if (Util.isEqualsZero(this.cur_y) && Util.isEqualsZero(this.prev_y)) {
            this.prev_y = d2;
            this.cur_y = d2;
        } else {
            this.prev_y = this.cur_y;
            this.cur_y = d2;
        }
        if (isYOutOfRange()) {
            Log.d(TAG, "isYOutOfRange");
            return 1;
        } else if (isReverse()) {
            Log.d(TAG, "isReverse");
            return -2;
        } else if (isComplete()) {
            Log.d(TAG, "isComplete");
            return 1;
        } else {
            int checkSpeed = checkSpeed();
            updateFrame();
            return checkSpeed;
        }
    }

    public RectF getFrameRect() {
        return this.frame_rect;
    }

    private void updateFrame() {
        Rect rect = new Rect();
        this.mPreviewFrame.getGlobalVisibleRect(rect);
        if (rect.width() > 0) {
            float height;
            float f;
            float height2;
            float f2;
            float width;
            if (this.mInitParam.output_rotation == 90) {
                width = ((float) this.mPreviewFrame.getWidth()) / ((float) this.output_width);
                height = (float) ((this.cur_y / ((double) this.output_height)) * ((double) rect.height()));
                f = (((float) this.mInitParam.input_height) / 2.0f) * width;
                height2 = ((float) rect.height()) / 2.0f;
                f2 = ((float) this.cur_x) * width;
            } else if (this.mInitParam.output_rotation == 180) {
                width = ((float) this.mPreviewFrame.getWidth()) / ((float) this.output_height);
                height = (float) ((this.cur_x / ((double) this.output_width)) * ((double) rect.height()));
                f = (((float) this.mInitParam.input_height) / 2.0f) * width;
                height2 = ((float) rect.height()) / 2.0f;
                f2 = ((float) this.cur_y) * width;
            } else if (this.mInitParam.output_rotation == 270) {
                width = ((float) this.mPreviewFrame.getWidth()) / ((float) this.output_width);
                height = (float) ((this.cur_y / ((double) this.output_height)) * ((double) rect.height()));
                f = (((float) this.mInitParam.input_height) / 2.0f) * width;
                height2 = ((float) rect.height()) / 2.0f;
                f2 = ((float) (((double) this.output_width) - this.cur_x)) * width;
            } else {
                width = ((float) this.mPreviewFrame.getWidth()) / ((float) this.output_height);
                height = (float) ((this.cur_x / ((double) this.output_width)) * ((double) rect.height()));
                f = (((float) this.mInitParam.input_height) / 2.0f) * width;
                height2 = ((float) rect.height()) / 2.0f;
                f2 = ((float) (((double) this.output_height) - this.cur_y)) * width;
            }
            this.frame_rect.set(f2 - f, height - height2, f2 + f, height + height2);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0049  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int checkSpeed() {
        double d;
        double d2;
        int i;
        switch (this.direction) {
            case 2:
            case 3:
                d = this.cur_y;
                d2 = this.prev_y;
                break;
            default:
                d = this.cur_x;
                d2 = this.prev_x;
                break;
        }
        this.mDiffManager.add(Math.abs(d - d2));
        if (15 < this.count) {
            if (this.mDiffManager.getDiff() < this.too_slow_thres) {
                i = 3;
            } else if (this.mDiffManager.getDiff() > this.too_fast_thres) {
                i = 2;
            }
            if (this.too_slow_count > 0) {
                this.too_slow_count = 0;
            }
            if (this.too_fast_count > 0) {
                this.too_fast_count = 0;
            }
            return i;
        }
        i = 0;
        if (this.too_slow_count > 0) {
        }
        if (this.too_fast_count > 0) {
        }
        return i;
    }

    private boolean isIdle() {
        long nanoTime = System.nanoTime();
        if (this.reset_idle_timer) {
            this.reset_idle_timer = false;
            this.idle_start_time = nanoTime;
        }
        if (this.idle_rect == null) {
            double d = this.idle_thres / 2.0d;
            this.idle_rect = new RectF((float) (this.cur_x - d), (float) (this.cur_y - d), (float) (this.cur_x + d), (float) (this.cur_y + d));
        }
        if (IDLE_TIME < nanoTime - this.idle_start_time) {
            return true;
        }
        if (!this.idle_rect.contains((float) this.cur_x, (float) this.cur_y)) {
            this.reset_idle_timer = true;
            this.idle_rect = null;
        }
        return false;
    }

    private boolean isComplete() {
        double d;
        int i;
        int i2;
        switch (this.direction) {
            case 2:
            case 3:
                d = this.cur_y;
                i = this.output_height;
                i2 = this.mPreviewHeight / 2;
                break;
            default:
                d = this.cur_x;
                i = this.output_width;
                i2 = this.mPreviewWidth / 2;
                break;
        }
        int i3 = this.direction;
        boolean z = false;
        if (i3 == 1 || i3 == 3) {
            if (this.mInitParam.output_rotation == 90 || this.mInitParam.output_rotation == 0) {
                if (d > ((double) (i - (i2 / 2)))) {
                    z = true;
                }
                return z;
            }
            if (d < ((double) (i2 / 2))) {
                z = true;
            }
            return z;
        } else if (this.mInitParam.output_rotation == 90 || this.mInitParam.output_rotation == 0) {
            if (d < ((double) (i2 / 2))) {
                z = true;
            }
            return z;
        } else {
            if (d > ((double) (i - (i2 / 2)))) {
                z = true;
            }
            return z;
        }
    }

    private boolean isYOutOfRange() {
        boolean z = true;
        if (this.cur_x < 0.0d || this.cur_y < 0.0d) {
            return true;
        }
        int min = Math.min(this.output_width, this.output_height);
        if (this.mInitParam.output_rotation % 180 == 90) {
            if (this.cur_y <= ((double) min)) {
                z = false;
            }
            return z;
        }
        if (this.cur_x <= ((double) min)) {
            z = false;
        }
        return z;
    }

    private boolean isReverse() {
        double d;
        double d2;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("cur_x = ");
        stringBuilder.append(this.cur_x);
        stringBuilder.append(", cur_y = ");
        stringBuilder.append(this.cur_y);
        Log.v(str, stringBuilder.toString());
        int i;
        switch (this.direction) {
            case 2:
            case 3:
                d = this.cur_y;
                d2 = this.prev_y;
                i = this.output_height;
                break;
            default:
                d = this.cur_x;
                d2 = this.prev_x;
                i = this.output_width;
                break;
        }
        int i2 = this.direction;
        boolean z = false;
        boolean z2 = i2 == 1 || i2 == 3 ? (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180 : (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 0 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 270;
        if (z2) {
            if (d2 - d > this.reverse_thres2) {
                return true;
            }
            boolean z3;
            if ((this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 90 || (this.mInitParam.output_rotation + this.mCameraOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT == 180) {
                switch (this.direction) {
                    case 0:
                    case 2:
                        this.peak = Math.min(this.peak, d);
                        break;
                    case 1:
                    case 3:
                        this.peak = Math.max(this.peak, d);
                        z3 = true;
                        break;
                }
                z3 = false;
            } else {
                switch (this.direction) {
                    case 0:
                    case 2:
                        this.peak = Math.max(this.peak, d);
                        z3 = true;
                        break;
                    case 1:
                    case 3:
                        this.peak = Math.min(this.peak, d);
                        break;
                }
                z3 = false;
            }
            if (z3 ? d <= ((double) i) && this.peak - d <= this.reverse_thres : d <= ((double) i) && d - this.peak <= this.reverse_thres) {
                z = true;
            }
        } else if (d - d2 > this.reverse_thres2) {
            return true;
        } else {
            if (d > this.peak) {
                this.peak = d;
            }
            if (d < 0.0d || this.peak - d > this.reverse_thres) {
                return true;
            }
        }
        return z;
    }
}
