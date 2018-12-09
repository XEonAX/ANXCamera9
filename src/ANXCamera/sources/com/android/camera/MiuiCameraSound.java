package com.android.camera;

import android.content.Context;
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
        if (!b.fJ()) {
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
    private int loadFromAsset(int r5) {
        /*
        r4 = this;
        r0 = 0;
        r1 = r4.mAssetManager;	 Catch:{ IOException -> 0x0032 }
        r2 = SOUND_FILES;	 Catch:{ IOException -> 0x0032 }
        r5 = r2[r5];	 Catch:{ IOException -> 0x0032 }
        r5 = r1.openFd(r5);	 Catch:{ IOException -> 0x0032 }
        r0 = r4.mSoundPool;	 Catch:{ IOException -> 0x002b, all -> 0x0026 }
        r1 = 1;
        r0 = r0.load(r5, r1);	 Catch:{ IOException -> 0x002b, all -> 0x0026 }
        if (r5 == 0) goto L_0x0049;
    L_0x0016:
        r5.close();	 Catch:{ IOException -> 0x001a }
    L_0x0019:
        goto L_0x0049;
    L_0x001a:
        r5 = move-exception;
        r1 = "MiuiCameraSound";
        r2 = "IOException occurs when closing Camera Sound AssetFileDescriptor.";
        com.android.camera.log.Log.e(r1, r2);
        r5.printStackTrace();
        goto L_0x0019;
    L_0x0026:
        r0 = move-exception;
        r3 = r0;
        r0 = r5;
        r5 = r3;
        goto L_0x004a;
    L_0x002b:
        r0 = move-exception;
        r3 = r0;
        r0 = r5;
        r5 = r3;
        goto L_0x0033;
    L_0x0030:
        r5 = move-exception;
        goto L_0x004a;
    L_0x0032:
        r5 = move-exception;
    L_0x0033:
        r5.printStackTrace();	 Catch:{ all -> 0x0030 }
        if (r0 == 0) goto L_0x0048;
    L_0x0038:
        r0.close();	 Catch:{ IOException -> 0x003c }
    L_0x003b:
        goto L_0x0048;
    L_0x003c:
        r5 = move-exception;
        r0 = "MiuiCameraSound";
        r1 = "IOException occurs when closing Camera Sound AssetFileDescriptor.";
        com.android.camera.log.Log.e(r0, r1);
        r5.printStackTrace();
        goto L_0x003b;
    L_0x0048:
        r0 = -1;
    L_0x0049:
        return r0;
    L_0x004a:
        if (r0 == 0) goto L_0x005b;
    L_0x004c:
        r0.close();	 Catch:{ IOException -> 0x0050 }
        goto L_0x005b;
    L_0x0050:
        r0 = move-exception;
        r1 = "MiuiCameraSound";
        r2 = "IOException occurs when closing Camera Sound AssetFileDescriptor.";
        com.android.camera.log.Log.e(r1, r2);
        r0.printStackTrace();
    L_0x005b:
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.MiuiCameraSound.loadFromAsset(int):int");
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
        if (!b.fJ() || this.mAudioManager.getRingerMode() == 2) {
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
