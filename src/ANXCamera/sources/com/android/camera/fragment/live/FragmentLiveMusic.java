package com.android.camera.fragment.live;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Environment;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.dialog.BaseDialogFragment;
import com.android.camera.fragment.music.LiveMusicInfo;
import com.android.camera.fragment.music.MusicAdapter;
import com.android.camera.fragment.music.OkHttpUtils;
import com.android.camera.log.Log;
import com.android.camera.network.live.TTLiveMusicResourceRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FragmentLiveMusic extends BaseDialogFragment implements OnClickListener {
    private static final int LOCAL_MUSIC = 0;
    private static final int ONLINE_MUSIC = 1;
    public static final String TAG = FragmentLiveMusic.class.getSimpleName();
    private MusicAdapter mAdapter;
    private ImageView mCloseImageView;
    private int mCurrentItemIndex;
    private LiveMusicInfo mCurrentSelectMusic;
    private TextView mHotMusicText;
    private List<LiveMusicInfo> mLocalMusicInfoList;
    private TextView mLocalMusicText;
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
    private List<LiveMusicInfo> mOnlineMusicInfoList;
    private ImageView mPlayingImageView;
    private RecyclerView mRecyclerView;

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
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getContext());
        linearLayoutManager.setOrientation(1);
        this.mRecyclerView.setLayoutManager(linearLayoutManager);
        this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        this.mHotMusicText = (TextView) view.findViewById(R.id.music_hotmusic);
        this.mHotMusicText.setOnClickListener(this);
        this.mLocalMusicText = (TextView) view.findViewById(R.id.music_localmusic);
        this.mLocalMusicText.setOnClickListener(this);
        this.mCloseImageView = (ImageView) view.findViewById(R.id.music_item_close);
        this.mCloseImageView.setOnClickListener(this);
        initMusicAdapter();
    }

    private void initMusicAdapter() {
        this.mOnlineMusicInfoList = new ArrayList();
        this.mAdapter = new MusicAdapter(getContext(), this, this.mOnlineMusicInfoList);
        this.mRecyclerView.setAdapter(this.mAdapter);
        this.mMediaPlayer = new MediaPlayer();
        this.mCurrentItemIndex = 1;
        new TTLiveMusicResourceRequest().execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                final List list = (List) objArr[0];
                FragmentLiveMusic.this.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        FragmentLiveMusic.this.updateOnlineMusicList(list);
                    }
                });
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
            }
        });
    }

    private void updateOnlineMusicList(List<LiveMusicInfo> list) {
        this.mOnlineMusicInfoList.addAll(list);
        if (this.mCurrentItemIndex == 1) {
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
            this.mMediaPlayer.setDataSource(liveMusicInfo.mPlayUrl);
            this.mMediaPlayer.prepare();
            this.mMediaPlayer.start();
        } catch (IOException e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mediaplayer play failed ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
        }
        this.mCurrentSelectMusic = liveMusicInfo;
    }

    private List<LiveMusicInfo> loadLoaclMusicList() {
        return new ArrayList();
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
    }

    public void onClick(View view) {
        int color = ContextCompat.getColor(getContext(), R.color.beautycamera_beauty_advanced_item_backgroud_pressed);
        int id = view.getId();
        if (id != R.id.music_play) {
            switch (id) {
                case R.id.music_item_close /*2131558465*/:
                    FragmentUtils.removeFragmentByTag(getFragmentManager(), TAG);
                    return;
                case R.id.music_hotmusic /*2131558466*/:
                    if (this.mCurrentItemIndex == 0) {
                        this.mCurrentItemIndex = 1;
                        this.mAdapter.setData(this.mOnlineMusicInfoList);
                        this.mLocalMusicText.setTextColor(-16777216);
                        this.mLocalMusicText.setAlpha(0.15f);
                        this.mHotMusicText.setAlpha(1.0f);
                        this.mHotMusicText.setTextColor(color);
                        return;
                    }
                    return;
                case R.id.music_localmusic /*2131558467*/:
                    if (this.mLocalMusicInfoList == null) {
                        this.mLocalMusicInfoList = loadLoaclMusicList();
                    }
                    if (this.mCurrentItemIndex == 1) {
                        this.mCurrentItemIndex = 0;
                        this.mAdapter.setData(this.mLocalMusicInfoList);
                        this.mLocalMusicText.setTextColor(color);
                        this.mLocalMusicText.setAlpha(1.0f);
                        this.mHotMusicText.setAlpha(0.15f);
                        this.mHotMusicText.setTextColor(-16777216);
                        return;
                    }
                    return;
                default:
                    LiveMusicInfo liveMusicInfo = (LiveMusicInfo) view.getTag();
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(Environment.getExternalStorageDirectory().getPath());
                    stringBuilder.append("/RecordDemo/music/");
                    stringBuilder.append(liveMusicInfo.mTitle);
                    stringBuilder.append(".mp3");
                    String stringBuilder2 = stringBuilder.toString();
                    String str = TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("save music: ");
                    stringBuilder3.append(stringBuilder2);
                    Log.v(str, stringBuilder3.toString());
                    startDownloadAnimation();
                    OkHttpUtils.downloadMp3Async(liveMusicInfo.mPlayUrl, stringBuilder2, this.mMp3DownloadCallback);
                    ((LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201)).onBGMChanged(stringBuilder2);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append(liveMusicInfo.mTitle);
                    stringBuilder4.append("-");
                    stringBuilder4.append(liveMusicInfo.mAuthor);
                    topAlert.alertTopMusicHint(0, stringBuilder4.toString());
                    return;
            }
        }
        LiveMusicInfo liveMusicInfo2 = (LiveMusicInfo) view.getTag();
        if (this.mPlayingImageView != null) {
            this.mPlayingImageView.setBackgroundResource(R.drawable.ic_live_music_play);
        }
        ImageView imageView = (ImageView) view.findViewById(R.id.music_play);
        if (!imageView.equals(this.mPlayingImageView)) {
            this.mPlayingImageView = imageView;
            imageView.setBackgroundResource(R.drawable.ic_live_music_pause);
        } else if (!this.mMediaPlayer.isPlaying()) {
            imageView.setBackgroundResource(R.drawable.ic_live_music_pause);
        }
        startPlayMusic(liveMusicInfo2);
    }

    private void startDownloadAnimation() {
    }

    private void stopDownloadAnimation() {
    }
}
