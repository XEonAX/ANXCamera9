package com.bef.effectsdk;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.support.annotation.Keep;
import android.util.Log;

@Keep
public class AudioPlayer {
    public static final String TAG = AudioPlayer.class.getSimpleName();
    private String mFilename;
    private boolean mIsPrepared;
    private MediaPlayer mMediaPlayer;
    private long mNativePtr;

    @Keep
    private native void nativeOnCompletion(long j);

    @Keep
    private native void nativeOnError(long j, int i, int i2);

    @Keep
    private native void nativeOnInfo(long j, int i, int i2);

    @Keep
    private native void nativeOnPrepared(long j);

    @Keep
    public void setNativePtr(long j) {
        this.mNativePtr = j;
    }

    @Keep
    public AudioPlayer() {
        this.mIsPrepared = false;
        this.mMediaPlayer = null;
        this.mIsPrepared = false;
        this.mFilename = null;
    }

    @Keep
    public int init() {
        this.mIsPrepared = false;
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.release();
        }
        this.mMediaPlayer = new MediaPlayer();
        this.mMediaPlayer.setOnInfoListener(new OnInfoListener() {
            public boolean onInfo(MediaPlayer mediaPlayer, int i, int i2) {
                String str = AudioPlayer.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer onInfo: [what, extra] = [");
                stringBuilder.append(i);
                stringBuilder.append(", ");
                stringBuilder.append(i2);
                stringBuilder.append("]");
                Log.i(str, stringBuilder.toString());
                AudioPlayer.this.nativeOnInfo(AudioPlayer.this.mNativePtr, i, i2);
                return false;
            }
        });
        this.mMediaPlayer.setOnErrorListener(new OnErrorListener() {
            public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
                String str = AudioPlayer.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer onError: [what, extra] = [");
                stringBuilder.append(i);
                stringBuilder.append(", ");
                stringBuilder.append(i2);
                stringBuilder.append("]");
                Log.d(str, stringBuilder.toString());
                try {
                    AudioPlayer.this.mMediaPlayer.stop();
                    AudioPlayer.this.mMediaPlayer.release();
                } catch (Exception e) {
                    e.printStackTrace();
                    String str2 = AudioPlayer.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("MediaPlayer stop exception on error ");
                    stringBuilder2.append(e.toString());
                    Log.e(str2, stringBuilder2.toString());
                }
                AudioPlayer.this.mMediaPlayer = null;
                AudioPlayer.this.nativeOnError(AudioPlayer.this.mNativePtr, i, i2);
                return false;
            }
        });
        this.mMediaPlayer.setOnPreparedListener(new OnPreparedListener() {
            public void onPrepared(MediaPlayer mediaPlayer) {
                Log.i(AudioPlayer.TAG, "MediaPlayer onPrepared...");
                AudioPlayer.this.mIsPrepared = true;
                AudioPlayer.this.nativeOnPrepared(AudioPlayer.this.mNativePtr);
            }
        });
        this.mMediaPlayer.setOnCompletionListener(new OnCompletionListener() {
            public void onCompletion(MediaPlayer mediaPlayer) {
                Log.i(AudioPlayer.TAG, "MediaPlayer onCompletion...");
                AudioPlayer.this.nativeOnCompletion(AudioPlayer.this.mNativePtr);
            }
        });
        return 0;
    }

    @Keep
    public int release() {
        if (this.mMediaPlayer != null) {
            try {
                this.mMediaPlayer.stop();
                this.mMediaPlayer.release();
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer stop exception on release ");
                stringBuilder.append(e.toString());
                Log.e(str, stringBuilder.toString());
            }
            this.mMediaPlayer = null;
        }
        return 0;
    }

    @Keep
    public void setDataSource(String str) {
        if (this.mMediaPlayer == null) {
            init();
        }
        if (!str.equals(this.mFilename) || !this.mIsPrepared || !this.mMediaPlayer.isPlaying()) {
            try {
                this.mMediaPlayer.reset();
                this.mMediaPlayer.setDataSource(str);
            } catch (Exception e) {
                e.printStackTrace();
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer setDataSource exception. ");
                stringBuilder.append(e.toString());
                Log.e(str2, stringBuilder.toString());
            }
            this.mFilename = str;
        }
    }

    @Keep
    public void startPlay() {
        if (this.mMediaPlayer != null) {
            try {
                if (!this.mIsPrepared) {
                    this.mMediaPlayer.prepare();
                    this.mIsPrepared = true;
                }
                this.mMediaPlayer.start();
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer setDataSource exception. ");
                stringBuilder.append(e.toString());
                Log.e(str, stringBuilder.toString());
            }
        }
    }

    @Keep
    public void stopPlay() {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return;
        }
        if (this.mIsPrepared) {
            try {
                this.mMediaPlayer.stop();
                this.mMediaPlayer.release();
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer stop exception on stop ");
                stringBuilder.append(e.toString());
                Log.e(str, stringBuilder.toString());
            }
            this.mMediaPlayer = null;
            this.mIsPrepared = false;
        }
    }

    @Keep
    public boolean pause() {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        } else if (this.mIsPrepared) {
            this.mMediaPlayer.pause();
            return true;
        } else {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
    }

    @Keep
    public boolean resume() {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        } else if (this.mIsPrepared) {
            this.mMediaPlayer.start();
            return true;
        } else {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
    }

    @Keep
    public boolean isPlaying() {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        } else if (this.mIsPrepared) {
            boolean isPlaying;
            try {
                isPlaying = this.mMediaPlayer.isPlaying();
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer isPlaying exception. ");
                stringBuilder.append(e.toString());
                Log.e(str, stringBuilder.toString());
                isPlaying = false;
            }
            return isPlaying;
        } else {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
    }

    @Keep
    public boolean seek(int i) {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        } else if (this.mIsPrepared) {
            try {
                this.mMediaPlayer.seekTo(i);
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MediaPlayer seek exception. ");
                stringBuilder.append(e.toString());
                Log.e(str, stringBuilder.toString());
            }
            return true;
        } else {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
    }

    @Keep
    public boolean setVolume(float f) {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        } else if (this.mIsPrepared) {
            this.mMediaPlayer.setVolume(f, f);
            return true;
        } else {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
    }

    @Keep
    public boolean setLoop(boolean z) {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "MediaPlayer is null!");
            return false;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("set isLoop ");
        stringBuilder.append(z);
        Log.i(str, stringBuilder.toString());
        this.mMediaPlayer.setLooping(z);
        return true;
    }

    @Keep
    public float getCurrentPlayTime() {
        if (this.mMediaPlayer != null) {
            return ((float) this.mMediaPlayer.getCurrentPosition()) / 1000.0f;
        }
        Log.e(TAG, "MediaPlayer is null!");
        return 0.0f;
    }

    @Keep
    public float getTotalPlayTime() {
        if (this.mMediaPlayer != null) {
            return ((float) this.mMediaPlayer.getDuration()) / 1000.0f;
        }
        Log.e(TAG, "MediaPlayer is null!");
        return 0.0f;
    }
}
