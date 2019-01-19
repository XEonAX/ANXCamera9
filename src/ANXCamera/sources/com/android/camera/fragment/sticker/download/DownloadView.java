package com.android.camera.fragment.sticker.download;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.android.camera.R;
import miui.view.animation.CubicEaseOutInterpolator;

public class DownloadView extends RelativeLayout {
    private static final float ALPHA_MIN = 0.0f;
    private static final float ALPHA_NORMAL = 1.0f;
    private static final int ANIMAL_APPEAR_TIME = 350;
    private static final int ANIMAL_DISAPPEAR_TIME = 250;
    private static final int ANIMAL_ROTATION_TIME = 1000;
    private static final float SCALE_MIN = 0.6f;
    private static final float SCALE_NORMAL = 1.0f;
    private ImageView mImageView;
    private OnDownloadSuccessListener mListener;
    private ObjectAnimator mRotationAnimal;

    public interface OnDownloadSuccessListener {
        void onDownloadSuccess(DownloadView downloadView);
    }

    private abstract class MyAnimalListener implements AnimatorListener {
        private MyAnimalListener() {
        }

        /* synthetic */ MyAnimalListener(DownloadView downloadView, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onAnimationStart(Animator animator) {
        }

        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationRepeat(Animator animator) {
        }
    }

    public DownloadView(Context context) {
        super(context);
        initView();
    }

    public DownloadView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    private void initView() {
        this.mImageView = new ImageView(getContext());
        addView(this.mImageView, -2, -2);
        ((LayoutParams) this.mImageView.getLayoutParams()).addRule(13);
    }

    public void setOnDownloadSuccessListener(OnDownloadSuccessListener onDownloadSuccessListener) {
        this.mListener = onDownloadSuccessListener;
    }

    public void startDownload() {
        clearAnimation();
        hide(this.mImageView, new MyAnimalListener() {
            public void onAnimationEnd(Animator animator) {
                DownloadView.this.doDownloading();
            }
        });
    }

    private void doDownloading() {
        this.mImageView.setImageResource(getStateImageResource(2));
        show(this.mImageView, new MyAnimalListener() {
            public void onAnimationEnd(Animator animator) {
                DownloadView.this.rotation();
            }
        });
    }

    public void endDownloading() {
        clearAnimation();
        hide(this.mImageView, new MyAnimalListener() {
            public void onAnimationEnd(Animator animator) {
                DownloadView.this.mImageView.setImageResource(DownloadView.this.getStateImageResource(3));
                DownloadView.this.show(DownloadView.this.mImageView, new MyAnimalListener() {
                    {
                        DownloadView downloadView = DownloadView.this;
                    }

                    public void onAnimationEnd(Animator animator) {
                        DownloadView.this.hide(DownloadView.this, new MyAnimalListener() {
                            {
                                DownloadView downloadView = DownloadView.this;
                            }

                            public void onAnimationEnd(Animator animator) {
                                if (DownloadView.this.mListener != null) {
                                    DownloadView.this.mListener.onDownloadSuccess(DownloadView.this);
                                }
                            }
                        });
                    }
                });
            }
        });
    }

    public void clearAnimation() {
        super.clearAnimation();
        this.mImageView.clearAnimation();
        if (this.mRotationAnimal != null) {
            this.mRotationAnimal.end();
        }
        setAlpha(getAlphaNormal());
        setScaleX(1.0f);
        setScaleY(1.0f);
    }

    protected int getStateImageResource(int i) {
        if (i == 0) {
            return R.drawable.icon_sticker_download;
        }
        switch (i) {
            case 2:
                return R.drawable.icon_sticker_downloading;
            case 3:
                return R.drawable.icon_sticker_downloaded;
            case 4:
                return R.drawable.icon_sticker_download;
            default:
                return 0;
        }
    }

    protected float getAlphaNormal() {
        return 1.0f;
    }

    public void setStateImage(int i) {
        switch (i) {
            case 0:
                clearAnimation();
                setVisibility(0);
                this.mImageView.setImageResource(getStateImageResource(i));
                return;
            case 1:
            case 5:
                clearAnimation();
                setVisibility(8);
                return;
            case 2:
                clearAnimation();
                setVisibility(0);
                doDownloading();
                return;
            case 3:
                setVisibility(0);
                endDownloading();
                return;
            case 4:
                clearAnimation();
                setVisibility(0);
                this.mImageView.setImageResource(getStateImageResource(i));
                return;
            default:
                return;
        }
    }

    private void show(View view, AnimatorListener animatorListener) {
        PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, getAlphaNormal()});
        PropertyValuesHolder ofFloat2 = PropertyValuesHolder.ofFloat("scaleX", new float[]{0.6f, 1.0f});
        PropertyValuesHolder ofFloat3 = PropertyValuesHolder.ofFloat("scaleY", new float[]{0.6f, 1.0f});
        ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{ofFloat, ofFloat2, ofFloat3});
        if (animatorListener != null) {
            ofPropertyValuesHolder.addListener(animatorListener);
        }
        ofPropertyValuesHolder.setInterpolator(new CubicEaseOutInterpolator());
        ofPropertyValuesHolder.setDuration(350).start();
    }

    private void hide(View view, AnimatorListener animatorListener) {
        PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat("alpha", new float[]{getAlphaNormal(), 0.0f});
        PropertyValuesHolder ofFloat2 = PropertyValuesHolder.ofFloat("scaleX", new float[]{1.0f, 0.6f});
        PropertyValuesHolder ofFloat3 = PropertyValuesHolder.ofFloat("scaleY", new float[]{1.0f, 0.6f});
        ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{ofFloat, ofFloat2, ofFloat3});
        if (animatorListener != null) {
            ofPropertyValuesHolder.addListener(animatorListener);
        }
        ofPropertyValuesHolder.setInterpolator(new CubicEaseOutInterpolator());
        ofPropertyValuesHolder.setDuration(250).start();
    }

    private void rotation() {
        if (this.mRotationAnimal == null) {
            this.mRotationAnimal = ObjectAnimator.ofFloat(this.mImageView, "rotation", new float[]{0.0f, 360.0f});
            this.mRotationAnimal.setRepeatCount(-1);
            this.mRotationAnimal.setInterpolator(new LinearInterpolator());
            this.mRotationAnimal.setDuration(1000);
        }
        this.mRotationAnimal.start();
    }
}
