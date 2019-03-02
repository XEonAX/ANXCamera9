package com.android.camera.fragment.music;

import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.media.AudioManager;
import android.media.AudioManager.OnAudioFocusChangeListener;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.CtaNoticeFragment.OnCtaNoticeClickListener;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.music.FragmentLiveMusic.Mp3DownloadCallback;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.network.NetworkDependencies;
import com.android.camera.network.live.BaseRequestException;
import com.android.camera.network.live.TTLiveMusicResourceRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.oneplus.camera.R;
import io.reactivex.Completable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Action;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import miui.app.ProgressDialog;

public class FragmentLiveMusicPager extends Fragment implements OnClickListener, OnTouchListener, OnCtaNoticeClickListener {
    private static final long MAX_REQUEST_TIME = 10800000;
    private static final String TAG = FragmentLiveMusicPager.class.getSimpleName();
    private LiveMusicInfo mCurrentSelectMusic;
    private LinearLayout mCurrentSelectedMusicLayout;
    private OnAudioFocusChangeListener mFocusChangeListener = new OnAudioFocusChangeListener() {
        public void onAudioFocusChange(int i) {
            if (i == -3 && FragmentLiveMusicPager.this.mMediaPlayer != null) {
                FragmentLiveMusicPager.this.mMediaPlayer.setVolume(0.2f, 0.2f);
            }
        }
    };
    private boolean mIsDestroyed;
    private boolean mIsLoadingAnimationStart;
    private boolean mIsMediaPreparing;
    private int mItemType;
    private List<LiveMusicInfo> mLiveMusicInfoList;
    private ProgressBar mMediaLoadingProgressBar;
    private MediaPlayer mMediaPlayer;
    private Mp3DownloadCallback mMp3DownloadCallback = new Mp3DownloadCallback() {
        public void onCompleted() {
            FragmentLiveMusicPager.this.stopDownloadAnimation();
            FragmentLiveMusicPager.this.onSelectedMusic(FragmentLiveMusicPager.this.mCurrentSelectMusic);
            FragmentUtils.removeFragmentByTag(FragmentLiveMusicPager.this.getParentFragment().getFragmentManager(), FragmentLiveMusic.TAG);
        }

        public void onFailed() {
            Log.e(FragmentLiveMusicPager.TAG, "mp3 download failed !!");
            Completable.fromAction(new Action() {
                public void run() {
                    FragmentLiveMusicPager.this.stopDownloadAnimation();
                    if (FragmentLiveMusicPager.this.mCurrentSelectedMusicLayout != null) {
                        FragmentLiveMusicPager.this.mCurrentSelectedMusicLayout.setBackgroundColor(-1);
                        FragmentLiveMusicPager.this.mCurrentSelectedMusicLayout.setAlpha(1.0f);
                    }
                    if (FragmentLiveMusicPager.this.getActivity() != null) {
                        Toast.makeText(FragmentLiveMusicPager.this.getActivity(), R.string.live_music_network_exception, 1).show();
                    }
                }
            }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
        }
    };
    private MusicAdapter mMusicAdapter;
    private int mMusicPlayPosition;
    private LinearLayout mNetworkExceptionLayout;
    private ImageView mPlayingImageView;
    private ProgressDialog mProgressDialog;
    private RecyclerView mRecyclerView;
    private LinearLayout mUpdateLayout;

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_live_music_pager, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    protected void initView(View view) {
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.music_recycler_view);
        LayoutManager linearLayoutManager = new LinearLayoutManager(getContext());
        linearLayoutManager.setOrientation(1);
        this.mRecyclerView.setLayoutManager(linearLayoutManager);
        this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        this.mUpdateLayout = (LinearLayout) view.findViewById(R.id.music_updating_layout);
        this.mNetworkExceptionLayout = (LinearLayout) view.findViewById(R.id.music_network_exception);
        this.mNetworkExceptionLayout.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (CtaNoticeFragment.checkCta(FragmentLiveMusicPager.this.getActivity().getFragmentManager(), false, FragmentLiveMusicPager.this)) {
                    FragmentLiveMusicPager.this.loadOnlineHotMusic();
                }
            }
        });
        this.mItemType = getArguments().getInt("ITEM_TYPE");
        this.mMediaPlayer = new MediaPlayer();
        this.mIsLoadingAnimationStart = false;
        this.mIsMediaPreparing = false;
        initAdapter();
    }

    private void initAdapter() {
        if (this.mItemType == 0) {
            this.mLiveMusicInfoList = new ArrayList();
            this.mMusicAdapter = new MusicAdapter(getContext(), this, this, this.mLiveMusicInfoList);
            if (CtaNoticeFragment.checkCta(getActivity().getFragmentManager(), false, this)) {
                loadOnlineHotMusic();
            }
        } else {
            this.mNetworkExceptionLayout.setVisibility(8);
            this.mUpdateLayout.setVisibility(8);
            this.mRecyclerView.setVisibility(0);
            this.mLiveMusicInfoList = MusicUtils.getMusicListFromLocalFolder(FileUtils.MUSIC_LOCAL, getContext());
            this.mMusicAdapter = new MusicAdapter(getContext(), this, this, this.mLiveMusicInfoList);
        }
        this.mRecyclerView.setAdapter(this.mMusicAdapter);
    }

    public void onPause() {
        super.onPause();
        if (this.mMediaPlayer.isPlaying()) {
            this.mMediaPlayer.pause();
            this.mMusicPlayPosition = this.mMediaPlayer.getCurrentPosition();
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mMusicPlayPosition != 0) {
            ((AudioManager) getContext().getSystemService("audio")).requestAudioFocus(this.mFocusChangeListener, 3, 1);
            this.mMediaPlayer.seekTo(this.mMusicPlayPosition);
            this.mMediaPlayer.start();
            this.mMusicPlayPosition = 0;
        }
    }

    public void onDestroy() {
        super.onDestroy();
        this.mIsDestroyed = true;
        this.mMediaPlayer.release();
        this.mRecyclerView.setAdapter(null);
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (!z && this.mMediaPlayer != null && this.mMediaPlayer.isPlaying()) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.reset();
            this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_play);
        }
    }

    public void onPositiveClick(DialogInterface dialogInterface, int i) {
        loadOnlineHotMusic();
    }

    public void onNegativeClick(DialogInterface dialogInterface, int i) {
        this.mUpdateLayout.setVisibility(8);
        this.mNetworkExceptionLayout.setVisibility(0);
    }

    private void loadOnlineHotMusic() {
        TTLiveMusicResourceRequest tTLiveMusicResourceRequest = new TTLiveMusicResourceRequest();
        boolean isConnected = NetworkDependencies.isConnected(getContext());
        long liveMusicFirstRequestTime = DataRepository.dataItemRunning().getLiveMusicFirstRequestTime();
        long currentTimeMillis = System.currentTimeMillis() - liveMusicFirstRequestTime;
        if (!isConnected || (liveMusicFirstRequestTime > 0 && currentTimeMillis < MAX_REQUEST_TIME)) {
            try {
                updateAdapter(tTLiveMusicResourceRequest.loadFromCache());
                return;
            } catch (BaseRequestException e) {
                this.mNetworkExceptionLayout.setVisibility(0);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("request online music failed ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
                return;
            }
        }
        tTLiveMusicResourceRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                final List list = (List) objArr[0];
                if (FragmentLiveMusicPager.this.isAdded()) {
                    Completable.fromAction(new Action() {
                        public void run() {
                            DataRepository.dataItemRunning().setLiveMusicFirstRequestTime(System.currentTimeMillis());
                            FragmentLiveMusicPager.this.updateAdapter(list);
                        }
                    }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                Completable.fromAction(new Action() {
                    public void run() {
                        if (FragmentLiveMusicPager.this.mNetworkExceptionLayout != null) {
                            FragmentLiveMusicPager.this.mNetworkExceptionLayout.setVisibility(0);
                        }
                    }
                }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
                str = FragmentLiveMusicPager.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("request online music failed, errorCode =  ");
                stringBuilder.append(errorCode);
                Log.e(str, stringBuilder.toString());
            }
        });
    }

    private void updateAdapter(List<LiveMusicInfo> list) {
        this.mLiveMusicInfoList.addAll(list);
        if (this.mItemType == 0) {
            this.mUpdateLayout.setVisibility(8);
            this.mNetworkExceptionLayout.setVisibility(8);
            this.mRecyclerView.setVisibility(0);
        }
        this.mMusicAdapter.notifyDataSetChanged();
    }

    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.music_network_exception) {
            this.mUpdateLayout.setVisibility(0);
            this.mNetworkExceptionLayout.setVisibility(8);
            loadOnlineHotMusic();
        } else if (id == R.id.music_play && !this.mIsMediaPreparing) {
            LiveMusicInfo liveMusicInfo = (LiveMusicInfo) view.getTag();
            if (this.mItemType == 0 && !NetworkDependencies.isConnected(getContext())) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(FileUtils.MUSIC_ONLINE);
                stringBuilder.append(liveMusicInfo.mTitle);
                stringBuilder.append(".mp3");
                String stringBuilder2 = stringBuilder.toString();
                if (new File(stringBuilder2).exists()) {
                    liveMusicInfo.mPlayUrl = stringBuilder2;
                } else {
                    Toast.makeText(getActivity(), R.string.live_music_network_exception, 1).show();
                    return;
                }
            }
            if (this.mPlayingImageView != null) {
                this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_play);
            }
            ImageView imageView = (ImageView) view.findViewById(R.id.music_play);
            if (!imageView.equals(this.mPlayingImageView)) {
                this.mPlayingImageView = imageView;
            }
            this.mMediaLoadingProgressBar = (ProgressBar) ((ViewGroup) view.getParent()).findViewById(R.id.music_loading);
            startPlayMusic(liveMusicInfo);
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        this.mCurrentSelectedMusicLayout = (LinearLayout) view.findViewById(R.id.music_layout);
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.mCurrentSelectedMusicLayout.setBackgroundColor(-3355444);
                this.mCurrentSelectedMusicLayout.setAlpha(0.5f);
                break;
            case 1:
                startDownloadMuusic((LiveMusicInfo) view.getTag());
                break;
            case 3:
                this.mCurrentSelectedMusicLayout.setBackgroundColor(-1);
                this.mCurrentSelectedMusicLayout.setAlpha(1.0f);
                break;
        }
        return true;
    }

    private void startDownloadMuusic(LiveMusicInfo liveMusicInfo) {
        String str = liveMusicInfo.mPlayUrl;
        if (this.mItemType == 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.MUSIC_ONLINE);
            stringBuilder.append(liveMusicInfo.mTitle);
            stringBuilder.append(".mp3");
            str = stringBuilder.toString();
            if (!new File(str).exists()) {
                if (NetworkDependencies.isConnected(getContext())) {
                    startDownloadAnimation();
                    OkHttpUtils.downloadMp3Async(liveMusicInfo.mPlayUrl, str, this.mMp3DownloadCallback);
                } else {
                    if (this.mCurrentSelectedMusicLayout != null) {
                        this.mCurrentSelectedMusicLayout.setBackgroundColor(-1);
                        this.mCurrentSelectedMusicLayout.setAlpha(1.0f);
                    }
                    Toast.makeText(getActivity(), R.string.live_music_network_exception, 1).show();
                    return;
                }
            }
        }
        this.mCurrentSelectMusic = liveMusicInfo;
        if (!this.mIsLoadingAnimationStart) {
            onSelectedMusic(liveMusicInfo);
            FragmentUtils.removeFragmentByTag(getParentFragment().getFragmentManager(), FragmentLiveMusic.TAG);
        }
    }

    private void onSelectedMusic(LiveMusicInfo liveMusicInfo) {
        String str = liveMusicInfo.mPlayUrl;
        if (this.mItemType == 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.MUSIC_ONLINE);
            stringBuilder.append(liveMusicInfo.mTitle);
            stringBuilder.append(".mp3");
            str = stringBuilder.toString();
        }
        LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        if (liveConfigChanges != null) {
            liveConfigChanges.onBGMChanged(str);
        }
        final TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(liveMusicInfo.mTitle);
        stringBuilder2.append("-");
        stringBuilder2.append(liveMusicInfo.mAuthor);
        CameraSettings.setCurrentLiveMusic(str, stringBuilder2.toString());
        Completable.fromAction(new Action() {
            public void run() {
                if (topAlert != null) {
                    topAlert.updateConfigItem(245);
                }
            }
        }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
    }

    private void startPlayMusic(LiveMusicInfo liveMusicInfo) {
        ((AudioManager) getContext().getSystemService("audio")).requestAudioFocus(this.mFocusChangeListener, 3, 1);
        if (liveMusicInfo != null && !liveMusicInfo.mPlayUrl.isEmpty() && !this.mIsDestroyed) {
            if (this.mCurrentSelectMusic != null && this.mCurrentSelectMusic.equals(liveMusicInfo) && this.mMediaPlayer.isPlaying()) {
                this.mMediaPlayer.stop();
                this.mMediaPlayer.reset();
                return;
            }
            try {
                if (this.mMediaPlayer != null && this.mMediaPlayer.isPlaying()) {
                    this.mMediaPlayer.stop();
                    this.mMediaPlayer.reset();
                }
                this.mPlayingImageView.setVisibility(4);
                this.mMediaLoadingProgressBar.setVisibility(0);
                this.mMediaPlayer.setDataSource(liveMusicInfo.mPlayUrl);
                this.mMediaPlayer.prepareAsync();
                this.mIsMediaPreparing = true;
                this.mMediaPlayer.setOnPreparedListener(new OnPreparedListener() {
                    public void onPrepared(MediaPlayer mediaPlayer) {
                        FragmentLiveMusicPager.this.mMediaLoadingProgressBar.setVisibility(4);
                        FragmentLiveMusicPager.this.mPlayingImageView.setVisibility(0);
                        FragmentLiveMusicPager.this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_pause);
                        mediaPlayer.start();
                        FragmentLiveMusicPager.this.mIsMediaPreparing = false;
                    }
                });
                this.mMediaPlayer.setOnCompletionListener(new OnCompletionListener() {
                    public void onCompletion(MediaPlayer mediaPlayer) {
                        FragmentLiveMusicPager.this.mMediaPlayer.stop();
                        FragmentLiveMusicPager.this.mMediaPlayer.reset();
                        FragmentLiveMusicPager.this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_play);
                    }
                });
            } catch (IOException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("mediaplayer play failed ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
            }
            this.mCurrentSelectMusic = liveMusicInfo;
        }
    }

    private void startDownloadAnimation() {
        this.mIsLoadingAnimationStart = true;
        this.mProgressDialog = new ProgressDialog(getActivity());
        CharSequence string = getString(R.string.live_music_downloading_tips);
        this.mProgressDialog.setCancelable(true);
        this.mProgressDialog.setOnKeyListener(new OnKeyListener() {
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                if (i != 4) {
                    return false;
                }
                if (FragmentLiveMusicPager.this.mProgressDialog.isShowing()) {
                    FragmentLiveMusicPager.this.mProgressDialog.dismiss();
                    if (FragmentLiveMusicPager.this.mIsLoadingAnimationStart) {
                        FragmentLiveMusicPager.this.mCurrentSelectedMusicLayout.setBackgroundColor(-1);
                        FragmentLiveMusicPager.this.mCurrentSelectedMusicLayout.setAlpha(1.0f);
                    }
                }
                return true;
            }
        });
        this.mProgressDialog.setMessage(string);
        this.mProgressDialog.show();
    }

    private void stopDownloadAnimation() {
        this.mIsLoadingAnimationStart = false;
        this.mProgressDialog.dismiss();
    }
}
