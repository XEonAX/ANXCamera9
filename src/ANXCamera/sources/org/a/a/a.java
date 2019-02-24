package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    private long mHandle;
    private int mStatus = 0;
    private AudioTrack uA = null;
    private long uB = 0;
    private Thread uC = null;
    private b uD = null;

    public a(long j) {
        this.mHandle = j;
    }

    public long ii() {
        return this.mHandle;
    }

    public boolean a(b bVar) {
        this.uD = bVar;
        this.uB = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.uB <= 0) {
            return false;
        }
        im();
        if (this.uA.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.uD != null) {
            this.uD.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public void ij() {
        this.mStatus = 0;
        il();
        in();
    }

    public void ik() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            ip();
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

    public void il() {
        this.mStatus = 4;
        if (this.uD != null) {
            this.uD.stopAudio(this.mHandle);
        }
        if (this.uC != null) {
            try {
                this.uC.join();
            } catch (Exception e) {
            }
        }
        this.uC = null;
    }

    private void im() {
        in();
        this.uA = new AudioTrack(3, 44100, 12, 2, (int) this.uB, 1);
    }

    private void in() {
        if (this.uA != null) {
            this.uA.flush();
            if (this.uA.getPlayState() == 1) {
                this.uA.stop();
            }
            this.uA.release();
            this.uA = null;
        }
    }

    private int ip() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.uD == null) {
            return -2;
        }
        this.uC = new Thread(new Runnable() {
            public void run() {
                if (a.this.uA != null && a.this.mStatus == 2) {
                    a.this.uA.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.uD.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.uA != null) {
                        try {
                            a.this.uA.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.uC.start();
        return 0;
    }
}
