package com.xiaomi.camera.liveshot.encoder;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodec.Callback;
import android.media.MediaCodec.CodecException;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.MediaCodecCapability;
import com.xiaomi.camera.liveshot.util.BackgroundWorker;
import com.xiaomi.camera.liveshot.util.HandlerHelper;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public abstract class CircularMediaEncoder extends Callback {
    private static final boolean DEBUG = true;
    private static final int MSG_RELEASE_ENCODER = 2;
    private static final int MSG_START_ENCODING = 0;
    private static final int MSG_STOP_ENCODING = 1;
    private static final String TAG = CircularMediaEncoder.class.getSimpleName();
    protected final BufferInfo mBufferInfo;
    protected final long mBufferingDurationUs;
    protected final long mCaptureDurationUs;
    protected volatile long mCurrentPresentationTimeUs;
    protected CyclicBuffer mCyclicBuffer;
    protected final MediaFormat mDesiredMediaFormat;
    protected final BackgroundWorker mEncodingThread;
    protected final EventHandler mEventHandler;
    protected final HandlerHelper mHandlerHelper;
    protected volatile boolean mIsBuffering;
    protected volatile boolean mIsInitialized = false;
    protected MediaCodec mMediaCodec;
    private volatile boolean mOutputFormatChanged;
    protected final long mPostCaptureDurationUs;
    protected final long mPreCaptureDurationUs;
    protected final List<Snapshot> mSnapshots;

    protected static final class CyclicBuffer {
        private static final boolean DEBUG = true;
        private static final String TAG = CyclicBuffer.class.getSimpleName();
        private final byte[] mDataBuffer;
        private int mMetaHead;
        private int mMetaTail;
        private final int[] mPacketFlags;
        private final int[] mPacketLength;
        private final long[] mPacketPtsUs;
        private final int[] mPacketStart;

        public CyclicBuffer(MediaFormat mediaFormat, long j) {
            if (mediaFormat != null) {
                String string = mediaFormat.getString("mime");
                if (string != null) {
                    int integer = mediaFormat.getInteger("bitrate");
                    int i = (int) ((((long) integer) * j) / 8000);
                    this.mDataBuffer = new byte[i];
                    int integer2 = (int) ((((double) i) / ((((double) integer) / (string.contains("video") ? (double) mediaFormat.getInteger("frame-rate") : ((double) mediaFormat.getInteger("sample-rate")) / 1024.0d)) / 8.0d)) + 1.0d);
                    int i2 = integer2 * 2;
                    this.mPacketFlags = new int[i2];
                    this.mPacketPtsUs = new long[i2];
                    this.mPacketStart = new int[i2];
                    this.mPacketLength = new int[i2];
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("DesiredSpan = ");
                    stringBuilder.append(j);
                    stringBuilder.append(", dataBufferSize = ");
                    stringBuilder.append(i);
                    stringBuilder.append(", metaBufferCount = ");
                    stringBuilder.append(i2);
                    stringBuilder.append(", estimatedPacketCount = ");
                    stringBuilder.append(integer2);
                    Log.d(str, stringBuilder.toString());
                    return;
                }
                throw new IllegalArgumentException("The desired mimeType is not specified");
            }
            throw new IllegalArgumentException("The desired MediaFormat must not be null");
        }

        private boolean canAdd(int i) {
            int length = this.mDataBuffer.length;
            int length2 = this.mPacketStart.length;
            StringBuilder stringBuilder;
            if (i > length) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Enormous packet: ");
                stringBuilder.append(i);
                stringBuilder.append(" vs. buffer ");
                stringBuilder.append(length);
                throw new RuntimeException(stringBuilder.toString());
            } else if (this.mMetaHead == this.mMetaTail) {
                return true;
            } else {
                if ((this.mMetaHead + 1) % length2 == this.mMetaTail) {
                    String str = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Ran out of metadata (head=");
                    stringBuilder2.append(this.mMetaHead);
                    stringBuilder2.append(" tail=");
                    stringBuilder2.append(this.mMetaTail);
                    stringBuilder2.append(")");
                    Log.v(str, stringBuilder2.toString());
                    return false;
                }
                int headStart = getHeadStart();
                int i2 = this.mPacketStart[this.mMetaTail];
                int i3 = ((i2 + length) - headStart) % length;
                String str2;
                if (i > i3) {
                    str2 = TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Ran out of data (tailStart=");
                    stringBuilder3.append(i2);
                    stringBuilder3.append(" headStart=");
                    stringBuilder3.append(headStart);
                    stringBuilder3.append(" req=");
                    stringBuilder3.append(i);
                    stringBuilder3.append(" free=");
                    stringBuilder3.append(i3);
                    stringBuilder3.append(")");
                    Log.v(str2, stringBuilder3.toString());
                    return false;
                }
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Okay: size=");
                stringBuilder.append(i);
                stringBuilder.append(" free=");
                stringBuilder.append(i3);
                stringBuilder.append(" metaFree=");
                stringBuilder.append((((this.mMetaTail + length2) - this.mMetaHead) % length2) - 1);
                Log.v(str2, stringBuilder.toString());
                return true;
            }
        }

        private int getHeadStart() {
            if (this.mMetaHead == this.mMetaTail) {
                return 0;
            }
            int length = this.mDataBuffer.length;
            int length2 = this.mPacketStart.length;
            int i = ((this.mMetaHead + length2) - 1) % length2;
            return ((this.mPacketStart[i] + this.mPacketLength[i]) + 1) % length;
        }

        private void removeTail() {
            if (this.mMetaHead != this.mMetaTail) {
                this.mMetaTail = (this.mMetaTail + 1) % this.mPacketStart.length;
                return;
            }
            throw new RuntimeException("Can't removeTail() in empty buffer");
        }

        public void add(ByteBuffer byteBuffer, int i, long j) {
            int limit = byteBuffer.limit() - byteBuffer.position();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Add size=");
            stringBuilder.append(limit);
            stringBuilder.append(" flags=0x");
            stringBuilder.append(Integer.toHexString(i));
            stringBuilder.append(" pts=");
            stringBuilder.append(j);
            Log.d(str, stringBuilder.toString());
            while (!canAdd(limit)) {
                Log.d(TAG, "Cached buffer removed from tail");
                removeTail();
            }
            int length = this.mDataBuffer.length;
            int length2 = this.mPacketStart.length;
            int headStart = getHeadStart();
            this.mPacketFlags[this.mMetaHead] = i;
            this.mPacketPtsUs[this.mMetaHead] = j;
            this.mPacketStart[this.mMetaHead] = headStart;
            this.mPacketLength[this.mMetaHead] = limit;
            if (headStart + limit < length) {
                byteBuffer.get(this.mDataBuffer, headStart, limit);
            } else {
                length -= headStart;
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Split, firstsize=");
                stringBuilder2.append(length);
                stringBuilder2.append(" size=");
                stringBuilder2.append(limit);
                Log.v(str2, stringBuilder2.toString());
                byteBuffer.get(this.mDataBuffer, headStart, length);
                byteBuffer.get(this.mDataBuffer, 0, limit - length);
            }
            this.mMetaHead = (this.mMetaHead + 1) % length2;
        }

        public void clear() {
            Arrays.fill(this.mDataBuffer, (byte) 0);
            Arrays.fill(this.mPacketFlags, 0);
            Arrays.fill(this.mPacketPtsUs, 0);
            Arrays.fill(this.mPacketStart, 0);
            Arrays.fill(this.mPacketLength, 0);
            this.mMetaHead = 0;
            this.mMetaTail = 0;
        }

        public long computeTimeSpanUsec() {
            int length = this.mPacketStart.length;
            if (this.mMetaHead == this.mMetaTail) {
                return 0;
            }
            return this.mPacketPtsUs[((this.mMetaHead + length) - 1) % length] - this.mPacketPtsUs[this.mMetaTail];
        }

        public ByteBuffer getChunk(int i, BufferInfo bufferInfo) {
            int length = this.mDataBuffer.length;
            int i2 = this.mPacketStart[i];
            int i3 = this.mPacketLength[i];
            bufferInfo.flags = this.mPacketFlags[i];
            bufferInfo.offset = i2;
            bufferInfo.presentationTimeUs = this.mPacketPtsUs[i];
            bufferInfo.size = i3;
            if (i2 + i3 <= length) {
                ByteBuffer allocateDirect = ByteBuffer.allocateDirect(i3);
                allocateDirect.put(this.mDataBuffer, i2, i3);
                bufferInfo.offset = 0;
                return allocateDirect;
            }
            ByteBuffer allocateDirect2 = ByteBuffer.allocateDirect(i3);
            length -= i2;
            allocateDirect2.put(this.mDataBuffer, this.mPacketStart[i], length);
            allocateDirect2.put(this.mDataBuffer, 0, i3 - length);
            bufferInfo.offset = 0;
            return allocateDirect2;
        }

        public int getFirstIndex() {
            int i = this.mMetaTail;
            return i == this.mMetaHead ? -1 : i;
        }

        public int getNextIndex(int i) {
            i = (i + 1) % this.mPacketStart.length;
            return i == this.mMetaHead ? -1 : i;
        }
    }

    protected class EventHandler extends Handler {
        public EventHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    CircularMediaEncoder.this.doStart();
                    message = ((Handler) message.obj).obtainMessage();
                    message.obj = new Object();
                    message.sendToTarget();
                    return;
                case 1:
                    CircularMediaEncoder.this.doStop();
                    message = ((Handler) message.obj).obtainMessage();
                    message.obj = new Object();
                    message.sendToTarget();
                    return;
                case 2:
                    CircularMediaEncoder.this.doRelease();
                    message = ((Handler) message.obj).obtainMessage();
                    message.obj = new Object();
                    message.sendToTarget();
                    return;
                default:
                    String access$000 = CircularMediaEncoder.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown message ");
                    stringBuilder.append(message.what);
                    Log.w(access$000, stringBuilder.toString());
                    return;
            }
        }
    }

    public static final class Sample {
        public static final Sample EOS_SAMPLE_ENTRY;
        public final ByteBuffer data;
        public final BufferInfo info;

        static {
            BufferInfo bufferInfo = new BufferInfo();
            bufferInfo.set(0, 0, 0, 4);
            EOS_SAMPLE_ENTRY = create(ByteBuffer.allocate(0), bufferInfo);
        }

        private Sample(ByteBuffer byteBuffer, BufferInfo bufferInfo) {
            this.data = byteBuffer;
            BufferInfo bufferInfo2 = new BufferInfo();
            bufferInfo2.set(bufferInfo.offset, bufferInfo.size, bufferInfo.presentationTimeUs, bufferInfo.flags);
            this.info = bufferInfo2;
        }

        public static Sample create(ByteBuffer byteBuffer, BufferInfo bufferInfo) {
            return new Sample(byteBuffer, bufferInfo);
        }
    }

    public static final class Snapshot {
        private boolean forceEos = false;
        public final MediaFormat format;
        public final long head;
        public long offset;
        public long position = -1;
        public volatile BlockingQueue<Sample> samples = new LinkedBlockingQueue();
        public final long tail;
        public long time;

        public Snapshot(long j, long j2, long j3, MediaFormat mediaFormat) {
            this.head = j;
            this.tail = j2;
            this.time = j3;
            this.format = mediaFormat;
        }

        public void clear() {
            while (!this.samples.isEmpty()) {
                ((Sample) this.samples.poll()).data.clear();
            }
        }

        public boolean eos() {
            return this.forceEos || this.position >= this.tail;
        }

        public void put(ByteBuffer byteBuffer, BufferInfo bufferInfo) throws InterruptedException {
            if (!eos()) {
                this.samples.put(Sample.create(byteBuffer, bufferInfo));
                this.position = bufferInfo.presentationTimeUs;
                if (eos()) {
                    String str = this.format.getString("mime").split("/")[0];
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(str);
                    stringBuilder.append(": max range has reached: ");
                    stringBuilder.append(this.head);
                    stringBuilder.append(":");
                    stringBuilder.append(this.tail);
                    stringBuilder.append(":");
                    stringBuilder.append(this.position);
                    Log.d("Snapshot", stringBuilder.toString());
                    putEos();
                }
            }
        }

        public void putEos() throws InterruptedException {
            this.samples.put(Sample.EOS_SAMPLE_ENTRY);
            this.forceEos = true;
        }
    }

    public CircularMediaEncoder(MediaFormat mediaFormat, long j, long j2) {
        if (mediaFormat == null) {
            throw new IllegalArgumentException("The desired MediaFormat must not be null");
        } else if (j2 > j) {
            throw new IllegalArgumentException("The preCaptureDurationUs must not be greater than captureDurationUs");
        } else if (j <= 0 || j2 <= 0) {
            throw new IllegalArgumentException("Both captureDurationUs and preCaptureDurationUs must be positive integers");
        } else {
            String string = mediaFormat.getString("mime");
            if (string == null) {
                throw new IllegalArgumentException("The desired mimeType is not specified");
            } else if (MediaCodecCapability.isFormatSupported(mediaFormat, string)) {
                this.mDesiredMediaFormat = mediaFormat;
                this.mCaptureDurationUs = j;
                this.mPreCaptureDurationUs = j2;
                this.mPostCaptureDurationUs = j - j2;
                this.mBufferingDurationUs = j * 2;
                this.mCyclicBuffer = new CyclicBuffer(this.mDesiredMediaFormat, TimeUnit.MICROSECONDS.toMillis(this.mBufferingDurationUs));
                this.mBufferInfo = new BufferInfo();
                this.mSnapshots = new ArrayList();
                this.mEncodingThread = new BackgroundWorker(string.contains("video") ? "VideoEncodingThread" : "AudioEncodingThread");
                this.mEventHandler = new EventHandler(this.mEncodingThread.getLooper());
                this.mHandlerHelper = new HandlerHelper();
                this.mIsBuffering = false;
            } else {
                throw new IllegalArgumentException("The desired MediaFormat is not supported");
            }
        }
    }

    protected void doRelease() {
        if (this.mMediaCodec != null) {
            this.mMediaCodec.release();
            this.mMediaCodec = null;
        }
        if (this.mEncodingThread != null) {
            try {
                this.mEncodingThread.quit();
            } catch (InterruptedException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to stop encoding thread: ");
                stringBuilder.append(e);
                Log.d(str, stringBuilder.toString());
            }
        }
    }

    protected void doStart() {
        this.mOutputFormatChanged = false;
        if (this.mMediaCodec != null) {
            this.mMediaCodec.start();
        }
    }

    protected void doStop() {
        if (this.mMediaCodec != null) {
            this.mMediaCodec.flush();
            this.mMediaCodec.stop();
            this.mMediaCodec.reset();
        }
    }

    protected long getNextPresentationTimeUs(long j) {
        return j;
    }

    public void onError(MediaCodec mediaCodec, CodecException codecException) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaCodec Exception occurred: ");
        stringBuilder.append(codecException);
        Log.e(str, stringBuilder.toString());
    }

    public void onInputBufferAvailable(MediaCodec mediaCodec, int i) {
    }

    public void onOutputBufferAvailable(MediaCodec mediaCodec, int i, BufferInfo bufferInfo) {
        BufferInfo bufferInfo2 = bufferInfo;
        ByteBuffer outputBuffer = mediaCodec.getOutputBuffer(i);
        String str = mediaCodec.getOutputFormat(i).getString("mime").split("/")[0];
        if (!(outputBuffer == null || bufferInfo2.size == 0 || !this.mIsBuffering)) {
            outputBuffer.position(bufferInfo2.offset);
            outputBuffer.limit(bufferInfo2.offset + bufferInfo2.size);
            bufferInfo2.presentationTimeUs = getNextPresentationTimeUs(bufferInfo2.presentationTimeUs);
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": CyclicBuffer.add E ");
            stringBuilder.append(bufferInfo2.presentationTimeUs);
            Log.d(str2, stringBuilder.toString());
            this.mCyclicBuffer.add(outputBuffer, bufferInfo2.flags, bufferInfo2.presentationTimeUs);
            this.mCurrentPresentationTimeUs = bufferInfo2.presentationTimeUs;
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append(": CyclicBuffer.add X ");
            stringBuilder2.append(bufferInfo2.presentationTimeUs);
            Log.d(str3, stringBuilder2.toString());
            List<Snapshot> arrayList = new ArrayList();
            synchronized (this.mSnapshots) {
                arrayList.addAll(this.mSnapshots);
            }
            for (Snapshot snapshot : arrayList) {
                int firstIndex = this.mCyclicBuffer.getFirstIndex();
                String str4;
                if (firstIndex >= 0) {
                    int i2 = snapshot.position == -1 ? 1 : false;
                    int i3 = firstIndex;
                    do {
                        ByteBuffer chunk = this.mCyclicBuffer.getChunk(i3, this.mBufferInfo);
                        long j = this.mBufferInfo.presentationTimeUs;
                        boolean z = (this.mBufferInfo.flags & 1) != 0;
                        String str5;
                        StringBuilder stringBuilder3;
                        StringBuilder stringBuilder4;
                        if (i2 != 0) {
                            try {
                                if (j >= snapshot.head) {
                                    str5 = TAG;
                                    stringBuilder3 = new StringBuilder();
                                    stringBuilder3.append(str);
                                    stringBuilder3.append(": Snapshot.put oldcache E ");
                                    stringBuilder3.append(snapshot.head);
                                    stringBuilder3.append(":");
                                    stringBuilder3.append(snapshot.tail);
                                    stringBuilder3.append(":");
                                    stringBuilder3.append(j);
                                    stringBuilder3.append(":");
                                    stringBuilder3.append(z);
                                    Log.d(str5, stringBuilder3.toString());
                                    snapshot.put(chunk, this.mBufferInfo);
                                    str4 = TAG;
                                    stringBuilder4 = new StringBuilder();
                                    stringBuilder4.append(str);
                                    stringBuilder4.append(": Snapshot.put oldcache X");
                                    Log.d(str4, stringBuilder4.toString());
                                }
                            } catch (InterruptedException e) {
                                str4 = TAG;
                                stringBuilder4 = new StringBuilder();
                                stringBuilder4.append(str);
                                stringBuilder4.append(": Snapshot.put: meet interrupted exception");
                                Log.e(str4, stringBuilder4.toString());
                            }
                        } else if (j > snapshot.position) {
                            str5 = TAG;
                            stringBuilder3 = new StringBuilder();
                            stringBuilder3.append(str);
                            stringBuilder3.append(": Snapshot.put incoming E ");
                            stringBuilder3.append(snapshot.head);
                            stringBuilder3.append(":");
                            stringBuilder3.append(snapshot.tail);
                            stringBuilder3.append(":");
                            stringBuilder3.append(j);
                            stringBuilder3.append(":");
                            stringBuilder3.append(z);
                            Log.d(str5, stringBuilder3.toString());
                            snapshot.put(chunk, this.mBufferInfo);
                            str4 = TAG;
                            stringBuilder4 = new StringBuilder();
                            stringBuilder4.append(str);
                            stringBuilder4.append(": Snapshot.put incoming X");
                            Log.d(str4, stringBuilder4.toString());
                        }
                        if (!snapshot.eos()) {
                            i3 = this.mCyclicBuffer.getNextIndex(i3);
                            if (i3 < 0) {
                                break;
                            }
                        } else {
                            synchronized (this.mSnapshots) {
                                str4 = TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append(str);
                                stringBuilder.append(": Snapshot.put: removed from queue");
                                Log.e(str4, stringBuilder.toString());
                                this.mSnapshots.remove(snapshot);
                            }
                            break;
                        }
                    } while (!snapshot.eos());
                }
                str4 = TAG;
                StringBuilder stringBuilder5 = new StringBuilder();
                stringBuilder5.append(str);
                stringBuilder5.append(": Unable to get the first index");
                Log.w(str4, stringBuilder5.toString());
                throw new IllegalStateException("Unable to get the first index");
            }
        }
        mediaCodec.releaseOutputBuffer(i, false);
    }

    public void onOutputFormatChanged(MediaCodec mediaCodec, MediaFormat mediaFormat) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaCodec Output Format Changed: ");
        stringBuilder.append(mediaFormat);
        Log.e(str, stringBuilder.toString());
        synchronized (this) {
            this.mOutputFormatChanged = true;
            notifyAll();
        }
    }

    public void release() {
        Log.d(TAG, "release");
        this.mHandlerHelper.sendMessageAndAwaitResponse(this.mEventHandler.obtainMessage(2));
        this.mHandlerHelper.release();
    }

    public Snapshot snapshot() {
        if (this.mIsBuffering) {
            long j = this.mCurrentPresentationTimeUs + this.mPostCaptureDurationUs;
            long max = Math.max(0, j - this.mCaptureDurationUs);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Snapshot[");
            stringBuilder.append(max);
            stringBuilder.append(", ");
            stringBuilder.append(this.mCurrentPresentationTimeUs);
            stringBuilder.append(", ");
            stringBuilder.append(j);
            stringBuilder.append("]");
            Log.d(str, stringBuilder.toString());
            Snapshot snapshot = new Snapshot(max, j, this.mCurrentPresentationTimeUs, this.mMediaCodec.getOutputFormat());
            synchronized (this.mSnapshots) {
                this.mSnapshots.add(snapshot);
            }
            return snapshot;
        }
        throw new IllegalStateException("MediaCodec has not been started yet");
    }

    public void start() {
        Log.d(TAG, "start");
        this.mHandlerHelper.sendMessageAndAwaitResponse(this.mEventHandler.obtainMessage(0));
    }

    public void stop() {
        int i;
        Log.d(TAG, "stop");
        synchronized (this) {
            i = 10;
            while (!this.mOutputFormatChanged && i > 0) {
                i--;
                Log.d(TAG, "waiting for MediaCodec getting stable before stop: E");
                try {
                    wait(200);
                } catch (InterruptedException e) {
                }
                Log.d(TAG, "waiting for MediaCodec getting stable before stop: X");
            }
        }
        if (i == 0) {
            Log.d(TAG, "waiting for MediaCodec getting stable before stop has timed out");
        }
        this.mHandlerHelper.sendMessageAndAwaitResponse(this.mEventHandler.obtainMessage(1));
    }
}
