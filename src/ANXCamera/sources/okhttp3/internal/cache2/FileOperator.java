package okhttp3.internal.cache2;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import okio.Buffer;

final class FileOperator {
    private static final int BUFFER_SIZE = 8192;
    private final byte[] byteArray = new byte[BUFFER_SIZE];
    private final ByteBuffer byteBuffer = ByteBuffer.wrap(this.byteArray);
    private final FileChannel fileChannel;

    FileOperator(FileChannel fileChannel) {
        this.fileChannel = fileChannel;
    }

    public void write(long j, Buffer buffer, long j2) throws IOException {
        if (j2 < 0 || j2 > buffer.size()) {
            throw new IndexOutOfBoundsException();
        }
        while (j2 > 0) {
            try {
                int min = (int) Math.min(8192, j2);
                buffer.read(this.byteArray, 0, min);
                this.byteBuffer.limit(min);
                do {
                    j += (long) this.fileChannel.write(this.byteBuffer, j);
                } while (this.byteBuffer.hasRemaining());
                j2 -= (long) min;
                this.byteBuffer.clear();
            } catch (Throwable th) {
                this.byteBuffer.clear();
                throw th;
            }
        }
    }

    public void read(long j, Buffer buffer, long j2) throws IOException {
        if (j2 >= 0) {
            while (j2 > 0) {
                try {
                    this.byteBuffer.limit((int) Math.min(8192, j2));
                    if (this.fileChannel.read(this.byteBuffer, j) != -1) {
                        int position = this.byteBuffer.position();
                        buffer.write(this.byteArray, 0, position);
                        long j3 = (long) position;
                        j += j3;
                        j2 -= j3;
                        this.byteBuffer.clear();
                    } else {
                        throw new EOFException();
                    }
                } catch (Throwable th) {
                    this.byteBuffer.clear();
                    throw th;
                }
            }
            return;
        }
        throw new IndexOutOfBoundsException();
    }
}
