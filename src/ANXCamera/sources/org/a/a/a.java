package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    private long mHandle;
    private int mStatus = 0;
    private AudioTrack tY = null;
    private long tZ = 0;
    private Thread ua = null;
    private b ub = null;

    public a(long j) {
        this.mHandle = j;
    }

    public long hH() {
        return this.mHandle;
    }

    public boolean a(b bVar) {
        this.ub = bVar;
        this.tZ = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.tZ <= 0) {
            return false;
        }
        hL();
        if (this.tY.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.ub != null) {
            this.ub.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public void hI() {
        this.mStatus = 0;
        hK();
        hM();
    }

    public void hJ() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            hN();
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

    public void hK() {
        this.mStatus = 4;
        if (this.ub != null) {
            this.ub.stopAudio(this.mHandle);
        }
        if (this.ua != null) {
            try {
                this.ua.join();
            } catch (Exception e) {
            }
        }
        this.ua = null;
    }

    private void hL() {
        hM();
        this.tY = new AudioTrack(3, 44100, 12, 2, (int) this.tZ, 1);
    }

    private void hM() {
        if (this.tY != null) {
            this.tY.flush();
            if (this.tY.getPlayState() == 1) {
                this.tY.stop();
            }
            this.tY.release();
            this.tY = null;
        }
    }

    private int hN() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.ub == null) {
            return -2;
        }
        this.ua = new Thread(new Runnable() {
            public void run() {
                if (a.this.tY != null && a.this.mStatus == 2) {
                    a.this.tY.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.ub.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.tY != null) {
                        try {
                            a.this.tY.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.ua.start();
        return 0;
    }
}
