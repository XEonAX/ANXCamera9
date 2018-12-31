package com.android.camera;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.SoundPool;
import android.media.SoundPool.Builder;
import android.media.SoundPool.OnLoadCompleteListener;
import com.android.camera.log.Log;
import com.mi.config.b;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.IOException;

public class MiuiCameraSound implements Consumer<Integer> {
    public static final int AUDIO_CAPTURE = 7;
    public static final int FAST_BURST = 4;
    public static final int FOCUS_COMPLETE = 1;
    public static final int KNOBS_SCROLL = 6;
    private static final int NUM_MEDIA_SOUND_STREAMS = 1;
    public static final int SHUTTER_CLICK = 0;
    public static final int SHUTTER_DELAY = 5;
    private static final String[] SOUND_FILES = new String[]{"camera_click_v9.mp3", "camera_focus_v9.mp3", "video_record_start_v9.ogg", "video_record_end_v9.ogg", "camera_fast_burst_v9.ogg", "sound_shuter_delay_bee.ogg", "/system/media/audio/ui/NumberPickerValueChange.ogg", "audio_capture.ogg"};
    private static final int SOUND_NOT_LOADED = -1;
    public static final int START_VIDEO_RECORDING = 2;
    public static final int STOP_VIDEO_RECORDING = 3;
    private static final String TAG = "MiuiCameraSound";
    private final AssetManager mAssetManager;
    private final AudioManager mAudioManager;
    private Disposable mDisposable;
    private FlowableEmitter<Integer> mFlowableEmitter;
    private long mLastPlayTime = 0;
    private OnLoadCompleteListener mLoadCompleteListener = new OnLoadCompleteListener() {
        public void onLoadComplete(SoundPool soundPool, int i, int i2) {
            if (i2 != 0) {
                String str = MiuiCameraSound.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to load sound for playback (status: ");
                stringBuilder.append(i2);
                stringBuilder.append(")");
                Log.e(str, stringBuilder.toString());
            } else if (MiuiCameraSound.this.mSoundIdToPlay == i) {
                soundPool.play(i, 1.0f, 1.0f, 0, 0, 1.0f);
                MiuiCameraSound.this.mSoundIdToPlay = -1;
            }
        }
    };
    private int mSoundIdToPlay;
    private int[] mSoundIds;
    private SoundPool mSoundPool;

    public MiuiCameraSound(Context context) {
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
        this.mAssetManager = context.getAssets();
        Builder builder = new Builder();
        int i = 1;
        builder.setMaxStreams(1);
        AudioAttributes.Builder builder2 = new AudioAttributes.Builder();
        if (!b.fM()) {
            i = 7;
        }
        builder.setAudioAttributes(builder2.setInternalLegacyStreamType(i).build());
        this.mSoundPool = builder.build();
        this.mSoundPool.setOnLoadCompleteListener(this.mLoadCompleteListener);
        this.mSoundIds = new int[SOUND_FILES.length];
        for (int i2 = 0; i2 < this.mSoundIds.length; i2++) {
            this.mSoundIds[i2] = -1;
        }
        this.mSoundIdToPlay = -1;
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> flowableEmitter) throws Exception {
                MiuiCameraSound.this.mFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.io()).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer num) throws Exception {
                String str = MiuiCameraSound.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("play sound too fast: ");
                stringBuilder.append(num.toString());
                Log.e(str, stringBuilder.toString());
            }
        }).subscribe((Consumer) this);
    }

    public synchronized void load(int i) {
        if (i >= 0) {
            if (i < SOUND_FILES.length) {
                if (this.mSoundIds[i] == -1) {
                    if (SOUND_FILES[i].startsWith("/")) {
                        this.mSoundIds[i] = this.mSoundPool.load(SOUND_FILES[i], 1);
                    } else {
                        this.mSoundIds[i] = loadFromAsset(i);
                    }
                }
            }
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unknown sound requested: ");
        stringBuilder.append(i);
        throw new RuntimeException(stringBuilder.toString());
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0038 A:{SYNTHETIC, Splitter: B:19:0x0038} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004c A:{SYNTHETIC, Splitter: B:25:0x004c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int loadFromAsset(int i) {
        IOException e;
        Throwable th;
        AssetFileDescriptor assetFileDescriptor = null;
        try {
            AssetFileDescriptor openFd = this.mAssetManager.openFd(SOUND_FILES[i]);
            try {
                int load = this.mSoundPool.load(openFd, 1);
                if (openFd == null) {
                    return load;
                }
                try {
                    openFd.close();
                    return load;
                } catch (IOException e2) {
                    Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e2.printStackTrace();
                    return load;
                }
            } catch (IOException e3) {
                IOException iOException = e3;
                assetFileDescriptor = openFd;
                e2 = iOException;
                try {
                    e2.printStackTrace();
                    if (assetFileDescriptor != null) {
                    }
                    return -1;
                } catch (Throwable th2) {
                    th = th2;
                    if (assetFileDescriptor != null) {
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                Throwable th4 = th3;
                assetFileDescriptor = openFd;
                th = th4;
                if (assetFileDescriptor != null) {
                    try {
                        assetFileDescriptor.close();
                    } catch (IOException e32) {
                        Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                        e32.printStackTrace();
                    }
                }
                throw th;
            }
        } catch (IOException e4) {
            e2 = e4;
            e2.printStackTrace();
            if (assetFileDescriptor != null) {
                try {
                    assetFileDescriptor.close();
                } catch (IOException e22) {
                    Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e22.printStackTrace();
                }
            }
            return -1;
        }
    }

    private synchronized void play(int i, int i2) {
        if (i >= 0) {
            if (i < SOUND_FILES.length) {
                if (this.mSoundIds[i] == -1) {
                    if (SOUND_FILES[i].startsWith("/")) {
                        this.mSoundIdToPlay = this.mSoundPool.load(SOUND_FILES[i], 1);
                    } else {
                        this.mSoundIdToPlay = loadFromAsset(i);
                    }
                    this.mSoundIds[i] = this.mSoundIdToPlay;
                } else {
                    this.mSoundPool.play(this.mSoundIds[i], 1.0f, 1.0f, 0, i2 - 1, 1.0f);
                    this.mLastPlayTime = System.currentTimeMillis();
                }
            }
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unknown sound requested: ");
        stringBuilder.append(i);
        throw new RuntimeException(stringBuilder.toString());
    }

    public void release() {
        if (!(this.mDisposable == null || this.mDisposable.isDisposed())) {
            this.mDisposable.dispose();
        }
        if (this.mSoundPool != null) {
            this.mSoundPool.release();
            this.mSoundPool = null;
        }
    }

    private void playSound(int i, int i2) {
        if (!b.fM() || this.mAudioManager.getRingerMode() == 2) {
            play(i, i2);
        }
    }

    public void playSound(int i) {
        if (!this.mFlowableEmitter.isCancelled()) {
            this.mFlowableEmitter.onNext(Integer.valueOf(i));
        }
    }

    public long getLastSoundPlayTime() {
        return this.mLastPlayTime;
    }

    public void accept(@NonNull Integer num) throws Exception {
        playSound(num.intValue(), 1);
    }
}
