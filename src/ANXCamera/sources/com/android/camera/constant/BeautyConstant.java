package com.android.camera.constant;

import android.content.res.Resources;
import com.android.camera.CameraAppImpl;
import com.oneplus.camera.R;

public interface BeautyConstant {
    public static final String LEVEL_ADVANCED = res.getString(R.string.pref_face_beauty_advanced);
    public static final String LEVEL_CLOSE = res.getString(R.string.pref_face_beauty_close);
    public static final String LEVEL_HIGH = res.getString(R.string.pref_face_beauty_high);
    public static final String LEVEL_LOW = res.getString(R.string.pref_face_beauty_low);
    public static final String LEVEL_MEDIUM = res.getString(R.string.pref_face_beauty_medium);
    public static final String LEVEL_XHIGH = res.getString(R.string.pref_face_beauty_xhigh);
    public static final String LEVEL_XXHIGH = res.getString(R.string.pref_face_beauty_xxhigh);
    public static final String LEVEL_XXXHIGH = res.getString(R.string.pref_face_beauty_xxxhigh);
    public static final Resources res = CameraAppImpl.getAndroidContext().getResources();
}
