package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    private long mHandle;
    private int mStatus = 0;
    private AudioTrack ua = null;
    private long ub = 0;
    private Thread uc = null;
    private b ud = null;

    public a(long j) {
        this.mHandle = j;
    }

    public long hJ() {
        return this.mHandle;
    }

    public boolean a(b bVar) {
        this.ud = bVar;
        this.ub = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.ub <= 0) {
            return false;
        }
        hN();
        if (this.ua.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.ud != null) {
            this.ud.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public void hK() {
        this.mStatus = 0;
        hM();
        hO();
    }

    public void hL() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            hP();
        }
    }

    public void resume() {
        if (this.mStatus == 3) {
            this.mStatus = 2;
        }
    }

    public void pause() {
        if (this.mStatus == 2) {
            this.mStatus = 3;
        }
    }

    public void hM() {
        this.mStatus = 4;
        if (this.ud != null) {
            this.ud.stopAudio(this.mHandle);
        }
        if (this.uc != null) {
            try {
                this.uc.join();
            } catch (Exception e) {
            }
        }
        this.uc = null;
    }

    private void hN() {
        hO();
        this.ua = new AudioTrack(3, 44100, 12, 2, (int) this.ub, 1);
    }

    private void hO() {
        if (this.ua != null) {
            this.ua.flush();
            if (this.ua.getPlayState() == 1) {
                this.ua.stop();
            }
            this.ua.release();
            this.ua = null;
        }
    }

    private int hP() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.ud == null) {
            return -2;
        }
        this.uc = new Thread(new Runnable() {
            public void run() {
                if (a.this.ua != null && a.this.mStatus == 2) {
                    a.this.ua.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.ud.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.ua != null) {
                        try {
                            a.this.ua.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.uc.start();
        return 0;
    }
}
