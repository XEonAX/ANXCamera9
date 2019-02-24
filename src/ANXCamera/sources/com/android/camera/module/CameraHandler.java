package com.android.camera.module;

import android.os.Handler;
import android.os.Message;
import com.android.camera.Camera;
import java.lang.ref.WeakReference;

public class CameraHandler extends Handler {
    public static final int APPLY_PREFERENCE_CHANGE = 32;
    public static final int ASD_DELAY = 26;
    public static final int CAMERA_OPEN_DONE = 8;
    public static final int CAMERA_OPEN_EXCEPTION = 10;
    public static final int CAMERA_RUNTIME_EXCEPTION = 51;
    public static final int CHANGE_UI_LAYOUT_BY_PREVIEW = 18;
    public static final int CHECK_DISPLAY_ROTATION = 4;
    public static final int CHECK_PREVIEW_ORIENTATION = 31;
    public static final int CLEAR_BLUR_FLAG = 22;
    public static final int CLEAR_SCREEN_DELAY = 2;
    public static final int COUNT_DOWN = 20;
    public static final int DELAY_BURST_END = 36;
    public static final int DO_CAPTURE = 15;
    public static final int FIRST_TIME_INIT = 1;
    public static final int HANDLE_FREEZE_HDR_CALLBACK = 24;
    public static final int HIDE_WARNING_MESSAGE = 21;
    public static final int KEEP_SCREEN_ON_DELAY = 1000;
    public static final int MSG_ABANDON_HANDLER = 45;
    public static final int MSG_BURST_SHOT_FINISHED = 48;
    public static final int MSG_BURST_SHOT_STOP_TIME_OUT = 49;
    public static final int MSG_FB_MODE_CHANGED = 34;
    public static final int MSG_FORCE_MULTI_SNAP_DONE = 37;
    public static final int MSG_KEEP_SCREEN_ON = 17;
    public static final int MSG_LYING_FLAG = 39;
    public static final int MSG_NORMAL_SHOT_TIMEOUT = 50;
    public static final int MSG_RESET_HAND_GESTURE = 57;
    public static final int MSG_RESET_UI = 53;
    public static final int MSG_RESTART_MODULE = 44;
    public static final int MSG_SAVE_POWER = 52;
    public static final int MSG_SHOW_STEREO_USE_HINT = 40;
    public static final int MSG_STILL_CAPTURE = 52;
    public static final int MSG_UPDATE_FACE_VIEW = 35;
    public static final int MSG_UPDATE_FOCUS_VIEW = 56;
    public static final int MSG_UPDATE_FPS960_HINT = 54;
    public static final int MSG_WAIT_STOP_CALLBACK_TIMEOUT = 46;
    public static final int MULTI_SNAP_LAUNCH = 12;
    public static final int OPEN_AUDIO_CAPTURE = 29;
    public static final int RENDER_BITMAP_TEXTURE = 25;
    public static final int RESET_VIDEO_AUTO_FOCUS = 55;
    public static final int RESTORE_SOUND_MESSAGE = 43;
    public static final int SAVE_POWER_DELAY = 1500000;
    public static final int SET_CAMERA_PARAMETERS_WHEN_IDLE = 3;
    public static final int SET_ORIENTATION = 33;
    public static final int SHOW_FIRST_USE_HINT = 5;
    public static final int SHOW_OBJECT_TRACK_HINT = 23;
    public static final int START_PREVIEW_DONE = 9;
    public static final int SWITCH_CAMERA_ANIMATION_DONE = 28;
    public static final int SWITCH_MANUAL_MODE = 41;
    public static final int TAKE_PICTURE_DONE = 27;
    public static final int UPDATE_MODE_PREFERENCE = 11;
    public static final int UPDATE_RECORD_TIME = 42;
    private WeakReference<Camera> activityRef;

    public CameraHandler(Camera camera) {
        this.activityRef = new WeakReference(camera);
    }

    public void handleMessage(Message message) {
        super.handleMessage(message);
    }
}
