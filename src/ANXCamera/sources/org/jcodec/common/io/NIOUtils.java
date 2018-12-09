package org.jcodec.common.io;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel.MapMode;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import org.jcodec.platform.Platform;

public class NIOUtils {
    public static final ByteBuffer read(ByteBuffer byteBuffer, int i) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        int position = byteBuffer.position() + i;
        duplicate.limit(position);
        byteBuffer.position(position);
        return duplicate;
    }

    public static ByteBuffer fetchFromChannel(ReadableByteChannel readableByteChannel, int i) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(i);
        readFromChannel(readableByteChannel, allocate);
        allocate.flip();
        return allocate;
    }

    public static ByteBuffer fetchFromFileL(File file, int i) throws IOException {
        Throwable th;
        Closeable closeable = null;
        try {
            Closeable channel = new FileInputStream(file).getChannel();
            try {
                ByteBuffer fetchFromChannel = fetchFromChannel(channel, i);
                closeQuietly(channel);
                return fetchFromChannel;
            } catch (Throwable th2) {
                th = th2;
                closeable = channel;
                closeQuietly(closeable);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            closeQuietly(closeable);
            throw th;
        }
    }

    public static byte[] toArray(ByteBuffer byteBuffer) {
        byte[] bArr = new byte[byteBuffer.remaining()];
        byteBuffer.duplicate().get(bArr);
        return bArr;
    }

    public static byte[] toArrayL(ByteBuffer byteBuffer, int i) {
        byte[] bArr = new byte[Math.min(byteBuffer.remaining(), i)];
        byteBuffer.duplicate().get(bArr);
        return bArr;
    }

    public static int readFromChannel(ReadableByteChannel readableByteChannel, ByteBuffer byteBuffer) throws IOException {
        int position = byteBuffer.position();
        while (readableByteChannel.read(byteBuffer) != -1 && byteBuffer.hasRemaining()) {
        }
        return byteBuffer.position() - position;
    }

    public static void write(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) {
        if (byteBuffer2.hasArray()) {
            byteBuffer.put(byteBuffer2.array(), byteBuffer2.arrayOffset() + byteBuffer2.position(), Math.min(byteBuffer.remaining(), byteBuffer2.remaining()));
        } else {
            byteBuffer.put(toArrayL(byteBuffer2, byteBuffer.remaining()));
        }
    }

    public static void fill(ByteBuffer byteBuffer, byte b) {
        while (byteBuffer.hasRemaining()) {
            byteBuffer.put(b);
        }
    }

    public static final MappedByteBuffer map(String str) throws IOException {
        return mapFile(new File(str));
    }

    public static final MappedByteBuffer mapFile(File file) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        MappedByteBuffer map = fileInputStream.getChannel().map(MapMode.READ_ONLY, 0, file.length());
        fileInputStream.close();
        return map;
    }

    public static int skip(ByteBuffer byteBuffer, int i) {
        i = Math.min(byteBuffer.remaining(), i);
        byteBuffer.position(byteBuffer.position() + i);
        return i;
    }

    public static ByteBuffer from(ByteBuffer byteBuffer, int i) {
        byteBuffer = byteBuffer.duplicate();
        byteBuffer.position(byteBuffer.position() + i);
        return byteBuffer;
    }

    public static ByteBuffer combineBuffers(Iterable<ByteBuffer> iterable) {
        int i = 0;
        for (ByteBuffer remaining : iterable) {
            i += remaining.remaining();
        }
        ByteBuffer allocate = ByteBuffer.allocate(i);
        for (ByteBuffer write : iterable) {
            write(allocate, write);
        }
        allocate.flip();
        return allocate;
    }

    public static String readString(ByteBuffer byteBuffer, int i) {
        return Platform.stringFromBytes(toArray(read(byteBuffer, i)));
    }

    public static String readPascalStringL(ByteBuffer byteBuffer, int i) {
        byteBuffer = read(byteBuffer, i + 1);
        return Platform.stringFromBytes(toArray(read(byteBuffer, Math.min(byteBuffer.get() & 255, i))));
    }

    public static void writePascalStringL(ByteBuffer byteBuffer, String str, int i) {
        byteBuffer.put((byte) str.length());
        byteBuffer.put(asciiString(str));
        skip(byteBuffer, i - str.length());
    }

    public static byte[] asciiString(String str) {
        return Platform.getBytes(str);
    }

    public static void writePascalString(ByteBuffer byteBuffer, String str) {
        byteBuffer.put((byte) str.length());
        byteBuffer.put(asciiString(str));
    }

    public static String readPascalString(ByteBuffer byteBuffer) {
        return readString(byteBuffer, byteBuffer.get() & 255);
    }

    public static String readNullTermString(ByteBuffer byteBuffer) {
        return readNullTermStringCharset(byteBuffer, "UTF-8");
    }

    public static String readNullTermStringCharset(ByteBuffer byteBuffer, String str) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        while (byteBuffer.hasRemaining() && byteBuffer.get() != (byte) 0) {
        }
        if (byteBuffer.hasRemaining()) {
            duplicate.limit(byteBuffer.position() - 1);
        }
        return Platform.stringFromCharset(toArray(duplicate), str);
    }

    public static ByteBuffer readBuf(ByteBuffer byteBuffer) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        byteBuffer.position(byteBuffer.limit());
        return duplicate;
    }

    public static void copy(ReadableByteChannel readableByteChannel, WritableByteChannel writableByteChannel, long j) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(65536);
        do {
            allocate.position(0);
            allocate.limit((int) Math.min(j, (long) allocate.capacity()));
            int read = readableByteChannel.read(allocate);
            if (read != -1) {
                allocate.flip();
                writableByteChannel.write(allocate);
                j -= (long) read;
            }
            if (read == -1) {
                return;
            }
        } while (j > 0);
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static FileChannelWrapper readableChannel(File file) throws FileNotFoundException {
        return new FileChannelWrapper(new FileInputStream(file).getChannel());
    }

    public static FileChannelWrapper writableChannel(File file) throws FileNotFoundException {
        return new FileChannelWrapper(new FileOutputStream(file).getChannel());
    }

    public static FileChannelWrapper rwChannel(File file) throws FileNotFoundException {
        return new FileChannelWrapper(new RandomAccessFile(file, "rw").getChannel());
    }
}
