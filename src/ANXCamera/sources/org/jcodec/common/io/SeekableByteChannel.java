package org.jcodec.common.io;

import java.io.Closeable;
import java.io.IOException;
import java.nio.channels.ByteChannel;
import java.nio.channels.Channel;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;

public interface SeekableByteChannel extends Closeable, ByteChannel, Channel, ReadableByteChannel, WritableByteChannel {
    long position() throws IOException;

    SeekableByteChannel setPosition(long j) throws IOException;

    long size() throws IOException;

    SeekableByteChannel truncate(long j) throws IOException;
}
