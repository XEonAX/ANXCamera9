package com.android.camera.fragment.live;

import android.content.DialogInterface;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.CtaNoticeFragment.OnCtaNoticeClickListener;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.dialog.BaseDialogFragment;
import com.android.camera.fragment.music.LiveMusicInfo;
import com.android.camera.fragment.music.MusicAdapter;
import com.android.camera.fragment.music.MusicUtils;
import com.android.camera.fragment.music.OkHttpUtils;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
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
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import miui.app.ProgressDialog;

public class FragmentLiveMusic extends BaseDialogFragment implements OnClickListener, OnTouchListener, OnCtaNoticeClickListener {
    private static final int LOCAL_MUSIC = 0;
    private static final long MAX_REQUEST_TIME = 10800000;
    private static final int ONLINE_MUSIC = 1;
    public static final String TAG = FragmentLiveMusic.class.getSimpleName();
    private MusicAdapter mAdapter;
    private ImageView mCloseImageView;
    private int mCurrentItemIndex;
    private LinearLayout mCurrentMusicLayout;
    private LiveMusicInfo mCurrentSelectMusic;
    private LiveMusicInfo mCurrentTouchMusic;
    private TextView mHotMusicText;
    private boolean mIsLoadingAnimationStart;
    private boolean mIsMediaPreparing;
    private List<LiveMusicInfo> mLocalMusicInfoList;
    private TextView mLocalMusicText;
    private ProgressBar mMediaLoadingProgressBar;
    private MediaPlayer mMediaPlayer;
    private Mp3DownloadCallback mMp3DownloadCallback = new Mp3DownloadCallback() {
        public void onCompleted() {
            FragmentLiveMusic.this.stopDownloadAnimation();
            FragmentUtils.removeFragmentByTag(FragmentLiveMusic.this.getFragmentManager(), FragmentLiveMusic.TAG);
        }

        public void onFailed() {
        }
    };
    private int mMusicPlayPosition;
    private int mOldOriginVolumeStream;
    private List<LiveMusicInfo> mOnlineMusicInfoList;
    private ImageView mPlayingImageView;
    private ProgressDialog mProgressDialog;
    private RecyclerView mRecyclerView;
    private LinearLayout mUpdateLayout;

    public interface Mp3DownloadCallback {
        void onCompleted();

        void onFailed();
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_dialog_tt_music, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    protected void initView(View view) {
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.music_recycler_view);
        LayoutManager linearLayoutManager = new LinearLayoutManager(getContext());
        linearLayoutManager.setOrientation(1);
        this.mRecyclerView.setLayoutManager(linearLayoutManager);
        this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        this.mHotMusicText = (TextView) view.findViewById(R.id.music_hotmusic);
        this.mHotMusicText.setOnClickListener(this);
        this.mLocalMusicText = (TextView) view.findViewById(R.id.music_localmusic);
        this.mLocalMusicText.setOnClickListener(this);
        this.mCloseImageView = (ImageView) view.findViewById(R.id.music_item_close);
        this.mCloseImageView.setOnClickListener(this);
        this.mUpdateLayout = (LinearLayout) view.findViewById(R.id.music_updating_layout);
        if (Util.isNotchDevice) {
            CompatibilityUtils.setCutoutModeShortEdges(getDialog().getWindow());
        }
        getDialog().getWindow().getDecorView().setSystemUiVisibility(768);
        getDialog().getWindow().addFlags(Integer.MIN_VALUE);
        initMusicAdapter();
        this.mOldOriginVolumeStream = getActivity().getVolumeControlStream();
        getActivity().setVolumeControlStream(3);
    }

    private void initMusicAdapter() {
        this.mOnlineMusicInfoList = new ArrayList();
        this.mAdapter = new MusicAdapter(getContext(), this, this, this.mOnlineMusicInfoList);
        this.mRecyclerView.setAdapter(this.mAdapter);
        this.mMediaPlayer = new MediaPlayer();
        this.mCurrentItemIndex = 1;
        this.mIsLoadingAnimationStart = false;
        this.mIsMediaPreparing = false;
        if (CtaNoticeFragment.checkCta(getActivity().getFragmentManager(), false, this)) {
            InitOnlineMusicList();
        }
    }

    public void onPositiveClick(DialogInterface dialogInterface, int i) {
        InitOnlineMusicList();
    }

    public void onNegativeClick(DialogInterface dialogInterface, int i) {
    }

    private void InitOnlineMusicList() {
        TTLiveMusicResourceRequest tTLiveMusicResourceRequest = new TTLiveMusicResourceRequest();
        boolean isConnected = NetworkDependencies.isConnected(getContext());
        long liveMusicFirstRequestTime = DataRepository.dataItemRunning().getLiveMusicFirstRequestTime();
        long currentTimeMillis = System.currentTimeMillis() - liveMusicFirstRequestTime;
        if (!isConnected || (liveMusicFirstRequestTime > 0 && currentTimeMillis < MAX_REQUEST_TIME)) {
            try {
                updateOnlineMusicList(tTLiveMusicResourceRequest.loadFromCache());
                return;
            } catch (BaseRequestException e) {
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
                if (FragmentLiveMusic.this.isAdded()) {
                    FragmentLiveMusic.this.getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            DataRepository.dataItemRunning().setLiveMusicFirstRequestTime(System.currentTimeMillis());
                            FragmentLiveMusic.this.updateOnlineMusicList(list);
                        }
                    });
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
            }
        });
    }

    private void updateOnlineMusicList(List<LiveMusicInfo> list) {
        this.mOnlineMusicInfoList.addAll(list);
        if (this.mCurrentItemIndex == 1) {
            this.mUpdateLayout.setVisibility(8);
            this.mRecyclerView.setVisibility(0);
            this.mAdapter.notifyDataSetChanged();
        }
    }

    private void startPlayMusic(LiveMusicInfo liveMusicInfo) {
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
                    FragmentLiveMusic.this.mMediaLoadingProgressBar.setVisibility(4);
                    FragmentLiveMusic.this.mPlayingImageView.setVisibility(0);
                    FragmentLiveMusic.this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_pause);
                    mediaPlayer.start();
                    FragmentLiveMusic.this.mIsMediaPreparing = false;
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
            this.mMediaPlayer.seekTo(this.mMusicPlayPosition);
            this.mMediaPlayer.start();
            this.mMusicPlayPosition = 0;
        }
    }

    public void onDestroy() {
        super.onDestroy();
        this.mMediaPlayer.release();
        this.mRecyclerView.setAdapter(null);
        getActivity().setVolumeControlStream(this.mOldOriginVolumeStream);
    }

    public void onClick(View view) {
        int color = ContextCompat.getColor(getContext(), R.color.beautycamera_beauty_advanced_item_backgroud_pressed);
        int id = view.getId();
        if (id != R.id.music_play) {
            switch (id) {
                case R.id.music_item_close /*2131558470*/:
                    FragmentUtils.removeFragmentByTag(getFragmentManager(), TAG);
                    return;
                case R.id.music_hotmusic /*2131558471*/:
                    if (this.mCurrentItemIndex == 0) {
                        this.mCurrentItemIndex = 1;
                        this.mAdapter.setData(this.mOnlineMusicInfoList);
                        this.mLocalMusicText.setTextColor(ViewCompat.MEASURED_STATE_MASK);
                        this.mLocalMusicText.setAlpha(0.5f);
                        this.mHotMusicText.setAlpha(1.0f);
                        this.mHotMusicText.setTextColor(color);
                        return;
                    }
                    return;
                case R.id.music_localmusic /*2131558472*/:
                    if (this.mLocalMusicInfoList == null) {
                        this.mLocalMusicInfoList = MusicUtils.getMusicListFromLocalFolder(FileUtils.MUSIC_LOCAL, getContext());
                    }
                    if (this.mCurrentItemIndex == 1) {
                        this.mCurrentItemIndex = 0;
                        this.mAdapter.setData(this.mLocalMusicInfoList);
                        this.mLocalMusicText.setTextColor(color);
                        this.mLocalMusicText.setAlpha(1.0f);
                        this.mHotMusicText.setAlpha(0.5f);
                        this.mHotMusicText.setTextColor(ViewCompat.MEASURED_STATE_MASK);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else if (!this.mIsMediaPreparing) {
            LiveMusicInfo liveMusicInfo = (LiveMusicInfo) view.getTag();
            if (this.mCurrentItemIndex == 1 && !NetworkDependencies.isConnected(getContext())) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(FileUtils.MUSIC_ONLINE);
                stringBuilder.append(liveMusicInfo.mTitle);
                stringBuilder.append(".mp3");
                String stringBuilder2 = stringBuilder.toString();
                if (new File(stringBuilder2).exists()) {
                    liveMusicInfo.mPlayUrl = stringBuilder2;
                } else {
                    Toast.makeText(getActivity(), R.string.network_exception, 1).show();
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
        switch (motionEvent.getActionMasked()) {
            case 0:
                if (this.mCurrentMusicLayout != null) {
                    this.mCurrentMusicLayout.setBackgroundColor(-1);
                    this.mCurrentMusicLayout.setAlpha(1.0f);
                }
                this.mCurrentMusicLayout = (LinearLayout) view.findViewById(R.id.music_layout);
                this.mCurrentMusicLayout.setBackgroundColor(-3355444);
                this.mCurrentMusicLayout.setAlpha(0.5f);
                this.mCurrentTouchMusic = (LiveMusicInfo) view.getTag();
                break;
            case 1:
                this.mCurrentMusicLayout.setBackgroundColor(-1);
                this.mCurrentMusicLayout.setAlpha(1.0f);
                String str = this.mCurrentTouchMusic.mPlayUrl;
                if (this.mCurrentItemIndex != 0) {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(FileUtils.MUSIC_ONLINE);
                    stringBuilder.append(this.mCurrentTouchMusic.mTitle);
                    stringBuilder.append(".mp3");
                    str = stringBuilder.toString();
                    if (!new File(str).exists()) {
                        if (!NetworkDependencies.isConnected(getContext())) {
                            Toast.makeText(getActivity(), R.string.network_exception, 1).show();
                            break;
                        }
                        startDownloadAnimation();
                        OkHttpUtils.downloadMp3Async(this.mCurrentTouchMusic.mPlayUrl, str, this.mMp3DownloadCallback);
                    }
                }
                ((LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201)).onBGMChanged(str);
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(this.mCurrentTouchMusic.mTitle);
                stringBuilder2.append("-");
                stringBuilder2.append(this.mCurrentTouchMusic.mAuthor);
                CameraSettings.setCurrentLiveMusic(str, stringBuilder2.toString());
                topAlert.updateConfigItem(245);
                if (!this.mIsLoadingAnimationStart) {
                    FragmentUtils.removeFragmentByTag(getFragmentManager(), TAG);
                    break;
                }
                break;
            case 3:
                this.mCurrentMusicLayout.setBackgroundColor(-1);
                this.mCurrentMusicLayout.setAlpha(1.0f);
                break;
        }
        return true;
    }

    private void startDownloadAnimation() {
        this.mIsLoadingAnimationStart = true;
        this.mProgressDialog = new ProgressDialog(getActivity());
        this.mProgressDialog.setTitle("正在下载...");
        this.mProgressDialog.show();
    }

    private void stopDownloadAnimation() {
        this.mIsLoadingAnimationStart = false;
        this.mProgressDialog.dismiss();
    }
}
