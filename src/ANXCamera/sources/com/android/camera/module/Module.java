package com.android.camera.module;

import android.content.Context;
import android.content.Intent;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import com.android.camera.Camera;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import java.util.List;

public interface Module extends BaseProtocol {
    boolean canIgnoreFocusChanged();

    void checkActivityOrientation();

    void closeCamera();

    void enableCameraControls(boolean z);

    int getModuleIndex();

    List<String> getSupportedSettingKeys();

    String getUnInterruptableReason();

    boolean isBlockSnap();

    boolean isCaptureIntent();

    boolean isCreated();

    boolean isDeparted();

    boolean isDoingAction();

    boolean isFrameAvailable();

    boolean isIgnoreTouchEvent();

    boolean isKeptBitmapTexture();

    boolean isPanoramaDoing();

    boolean isPostProcessing();

    boolean isSelectingCapturedResult();

    boolean isUnInterruptable();

    boolean isVideoRecording();

    void notifyError();

    void onActivityResult(int i, int i2, Intent intent);

    boolean onBackPressed();

    void onBroadcastReceived(Context context, Intent intent);

    void onCreate(int i, int i2);

    void onDestroy();

    boolean onGestureTrack(RectF rectF, boolean z);

    void onHostStopAndNotifyActionStop();

    boolean onKeyDown(int i, KeyEvent keyEvent);

    boolean onKeyUp(int i, KeyEvent keyEvent);

    void onLongPress(int i, int i2);

    void onNewIntent();

    void onNewUriArrived(Uri uri, String str);

    void onOrientationChanged(int i, int i2);

    void onPause();

    void onPreviewPixelsRead(byte[] bArr, int i, int i2);

    void onResume();

    void onSaveInstanceState(Bundle bundle);

    boolean onScale(float f, float f2, float f3);

    boolean onScaleBegin(float f, float f2);

    void onScaleEnd();

    void onSingleTapUp(int i, int i2, boolean z);

    void onStop();

    void onSurfaceTextureReleased();

    void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute);

    void onUserInteraction();

    void onWindowFocusChanged(boolean z);

    void pausePreview();

    void preTransferOrientation(int i, int i2);

    void registerProtocol();

    void requestRender();

    void resumePreview();

    void setActivity(Camera camera);

    void setDeparted();

    void setFrameAvailable(boolean z);

    void setRestoring(boolean z);

    boolean shouldReleaseLater();

    void startPreview();

    void unRegisterModulePersistProtocol();

    void unRegisterProtocol();
}
