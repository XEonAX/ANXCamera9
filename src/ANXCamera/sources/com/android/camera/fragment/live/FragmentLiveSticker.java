package com.android.camera.fragment.live;

import android.content.Context;
import android.graphics.Rect;
import android.net.Uri;
import android.os.statistics.E2EScenario;
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
import com.android.camera.Util;
import com.android.camera.fragment.CommonRecyclerViewHolder;
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
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FragmentLiveSticker extends FragmentLiveBase {
    private static final int FRAGMENT_INFO = 4092;
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
            String str3;
            StringBuilder stringBuilder2;
            if (i != 3) {
                str3 = FragmentLiveSticker.TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("download ");
                stringBuilder2.append(str);
                stringBuilder2.append(" failed");
                Log.e(str3, stringBuilder2.toString());
                return;
            }
            int i2 = 0;
            while (i2 < FragmentLiveSticker.this.mStickerList.size()) {
                LiveStickerInfo liveStickerInfo = (LiveStickerInfo) FragmentLiveSticker.this.mStickerList.get(i2);
                if (str.equals(liveStickerInfo.id)) {
                    try {
                        StringBuilder stringBuilder3 = new StringBuilder();
                        stringBuilder3.append(FileUtils.STICKER_RESOURCE_DIR);
                        stringBuilder3.append(liveStickerInfo.name);
                        stringBuilder3.append(FileUtils.SUFFIX);
                        FileUtils.UnZipFileFolder(stringBuilder3.toString(), FileUtils.STICKER_RESOURCE_DIR);
                        StringBuilder stringBuilder4 = new StringBuilder();
                        stringBuilder4.append(FileUtils.STICKER_RESOURCE_DIR);
                        stringBuilder4.append(liveStickerInfo.name);
                        stringBuilder4.append(FileUtils.SUFFIX);
                        new File(stringBuilder4.toString()).delete();
                        ((LiveStickerInfo) FragmentLiveSticker.this.mStickerList.get(i2)).downloadState = i;
                        FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                            public void run() {
                                FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
                                if (FragmentLiveSticker.this.mSelectIndex == i2) {
                                    FragmentLiveSticker.this.onItemSelected(i2, null);
                                }
                            }
                        });
                        break;
                    } catch (Throwable e) {
                        str3 = FragmentLiveSticker.TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("unzip ");
                        stringBuilder2.append(liveStickerInfo.name);
                        Log.e(str3, stringBuilder2.toString(), e);
                    }
                } else {
                    i2++;
                }
            }
        }
    };
    private int mItemWidth;
    private LinearLayoutManager mLayoutManager;
    private View mRootView;
    int mSelectIndex;
    private List<LiveStickerInfo> mStickerList = sPersistStickerList;
    private RecyclerView mStickerListView;
    private int mTotalWidth;

    private static class StickerItemAdapter extends Adapter<StickerItemHolder> {
        Context mContext;
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
                    int i = StickerItemAdapter.this.mSelectIndex;
                    StickerItemAdapter.this.mSelectIndex = adapterPosition;
                    StickerItemAdapter.this.mListener.onItemClick(null, view, adapterPosition, getItemId());
                    StickerItemAdapter.this.notifyItemChanged(i);
                    StickerItemAdapter.this.notifyItemChanged(adapterPosition);
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
            if (liveStickerInfo.isLocal) {
                imageView.setImageResource(liveStickerInfo.iconId);
            } else {
                c.f(this.mContext).a(liveStickerInfo.icon).a(imageView);
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
    }

    protected void initView(View view) {
        this.mRootView = view;
        this.mItemWidth = getResources().getDimensionPixelSize(R.dimen.live_sticker_item_size);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        final boolean isLayoutRTL = Util.isLayoutRTL(getContext());
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
        updateData();
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
        this.mSelectIndex = i;
        StickerProtocol stickerProtocol = (StickerProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(178);
        if (stickerProtocol != null) {
            LiveStickerInfo liveStickerInfo = (LiveStickerInfo) this.mStickerList.get(this.mSelectIndex);
            CameraSettings.setCurrentLiveSticker(liveStickerInfo.name);
            int downloadState = liveStickerInfo.getDownloadState();
            if (downloadState == 1 || downloadState == 3) {
                stickerProtocol.onStickerChanged(liveStickerInfo.name);
            } else {
                liveStickerInfo.downloadState = 2;
                LiveResourceDownloadManager.getInstance().download(liveStickerInfo, this.mDownloadHelper);
            }
            scrollIfNeed(this.mSelectIndex);
        }
    }

    private void updateStickerList(List<LiveStickerInfo> list) {
        this.mStickerList.clear();
        this.mStickerList.addAll(Arrays.asList(sLocalStickerList));
        if (list != null) {
            this.mStickerList.addAll(list);
            sPersistStickerList = this.mStickerList;
        }
        this.mAdapter.notifyDataSetChanged();
    }

    private void updateData() {
        new TTLiveStickerResourceRequest("test", E2EScenario.DEFAULT_CATEGORY).execute(new ResponseListener() {
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
                FragmentLiveSticker.this.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        FragmentLiveSticker.this.updateStickerList(null);
                    }
                });
                Log.e(FragmentLiveSticker.TAG, String.format("errorCode %d msg: %s", new Object[]{Integer.valueOf(errorCode.CODE), str}));
            }
        });
    }
}
