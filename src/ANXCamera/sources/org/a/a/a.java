package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    private long mHandle;
    private int mStatus = 0;
    private AudioTrack uk = null;
    private long ul = 0;
    private Thread um = null;
    private b un = null;

    public a(long j) {
        this.mHandle = j;
    }

    public long hT() {
        return this.mHandle;
    }

    public boolean a(b bVar) {
        this.un = bVar;
        this.ul = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.ul <= 0) {
            return false;
        }
        hX();
        if (this.uk.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.un != null) {
            this.un.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public void hU() {
        this.mStatus = 0;
        hW();
        hY();
    }

    public void hV() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            hZ();
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

    public void hW() {
        this.mStatus = 4;
        if (this.un != null) {
            this.un.stopAudio(this.mHandle);
        }
        if (this.um != null) {
            try {
                this.um.join();
            } catch (Exception e) {
            }
        }
        this.um = null;
    }

    private void hX() {
        hY();
        this.uk = new AudioTrack(3, 44100, 12, 2, (int) this.ul, 1);
    }

    private void hY() {
        if (this.uk != null) {
            this.uk.flush();
            if (this.uk.getPlayState() == 1) {
                this.uk.stop();
            }
            this.uk.release();
            this.uk = null;
        }
    }

    private int hZ() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.un == null) {
            return -2;
        }
        this.um = new Thread(new Runnable() {
            public void run() {
                if (a.this.uk != null && a.this.mStatus == 2) {
                    a.this.uk.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.un.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.uk != null) {
                        try {
                            a.this.uk.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.um.start();
        return 0;
    }
}
