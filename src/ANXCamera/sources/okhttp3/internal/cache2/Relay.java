package okhttp3.internal.cache2;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import okhttp3.internal.Util;
import okio.Buffer;
import okio.ByteString;
import okio.Source;
import okio.Timeout;

final class Relay {
    private static final long FILE_HEADER_SIZE = 32;
    static final ByteString PREFIX_CLEAN = ByteString.encodeUtf8("OkHttp cache v1\n");
    static final ByteString PREFIX_DIRTY = ByteString.encodeUtf8("OkHttp DIRTY :(\n");
    private static final int SOURCE_FILE = 2;
    private static final int SOURCE_UPSTREAM = 1;
    final Buffer buffer = new Buffer();
    final long bufferMaxSize;
    boolean complete;
    RandomAccessFile file;
    private final ByteString metadata;
    int sourceCount;
    Source upstream;
    final Buffer upstreamBuffer = new Buffer();
    long upstreamPos;
    Thread upstreamReader;

    class RelaySource implements Source {
        private FileOperator fileOperator = new FileOperator(Relay.this.file.getChannel());
        private long sourcePos;
        private final Timeout timeout = new Timeout();

        RelaySource() {
        }

        /* JADX WARNING: Missing block: B:16:0x0039, code:
            r11 = r7 - r1.this$0.buffer.size();
     */
        /* JADX WARNING: Missing block: B:17:0x0047, code:
            if (r1.sourcePos >= r11) goto L_0x011e;
     */
        /* JADX WARNING: Missing block: B:19:0x004b, code:
            r0 = 2;
     */
        /* JADX WARNING: Missing block: B:73:?, code:
            r2 = java.lang.Math.min(r2, r7 - r1.sourcePos);
            r1.this$0.buffer.copyTo(r22, r1.sourcePos - r11, r2);
            r1.sourcePos += r2;
     */
        /* JADX WARNING: Missing block: B:75:0x013a, code:
            return r2;
     */
        public long read(okio.Buffer r22, long r23) throws java.io.IOException {
            /*
            r21 = this;
            r1 = r21;
            r2 = r23;
            r0 = r1.fileOperator;
            if (r0 == 0) goto L_0x013e;
        L_0x0008:
            r4 = okhttp3.internal.cache2.Relay.this;
            monitor-enter(r4);
        L_0x000b:
            r5 = r1.sourcePos;	 Catch:{ all -> 0x013b }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r7 = r0.upstreamPos;	 Catch:{ all -> 0x013b }
            r0 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1));
            r5 = 2;
            r9 = -1;
            if (r0 != 0) goto L_0x0039;
        L_0x0018:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r0 = r0.complete;	 Catch:{ all -> 0x013b }
            if (r0 == 0) goto L_0x0020;
        L_0x001e:
            monitor-exit(r4);	 Catch:{ all -> 0x013b }
            return r9;
        L_0x0020:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r0 = r0.upstreamReader;	 Catch:{ all -> 0x013b }
            if (r0 == 0) goto L_0x002e;
        L_0x0026:
            r0 = r1.timeout;	 Catch:{ all -> 0x013b }
            r5 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r0.waitUntilNotified(r5);	 Catch:{ all -> 0x013b }
            goto L_0x000b;
        L_0x002e:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r6 = java.lang.Thread.currentThread();	 Catch:{ all -> 0x013b }
            r0.upstreamReader = r6;	 Catch:{ all -> 0x013b }
            r0 = 1;
            monitor-exit(r4);	 Catch:{ all -> 0x013b }
            goto L_0x004c;
        L_0x0039:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r0 = r0.buffer;	 Catch:{ all -> 0x013b }
            r11 = r0.size();	 Catch:{ all -> 0x013b }
            r11 = r7 - r11;
            r13 = r1.sourcePos;	 Catch:{ all -> 0x013b }
            r0 = (r13 > r11 ? 1 : (r13 == r11 ? 0 : -1));
            if (r0 >= 0) goto L_0x011e;
            monitor-exit(r4);	 Catch:{ all -> 0x013b }
            r0 = r5;
        L_0x004c:
            r11 = 32;
            if (r0 != r5) goto L_0x006a;
        L_0x0050:
            r4 = r1.sourcePos;
            r7 = r7 - r4;
            r2 = java.lang.Math.min(r2, r7);
            r13 = r1.fileOperator;
            r4 = r1.sourcePos;
            r14 = r11 + r4;
            r16 = r22;
            r17 = r2;
            r13.read(r14, r16, r17);
            r4 = r1.sourcePos;
            r4 = r4 + r2;
            r1.sourcePos = r4;
            return r2;
        L_0x006a:
            r4 = 0;
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r0 = r0.upstream;	 Catch:{ all -> 0x010c }
            r5 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r5 = r5.upstreamBuffer;	 Catch:{ all -> 0x010c }
            r6 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r13 = r6.bufferMaxSize;	 Catch:{ all -> 0x010c }
            r5 = r0.read(r5, r13);	 Catch:{ all -> 0x010c }
            r0 = (r5 > r9 ? 1 : (r5 == r9 ? 0 : -1));
            if (r0 != 0) goto L_0x0096;
        L_0x007f:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r0.commit(r7);	 Catch:{ all -> 0x010c }
            r2 = okhttp3.internal.cache2.Relay.this;
            monitor-enter(r2);
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0093 }
            r0.upstreamReader = r4;	 Catch:{ all -> 0x0093 }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0093 }
            r0.notifyAll();	 Catch:{ all -> 0x0093 }
            monitor-exit(r2);	 Catch:{ all -> 0x0093 }
            return r9;
        L_0x0093:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x0093 }
            throw r0;
        L_0x0096:
            r2 = java.lang.Math.min(r5, r2);	 Catch:{ all -> 0x010c }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r13 = r0.upstreamBuffer;	 Catch:{ all -> 0x010c }
            r15 = 0;
            r14 = r22;
            r17 = r2;
            r13.copyTo(r14, r15, r17);	 Catch:{ all -> 0x010c }
            r9 = r1.sourcePos;	 Catch:{ all -> 0x010c }
            r9 = r9 + r2;
            r1.sourcePos = r9;	 Catch:{ all -> 0x010c }
            r15 = r1.fileOperator;	 Catch:{ all -> 0x010c }
            r16 = r11 + r7;
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            r0 = r0.upstreamBuffer;	 Catch:{ all -> 0x010c }
            r18 = r0.clone();	 Catch:{ all -> 0x010c }
            r19 = r5;
            r15.write(r16, r18, r19);	 Catch:{ all -> 0x010c }
            r7 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x010c }
            monitor-enter(r7);	 Catch:{ all -> 0x010c }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r0 = r0.buffer;	 Catch:{ all -> 0x0109 }
            r8 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r8 = r8.upstreamBuffer;	 Catch:{ all -> 0x0109 }
            r0.write(r8, r5);	 Catch:{ all -> 0x0109 }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r0 = r0.buffer;	 Catch:{ all -> 0x0109 }
            r8 = r0.size();	 Catch:{ all -> 0x0109 }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r10 = r0.bufferMaxSize;	 Catch:{ all -> 0x0109 }
            r0 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1));
            if (r0 <= 0) goto L_0x00ef;
        L_0x00db:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r0 = r0.buffer;	 Catch:{ all -> 0x0109 }
            r8 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r8 = r8.buffer;	 Catch:{ all -> 0x0109 }
            r8 = r8.size();	 Catch:{ all -> 0x0109 }
            r10 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r10 = r10.bufferMaxSize;	 Catch:{ all -> 0x0109 }
            r8 = r8 - r10;
            r0.skip(r8);	 Catch:{ all -> 0x0109 }
        L_0x00ef:
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0109 }
            r8 = r0.upstreamPos;	 Catch:{ all -> 0x0109 }
            r8 = r8 + r5;
            r0.upstreamPos = r8;	 Catch:{ all -> 0x0109 }
            monitor-exit(r7);	 Catch:{ all -> 0x0109 }
            r5 = okhttp3.internal.cache2.Relay.this;
            monitor-enter(r5);
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0106 }
            r0.upstreamReader = r4;	 Catch:{ all -> 0x0106 }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x0106 }
            r0.notifyAll();	 Catch:{ all -> 0x0106 }
            monitor-exit(r5);	 Catch:{ all -> 0x0106 }
            return r2;
        L_0x0106:
            r0 = move-exception;
            monitor-exit(r5);	 Catch:{ all -> 0x0106 }
            throw r0;
        L_0x0109:
            r0 = move-exception;
            monitor-exit(r7);	 Catch:{ all -> 0x0109 }
            throw r0;	 Catch:{ all -> 0x010c }
        L_0x010c:
            r0 = move-exception;
            r2 = okhttp3.internal.cache2.Relay.this;
            monitor-enter(r2);
            r3 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x011b }
            r3.upstreamReader = r4;	 Catch:{ all -> 0x011b }
            r1 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x011b }
            r1.notifyAll();	 Catch:{ all -> 0x011b }
            monitor-exit(r2);	 Catch:{ all -> 0x011b }
            throw r0;
        L_0x011b:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x011b }
            throw r0;
        L_0x011e:
            r5 = r1.sourcePos;	 Catch:{ all -> 0x013b }
            r7 = r7 - r5;
            r2 = java.lang.Math.min(r2, r7);	 Catch:{ all -> 0x013b }
            r0 = okhttp3.internal.cache2.Relay.this;	 Catch:{ all -> 0x013b }
            r13 = r0.buffer;	 Catch:{ all -> 0x013b }
            r5 = r1.sourcePos;	 Catch:{ all -> 0x013b }
            r15 = r5 - r11;
            r14 = r22;
            r17 = r2;
            r13.copyTo(r14, r15, r17);	 Catch:{ all -> 0x013b }
            r5 = r1.sourcePos;	 Catch:{ all -> 0x013b }
            r5 = r5 + r2;
            r1.sourcePos = r5;	 Catch:{ all -> 0x013b }
            monitor-exit(r4);	 Catch:{ all -> 0x013b }
            return r2;
        L_0x013b:
            r0 = move-exception;
            monitor-exit(r4);	 Catch:{ all -> 0x013b }
            throw r0;
        L_0x013e:
            r0 = new java.lang.IllegalStateException;
            r1 = "closed";
            r0.<init>(r1);
            throw r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.cache2.Relay.RelaySource.read(okio.Buffer, long):long");
        }

        public Timeout timeout() {
            return this.timeout;
        }

        public void close() throws IOException {
            if (this.fileOperator != null) {
                Closeable closeable = null;
                this.fileOperator = null;
                synchronized (Relay.this) {
                    Relay relay = Relay.this;
                    relay.sourceCount--;
                    if (Relay.this.sourceCount == 0) {
                        RandomAccessFile randomAccessFile = Relay.this.file;
                        Relay.this.file = null;
                        closeable = randomAccessFile;
                    }
                }
                if (closeable != null) {
                    Util.closeQuietly(closeable);
                }
            }
        }
    }

    private Relay(RandomAccessFile randomAccessFile, Source source, long j, ByteString byteString, long j2) {
        this.file = randomAccessFile;
        this.upstream = source;
        this.complete = source == null;
        this.upstreamPos = j;
        this.metadata = byteString;
        this.bufferMaxSize = j2;
    }

    public static Relay edit(File file, Source source, ByteString byteString, long j) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
        Relay relay = new Relay(randomAccessFile, source, 0, byteString, j);
        randomAccessFile.setLength(0);
        relay.writeHeader(PREFIX_DIRTY, -1, -1);
        return relay;
    }

    public static Relay read(File file) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
        FileOperator fileOperator = new FileOperator(randomAccessFile.getChannel());
        Buffer buffer = new Buffer();
        fileOperator.read(0, buffer, 32);
        if (buffer.readByteString((long) PREFIX_CLEAN.size()).equals(PREFIX_CLEAN)) {
            long readLong = buffer.readLong();
            long readLong2 = buffer.readLong();
            buffer = new Buffer();
            fileOperator.read(32 + readLong, buffer, readLong2);
            return new Relay(randomAccessFile, null, readLong, buffer.readByteString(), 0);
        }
        throw new IOException("unreadable cache file");
    }

    private void writeHeader(ByteString byteString, long j, long j2) throws IOException {
        Buffer buffer = new Buffer();
        buffer.write(byteString);
        buffer.writeLong(j);
        buffer.writeLong(j2);
        if (buffer.size() == 32) {
            new FileOperator(this.file.getChannel()).write(0, buffer, 32);
            return;
        }
        throw new IllegalArgumentException();
    }

    private void writeMetadata(long j) throws IOException {
        Buffer buffer = new Buffer();
        buffer.write(this.metadata);
        new FileOperator(this.file.getChannel()).write(32 + j, buffer, (long) this.metadata.size());
    }

    void commit(long j) throws IOException {
        writeMetadata(j);
        this.file.getChannel().force(false);
        writeHeader(PREFIX_CLEAN, j, (long) this.metadata.size());
        this.file.getChannel().force(false);
        synchronized (this) {
            this.complete = true;
        }
        Util.closeQuietly(this.upstream);
        this.upstream = null;
    }

    boolean isClosed() {
        return this.file == null;
    }

    public ByteString metadata() {
        return this.metadata;
    }

    public Source newSource() {
        synchronized (this) {
            if (this.file == null) {
                return null;
            }
            this.sourceCount++;
            return new RelaySource();
        }
    }
}
