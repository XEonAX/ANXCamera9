package com.android.camera.ui;

import android.os.SystemProperties;
import android.support.v4.view.MotionEventCompat;
import android.view.MotionEvent;
import android.view.MotionEvent.PointerCoords;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.Locale;

public class EdgeGestureDetector {
    private static final String TAG = "EdgeGestureDetector";
    private final int TAP_TIMEOUT = SystemProperties.getInt("tap_timeout", 400);
    private final int TAP_TO_TOUCH_TIME = SystemProperties.getInt("tap_to_touch_min_time", 100);
    private final int TOUCH_SLOP_SQUARE = SystemProperties.getInt("edgetouch_slop_quare", Util.dpToPixel(66.67f) * Util.dpToPixel(66.67f));
    private boolean mCurDown;
    private int mCurNumPointers;
    private EdgeGestureListener mEdgeGestureListener;
    private long mLastTapEvent;
    private int mMaxNumPointers;
    private final ArrayList<PointerState> mPointers = new ArrayList();
    private boolean mPrintCoords = true;
    private final PointerCoords mTempCoords = new PointerCoords();
    private final FasterStringBuilder mText = new FasterStringBuilder();

    public interface EdgeGestureListener {
        boolean onEdgeTap(int i, int i2);

        boolean onEdgeTouch(int i, int i2);
    }

    private static final class FasterStringBuilder {
        private char[] mChars = new char[64];
        private int mLength;

        public FasterStringBuilder clear() {
            this.mLength = 0;
            return this;
        }

        public FasterStringBuilder append(String str) {
            int length = str.length();
            str.getChars(0, length, this.mChars, reserve(length));
            this.mLength += length;
            return this;
        }

        public FasterStringBuilder append(int i) {
            return append(i, 0);
        }

        public FasterStringBuilder append(int i, int i2) {
            int i3;
            if (i < 0) {
                i3 = 1;
            } else {
                i3 = 0;
            }
            if (i3 != 0) {
                i = -i;
                if (i < 0) {
                    append("-2147483648");
                    return this;
                }
            }
            int reserve = reserve(11);
            char[] cArr = this.mChars;
            if (i == 0) {
                cArr[reserve] = '0';
                this.mLength++;
                return this;
            }
            int i4;
            if (i3 != 0) {
                i4 = reserve + 1;
                cArr[reserve] = '-';
            } else {
                i4 = reserve;
            }
            i3 = 1000000000;
            int i5 = i4;
            i4 = 10;
            while (i < i3) {
                i3 /= 10;
                i4--;
                if (i4 < i2) {
                    int i6 = i5 + 1;
                    cArr[i5] = '0';
                    i5 = i6;
                }
            }
            while (true) {
                i2 = i / i3;
                i -= i2 * i3;
                i3 /= 10;
                i4 = i5 + 1;
                cArr[i5] = (char) (i2 + 48);
                if (i3 == 0) {
                    this.mLength = i4;
                    return this;
                }
                i5 = i4;
            }
        }

        public FasterStringBuilder append(float f, int i) {
            int i2 = 1;
            for (int i3 = 0; i3 < i; i3++) {
                i2 *= 10;
            }
            float f2 = (float) i2;
            f = (float) (Math.rint((double) (f * f2)) / ((double) i2));
            append((int) f);
            if (i != 0) {
                append(".");
                double abs = (double) Math.abs(f);
                append((int) (((float) (abs - Math.floor(abs))) * f2), i);
            }
            return this;
        }

        public String toString() {
            return new String(this.mChars, 0, this.mLength);
        }

        private int reserve(int i) {
            int i2 = this.mLength;
            int i3 = this.mLength + i;
            Object obj = this.mChars;
            int length = obj.length;
            if (i3 > length) {
                Object obj2 = new char[(length * 2)];
                System.arraycopy(obj, 0, obj2, 0, i2);
                this.mChars = obj2;
            }
            return i2;
        }
    }

    public static class PointerState {
        private PointerCoords mCoords = new PointerCoords();
        private boolean mCurDown;
        private float mDownFocusX;
        private float mDownFocusY;
        private long mDownTime;
        private boolean mHandleDown;
        private boolean mMoving;

        public String toString() {
            return String.format(Locale.ENGLISH, "PointerState mDownFocusX=%f mDownFocusY=%f mDownTime=%d mCurDown=%b mHandleDown=%b  mMoving=%b", new Object[]{Float.valueOf(this.mDownFocusX), Float.valueOf(this.mDownFocusY), Long.valueOf(this.mDownTime), Boolean.valueOf(this.mCurDown), Boolean.valueOf(this.mHandleDown), Boolean.valueOf(this.mMoving)});
        }
    }

    public EdgeGestureDetector(EdgeGestureListener edgeGestureListener) {
        this.mEdgeGestureListener = edgeGestureListener;
    }

    private void detectMoving(float f, float f2, PointerState pointerState) {
        if (!pointerState.mMoving) {
            int access$100 = (int) (f - pointerState.mDownFocusX);
            int access$200 = (int) (f2 - pointerState.mDownFocusY);
            if ((access$100 * access$100) + (access$200 * access$200) > this.TOUCH_SLOP_SQUARE) {
                Log.v(TAG, String.format(Locale.ENGLISH, "detectMoving success currentX=%f currentY=%f distance=%d ps=%s TOUCH_SLOP_SQUARE=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Integer.valueOf(access$100), pointerState, Integer.valueOf(this.TOUCH_SLOP_SQUARE)}));
                pointerState.mMoving = true;
            }
        }
    }

    private void detectTap(float f, float f2, long j, PointerState pointerState) {
        Log.v(TAG, String.format(Locale.ENGLISH, "detectTap currentX=%f currentY=%f upTime=%d ps=%s TAP_TIMEOUT=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Long.valueOf(j), pointerState, Integer.valueOf(this.TAP_TIMEOUT)}));
        if (!pointerState.mHandleDown && !pointerState.mMoving && pointerState.mCurDown) {
            if (!Util.isTimeout(j, pointerState.mDownTime, (long) this.TAP_TIMEOUT)) {
                Log.v(TAG, "detectTap sucess");
                if (this.mEdgeGestureListener.onEdgeTap((int) f, (int) f2)) {
                    this.mLastTapEvent = j;
                }
            }
        }
    }

    private void detectTouch(float f, float f2, long j, PointerState pointerState) {
        Log.v(TAG, String.format(Locale.ENGLISH, "detectTouch currentX=%f currentY=%f ps=%s eventTime=%d mLastTapEvent=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), pointerState, Long.valueOf(j), Long.valueOf(this.mLastTapEvent)}));
        if (pointerState.mCurDown) {
            if (Util.isTimeout(j, this.mLastTapEvent, (long) this.TAP_TO_TOUCH_TIME)) {
                pointerState.mHandleDown = this.mEdgeGestureListener.onEdgeTouch((int) f, (int) f2);
            }
        }
    }

    public void onTouchEvent(MotionEvent motionEvent) {
        int i;
        int pointerId;
        PointerState pointerState;
        int i2;
        int i3;
        int i4;
        boolean z;
        PointerState pointerState2;
        MotionEvent motionEvent2 = motionEvent;
        boolean action = motionEvent.getAction();
        int size = this.mPointers.size();
        boolean z2 = true;
        if (!action || (action & 255) == 5) {
            i = (action & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8;
            if (!action) {
                for (int i5 = 0; i5 < size; i5++) {
                    ((PointerState) this.mPointers.get(i5)).mCurDown = false;
                }
                this.mCurDown = true;
                this.mCurNumPointers = 0;
                this.mMaxNumPointers = 0;
            }
            this.mCurNumPointers++;
            if (this.mMaxNumPointers < this.mCurNumPointers) {
                this.mMaxNumPointers = this.mCurNumPointers;
            }
            pointerId = motionEvent2.getPointerId(i);
            while (size <= pointerId) {
                this.mPointers.add(new PointerState());
                size++;
            }
            pointerState = (PointerState) this.mPointers.get(pointerId);
            pointerState.mCurDown = true;
            pointerState.mMoving = false;
            pointerState.mHandleDown = false;
            pointerState.mDownTime = motionEvent.getEventTime();
            pointerState.mDownFocusX = motionEvent2.getX(i);
            pointerState.mDownFocusY = motionEvent2.getY(i);
            i2 = i;
            i3 = pointerId;
            i4 = 0;
            detectTouch(motionEvent2.getX(i), motionEvent2.getY(i), motionEvent.getEventTime(), pointerState);
            Log.v(TAG, String.format(Locale.ENGLISH, "new TouchDown event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d", new Object[]{r19, Integer.valueOf(this.mMaxNumPointers), Integer.valueOf(this.mCurNumPointers), Integer.valueOf(action), Integer.valueOf(i2), Integer.valueOf(i3)}));
        } else {
            i4 = 0;
        }
        i2 = motionEvent.getPointerCount();
        i3 = motionEvent.getHistorySize();
        int i6 = i4;
        while (i6 < i3) {
            pointerId = i4;
            while (pointerId < i2) {
                int i7;
                int i8;
                i = motionEvent2.getPointerId(pointerId);
                if (i >= this.mPointers.size()) {
                    i7 = pointerId;
                    i8 = i6;
                    z = z2;
                } else {
                    PointerCoords pointerCoords;
                    if (this.mCurDown) {
                        pointerState = (PointerState) this.mPointers.get(i);
                    } else {
                        pointerState = null;
                    }
                    PointerCoords access$600 = pointerState != null ? pointerState.mCoords : this.mTempCoords;
                    motionEvent2.getHistoricalPointerCoords(pointerId, i6, access$600);
                    if (this.mPrintCoords) {
                        pointerCoords = access$600;
                        pointerState2 = pointerState;
                        i7 = pointerId;
                        i8 = i6;
                        z = z2;
                        logCoords("Pointer", action, pointerId, pointerCoords, i, motionEvent2);
                    } else {
                        pointerCoords = access$600;
                        pointerState2 = pointerState;
                        i7 = pointerId;
                        i8 = i6;
                        z = z2;
                    }
                    if (pointerState2 != null) {
                        PointerCoords pointerCoords2 = pointerCoords;
                        detectMoving(pointerCoords2.x, pointerCoords2.y, pointerState2);
                    }
                }
                pointerId = i7 + 1;
                z2 = z;
                i6 = i8;
            }
            z = z2;
            i6++;
            i4 = 0;
        }
        z = z2;
        for (int i9 = 0; i9 < i2; i9++) {
            i6 = motionEvent2.getPointerId(i9);
            if (i6 < this.mPointers.size()) {
                PointerState pointerState3;
                PointerCoords pointerCoords3;
                if (this.mCurDown) {
                    pointerState3 = (PointerState) this.mPointers.get(i6);
                } else {
                    pointerState3 = null;
                }
                PointerCoords access$6002 = pointerState3 != null ? pointerState3.mCoords : this.mTempCoords;
                motionEvent2.getPointerCoords(i9, access$6002);
                if (this.mPrintCoords) {
                    pointerCoords3 = access$6002;
                    logCoords("Pointer", action, i9, access$6002, i6, motionEvent2);
                } else {
                    pointerCoords3 = access$6002;
                }
                if (pointerState3 != null) {
                    detectMoving(pointerCoords3.x, pointerCoords3.y, pointerState3);
                }
            }
        }
        if (action == z || action || (action & 255) == 6) {
            size = (MotionEventCompat.ACTION_POINTER_INDEX_MASK & action) >> 8;
            int pointerId2 = motionEvent2.getPointerId(size);
            if (pointerId2 < this.mPointers.size()) {
                pointerState2 = (PointerState) this.mPointers.get(pointerId2);
                Log.v(TAG, String.format(Locale.ENGLISH, "new TouchUp event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d", new Object[]{pointerState2, Integer.valueOf(this.mMaxNumPointers), Integer.valueOf(this.mCurNumPointers), Integer.valueOf(action), Integer.valueOf(size), Integer.valueOf(pointerId2)}));
                detectTap(motionEvent2.getX(size), motionEvent2.getY(size), motionEvent.getEventTime(), pointerState2);
                pointerState2.mCurDown = false;
            }
            if (action == z || action) {
                this.mCurDown = false;
                this.mCurNumPointers = 0;
            } else if (pointerId2 < this.mPointers.size()) {
                this.mCurNumPointers -= z;
            }
        }
    }

    private void logCoords(String str, int i, int i2, PointerCoords pointerCoords, int i3, MotionEvent motionEvent) {
        String str2;
        int toolType = motionEvent.getToolType(i2);
        int buttonState = motionEvent.getButtonState();
        switch (i & 255) {
            case 0:
                str2 = "DOWN";
                break;
            case 1:
                str2 = "UP";
                break;
            case 2:
                str2 = "MOVE";
                break;
            case 3:
                str2 = "CANCEL";
                break;
            case 4:
                str2 = "OUTSIDE";
                break;
            case 5:
                if (i2 != ((i & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8)) {
                    str2 = "MOVE";
                    break;
                } else {
                    str2 = "DOWN";
                    break;
                }
            case 6:
                if (i2 != ((i & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8)) {
                    str2 = "MOVE";
                    break;
                } else {
                    str2 = "UP";
                    break;
                }
            case 7:
                str2 = "HOVER MOVE";
                break;
            case 8:
                str2 = "SCROLL";
                break;
            case 9:
                str2 = "HOVER ENTER";
                break;
            case 10:
                str2 = "HOVER EXIT";
                break;
            default:
                str2 = Integer.toString(i);
                break;
        }
        Log.i(TAG, this.mText.clear().append(str).append(" id ").append(i3 + 1).append(": ").append(str2).append(" (").append(pointerCoords.x, 3).append(", ").append(pointerCoords.y, 3).append(") Pressure=").append(pointerCoords.pressure, 3).append(" Size=").append(pointerCoords.size, 3).append(" TouchMajor=").append(pointerCoords.touchMajor, 3).append(" TouchMinor=").append(pointerCoords.touchMinor, 3).append(" ToolMajor=").append(pointerCoords.toolMajor, 3).append(" ToolMinor=").append(pointerCoords.toolMinor, 3).append(" Orientation=").append((float) (((double) (pointerCoords.orientation * 180.0f)) / 3.141592653589793d), 1).append("deg").append(" Tilt=").append((float) (((double) (pointerCoords.getAxisValue(25) * 180.0f)) / 3.141592653589793d), 1).append("deg").append(" Distance=").append(pointerCoords.getAxisValue(24), 1).append(" VScroll=").append(pointerCoords.getAxisValue(9), 1).append(" HScroll=").append(pointerCoords.getAxisValue(10), 1).append(" BoundingBox=[(").append(motionEvent.getAxisValue(32), 3).append(", ").append(motionEvent.getAxisValue(33), 3).append(")").append(", (").append(motionEvent.getAxisValue(34), 3).append(", ").append(motionEvent.getAxisValue(35), 3).append(")]").append(" ToolType=").append(MotionEvent.toolTypeToString(toolType)).append(" ButtonState=").append(MotionEvent.buttonStateToString(buttonState)).toString());
    }
}
