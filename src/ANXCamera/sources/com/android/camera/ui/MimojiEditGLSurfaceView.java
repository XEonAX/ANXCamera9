package com.android.camera.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.GLSurfaceView.EGLConfigChooser;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import com.android.camera.Util;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.gallery3d.exif.ExifInterface.GpsStatus;
import com.arcsoft.avatar.AvatarConfig.c;
import com.arcsoft.avatar.AvatarEngine;
import com.mi.config.b;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;
import miui.reflect.Field;

public class MimojiEditGLSurfaceView extends GLSurfaceView implements Renderer {
    public static final int GET_SAVE_THUM_END = 4;
    private static final String TAG = MimojiEditGLSurfaceView.class.getSimpleName();
    private AvatarEngine mAvatar;
    private int mDeviceRotation;
    private final MyEGLConfigChooser mEglConfigChooser;
    private Handler mHandler;
    private boolean mNeedGetThumbnail;
    private boolean mSaveConfigThum;

    private class MyEGLConfigChooser implements EGLConfigChooser {
        private final int[] ATTR_ID;
        private final String[] ATTR_NAME;
        private final int[] mConfigSpec;

        private MyEGLConfigChooser() {
            int[] iArr = new int[13];
            iArr[0] = 12324;
            iArr[1] = b.ja() ? 8 : 5;
            iArr[2] = 12323;
            iArr[3] = b.ja() ? 8 : 6;
            iArr[4] = 12322;
            iArr[5] = b.ja() ? 8 : 5;
            iArr[6] = 12325;
            iArr[7] = 8;
            iArr[8] = 12321;
            iArr[9] = 0;
            iArr[10] = 12352;
            iArr[11] = 4;
            iArr[12] = 12344;
            this.mConfigSpec = iArr;
            this.ATTR_ID = new int[]{12324, 12323, 12322, 12321, 12325, 12326, 12328, 12327};
            this.ATTR_NAME = new String[]{"R", "G", Field.BYTE_SIGNATURE_PRIMITIVE, GpsStatus.IN_PROGRESS, Field.DOUBLE_SIGNATURE_PRIMITIVE, "S", "ID", "CAVEAT"};
        }

        private EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            int[] iArr = new int[1];
            int length = eGLConfigArr.length;
            int i = Integer.MAX_VALUE;
            EGLConfig eGLConfig = null;
            for (int i2 = 0; i2 < length; i2++) {
                if (!egl10.eglGetConfigAttrib(eGLDisplay, eGLConfigArr[i2], 12324, iArr) || iArr[0] != 8) {
                    if (!egl10.eglGetConfigAttrib(eGLDisplay, eGLConfigArr[i2], 12326, iArr)) {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("eglGetConfigAttrib error: ");
                        stringBuilder.append(egl10.eglGetError());
                        throw new RuntimeException(stringBuilder.toString());
                    } else if (iArr[0] != 0 && iArr[0] < i) {
                        int i3 = iArr[0];
                        i = i3;
                        eGLConfig = eGLConfigArr[i2];
                    }
                }
            }
            if (eGLConfig == null) {
                eGLConfig = eGLConfigArr[0];
            }
            egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, 12326, iArr);
            logConfig(egl10, eGLDisplay, eGLConfig);
            return eGLConfig;
        }

        private void logConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig) {
            int[] iArr = new int[1];
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < this.ATTR_ID.length; i++) {
                egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, this.ATTR_ID[i], iArr);
                stringBuilder.append(this.ATTR_NAME[i]);
                stringBuilder.append(iArr[0]);
                stringBuilder.append(" ");
            }
            String access$100 = MimojiEditGLSurfaceView.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Config chosen: ");
            stringBuilder2.append(stringBuilder.toString());
            Log.i(access$100, stringBuilder2.toString());
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
            int[] iArr = new int[1];
            if (!egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, null, 0, iArr)) {
                throw new RuntimeException("eglChooseConfig failed");
            } else if (iArr[0] > 0) {
                EGLConfig[] eGLConfigArr = new EGLConfig[iArr[0]];
                if (egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, eGLConfigArr, eGLConfigArr.length, iArr)) {
                    return chooseConfig(egl10, eGLDisplay, eGLConfigArr);
                }
                throw new RuntimeException();
            } else {
                throw new RuntimeException("No configs match configSpec");
            }
        }
    }

    public MimojiEditGLSurfaceView(Context context) {
        this(context, null);
    }

    public MimojiEditGLSurfaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mEglConfigChooser = new MyEGLConfigChooser();
        this.mDeviceRotation = 90;
        this.mNeedGetThumbnail = false;
        this.mSaveConfigThum = false;
        setEGLContextClientVersion(2);
        setEGLConfigChooser(this.mEglConfigChooser);
        setRenderer(this);
        setRenderMode(0);
        setPreserveEGLContextOnPause(true);
        getHolder().setFormat(4);
        if (b.it()) {
            getHolder().setFixedSize(Util.LIMIT_SURFACE_WIDTH, (Util.sWindowHeight * Util.LIMIT_SURFACE_WIDTH) / Util.sWindowWidth);
        }
        setupAvatar();
    }

    private void getConfigThumbnail() {
        ArrayList selectConfigList = AvatarEngineManager.getInstance().getSelectConfigList();
        Log.d(TAG, "start get thumbnail...");
        for (int i = 0; i < selectConfigList.size(); i++) {
            c cVar = (c) selectConfigList.get(i);
            this.mAvatar.a(cVar);
            byte[] bArr = new byte[230400];
            this.mAvatar.a(bArr, 240, 240, 960);
            Bitmap createBitmap = Bitmap.createBitmap(240, 240, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
            cVar.an = createBitmap;
        }
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.updateThumbnail();
        }
    }

    private void setupAvatar() {
        this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
        this.mAvatar.a(false, 1.0f);
    }

    public void onDeviceRotationChange(int i) {
        this.mDeviceRotation = i;
    }

    public void onDrawFrame(GL10 gl10) {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glEnable(2929);
        GLES20.glClear(16640);
        this.mAvatar.a(this.mDeviceRotation, getWidth(), getHeight(), 0, false, null);
        if (this.mNeedGetThumbnail) {
            getConfigThumbnail();
            this.mNeedGetThumbnail = false;
        }
        if (this.mSaveConfigThum) {
            this.mSaveConfigThum = false;
            Object obj = new byte[230400];
            this.mAvatar.a(obj, 240, 240, 960);
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 4;
            obtainMessage.obj = obj;
            if (this.mHandler != null) {
                this.mHandler.sendMessage(obtainMessage);
            }
        }
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        GLES20.glViewport(0, 0, i, i2);
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    }

    public void setNeedGetThumbnail(boolean z) {
        this.mNeedGetThumbnail = z;
    }

    public void setmHandler(Handler handler) {
        this.mHandler = handler;
    }

    public void setmSaveConfigThum(boolean z) {
        this.mSaveConfigThum = z;
    }
}
