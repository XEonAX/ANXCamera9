package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    private long mHandle;
    private int mStatus = 0;
    private AudioTrack ur = null;
    private long us = 0;
    private Thread ut = null;
    private b uu = null;

    public a(long j) {
        this.mHandle = j;
    }

    public long hZ() {
        return this.mHandle;
    }

    public boolean a(b bVar) {
        this.uu = bVar;
        this.us = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.us <= 0) {
            return false;
        }
        id();
        if (this.ur.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.uu != null) {
            this.uu.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public void ia() {
        this.mStatus = 0;
        ic();
        ie();
    }

    public void ib() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            m1if();
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

    public void ic() {
        this.mStatus = 4;
        if (this.uu != null) {
            this.uu.stopAudio(this.mHandle);
        }
        if (this.ut != null) {
            try {
                this.ut.join();
            } catch (Exception e) {
            }
        }
        this.ut = null;
    }

    private void id() {
        ie();
        this.ur = new AudioTrack(3, 44100, 12, 2, (int) this.us, 1);
    }

    private void ie() {
        if (this.ur != null) {
            this.ur.flush();
            if (this.ur.getPlayState() == 1) {
                this.ur.stop();
            }
            this.ur.release();
            this.ur = null;
        }
    }

    /* renamed from: if */
    private int m1if() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.uu == null) {
            return -2;
        }
        this.ut = new Thread(new Runnable() {
            public void run() {
                if (a.this.ur != null && a.this.mStatus == 2) {
                    a.this.ur.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.uu.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.ur != null) {
                        try {
                            a.this.ur.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.ut.start();
        return 0;
    }
}
