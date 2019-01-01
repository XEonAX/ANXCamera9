package com.android.camera.fragment.live;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Rect;
import android.net.Uri;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.CtaNoticeFragment.OnCtaNoticeClickListener;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.network.download.Request;
import com.android.camera.network.download.Verifier.Md5;
import com.android.camera.network.live.TTLiveStickerResourceRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.network.resource.LiveDownloadHelper;
import com.android.camera.network.resource.LiveResourceDownloadManager;
import com.android.camera.network.resource.OnLiveDownloadListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.camera.sticker.LiveStickerInfo;
import com.bumptech.glide.c;
import com.bumptech.glide.request.f;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FragmentLiveSticker extends FragmentLiveBase implements OnCtaNoticeClickListener {
    private static final int FRAGMENT_INFO = 4092;
    private static final int STICKER_ITEM_SIZE = 10;
    private static final String TAG = "FragmentLiveSticker";
    private static final LiveStickerInfo[] sLocalStickerList = new LiveStickerInfo[]{new LiveStickerInfo("", R.drawable.ff), new LiveStickerInfo("2D_angel", R.drawable.color_effect_image_berry), new LiveStickerInfo("2D_bubble", R.drawable.color_effect_image_warm)};
    private static List<LiveStickerInfo> sPersistStickerList = new ArrayList(Arrays.asList(sLocalStickerList));
    private StickerItemAdapter mAdapter;
    private LiveDownloadHelper<LiveStickerInfo> mDownloadHelper = new LiveDownloadHelper<LiveStickerInfo>() {
        public boolean isDownloaded(LiveStickerInfo liveStickerInfo) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
            stringBuilder.append(liveStickerInfo.name);
            return new File(stringBuilder.toString()).exists();
        }

        public Request createDownloadRequest(LiveStickerInfo liveStickerInfo) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
            stringBuilder.append(liveStickerInfo.name);
            stringBuilder.append(FileUtils.SUFFIX);
            Request request = new Request(liveStickerInfo.id, Uri.parse(liveStickerInfo.url), new File(stringBuilder.toString()));
            request.setVerifier(new Md5(liveStickerInfo.hash));
            return request;
        }
    };
    private OnLiveDownloadListener mDownloadListener = new OnLiveDownloadListener() {
        public void onProgressUpdate(String str, int i) {
            String str2 = FragmentLiveSticker.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("update ");
            stringBuilder.append(str);
            stringBuilder.append(": ");
            stringBuilder.append(i);
            Log.v(str2, stringBuilder.toString());
        }

        public void onFinish(String str, int i) {
            String str2 = FragmentLiveSticker.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("finish ");
            stringBuilder.append(str);
            stringBuilder.append(": ");
            stringBuilder.append(i);
            Log.v(str2, stringBuilder.toString());
            LiveStickerInfo liveStickerInfo = null;
            int i2 = 0;
            while (i2 < FragmentLiveSticker.this.mStickerList.size()) {
                liveStickerInfo = (LiveStickerInfo) FragmentLiveSticker.this.mStickerList.get(i2);
                if (str.equals(liveStickerInfo.id)) {
                    break;
                }
                i2++;
            }
            i2 = -1;
            String str3;
            if (liveStickerInfo == null) {
                str3 = FragmentLiveSticker.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("sticker ");
                stringBuilder2.append(str);
                stringBuilder2.append(" not found");
                Log.w(str3, stringBuilder2.toString());
                return;
            }
            liveStickerInfo.downloadState = i;
            if (i != 3) {
                str2 = FragmentLiveSticker.TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("download ");
                stringBuilder3.append(str);
                stringBuilder3.append(" failed, state = ");
                stringBuilder3.append(i);
                Log.e(str2, stringBuilder3.toString());
                FragmentLiveSticker.this.showNetworkErrorHint();
                FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
                    }
                });
            } else {
                try {
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append(FileUtils.STICKER_RESOURCE_DIR);
                    stringBuilder4.append(liveStickerInfo.name);
                    stringBuilder4.append(FileUtils.SUFFIX);
                    FileUtils.UnZipFileFolder(stringBuilder4.toString(), FileUtils.STICKER_RESOURCE_DIR);
                    StringBuilder stringBuilder5 = new StringBuilder();
                    stringBuilder5.append(FileUtils.STICKER_RESOURCE_DIR);
                    stringBuilder5.append(liveStickerInfo.name);
                    stringBuilder5.append(FileUtils.SUFFIX);
                    new File(stringBuilder5.toString()).delete();
                    FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
                            if (FragmentLiveSticker.this.mFutureSelectIndex == i2) {
                                FragmentLiveSticker.this.onItemSelected(i2, null);
                            }
                        }
                    });
                } catch (Throwable e) {
                    str3 = FragmentLiveSticker.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("unzip ");
                    stringBuilder.append(liveStickerInfo.name);
                    Log.e(str3, stringBuilder.toString(), e);
                }
            }
        }
    };
    int mFutureSelectIndex;
    private int mItemWidth;
    private LinearLayoutManager mLayoutManager;
    private View mRootView;
    int mSelectIndex;
    private List<LiveStickerInfo> mStickerList = sPersistStickerList;
    private RecyclerView mStickerListView;
    private int mTotalWidth;
    private View mUpdatingView;

    private static class StickerItemAdapter extends Adapter<StickerItemHolder> {
        Context mContext;
        f mGlideOptions = new f().J(R.drawable.ic_live_sticker_placeholder);
        LayoutInflater mLayoutInflater;
        OnItemClickListener mListener;
        int mSelectIndex;
        List<LiveStickerInfo> mStickerList;

        class StickerItemHolder extends CommonRecyclerViewHolder implements OnClickListener {
            public StickerItemHolder(View view) {
                super(view);
                view.setOnClickListener(this);
            }

            public void onClick(View view) {
                int adapterPosition = getAdapterPosition();
                if (adapterPosition != StickerItemAdapter.this.mSelectIndex) {
                    StickerItemAdapter.this.mListener.onItemClick(null, view, adapterPosition, getItemId());
                }
            }
        }

        public StickerItemAdapter(Context context, List<LiveStickerInfo> list, int i, OnItemClickListener onItemClickListener) {
            this.mContext = context;
            this.mStickerList = list;
            this.mSelectIndex = i;
            this.mLayoutInflater = LayoutInflater.from(context);
            this.mListener = onItemClickListener;
        }

        public StickerItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new StickerItemHolder(this.mLayoutInflater.inflate(R.layout.fragment_live_sticker_item, viewGroup, false));
        }

        public void onBindViewHolder(StickerItemHolder stickerItemHolder, int i) {
            LiveDownloadView liveDownloadView = (LiveDownloadView) stickerItemHolder.getView(R.id.item_download);
            ImageView imageView = (ImageView) stickerItemHolder.getView(R.id.item_image);
            View view = stickerItemHolder.getView(R.id.item_selected_indicator);
            LiveStickerInfo liveStickerInfo = (LiveStickerInfo) this.mStickerList.get(i);
            stickerItemHolder.itemView.setTag(liveStickerInfo);
            if (liveStickerInfo.isLocal || liveStickerInfo.iconId > 0) {
                imageView.setImageResource(liveStickerInfo.iconId);
            } else {
                c.f(this.mContext).a(liveStickerInfo.icon).b(this.mGlideOptions).a(imageView);
            }
            int downloadState = liveStickerInfo.getDownloadState();
            liveDownloadView.setStateImage(downloadState);
            if (downloadState == 3) {
                liveStickerInfo.downloadState = 1;
            }
            if (i == this.mSelectIndex) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
        }

        public int getItemCount() {
            return this.mStickerList.size();
        }

        public void setSelectIndex(int i) {
            this.mSelectIndex = i;
        }
    }

    protected void initView(View view) {
        this.mRootView = view;
        this.mItemWidth = getResources().getDimensionPixelSize(R.dimen.live_sticker_item_size);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        final boolean isLayoutRTL = Util.isLayoutRTL(getContext());
        this.mUpdatingView = this.mRootView.findViewById(R.id.live_sticker_updating);
        this.mStickerListView = (RecyclerView) this.mRootView.findViewById(R.id.live_sticker_list);
        this.mSelectIndex = 0;
        String currentLiveSticker = CameraSettings.getCurrentLiveSticker();
        if (currentLiveSticker != null) {
            for (int i = 0; i < this.mStickerList.size(); i++) {
                if (currentLiveSticker.equals(((LiveStickerInfo) this.mStickerList.get(i)).name)) {
                    this.mSelectIndex = i;
                    break;
                }
            }
        }
        this.mAdapter = new StickerItemAdapter(getContext(), this.mStickerList, this.mSelectIndex, new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                FragmentLiveSticker.this.onItemSelected(i, view);
            }
        });
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mStickerListView.setLayoutManager(this.mLayoutManager);
        this.mStickerListView.addItemDecoration(new ItemDecoration() {
            final int mLeftMargin = FragmentLiveSticker.this.getResources().getDimensionPixelSize(R.dimen.live_sticker_list_margin_left);
            final int mRightMargin = FragmentLiveSticker.this.getResources().getDimensionPixelSize(R.dimen.live_sticker_list_margin_right);

            public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                if (isLayoutRTL) {
                    if (childAdapterPosition == 0) {
                        rect.set(0, 0, this.mLeftMargin, 0);
                    } else if (childAdapterPosition + 1 == recyclerView.getAdapter().getItemCount()) {
                        rect.set(this.mRightMargin, 0, 0, 0);
                    }
                } else if (childAdapterPosition == 0) {
                    rect.set(this.mLeftMargin, 0, 0, 0);
                } else if (childAdapterPosition + 1 == recyclerView.getAdapter().getItemCount()) {
                    rect.set(0, 0, this.mRightMargin, 0);
                }
            }
        });
        ItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mStickerListView.setItemAnimator(defaultItemAnimator);
        this.mStickerListView.setAdapter(this.mAdapter);
        setItemInCenter(this.mSelectIndex);
        LiveResourceDownloadManager.getInstance().addDownloadListener(this.mDownloadListener);
        if (sPersistStickerList.size() == sLocalStickerList.length && this.mSelectIndex == 0) {
            reload();
        }
    }

    public void onDestroy() {
        super.onDestroy();
        LiveResourceDownloadManager.getInstance().removeDownloadListener(this.mDownloadListener);
    }

    public int getFragmentInto() {
        return 4092;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_live_sticker;
    }

    private void setItemInCenter(int i) {
        this.mLayoutManager.scrollToPositionWithOffset(i, (this.mTotalWidth / 2) - (this.mItemWidth / 2));
    }

    private boolean scrollIfNeed(int i) {
        int max;
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            max = Math.max(0, i - 1);
        } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            max = Math.min(i + 1, this.mLayoutManager.getItemCount() - 1);
        } else {
            max = i;
        }
        if (max == i) {
            return false;
        }
        this.mLayoutManager.scrollToPosition(max);
        return true;
    }

    protected void onItemSelected(int i, View view) {
        this.mFutureSelectIndex = i;
        StickerProtocol stickerProtocol = (StickerProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(178);
        if (stickerProtocol != null) {
            LiveStickerInfo liveStickerInfo = (LiveStickerInfo) this.mStickerList.get(i);
            int downloadState = liveStickerInfo.getDownloadState();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("select sticker ");
            stringBuilder.append(i);
            stringBuilder.append(": ");
            stringBuilder.append(liveStickerInfo.name);
            stringBuilder.append(", ");
            stringBuilder.append(downloadState);
            stringBuilder.append(", ");
            stringBuilder.append(liveStickerInfo.isLocal);
            stringBuilder.append(", ");
            stringBuilder.append(liveStickerInfo.url);
            Log.v(str, stringBuilder.toString());
            if (downloadState == 1 || downloadState == 3) {
                downloadState = this.mSelectIndex;
                this.mSelectIndex = i;
                this.mAdapter.setSelectIndex(this.mSelectIndex);
                this.mAdapter.notifyItemChanged(downloadState);
                this.mAdapter.notifyItemChanged(this.mSelectIndex);
                scrollIfNeed(this.mSelectIndex);
                CameraSettings.setCurrentLiveSticker(liveStickerInfo.name);
                stickerProtocol.onStickerChanged(liveStickerInfo.name);
            } else if (!liveStickerInfo.isLocal && CtaNoticeFragment.checkCta(getActivity().getFragmentManager(), false, this)) {
                liveStickerInfo.downloadState = 2;
                this.mAdapter.notifyItemChanged(i);
                LiveResourceDownloadManager.getInstance().download(liveStickerInfo, this.mDownloadHelper);
            }
        }
    }

    public void onPositiveClick(DialogInterface dialogInterface, int i) {
        reload();
    }

    public void onNegativeClick(DialogInterface dialogInterface, int i) {
    }

    private void updateStickerList(List<LiveStickerInfo> list) {
        this.mStickerList.clear();
        this.mStickerList.addAll(Arrays.asList(sLocalStickerList));
        if (list != null) {
            this.mStickerList.addAll(list);
            sPersistStickerList = this.mStickerList;
        }
        this.mAdapter.notifyDataSetChanged();
        setItemInCenter(this.mSelectIndex);
        this.mUpdatingView.setVisibility(8);
        this.mStickerListView.setVisibility(0);
    }

    private void showNetworkErrorHint() {
        ToastUtils.showToast(getContext(), getResources().getString(R.string.live_sticker_network_error_hint), 80);
    }

    private void reload() {
        this.mUpdatingView.setVisibility(0);
        this.mStickerListView.setVisibility(4);
        this.mSelectIndex = 0;
        this.mAdapter.setSelectIndex(this.mSelectIndex);
        updateData();
    }

    private void updateData() {
        new TTLiveStickerResourceRequest("test", "default").execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                final List<LiveStickerInfo> list = (List) objArr[0];
                for (LiveStickerInfo liveStickerInfo : list) {
                    liveStickerInfo.downloadState = LiveResourceDownloadManager.getInstance().getDownloadState(liveStickerInfo.id);
                }
                FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        FragmentLiveSticker.this.updateStickerList(list);
                    }
                });
                String str = FragmentLiveSticker.TAG;
                String str2 = "getStickerList %d ";
                Object[] objArr2 = new Object[1];
                objArr2[0] = Integer.valueOf(list == null ? -1 : list.size());
                Log.d(str, String.format(str2, objArr2));
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                final List arrayList = new ArrayList();
                if (errorCode == ErrorCode.NETWORK_NOT_CONNECTED) {
                    int length = (10 - FragmentLiveSticker.sLocalStickerList.length) + 1;
                    for (int i = 0; i < length; i++) {
                        LiveStickerInfo liveStickerInfo = new LiveStickerInfo();
                        liveStickerInfo.iconId = R.drawable.ic_live_sticker_placeholder;
                        arrayList.add(liveStickerInfo);
                    }
                }
                FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        FragmentLiveSticker.this.updateStickerList(arrayList);
                    }
                });
                Log.e(FragmentLiveSticker.TAG, String.format("errorCode %d msg: %s", new Object[]{Integer.valueOf(errorCode.CODE), str}));
            }
        });
    }
}
