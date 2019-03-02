package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraScreenNail.RequestRenderListener;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.GLTextureView;
import com.android.camera.ui.GLTextureView.EGLShareContextGetter;
import com.android.camera.ui.PanoMovingIndicatorView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.GLCanvas;
import com.oneplus.camera.R;
import io.reactivex.Completable;
import java.util.List;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.opengles.GL10;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FragmentPanorama extends BaseFragment implements OnClickListener, RequestRenderListener, PanoramaProtocol {
    public static final int FRAGMENT_INFO = 4080;
    public static final String TAG = "FragmentPanorama";
    private int mArrowMargin;
    private Interpolator mCubicEaseInOutInterpolator = new CubicEaseInOutInterpolator();
    private Handler mHandler = new Handler();
    private ViewGroup mHintFrame;
    private ImageView mIndicator;
    private int mMoveDirection = -1;
    private View mMoveReferenceLine;
    private PanoMovingIndicatorView mMovingDirectionView;
    private PanoramaArrowAnimateDrawable mPanoramaArrowAnimateDrawable = new PanoramaArrowAnimateDrawable();
    private ImageView mPanoramaPreview;
    private View mPanoramaViewRoot;
    private GLTextureView mStillPreview;
    private View mStillPreviewHintArea;
    private int mStillPreviewTextureHeight;
    private int mStillPreviewTextureOffsetX;
    private int mStillPreviewTextureOffsetY;
    private int mStillPreviewTextureWidth;
    private TextView mUseHint;
    private View mUseHintArea;
    private boolean mWaitingFirstFrame = false;

    private class StillPreviewRender implements Renderer {
        private DrawExtTexAttribute mExtTexture;
        float[] mTransform;

        private StillPreviewRender() {
            this.mExtTexture = new DrawExtTexAttribute(true);
            this.mTransform = new float[16];
        }

        /* synthetic */ StillPreviewRender(FragmentPanorama fragmentPanorama, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        }

        public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        }

        public void onDrawFrame(GL10 gl10) {
            CameraScreenNail cameraScreenNail = ((ActivityBase) FragmentPanorama.this.getContext()).getCameraScreenNail();
            GLCanvas gLCanvas = ((ActivityBase) FragmentPanorama.this.getContext()).getGLView().getGLCanvas();
            if (cameraScreenNail != null && gLCanvas != null) {
                synchronized (gLCanvas) {
                    gLCanvas.clearBuffer();
                    int width = gLCanvas.getWidth();
                    int height = gLCanvas.getHeight();
                    gLCanvas.getState().pushState();
                    gLCanvas.setSize(FragmentPanorama.this.mStillPreview.getWidth(), FragmentPanorama.this.mStillPreview.getHeight());
                    cameraScreenNail.getSurfaceTexture().getTransformMatrix(this.mTransform);
                    gLCanvas.draw(this.mExtTexture.init(cameraScreenNail.getExtTexture(), this.mTransform, FragmentPanorama.this.mStillPreviewTextureOffsetX, FragmentPanorama.this.mStillPreviewTextureOffsetY, FragmentPanorama.this.mStillPreviewTextureWidth, FragmentPanorama.this.mStillPreviewTextureHeight));
                    gLCanvas.setSize(width, height);
                    gLCanvas.getState().popState();
                    gLCanvas.recycledResources();
                }
                if (FragmentPanorama.this.mWaitingFirstFrame) {
                    FragmentPanorama.this.mWaitingFirstFrame = false;
                    FragmentPanorama.this.mHandler.post(new Runnable() {
                        public void run() {
                            FragmentPanorama.this.mStillPreview.animate().alpha(1.0f);
                            FragmentPanorama.this.mMoveReferenceLine.setVisibility(0);
                            FragmentPanorama.this.mIndicator.setVisibility(0);
                        }
                    });
                }
            }
        }
    }

    protected void initView(View view) {
        this.mPanoramaViewRoot = view;
        this.mIndicator = (ImageView) this.mPanoramaViewRoot.findViewById(R.id.pano_arrow);
        this.mUseHint = (TextView) this.mPanoramaViewRoot.findViewById(R.id.pano_use_hint);
        this.mIndicator.setImageDrawable(this.mPanoramaArrowAnimateDrawable);
        this.mArrowMargin = getResources().getDimensionPixelSize(R.dimen.pano_arrow_margin);
        if (Util.isNotchDevice) {
            setViewMargin(this.mPanoramaViewRoot, Util.sStatusBarHeight);
        }
        this.mPanoramaPreview = (ImageView) this.mPanoramaViewRoot.findViewById(R.id.panorama_image_preview);
        this.mStillPreview = (GLTextureView) this.mPanoramaViewRoot.findViewById(R.id.panorama_still_preview);
        this.mMovingDirectionView = (PanoMovingIndicatorView) this.mPanoramaViewRoot.findViewById(R.id.pano_move_direction_view);
        this.mMoveReferenceLine = this.mPanoramaViewRoot.findViewById(R.id.pano_move_reference_line);
        this.mStillPreviewHintArea = this.mPanoramaViewRoot.findViewById(R.id.pano_still_preview_hint_area);
        this.mHintFrame = (ViewGroup) this.mPanoramaViewRoot.findViewById(R.id.pano_preview_hint_frame);
        this.mHintFrame.setOnClickListener(this);
        if (this.mStillPreview.getRenderer() == null) {
            Renderer stillPreviewRender = new StillPreviewRender(this, null);
            this.mStillPreview.setEGLContextClientVersion(2);
            this.mStillPreview.setEGLShareContextGetter(new EGLShareContextGetter() {
                public EGLContext getShareContext() {
                    return ((ActivityBase) FragmentPanorama.this.getContext()).getGLView().getEGLContext();
                }
            });
            this.mStillPreview.setRenderer(stillPreviewRender);
            this.mStillPreview.setRenderMode(0);
            this.mStillPreview.onPause();
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.pano_view;
    }

    public int getFragmentInto() {
        return 4080;
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(176, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(176, this);
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            if (this.mMoveDirection == 4) {
                CameraStatUtil.trackDirectionChanged(3);
                moveToDirection(3);
            } else if (this.mMoveDirection == 3) {
                CameraStatUtil.trackDirectionChanged(4);
                moveToDirection(4);
            }
            CameraSettings.setPanoramaMoveDirection(this.mMoveDirection);
        }
    }

    private void setViewMargin(View view, int i) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.topMargin = i;
        view.setLayoutParams(marginLayoutParams);
    }

    public void initPreviewLayout(int i, int i2, int i3, int i4) {
        this.mMoveDirection = CameraSettings.getPanoramaMoveDirection();
        LayoutParams layoutParams = this.mStillPreview.getLayoutParams();
        layoutParams.width = i;
        layoutParams.height = i2;
        this.mStillPreviewTextureWidth = layoutParams.width;
        this.mStillPreviewTextureHeight = (layoutParams.width * i3) / i4;
        this.mStillPreviewTextureOffsetX = 0;
        this.mStillPreviewTextureOffsetY = (-(this.mStillPreviewTextureHeight - layoutParams.height)) / 2;
        this.mStillPreview.requestLayout();
        this.mUseHint.setText(R.string.pano_how_to_use_prompt_start);
    }

    public void moveToDirection(int i) {
        this.mMoveDirection = i;
        float translationX = this.mIndicator.getTranslationX();
        float transformationRatio = this.mPanoramaArrowAnimateDrawable.getTransformationRatio();
        if (this.mMoveDirection == 3) {
            translationX = (float) (this.mStillPreviewTextureWidth + this.mArrowMargin);
            transformationRatio = 2.0f;
        } else if (this.mMoveDirection == 4) {
            translationX = (float) (((Util.sWindowWidth - this.mStillPreviewTextureWidth) - this.mArrowMargin) - this.mIndicator.getWidth());
            transformationRatio = 0.0f;
        }
        ObjectAnimator.ofFloat(this.mIndicator, "translationX", new float[]{this.mIndicator.getTranslationX(), translationX}).setDuration(500);
        ObjectAnimator.ofFloat(this.mPanoramaArrowAnimateDrawable, "transformationRatio", new float[]{this.mPanoramaArrowAnimateDrawable.getTransformationRatio(), transformationRatio}).setDuration(500);
        ObjectAnimator.ofFloat(this.mStillPreview, "alpha", new float[]{this.mStillPreview.getAlpha(), 0.0f}).setDuration(250);
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.mStillPreview, "alpha", new float[]{0.0f, 1.0f});
        ofFloat.setDuration(250);
        ofFloat.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) FragmentPanorama.this.mStillPreview.getLayoutParams();
                if (FragmentPanorama.this.mMoveDirection == 4) {
                    layoutParams.removeRule(9);
                    layoutParams.addRule(11);
                } else if (FragmentPanorama.this.mMoveDirection == 3) {
                    layoutParams.removeRule(11);
                    layoutParams.addRule(9);
                }
                FragmentPanorama.this.mStillPreview.requestLayout();
            }
        });
        new AnimatorSet().playSequentially(new Animator[]{r1, ofFloat});
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(new Animator[]{r13, r0, r4});
        animatorSet.setInterpolator(this.mCubicEaseInOutInterpolator);
        animatorSet.start();
    }

    public void requestRender() {
        if (this.mStillPreviewHintArea != null && this.mStillPreviewHintArea.isShown()) {
            this.mStillPreview.requestRender();
        }
    }

    public void setShootUI() {
        Log.d(TAG, "setShootUI");
        setClickEnable(false);
        this.mMovingDirectionView.setVisibility(8);
        this.mStillPreviewHintArea.setVisibility(0);
    }

    public void resetShootUI() {
        Log.d(TAG, "resetShootUI");
        setClickEnable(true);
        this.mStillPreviewHintArea.setVisibility(8);
        this.mStillPreview.onPause();
        this.mMovingDirectionView.setVisibility(8);
        this.mUseHint.setText(R.string.pano_how_to_use_prompt_start);
    }

    public ViewGroup getPreivewContainer() {
        return this.mHintFrame;
    }

    public void showSmallPreview(boolean z) {
        this.mMovingDirectionView.setVisibility(8);
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.mStillPreview.getLayoutParams();
        if (this.mMoveDirection == 4) {
            layoutParams.removeRule(9);
            layoutParams.addRule(11);
            this.mIndicator.setTranslationX((float) (((Util.sWindowWidth - this.mStillPreviewTextureWidth) - this.mArrowMargin) - this.mIndicator.getWidth()));
            this.mPanoramaArrowAnimateDrawable.setTransformationRatio(0.0f);
        } else if (this.mMoveDirection == 3) {
            layoutParams.removeRule(11);
            layoutParams.addRule(9);
            this.mIndicator.setTranslationX((float) (this.mStillPreviewTextureWidth + this.mArrowMargin));
            this.mPanoramaArrowAnimateDrawable.setTransformationRatio(2.0f);
        }
        this.mStillPreview.requestLayout();
        this.mStillPreview.onResume();
        this.mStillPreview.requestRender();
        this.mStillPreviewHintArea.setVisibility(0);
        this.mWaitingFirstFrame = true;
        if (z) {
            Completable.create(new AlphaInOnSubscribe(this.mPanoramaViewRoot).setDurationTime(600)).subscribe();
        } else {
            AlphaInOnSubscribe.directSetResult(this.mPanoramaViewRoot);
        }
    }

    public void setDisplayPreviewBitmap(Bitmap bitmap) {
        if (bitmap == null) {
            this.mPanoramaPreview.setImageDrawable(null);
        } else {
            this.mPanoramaPreview.setImageBitmap(bitmap);
        }
    }

    public void setDirectionTooFast(boolean z, int i) {
        this.mMovingDirectionView.setTooFast(z, i);
    }

    public void setDirectionPosition(Point point, int i) {
        this.mMovingDirectionView.setPosition(point, i);
    }

    public void onPreviewMoving() {
        if (this.mStillPreviewHintArea.getVisibility() == 0) {
            return;
        }
        if (this.mMovingDirectionView.isTooFast()) {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_slow_down);
        } else if (this.mMovingDirectionView.isFar()) {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_align_reference_line);
        } else {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_go_on_moving);
        }
    }

    public void onCaptureOrientationDecided(int i, int i2, int i3) {
        this.mStillPreviewHintArea.setVisibility(8);
        this.mStillPreview.onPause();
        this.mUseHint.setText(R.string.pano_how_to_use_prompt_go_on_moving);
        this.mMovingDirectionView.setVisibility(0);
        this.mMovingDirectionView.setDisplayCenterY(Util.getRelativeLocation(this.mMovingDirectionView, this.mMoveReferenceLine)[1] + (this.mMoveReferenceLine.getHeight() / 2));
        this.mMovingDirectionView.setMovingAttribute(i, i2, i3);
    }

    public boolean isShown() {
        return this.mPanoramaViewRoot.isShown();
    }

    public void onPause() {
        super.onPause();
        this.mStillPreview.onPause();
        this.mPanoramaPreview.setImageDrawable(null);
    }

    public void onResume() {
        super.onResume();
        this.mStillPreview.setAlpha(0.0f);
        this.mPanoramaViewRoot.setVisibility(4);
        this.mMoveReferenceLine.setVisibility(4);
        this.mIndicator.setVisibility(4);
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        if (i != 166 && this.mPanoramaViewRoot.getVisibility() == 0) {
            if (list == null) {
                AlphaOutOnSubscribe.directSetResult(this.mPanoramaViewRoot);
            } else {
                list.add(Completable.create(new AlphaOutOnSubscribe(this.mPanoramaViewRoot).setDurationTime(150)));
            }
        }
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mCurrentMode == 166 && this.mPanoramaViewRoot.getVisibility() != 0) {
            showSmallPreview(true);
        }
    }
}
