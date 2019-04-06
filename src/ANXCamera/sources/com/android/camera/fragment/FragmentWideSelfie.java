package com.android.camera.fragment;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.annotation.UiThread;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.DrawRectAttribute;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.WideSelfieProtocol;
import com.android.camera.ui.GLTextureView;
import com.android.camera.ui.GLTextureView.EGLShareContextGetter;
import com.android.camera.wideselfie.DrawImageView;
import com.android.camera.wideselfie.WideSelfieConfig;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.GLPaint;
import io.reactivex.Completable;
import java.util.List;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.opengles.GL10;

public class FragmentWideSelfie extends BaseFragment implements WideSelfieProtocol {
    public static final int FRAGMENT_INFO = 4094;
    private static final String TAG = "WideSelfie";
    private boolean mIsCurrentLandScape;
    private boolean mIsShooting;
    private DrawImageView mProgressImageView;
    private GLTextureView mStillPreview;
    private int mStillPreviewHeight;
    private RelativeLayout mStillPreviewLayout;
    private int mStillPreviewWidth;
    private int mThumbBgHeight;
    private int mThumbBgHeightVertical;
    private int mThumbBgTopMargin;
    private int mThumbBgTopMarginVertical;
    private int mThumbBgWidth;
    private int mThumbBgWidthVertical;
    private ViewGroup mThumbNailBackground;
    private int mThumbViewHeight;
    private int mThumbViewHeightVertical;
    private int mThumbViewTopMargin;
    private int mThumbViewTopMarginVertical;
    private int mThumbViewWidth;
    private int mThumbViewWidthVertical;
    private TextView mUseHint;
    private TextView mUseHintLeft;
    private TextView mUseHintRight;
    private View mViewRoot;
    private boolean mWaitingFirstFrame = false;

    private class StillPreviewRender implements Renderer {
        private DrawExtTexAttribute mExtTexture;
        private GLPaint mGlPaint;
        private Handler mHandler;
        private DrawRectAttribute mRectAttribute;
        float[] mTransform;

        private StillPreviewRender() {
            this.mExtTexture = new DrawExtTexAttribute(true);
            this.mTransform = new float[16];
            this.mRectAttribute = new DrawRectAttribute();
            this.mGlPaint = new GLPaint(FragmentWideSelfie.this.getContext().getResources().getDimension(R.dimen.chips_radius), FragmentWideSelfie.this.getContext().getColor(R.color.front_camera_hint_popup_background_color));
            this.mHandler = new Handler();
        }

        /* synthetic */ StillPreviewRender(FragmentWideSelfie fragmentWideSelfie, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onDrawFrame(GL10 gl10) {
            CameraScreenNail cameraScreenNail = ((ActivityBase) FragmentWideSelfie.this.getContext()).getCameraScreenNail();
            GLCanvas gLCanvas = ((ActivityBase) FragmentWideSelfie.this.getContext()).getGLView().getGLCanvas();
            if (cameraScreenNail != null && gLCanvas != null) {
                synchronized (gLCanvas) {
                    gLCanvas.clearBuffer();
                    int width = gLCanvas.getWidth();
                    int height = gLCanvas.getHeight();
                    gLCanvas.getState().pushState();
                    int width2 = FragmentWideSelfie.this.mStillPreview.getWidth();
                    int height2 = FragmentWideSelfie.this.mStillPreview.getHeight();
                    gLCanvas.setSize(width2, height2);
                    cameraScreenNail.getSurfaceTexture().getTransformMatrix(this.mTransform);
                    gLCanvas.draw(this.mExtTexture.init(cameraScreenNail.getExtTexture(), this.mTransform, 0, 0, width2, height2));
                    gLCanvas.draw(this.mRectAttribute.init(0.0f, 0.0f, (float) width2, (float) height2, this.mGlPaint));
                    gLCanvas.setSize(width, height);
                    gLCanvas.getState().popState();
                    gLCanvas.recycledResources();
                }
                if (FragmentWideSelfie.this.mWaitingFirstFrame) {
                    FragmentWideSelfie.this.mWaitingFirstFrame = false;
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            FragmentWideSelfie.this.mStillPreview.animate().alpha(1.0f);
                        }
                    });
                }
            }
        }

        public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        }

        public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        }
    }

    private void updateProgressImageViewLayout(boolean z) {
        LayoutParams layoutParams = (LayoutParams) this.mProgressImageView.getLayoutParams();
        if (z) {
            layoutParams.width = this.mThumbViewWidthVertical;
            layoutParams.height = this.mThumbViewHeightVertical;
            layoutParams.topMargin = this.mThumbViewTopMarginVertical;
            this.mProgressImageView.requestLayout();
            return;
        }
        layoutParams.width = this.mThumbViewWidth;
        layoutParams.height = this.mThumbViewHeight;
        layoutParams.topMargin = this.mThumbViewTopMargin;
        this.mProgressImageView.requestLayout();
    }

    private void updateStillPreviewLayout(boolean z) {
        LayoutParams layoutParams = (LayoutParams) this.mStillPreviewLayout.getLayoutParams();
        if (z) {
            layoutParams.topMargin = (this.mThumbBgTopMarginVertical + 1) + (((this.mThumbBgHeightVertical - 2) - this.mStillPreviewHeight) / 2);
            this.mStillPreviewLayout.requestLayout();
            return;
        }
        layoutParams.topMargin = this.mThumbBgTopMargin + 1;
        this.mStillPreviewLayout.requestLayout();
    }

    private void updateThumbnailBackgroundLayout(boolean z) {
        LayoutParams layoutParams = (LayoutParams) this.mThumbNailBackground.getLayoutParams();
        if (z) {
            layoutParams.width = this.mThumbBgWidthVertical;
            layoutParams.height = this.mThumbBgHeightVertical;
            layoutParams.leftMargin = 0;
            layoutParams.rightMargin = 0;
            layoutParams.topMargin = this.mThumbBgTopMarginVertical;
            layoutParams.addRule(14);
            this.mThumbNailBackground.requestLayout();
            return;
        }
        layoutParams.width = this.mThumbBgWidth;
        layoutParams.height = this.mThumbBgHeight;
        layoutParams.leftMargin = 0;
        layoutParams.rightMargin = 0;
        layoutParams.topMargin = this.mThumbBgTopMargin;
        layoutParams.addRule(14);
        this.mThumbNailBackground.requestLayout();
    }

    private void updateUiLayout(boolean z) {
        AlphaOutOnSubscribe.directSetResult(this.mUseHint);
        AlphaOutOnSubscribe.directSetResult(this.mUseHintLeft);
        AlphaOutOnSubscribe.directSetResult(this.mUseHintRight);
        if (this.mProgressImageView != null) {
            this.mProgressImageView.setOrientation(this.mDegree);
        }
        if (isLandScape()) {
            Log.d(TAG, "updateUiLayout LandScape");
            if (isLeftLandScape()) {
                startAnimateViewVisible(this.mUseHintLeft, z);
            } else if (isRightLandScape()) {
                startAnimateViewVisible(this.mUseHintRight, z);
            }
            updateThumbnailBackgroundLayout(true);
            updateProgressImageViewLayout(true);
            updateStillPreviewLayout(true);
            this.mIsCurrentLandScape = true;
            return;
        }
        Log.d(TAG, "updateUiLayout Portrait");
        startAnimateViewVisible(this.mUseHint, z);
        updateThumbnailBackgroundLayout(false);
        updateProgressImageViewLayout(false);
        updateStillPreviewLayout(false);
        this.mIsCurrentLandScape = false;
    }

    public int getFragmentInto() {
        return FRAGMENT_INFO;
    }

    protected int getLayoutResourceId() {
        return R.layout.mimoji_type_select_view;
    }

    public void initPreviewLayout(int i, int i2, int i3, int i4) {
        ViewGroup.LayoutParams layoutParams = this.mStillPreview.getLayoutParams();
        layoutParams.width = i;
        layoutParams.height = i2;
        this.mStillPreview.requestLayout();
    }

    protected void initView(View view) {
        Log.d(TAG, "initView");
        this.mViewRoot = view;
        this.mUseHint = (TextView) this.mViewRoot.findViewById(R.id.wideselfie_thumbnail_layout);
        this.mUseHintLeft = (TextView) this.mViewRoot.findViewById(R.id.wideselfie_still_preview_layout);
        this.mUseHintRight = (TextView) this.mViewRoot.findViewById(R.id.wideselfie_still_preview);
        ViewCompat.setRotation(this.mUseHintLeft, 90.0f);
        ViewCompat.setRotation(this.mUseHintRight, -90.0f);
        this.mProgressImageView = (DrawImageView) this.mViewRoot.findViewById(R.id.edit_mode_title);
        this.mStillPreview = (GLTextureView) this.mViewRoot.findViewById(R.id.wideselfie_content);
        this.mStillPreviewLayout = (RelativeLayout) this.mViewRoot.findViewById(R.id.mimoji_lighting_view);
        this.mThumbNailBackground = (ViewGroup) this.mViewRoot.findViewById(R.id.thumbnail_select_view);
        this.mProgressImageView.setParams(this.mStillPreviewWidth, this.mStillPreviewHeight, this.mThumbBgWidth, this.mThumbBgHeightVertical);
        if (this.mStillPreview.getRenderer() == null) {
            Renderer stillPreviewRender = new StillPreviewRender(this, null);
            this.mStillPreview.setEGLContextClientVersion(2);
            this.mStillPreview.setEGLShareContextGetter(new EGLShareContextGetter() {
                public EGLContext getShareContext() {
                    return ((ActivityBase) FragmentWideSelfie.this.getContext()).getGLView().getEGLContext();
                }
            });
            this.mStillPreview.setRenderer(stillPreviewRender);
            this.mStillPreview.setRenderMode(0);
            this.mStillPreview.onPause();
        }
        updateThumbnailBackgroundLayout(false);
        updateProgressImageViewLayout(false);
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mCurrentMode == 176 && this.mViewRoot.getVisibility() != 0) {
            showSmallPreview(true);
        }
    }

    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        WideSelfieConfig instance = WideSelfieConfig.getInstance(getContext());
        this.mStillPreviewWidth = instance.getStillPreviewWidth();
        this.mStillPreviewHeight = instance.getStillPreviewHeight();
        this.mThumbBgWidth = instance.getThumbBgWidth();
        this.mThumbBgHeight = instance.getThumbBgHeight();
        this.mThumbBgTopMargin = instance.getThumbBgTopMargin();
        this.mThumbBgWidthVertical = instance.getThumbBgWidthVertical();
        this.mThumbBgHeightVertical = instance.getThumbBgHeightVertical();
        this.mThumbBgTopMarginVertical = instance.getThumbBgTopMarginVertical();
        this.mThumbViewWidth = instance.getThumbViewWidth();
        this.mThumbViewHeight = instance.getThumbViewHeight();
        this.mThumbViewTopMargin = instance.getThumbViewTopMargin();
        this.mThumbViewWidthVertical = instance.getThumbViewWidthVertical();
        this.mThumbViewHeightVertical = instance.getThumbViewHeightVertical();
        this.mThumbViewTopMarginVertical = instance.getThumbViewTopMarginVertical();
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public void onPause() {
        super.onPause();
        this.mStillPreview.onPause();
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        if (i == 176) {
            this.mStillPreview.setAlpha(0.0f);
            this.mViewRoot.setVisibility(4);
        } else if (this.mViewRoot.getVisibility() != 0) {
        } else {
            if (list == null) {
                AlphaOutOnSubscribe.directSetResult(this.mViewRoot);
            } else {
                list.add(Completable.create(new AlphaOutOnSubscribe(this.mViewRoot).setDurationTime(150)));
            }
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (!this.mIsShooting) {
            updateUiLayout(false);
        }
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(216, this);
    }

    public void requestRender() {
        if (this.mStillPreviewLayout != null && this.mStillPreviewLayout.isShown()) {
            this.mStillPreview.requestRender();
        }
    }

    public void resetShootUI() {
        Log.d(TAG, "resetShootUI");
        this.mIsShooting = false;
        setClickEnable(true);
        this.mProgressImageView.setVisibility(8);
        this.mStillPreviewLayout.setVisibility(0);
        updateUiLayout(false);
        this.mStillPreview.onResume();
        this.mUseHint.setText(R.string.pref_camera_coloreffect_entry_big_face);
        this.mUseHintLeft.setText(R.string.pref_camera_coloreffect_entry_big_face);
        this.mUseHintRight.setText(R.string.pref_camera_coloreffect_entry_big_face);
    }

    public void setShootingUI() {
        Log.d(TAG, "setShootingUI");
        this.mIsShooting = true;
        setClickEnable(false);
        this.mProgressImageView.setImageBitmap(null, null, null);
        this.mProgressImageView.setVisibility(0);
    }

    public void showSmallPreview(boolean z) {
        this.mStillPreview.requestLayout();
        this.mStillPreview.onResume();
        this.mStillPreview.requestRender();
        this.mStillPreviewLayout.setVisibility(0);
        this.mWaitingFirstFrame = true;
        if (z) {
            Completable.create(new AlphaInOnSubscribe(this.mViewRoot).setDurationTime(600)).subscribe();
        } else {
            AlphaInOnSubscribe.directSetResult(this.mViewRoot);
        }
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(216, this);
    }

    public void updateHintText(@StringRes int i) {
        this.mUseHint.setText(i);
        this.mUseHintLeft.setText(i);
    }

    @UiThread
    public void updatePreviewBitmap(@Nullable Bitmap bitmap, Rect rect, Rect rect2) {
        if (bitmap != null && this.mStillPreviewLayout.getVisibility() == 0) {
            this.mStillPreviewLayout.setVisibility(8);
        }
        this.mProgressImageView.setImageBitmap(bitmap, rect, rect2);
    }

    public void updateThumbBackgroudLayout(boolean z, boolean z2, int i) {
        LayoutParams layoutParams = (LayoutParams) this.mThumbNailBackground.getLayoutParams();
        if (z) {
            layoutParams.height -= i;
            if (z2) {
                layoutParams.topMargin += i;
            }
            this.mThumbNailBackground.requestLayout();
            return;
        }
        int i2 = layoutParams.width;
        layoutParams.width = i2 - i;
        if (z2) {
            layoutParams.leftMargin = ((Util.sWindowWidth - i2) / 2) + i;
            layoutParams.removeRule(14);
        } else {
            layoutParams.leftMargin = (Util.sWindowWidth - i2) / 2;
            layoutParams.removeRule(14);
        }
        this.mThumbNailBackground.requestLayout();
    }
}
