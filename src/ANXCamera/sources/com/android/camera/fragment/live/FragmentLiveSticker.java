package com.android.camera.fragment.live;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
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
import com.android.camera.fragment.sticker.download.DownloadView;
import com.android.camera.fragment.sticker.download.DownloadView.OnDownloadSuccessListener;
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
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.sticker.LiveStickerInfo;
import com.bumptech.glide.c;
import com.bumptech.glide.request.f;
import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

public class FragmentLiveSticker extends FragmentLiveBase implements OnCtaNoticeClickListener {
    private static final int FRAGMENT_INFO = 4092;
    private static final String MAIN_URI = "snssdk1128://feed/";
    private static final String MARKET_URI = "market://details?id=com.ss.android.ugc.aweme&back=true&ref=camera&startDownload=false";
    private static final int MIN_SUPPORT_VERSION = 320;
    private static final String MORE_URI = "snssdk1128://openRecord/?recordOrigin=system&recordParam=withStickerPanel&gd_label=open_camera&label=";
    private static final String PACKAGE_NAME = "com.ss.android.ugc.aweme";
    private static final int STICKER_ITEM_SIZE = 10;
    private static final String TAG = "FragmentLiveSticker";
    private static final LiveStickerInfo[] sLocalStickerList = new LiveStickerInfo[]{new LiveStickerInfo("", "", "off.png"), new LiveStickerInfo(CameraStat.PARAM_BEAUTY_BODY_SLIM, "0eb0e0214f7bc7f7bbfb4e9f4dba7f99", "f2e24fea41e33a1c0fc9a79b8d3b91e2.png", "保持全身在画面中哦"), new LiveStickerInfo("星空喵", "a75682e81788cc12f68682b9c9067f70", "8ca064318882fa610f4623b852accd36.png"), new LiveStickerInfo("浮生若梦", "24991e783f23920397ac8aeed15994c2", "e42237f75eeff4e5162f9b0130492e36.png")};
    private static final LiveStickerInfo sMoreSticker = new LiveStickerInfo("", "", (int) R.drawable.ic_live_sticker_more);
    private static List<LiveStickerInfo> sPersistStickerList = new ArrayList(Arrays.asList(sLocalStickerList));
    private StickerItemAdapter mAdapter;
    private LiveDownloadHelper<LiveStickerInfo> mDownloadHelper = new LiveDownloadHelper<LiveStickerInfo>() {
        public boolean isDownloaded(LiveStickerInfo liveStickerInfo) {
            return false;
        }

        public Request createDownloadRequest(LiveStickerInfo liveStickerInfo) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
            stringBuilder.append(liveStickerInfo.hash);
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
            int i2 = 0;
            while (i2 < FragmentLiveSticker.this.mStickerList.size()) {
                if (str.equals(((LiveStickerInfo) FragmentLiveSticker.this.mStickerList.get(i2)).id)) {
                    break;
                }
                i2++;
            }
            i2 = -1;
            if (i2 == -1) {
                String str3 = FragmentLiveSticker.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("sticker ");
                stringBuilder2.append(str);
                stringBuilder2.append(" not found");
                Log.w(str3, stringBuilder2.toString());
                return;
            }
            final LiveStickerInfo liveStickerInfo = (LiveStickerInfo) FragmentLiveSticker.this.mStickerList.get(i2);
            liveStickerInfo.downloadState = i;
            if (i == 3 || i == 1) {
                CameraStatUtil.trackLiveStickerDownload(liveStickerInfo.name, true);
                Completable.fromAction(new Action() {
                    public void run() throws Exception {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
                        stringBuilder.append(liveStickerInfo.hash);
                        stringBuilder.append(FileUtils.SUFFIX);
                        FileUtils.UnZipFileFolder(stringBuilder.toString(), FileUtils.STICKER_RESOURCE_DIR);
                    }
                }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new CompletableObserver() {
                    public void onSubscribe(Disposable disposable) {
                    }

                    public void onComplete() {
                        FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
                        if (FragmentLiveSticker.this.mFutureSelectIndex == i2) {
                            FragmentLiveSticker.this.onItemSelected(i2, null);
                        }
                    }

                    public void onError(Throwable th) {
                        String str = FragmentLiveSticker.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("unzip ");
                        stringBuilder.append(liveStickerInfo.hash);
                        stringBuilder.append(".zip failed");
                        Log.e(str, stringBuilder.toString(), th);
                        liveStickerInfo.downloadState = 4;
                        FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
                    }
                });
            } else {
                String str4 = FragmentLiveSticker.TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("download ");
                stringBuilder3.append(str);
                stringBuilder3.append(" failed, state = ");
                stringBuilder3.append(i);
                Log.e(str4, stringBuilder3.toString());
                CameraStatUtil.trackLiveStickerDownload(liveStickerInfo.name, false);
                FragmentLiveSticker.this.showNetworkErrorHint();
                FragmentLiveSticker.this.mAdapter.notifyItemChanged(i2);
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

        class StickerItemHolder extends CommonRecyclerViewHolder implements OnClickListener, OnDownloadSuccessListener {
            boolean mWaitingDownloadSuccess;

            public StickerItemHolder(View view) {
                super(view);
                view.setOnClickListener(this);
                ((LiveDownloadView) getView(R.id.item_download)).setOnDownloadSuccessListener(this);
            }

            public void onClick(View view) {
                int adapterPosition = getAdapterPosition();
                if (adapterPosition != StickerItemAdapter.this.mSelectIndex) {
                    StickerItemAdapter.this.mListener.onItemClick(null, view, adapterPosition, getItemId());
                }
            }

            public void onDownloadSuccess(DownloadView downloadView) {
                int layoutPosition = getLayoutPosition();
                this.mWaitingDownloadSuccess = false;
                StickerItemAdapter.this.notifyItemChanged(layoutPosition);
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
            if (!liveStickerInfo.isLocal || liveStickerInfo.iconId <= 0) {
                c.f(this.mContext).a(liveStickerInfo.icon).b(this.mGlideOptions).a(imageView);
            } else {
                imageView.setImageResource(liveStickerInfo.iconId);
            }
            int downloadState = liveStickerInfo.getDownloadState();
            if (downloadState == 3) {
                stickerItemHolder.mWaitingDownloadSuccess = true;
                liveStickerInfo.downloadState = 1;
            }
            if (!(stickerItemHolder.mWaitingDownloadSuccess && downloadState == 5)) {
                liveDownloadView.setStateImage(downloadState);
                if (i == this.mSelectIndex) {
                    view.setVisibility(0);
                }
            }
            if (i != this.mSelectIndex) {
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

    static {
        sPersistStickerList.add(sMoreSticker);
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
                if (currentLiveSticker.equals(((LiveStickerInfo) this.mStickerList.get(i)).hash)) {
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
        defaultItemAnimator.setSupportsChangeAnimations(false);
        this.mStickerListView.setItemAnimator(defaultItemAnimator);
        this.mStickerListView.setAdapter(this.mAdapter);
        setItemInCenter(this.mSelectIndex);
        LiveResourceDownloadManager.getInstance().addDownloadListener(this.mDownloadListener);
        if (this.mSelectIndex == 0) {
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

    protected void onItemSelected(final int i, final View view) {
        this.mFutureSelectIndex = i;
        final LiveStickerInfo liveStickerInfo = (LiveStickerInfo) this.mStickerList.get(i);
        int downloadState = liveStickerInfo.getDownloadState();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("select sticker ");
        stringBuilder.append(i);
        stringBuilder.append(": ");
        stringBuilder.append(liveStickerInfo.hash);
        stringBuilder.append(", ");
        stringBuilder.append(downloadState);
        stringBuilder.append(", ");
        stringBuilder.append(liveStickerInfo.isLocal);
        stringBuilder.append(", ");
        stringBuilder.append(liveStickerInfo.url);
        Log.v(str, stringBuilder.toString());
        boolean z = true;
        if (liveStickerInfo == sMoreSticker) {
            PackageManager packageManager = getActivity().getPackageManager();
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(MORE_URI));
            if (packageManager.queryIntentActivities(intent, 65536).size() > 0) {
                try {
                    if (packageManager.getPackageInfo(PACKAGE_NAME, 0).versionCode < 320) {
                        intent = new Intent("android.intent.action.VIEW", Uri.parse(MAIN_URI));
                    }
                    z = false;
                } catch (NameNotFoundException e) {
                }
            }
            if (z) {
                intent = new Intent("android.intent.action.VIEW", Uri.parse(MARKET_URI));
            }
            CameraStatUtil.trackLiveStickerMore(z);
            startActivity(intent);
        } else if (liveStickerInfo.isLocal || downloadState == 5) {
            int i2 = this.mSelectIndex;
            this.mSelectIndex = i;
            this.mAdapter.setSelectIndex(this.mSelectIndex);
            this.mAdapter.notifyItemChanged(i2);
            this.mAdapter.notifyItemChanged(this.mSelectIndex);
            scrollIfNeed(this.mSelectIndex);
            CameraSettings.setCurrentLiveSticker(liveStickerInfo.hash, liveStickerInfo.name, liveStickerInfo.hint);
            StickerProtocol stickerProtocol = (StickerProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(178);
            if (stickerProtocol != null) {
                stickerProtocol.onStickerChanged(liveStickerInfo.hash);
            }
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (mainContentProtocol == null) {
                return;
            }
            if ((liveStickerInfo.hint == null || liveStickerInfo.hint.equals("")) && (liveStickerInfo.hintIcon == null || liveStickerInfo.hintIcon.equals(""))) {
                mainContentProtocol.setCenterHint(8, null, null, 0);
            } else {
                mainContentProtocol.setCenterHint(0, liveStickerInfo.hint, liveStickerInfo.hintIcon, 5000);
            }
        } else if (downloadState == 1 || downloadState == 3) {
            Completable.fromAction(new Action() {
                public void run() throws IOException {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
                    stringBuilder.append(liveStickerInfo.hash);
                    stringBuilder.append(FileUtils.SUFFIX);
                    String stringBuilder2 = stringBuilder.toString();
                    try {
                        StringBuilder stringBuilder3 = new StringBuilder();
                        stringBuilder3.append(FileUtils.STICKER_RESOURCE_DIR);
                        stringBuilder3.append(liveStickerInfo.hash);
                        Util.verifyZip(stringBuilder2, stringBuilder3.toString(), 32768);
                    } catch (IOException e) {
                        new File(stringBuilder2).delete();
                        throw e;
                    }
                }
            }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new CompletableObserver() {
                public void onSubscribe(Disposable disposable) {
                }

                public void onComplete() {
                    liveStickerInfo.downloadState = 5;
                    FragmentLiveSticker.this.onItemSelected(i, view);
                }

                public void onError(Throwable th) {
                    String str = FragmentLiveSticker.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("verify ");
                    stringBuilder.append(liveStickerInfo.hash);
                    stringBuilder.append(".zip failed");
                    Log.e(str, stringBuilder.toString(), th);
                    liveStickerInfo.downloadState = 0;
                    FragmentLiveSticker.this.mAdapter.notifyItemChanged(i);
                    FragmentLiveSticker.this.onItemSelected(i, view);
                }
            });
        } else if (downloadState != 2 && CtaNoticeFragment.checkCta(getActivity().getFragmentManager(), false, this)) {
            liveStickerInfo.downloadState = 2;
            scrollIfNeed(i);
            this.mAdapter.notifyItemChanged(i);
            LiveResourceDownloadManager.getInstance().download(liveStickerInfo, this.mDownloadHelper);
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
            this.mStickerList.add(sMoreSticker);
            sPersistStickerList = this.mStickerList;
        }
        this.mSelectIndex = 0;
        String currentLiveSticker = CameraSettings.getCurrentLiveSticker();
        if (currentLiveSticker != null) {
            for (int i = 0; i < this.mStickerList.size(); i++) {
                if (currentLiveSticker.equals(((LiveStickerInfo) this.mStickerList.get(i)).hash)) {
                    this.mSelectIndex = i;
                    break;
                }
            }
        }
        this.mAdapter.setSelectIndex(this.mSelectIndex);
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
        new TTLiveStickerResourceRequest(CameraSettings.isLiveStickerInternalChannel() ? "local_test" : "default", "default").execute(CameraSettings.isLiveStickerInternalChannel() ^ 1, new ResponseListener() {
            public void onResponse(Object... objArr) {
                final List list = (List) objArr[0];
                Completable.fromAction(new Action() {
                    public void run() {
                        HashSet hashSet = new HashSet();
                        for (LiveStickerInfo liveStickerInfo : list) {
                            liveStickerInfo.downloadState = LiveResourceDownloadManager.getInstance().getDownloadState(liveStickerInfo.id);
                            liveStickerInfo.getDownloadState();
                            hashSet.add(liveStickerInfo.hash);
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append(liveStickerInfo.hash);
                            stringBuilder.append(FileUtils.SUFFIX);
                            hashSet.add(stringBuilder.toString());
                        }
                        int i = 0;
                        for (LiveStickerInfo liveStickerInfo2 : FragmentLiveSticker.sLocalStickerList) {
                            hashSet.add(liveStickerInfo2.hash);
                        }
                        File[] listFiles = new File(FileUtils.STICKER_RESOURCE_DIR).listFiles();
                        int length = listFiles.length;
                        while (i < length) {
                            File file = listFiles[i];
                            String name = file.getName();
                            if (!hashSet.contains(name)) {
                                file.delete();
                                String str = FragmentLiveSticker.TAG;
                                StringBuilder stringBuilder2 = new StringBuilder();
                                stringBuilder2.append("remove deprecated sticker ");
                                stringBuilder2.append(name);
                                Log.i(str, stringBuilder2.toString());
                            }
                            i++;
                        }
                    }
                }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Action() {
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
                int length = (10 - FragmentLiveSticker.sLocalStickerList.length) + 1;
                for (int i = 0; i < length; i++) {
                    LiveStickerInfo liveStickerInfo = new LiveStickerInfo();
                    liveStickerInfo.iconId = R.drawable.ic_live_sticker_placeholder;
                    liveStickerInfo.url = "https://mi.com/";
                    liveStickerInfo.hash = "0123456789abcdef0123456789abcdef";
                    liveStickerInfo.id = String.valueOf(i);
                    arrayList.add(liveStickerInfo);
                }
                Completable.complete().observeOn(AndroidSchedulers.mainThread()).subscribe(new Action() {
                    public void run() {
                        FragmentLiveSticker.this.updateStickerList(arrayList);
                    }
                });
                Log.e(FragmentLiveSticker.TAG, String.format("errorCode %d msg: %s", new Object[]{Integer.valueOf(errorCode.CODE), str}));
            }
        });
    }
}
