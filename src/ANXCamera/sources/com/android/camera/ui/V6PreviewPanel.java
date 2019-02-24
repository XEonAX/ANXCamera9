package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import com.android.camera.ActivityBase;
import com.android.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.PlayVideoProtocol;
import com.android.camera2.autozoom.AutoZoomView;

public class V6PreviewPanel extends V6RelativeLayout implements OnClickListener {
    public AutoZoomView mAutoZoomView;
    public V6EffectCropView mCropView;
    public FaceView mFaceView;
    public FocusView mFocusView;
    private Runnable mHidePreviewCover = new Runnable() {
        public void run() {
            V6PreviewPanel.this.mPreviewCover.setVisibility(8);
        }
    };
    public ObjectView mObjectView;
    private View mPreviewCover;
    public V6PreviewFrame mPreviewFrame;
    public ImageView mVideoReviewImage;
    public ImageView mVideoReviewPlay;

    public V6PreviewPanel(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mFaceView = (FaceView) findChildrenById(R.id.v6_face_view);
        this.mObjectView = (ObjectView) findChildrenById(R.id.object_view);
        this.mVideoReviewPlay = (ImageView) findChildrenById(R.id.v6_video_btn_play);
        this.mFocusView = (FocusView) findChildrenById(R.id.v6_focus_view);
        this.mPreviewFrame = (V6PreviewFrame) findChildrenById(R.id.v6_frame_layout);
        this.mCropView = (V6EffectCropView) findChildrenById(R.id.v6_effect_crop_view);
        this.mVideoReviewImage = (ImageView) findViewById(R.id.v6_video_review_image);
        this.mPreviewCover = findViewById(R.id.preview_cover);
        this.mAutoZoomView = (AutoZoomView) findChildrenById(R.id.autozoom_overlay);
        this.mVideoReviewImage.setBackgroundColor(-16777216);
        this.mVideoReviewPlay.setOnClickListener(this);
    }

    public void onCameraOpen() {
        super.onCameraOpen();
    }

    public void onPause() {
        super.onPause();
        this.mFaceView.clear();
        this.mObjectView.clear();
        this.mAutoZoomView.clear(0);
        removeCallbacks(this.mHidePreviewCover);
        this.mPreviewCover.setVisibility(8);
    }

    public void onResume() {
        super.onResume();
        this.mFaceView.setVisibility(8);
        this.mObjectView.setVisibility(8);
        this.mVideoReviewImage.setVisibility(8);
        this.mVideoReviewPlay.setVisibility(8);
        if (((ActivityBase) getContext()).getCameraIntentManager().isScanQRCodeIntent()) {
            setVisibility(4);
        } else {
            setVisibility(0);
        }
    }

    public void onClick(View view) {
        if (view.getId() == R.id.v6_video_btn_play) {
            ((PlayVideoProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(167)).playVideo();
        }
    }

    public void setOrientation(int i, boolean z) {
        super.setOrientation(i, z);
    }

    public void onCapture() {
        this.mPreviewCover.setBackgroundResource(R.color.preview_cover_capture);
        this.mPreviewCover.setVisibility(0);
        removeCallbacks(this.mHidePreviewCover);
        postDelayed(this.mHidePreviewCover, 120);
    }
}
