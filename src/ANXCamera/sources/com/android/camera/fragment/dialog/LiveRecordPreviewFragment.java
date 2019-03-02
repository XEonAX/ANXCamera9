package com.android.camera.fragment.dialog;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.RelativeLayout;
import com.android.camera.Util;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.LiveVideoEditor;
import com.oneplus.camera.R;

public class LiveRecordPreviewFragment extends BaseFragment implements OnClickListener {
    public static final String TAG = "LivePreview";
    private ViewGroup mBottomLayout;

    protected void initView(View view) {
        this.mBottomLayout = (RelativeLayout) view.findViewById(R.id.live_preview_bottom_parent);
        ((MarginLayoutParams) this.mBottomLayout.getLayoutParams()).bottomMargin = getResources().getDimensionPixelSize(R.dimen.bottom_margin_bottom) + Util.sNavigationBarHeight;
        ((MarginLayoutParams) this.mBottomLayout.getLayoutParams()).height = Util.getBottomHeight(getResources());
        view.findViewById(R.id.live_preview_play).setOnClickListener(this);
        this.mBottomLayout.findViewById(R.id.live_preview_back).setOnClickListener(this);
        this.mBottomLayout.findViewById(R.id.live_preview_save).setOnClickListener(this);
        this.mBottomLayout.findViewById(R.id.live_preview_share).setOnClickListener(this);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_live_record_preview;
    }

    public int getFragmentInto() {
        return 0;
    }

    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.live_preview_play) {
            ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).startPlay();
        } else if (id == R.id.live_preview_back) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        } else if (id == R.id.live_preview_save) {
            ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).combineVideoAudio(null, null, null);
        }
    }
}
