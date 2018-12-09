package com.ss.android.ttve.mediacodec;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.annotation.Keep;
import android.util.Log;
import android.view.Surface;
import com.android.camera.Util;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.ss.android.ttve.common.TEEglStateSaver;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.common.TESharedContext;
import com.ss.android.ttve.common.TETextureDrawer;
import java.io.FileOutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;

@Keep
public class TEAvcEncoder {
    private static boolean DEBUG = false;
    private static final int MASK_BIT_RATE = 1;
    private static final int MASK_FORCE_RESTART = 4;
    private static final int MASK_FRAME_RATE = 2;
    private static int MAX_FRAME_RATE = 2000;
    private static int MIN_FRAME_RATE = 7;
    private static final String TAG = TEAvcEncoder.class.getSimpleName();
    private static final int TIMEOUT_USEC = 0;
    private static final int TIMEOUT_USEC_EOS = 10000;
    private static final String VIDEO_MIME_TYPE = "video/avc";
    private static int avcqueuesize = 25;
    private static TEAvcEncoder c_curObj = null;
    public ArrayBlockingQueue<CodecData> AVCQueue = new ArrayBlockingQueue(avcqueuesize);
    public byte[] configbyte = null;
    private int mBufferIndex = -1;
    private boolean mEndOfStream = false;
    private boolean mFirstFrame = true;
    private CodecData mLastCodecData = null;
    private boolean m_bNeedSingalEnd = false;
    private boolean m_bSignalEndOfStream = false;
    private boolean m_bSuccessInit = false;
    private int m_bitRate = 0;
    private MediaFormat m_codecFormat = null;
    private int m_colorFormat = 0;
    private int m_configStatus = 0;
    private TEEglStateSaver m_eglStateSaver;
    private long m_encodeStartTime = -1;
    private int m_frameRate = 0;
    private long m_getnerateIndex = 0;
    private int m_height = 0;
    private int m_iFrameInternal = 0;
    private boolean m_isNeedReconfigure = false;
    private MediaCodec m_mediaCodec = null;
    private int m_profile = 0;
    private TESharedContext m_sharedContext;
    private Surface m_surface = null;
    private TETextureDrawer m_textureDrawer;
    private boolean m_useInputSurface = true;
    private int m_width = 0;
    private byte[] pps;
    private byte[] sps;

    public static class CodecData {
        public byte[] data = null;
        public int flag;
        public long pts = 0;
    }

    public static TEAvcEncoder createEncoderObject() {
        c_curObj = new TEAvcEncoder();
        return c_curObj;
    }

    private int configEncode() {
        try {
            if (reconfigureMediaFormat() != 0) {
                return -1;
            }
            this.m_mediaCodec = MediaCodec.createEncoderByType(VIDEO_MIME_TYPE);
            this.m_mediaCodec.configure(this.m_codecFormat, null, null, 1);
            if (VERSION.SDK_INT >= 18 && this.m_useInputSurface) {
                this.m_surface = this.m_mediaCodec.createInputSurface();
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }
    }

    @TargetApi(18)
    public int initEncoder(int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
        boolean z2 = z;
        if (z2 && VERSION.SDK_INT < 18) {
            return -1;
        }
        this.m_useInputSurface = z2;
        if (this.m_useInputSurface) {
            this.m_colorFormat = 2130708361;
        } else {
            this.m_colorFormat = i4;
        }
        setEncoder(i, i2, i3, i6, i5, this.m_colorFormat, i7);
        this.m_isNeedReconfigure = true;
        this.m_bSuccessInit = true;
        this.m_bSignalEndOfStream = false;
        return configEncode();
    }

    public void releaseEncoder() {
        stopEncoder();
        if (this.m_mediaCodec != null) {
            this.m_mediaCodec.release();
            this.m_mediaCodec = null;
        }
        if (this.m_surface != null) {
            this.m_surface.release();
            this.m_surface = null;
        }
        c_curObj = null;
    }

    public Surface getInputSurface() {
        return this.m_surface;
    }

    public int setEncoder(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        this.m_configStatus = 0;
        if (i > 0) {
            this.m_width = i;
        }
        if (i2 > 0) {
            this.m_height = i2;
        }
        if (i3 > 0) {
            if (i3 < MIN_FRAME_RATE) {
                TELogUtil.w(TAG, String.format(Locale.getDefault(), "_frameRate:[%d] is too small, change to %d", new Object[]{Integer.valueOf(i3), Integer.valueOf(MIN_FRAME_RATE)}));
                i3 = MIN_FRAME_RATE;
            } else if (i3 > MAX_FRAME_RATE) {
                TELogUtil.w(TAG, String.format(Locale.getDefault(), "_frameRate:[%d] is too large, change to %d", new Object[]{Integer.valueOf(i3), Integer.valueOf(MAX_FRAME_RATE)}));
                i3 = MAX_FRAME_RATE;
            }
            if (this.m_frameRate != i3) {
                this.m_frameRate = i3;
                if (i3 < this.m_iFrameInternal) {
                    this.m_iFrameInternal = i3;
                }
                this.m_isNeedReconfigure = true;
                this.m_configStatus |= 2;
            }
        }
        if (i4 > 0 && this.m_bitRate != i4) {
            this.m_bitRate = i4;
            this.m_isNeedReconfigure = true;
            this.m_configStatus = 1 | this.m_configStatus;
        }
        if (i5 >= 0) {
            this.m_iFrameInternal = i5;
        }
        if (i6 > 0) {
            this.m_colorFormat = i6;
        }
        if (i7 >= 0) {
            this.m_profile = i7;
        }
        return 0;
    }

    public boolean initTextureDrawer() {
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
        this.m_textureDrawer = TETextureDrawer.create();
        if (this.m_textureDrawer == null) {
            return false;
        }
        this.m_textureDrawer.setRotation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        this.m_textureDrawer.setFlipScale(1.0f, -1.0f);
        return true;
    }

    public void releaseTextureDrawer() {
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
    }

    @TargetApi(16)
    public int startEncoder() {
        TELogUtil.d(TAG, "startEncoder...");
        try {
            if (VERSION.SDK_INT >= 18 && this.m_useInputSurface) {
                if (this.m_sharedContext == null) {
                    this.m_sharedContext = TESharedContext.create(this.m_eglStateSaver.getSavedEGLContext(), 64, 64, TESharedContext.EGL_RECORDABLE_ANDROID, this.m_surface);
                    if (this.m_sharedContext == null) {
                        return -2;
                    }
                } else if (!this.m_sharedContext.updateSurface(0, 0, TESharedContext.EGL_RECORDABLE_ANDROID, this.m_surface)) {
                    return -2;
                }
                if (!initTextureDrawer()) {
                    return -3;
                }
            }
            this.m_mediaCodec.start();
            this.m_encodeStartTime = System.nanoTime();
            this.m_isNeedReconfigure = false;
            this.mEndOfStream = false;
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @TargetApi(16)
    public void stopEncoder() {
        try {
            if (this.m_sharedContext != null) {
                this.m_sharedContext.makeCurrent();
            }
            if (this.m_textureDrawer != null) {
                this.m_textureDrawer.release();
                this.m_textureDrawer = null;
            }
            if (this.m_mediaCodec != null) {
                this.m_mediaCodec.stop();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int restartEncoder() {
        this.m_bNeedSingalEnd = false;
        stopEncoder();
        int configEncode = configEncode();
        if (configEncode < 0) {
            return configEncode;
        }
        return startEncoder();
    }

    @TargetApi(18)
    public int encodeVideoFromTexture(int i) {
        int i2 = 0;
        if (!this.m_bSuccessInit) {
            return 0;
        }
        if (this.m_eglStateSaver == null) {
            this.m_eglStateSaver = new TEEglStateSaver();
            this.m_eglStateSaver.saveEGLState();
        }
        if (this.m_isNeedReconfigure || (this.m_configStatus & 4) != 0) {
            if (this.m_mediaCodec == null || this.m_configStatus != 1 || VERSION.SDK_INT < 19) {
                restartEncoder();
            } else {
                Bundle bundle = new Bundle();
                bundle.putInt("video-bitrate", this.m_bitRate);
                this.m_mediaCodec.setParameters(bundle);
                this.m_configStatus = 0;
            }
            this.m_isNeedReconfigure = false;
        }
        if (this.m_encodeStartTime == -1) {
            this.m_encodeStartTime = System.nanoTime();
        }
        drainOutputBuffer(0);
        i &= -1;
        int i3 = 30;
        if (i != 0) {
            try {
                if (this.m_textureDrawer != null) {
                    this.m_sharedContext.makeCurrent();
                    GLES20.glViewport(0, 0, this.m_width, this.m_height);
                    this.m_textureDrawer.drawTexture(i);
                    if (this.mFirstFrame) {
                        if (DEBUG) {
                            Buffer allocateDirect = ByteBuffer.allocateDirect(3686400);
                            allocateDirect.order(ByteOrder.nativeOrder());
                            allocateDirect.position(0);
                            GLES20.glReadPixels(0, 0, 1280, Util.LIMIT_SURFACE_WIDTH, 6408, 5121, allocateDirect);
                            FileOutputStream fileOutputStream = new FileOutputStream("/mnt/sdcard/ttt.rgba");
                            fileOutputStream.write(allocateDirect.array());
                            fileOutputStream.close();
                        }
                        this.mFirstFrame = false;
                    }
                    this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                    this.m_sharedContext.swapBuffers();
                    this.m_bNeedSingalEnd = true;
                    drainOutputBuffer(0);
                    if (this.configbyte == null) {
                        int i4 = 0;
                        do {
                            GLES20.glViewport(0, 0, this.m_width, this.m_height);
                            this.m_textureDrawer.drawTexture(i);
                            this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                            this.m_sharedContext.swapBuffers();
                            drainOutputBuffer(0);
                            i4++;
                            if (i4 > 30) {
                                break;
                            }
                            Thread.sleep(10, 0);
                        } while (this.configbyte == null);
                        String str;
                        StringBuilder stringBuilder;
                        if (this.configbyte == null) {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("Generate configData failed!!!");
                            stringBuilder.append(i4);
                            Log.e(str, stringBuilder.toString());
                        } else {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("Generate configData succeed!!!");
                            stringBuilder.append(i4);
                            Log.e(str, stringBuilder.toString());
                        }
                        this.AVCQueue.clear();
                        restartEncoder();
                        this.m_getnerateIndex = 0;
                        this.m_sharedContext.makeCurrent();
                        GLES20.glViewport(0, 0, this.m_width, this.m_height);
                        this.m_textureDrawer.drawTexture(i);
                        this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                        this.m_sharedContext.swapBuffers();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.m_getnerateIndex++;
        } else if (!(this.m_mediaCodec == null || this.m_bSignalEndOfStream || !this.m_bNeedSingalEnd)) {
            try {
                Log.i(TAG, "m_mediaCodec.flush()");
                this.m_bSignalEndOfStream = true;
                this.mEndOfStream = false;
                this.m_mediaCodec.signalEndOfInputStream();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        this.m_eglStateSaver.makeSavedStateCurrent();
        if (this.m_bSignalEndOfStream) {
            while (!this.mEndOfStream) {
                drainOutputBuffer(10000);
                if (this.mBufferIndex < 0) {
                    i3--;
                    if (i3 <= 0) {
                        break;
                    }
                }
                break;
            }
        }
        drainOutputBuffer(0);
        this.mLastCodecData = (CodecData) this.AVCQueue.poll();
        if (this.mLastCodecData != null) {
            i2 = this.mLastCodecData.data.length;
        }
        return i2;
    }

    public byte[] getCodecData(int i) {
        if (this.mLastCodecData != null) {
            return this.mLastCodecData.data;
        }
        return null;
    }

    public int getInfoByFlag(int[] iArr, int i) {
        if (i != 1) {
            return -1;
        }
        iArr[0] = (int) (this.mLastCodecData.pts & -1);
        iArr[1] = (int) ((this.mLastCodecData.pts >> 32) & -1);
        return 2;
    }

    @TargetApi(16)
    private int reconfigureMediaFormat() {
        if (VERSION.SDK_INT < 16) {
            return -1;
        }
        this.m_codecFormat = MediaFormat.createVideoFormat(VIDEO_MIME_TYPE, this.m_width, this.m_height);
        this.m_codecFormat.setInteger("color-format", this.m_colorFormat);
        this.m_codecFormat.setInteger("bitrate", this.m_bitRate);
        this.m_codecFormat.setInteger("frame-rate", this.m_frameRate);
        this.m_codecFormat.setInteger("i-frame-interval", this.m_iFrameInternal);
        Log.i(TAG, String.format("width:[%d] height:[%d] frameRate:[%d] iFrameInternal:[%d] bitRate:[%d] colorFormat:[%d]", new Object[]{Integer.valueOf(this.m_width), Integer.valueOf(this.m_height), Integer.valueOf(this.m_frameRate), Integer.valueOf(this.m_iFrameInternal), Integer.valueOf(this.m_bitRate), Integer.valueOf(this.m_colorFormat)}));
        return 0;
    }

    @TargetApi(16)
    private ByteBuffer getOutputBufferByIdx(int i) {
        if (VERSION.SDK_INT >= 21) {
            return this.m_mediaCodec.getOutputBuffer(i);
        }
        return this.m_mediaCodec.getOutputBuffers()[i];
    }

    private void addOutputData(byte[] bArr, long j, int i) {
        CodecData codecData = new CodecData();
        codecData.data = bArr;
        codecData.pts = j;
        codecData.flag = i;
        try {
            this.AVCQueue.add(codecData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressLint({"WrongConstant"})
    @TargetApi(16)
    private void drainOutputBuffer(long j) {
        BufferInfo bufferInfo = new BufferInfo();
        this.mBufferIndex = -1;
        try {
            this.mBufferIndex = this.m_mediaCodec.dequeueOutputBuffer(bufferInfo, j);
        } catch (Exception e) {
            e.printStackTrace();
        }
        while (this.mBufferIndex >= 0) {
            ByteBuffer outputBufferByIdx = getOutputBufferByIdx(this.mBufferIndex);
            Object obj = new byte[bufferInfo.size];
            outputBufferByIdx.position(bufferInfo.offset);
            outputBufferByIdx.limit(bufferInfo.offset + bufferInfo.size);
            outputBufferByIdx.get(obj);
            if (bufferInfo.flags == 2) {
                this.configbyte = obj;
            } else if (bufferInfo.flags == 1) {
                byte[] bArr;
                if (this.configbyte == null) {
                    Log.e(TAG, "I can't find configbyte!!!! NEED extract from I frame!!!");
                } else if (obj[4] == this.configbyte[4] && (obj[this.configbyte.length + 4] & 31) == 5) {
                    bArr = new byte[(obj.length - this.configbyte.length)];
                    System.arraycopy(obj, this.configbyte.length, bArr, 0, bArr.length);
                    addOutputData(bArr, bufferInfo.presentationTimeUs, bufferInfo.flags);
                }
                bArr = obj;
                addOutputData(bArr, bufferInfo.presentationTimeUs, bufferInfo.flags);
            } else if (bufferInfo.flags == 4) {
                this.mEndOfStream = true;
                break;
            } else {
                addOutputData(obj, bufferInfo.presentationTimeUs, bufferInfo.flags);
            }
            this.m_mediaCodec.releaseOutputBuffer(this.mBufferIndex, false);
            this.mBufferIndex = this.m_mediaCodec.dequeueOutputBuffer(bufferInfo, j);
        }
        if (this.mBufferIndex == -2) {
            MediaFormat outputFormat = this.m_mediaCodec.getOutputFormat();
            ByteBuffer byteBuffer = outputFormat.getByteBuffer("csd-0");
            ByteBuffer byteBuffer2 = outputFormat.getByteBuffer("csd-1");
            if (byteBuffer != null && byteBuffer2 != null) {
                this.sps = (byte[]) byteBuffer.array().clone();
                this.pps = (byte[]) byteBuffer2.array().clone();
                this.configbyte = new byte[(this.sps.length + this.pps.length)];
                System.arraycopy(this.sps, 0, this.configbyte, 0, this.sps.length);
                System.arraycopy(this.pps, 0, this.configbyte, this.sps.length, this.pps.length);
            }
        }
    }

    public byte[] getExtraData() {
        if (this.configbyte != null) {
            return this.configbyte;
        }
        return new byte[0];
    }

    private long computePresentationTime(long j) {
        return this.m_encodeStartTime + ((j * 1000000000) / ((long) this.m_frameRate));
    }
}
