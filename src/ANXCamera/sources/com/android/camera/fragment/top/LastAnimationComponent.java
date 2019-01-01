package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import com.android.camera.data.data.config.TopConfigItem;
import com.ss.android.vesdk.VEResult;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.QuarticEaseInInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;

public class LastAnimationComponent {
    public View mAnchorView;
    private int mExpandOffset;
    private int mGravity;
    public List<View> mHidedViews;
    private Interpolator mQuartEaseIn = new QuarticEaseInInterpolator();
    private Interpolator mQuartEaseOut = new QuarticEaseOutInterpolator();
    public RecyclerView mRecyclerView;
    public int mReverseLeft;
    public int mReverseRecyclerViewLeft;
    private int mShowDelay;
    public boolean mShown;

    public void setExpandGravity(int i) {
        this.mGravity = i;
        if (i == 3) {
            this.mExpandOffset = VEResult.TER_UNSUPPORTED;
            this.mShowDelay = 0;
            return;
        }
        this.mExpandOffset = 200;
        this.mShowDelay = 140;
    }

    public boolean reverse(boolean z) {
        if (!this.mShown) {
            return false;
        }
        this.mShown = false;
        if (this.mHidedViews != null) {
            for (View view : this.mHidedViews) {
                if (z) {
                    float f = 1.0f;
                    Object tag = view.getTag(R.id.tag_config_view_state_desc);
                    if (tag == null || !(tag instanceof TopConfigItem)) {
                        view.setEnabled(true);
                    } else if (((TopConfigItem) tag).enable) {
                        view.setEnabled(true);
                    } else {
                        view.setEnabled(false);
                        f = 0.6f;
                    }
                    ViewCompat.setAlpha(view, 0.0f);
                    ViewCompat.animate(view).setStartDelay(0).setDuration(280).alpha(f).translationX(0.0f).setInterpolator(this.mQuartEaseOut).start();
                } else {
                    ViewCompat.setTranslationX(view, 0.0f);
                    AlphaInOnSubscribe.directSetResult(view);
                }
            }
            this.mHidedViews.clear();
            this.mHidedViews = null;
        }
        if (this.mAnchorView != null) {
            if (z) {
                ViewCompat.animate(this.mAnchorView).translationX((float) (this.mReverseLeft - this.mAnchorView.getLeft())).setStartDelay(0).setDuration(280).setInterpolator(this.mQuartEaseOut).start();
            } else {
                TranslateXOnSubscribe.directSetResult(this.mAnchorView, this.mReverseLeft - this.mAnchorView.getLeft());
            }
            this.mAnchorView = null;
        }
        if (z) {
            ViewCompat.animate(this.mRecyclerView).setStartDelay(0).alpha(0.0f).translationX((float) (this.mReverseRecyclerViewLeft - this.mRecyclerView.getLeft())).setDuration(280).setInterpolator(this.mQuartEaseOut).withEndAction(new Runnable() {
                public void run() {
                    LastAnimationComponent.this.mRecyclerView.setVisibility(4);
                    LastAnimationComponent.this.mRecyclerView = null;
                }
            }).start();
        } else {
            ViewCompat.setAlpha(this.mRecyclerView, 0.0f);
            ViewCompat.setTranslationX(this.mRecyclerView, (float) (this.mReverseRecyclerViewLeft - this.mRecyclerView.getLeft()));
            this.mRecyclerView.setVisibility(4);
            this.mRecyclerView = null;
        }
        return true;
    }

    public void translateAnchorView(int i) {
        ViewCompat.animate(this.mAnchorView).translationX((float) i).setStartDelay((long) this.mShowDelay).setDuration(280).setInterpolator(this.mQuartEaseOut).start();
    }

    public void showExtraView(int i, int i2) {
        ViewCompat.setAlpha(this.mRecyclerView, 0.0f);
        ViewCompat.setTranslationX(this.mRecyclerView, (float) i);
        ViewCompat.animate(this.mRecyclerView).setStartDelay((long) this.mShowDelay).alpha(1.0f).translationX((float) i2).setDuration(280).setInterpolator(this.mQuartEaseOut).start();
    }

    public void hideOtherViews(int i, List<ImageView> list) {
        if (!this.mShown) {
            this.mShown = true;
            if (this.mHidedViews == null) {
                this.mHidedViews = new ArrayList();
            } else {
                this.mHidedViews.clear();
            }
            for (View view : list) {
                if (((Integer) view.getTag()).intValue() != i) {
                    if (view.getVisibility() == 0) {
                        if (view.getAlpha() != 0.0f) {
                            this.mHidedViews.add(view);
                            ViewCompat.setAlpha(view, 1.0f);
                            ViewCompat.animate(view).setStartDelay(0).setDuration(this.mShowDelay > 0 ? 140 : 280).alpha(0.0f).translationXBy((float) this.mExpandOffset).setInterpolator(this.mShowDelay > 0 ? this.mQuartEaseIn : this.mQuartEaseOut).start();
                            view.setEnabled(false);
                        }
                    }
                }
            }
        }
    }
}
