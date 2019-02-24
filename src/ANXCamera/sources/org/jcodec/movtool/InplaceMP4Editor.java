package org.jcodec.movtool;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.jcodec.common.Preconditions;
import org.jcodec.common.Tuple;
import org.jcodec.common.Tuple.Mapper;
import org.jcodec.common.Tuple._2;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.BoxFactory;
import org.jcodec.containers.mp4.BoxUtil;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Atom;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;
import org.jcodec.containers.mp4.boxes.MovieFragmentBox;

public class InplaceMP4Editor {
    public boolean modify(File file, MP4Edit mP4Edit) throws IOException {
        Throwable th;
        Closeable rwChannel;
        try {
            rwChannel = NIOUtils.rwChannel(file);
            try {
                boolean z;
                List<_2> doTheFix = doTheFix(rwChannel, mP4Edit);
                if (doTheFix == null) {
                    z = false;
                } else {
                    for (_2 _2 : doTheFix) {
                        replaceBox(rwChannel, (Atom) _2.v0, (ByteBuffer) _2.v1);
                    }
                    z = true;
                }
                NIOUtils.closeQuietly(rwChannel);
                return z;
            } catch (Throwable th2) {
                th = th2;
                NIOUtils.closeQuietly(rwChannel);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            rwChannel = null;
            NIOUtils.closeQuietly(rwChannel);
            throw th;
        }
    }

    public boolean copy(File file, File file2, MP4Edit mP4Edit) throws IOException {
        Closeable readableChannel;
        Closeable writableChannel;
        Throwable th;
        try {
            readableChannel = NIOUtils.readableChannel(file);
            try {
                writableChannel = NIOUtils.writableChannel(file2);
            } catch (Throwable th2) {
                th = th2;
                writableChannel = null;
                NIOUtils.closeQuietly(readableChannel);
                NIOUtils.closeQuietly(writableChannel);
                throw th;
            }
            try {
                boolean z;
                List doTheFix = doTheFix(readableChannel, mP4Edit);
                if (doTheFix == null) {
                    z = false;
                } else {
                    Map asMap = Tuple.asMap(Tuple._2map0(doTheFix, new Mapper<Atom, Long>() {
                        public Long map(Atom atom) {
                            return Long.valueOf(atom.getOffset());
                        }
                    }));
                    for (Atom atom : MP4Util.getRootAtoms(readableChannel)) {
                        ByteBuffer byteBuffer = (ByteBuffer) asMap.get(Long.valueOf(atom.getOffset()));
                        if (byteBuffer != null) {
                            writableChannel.write(byteBuffer);
                        } else {
                            atom.copy(readableChannel, writableChannel);
                        }
                    }
                    z = true;
                }
                NIOUtils.closeQuietly(readableChannel);
                NIOUtils.closeQuietly(writableChannel);
                return z;
            } catch (Throwable th3) {
                th = th3;
                NIOUtils.closeQuietly(readableChannel);
                NIOUtils.closeQuietly(writableChannel);
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            readableChannel = null;
            writableChannel = readableChannel;
            NIOUtils.closeQuietly(readableChannel);
            NIOUtils.closeQuietly(writableChannel);
            throw th;
        }
    }

    public boolean replace(File file, MP4Edit mP4Edit) throws IOException {
        File parentFile = file.getParentFile();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(".");
        stringBuilder.append(file.getName());
        File file2 = new File(parentFile, stringBuilder.toString());
        if (!copy(file, file2, mP4Edit)) {
            return false;
        }
        file2.renameTo(file);
        return true;
    }

    private List<_2<Atom, ByteBuffer>> doTheFix(SeekableByteChannel seekableByteChannel, MP4Edit mP4Edit) throws IOException {
        Atom moov = getMoov(seekableByteChannel);
        Preconditions.checkNotNull(moov);
        ByteBuffer fetchBox = fetchBox(seekableByteChannel, moov);
        MovieBox movieBox = (MovieBox) parseBox(fetchBox);
        List<_2<Atom, ByteBuffer>> linkedList = new LinkedList();
        if (BoxUtil.containsBox(movieBox, "mvex")) {
            List<_2> linkedList2 = new LinkedList();
            for (Atom atom : getFragments(seekableByteChannel)) {
                ByteBuffer fetchBox2 = fetchBox(seekableByteChannel, atom);
                linkedList.add(Tuple.pair(atom, fetchBox2));
                MovieFragmentBox movieFragmentBox = (MovieFragmentBox) parseBox(fetchBox2);
                movieFragmentBox.setMovie(movieBox);
                linkedList2.add(Tuple.pair(fetchBox2, movieFragmentBox));
            }
            mP4Edit.applyToFragment(movieBox, (MovieFragmentBox[]) Tuple._2_project1(linkedList2).toArray(new MovieFragmentBox[0]));
            for (_2 _2 : linkedList2) {
                if (!rewriteBox((ByteBuffer) _2.v0, (Box) _2.v1)) {
                    return null;
                }
            }
        } else {
            mP4Edit.apply(movieBox);
        }
        if (!rewriteBox(fetchBox, movieBox)) {
            return null;
        }
        linkedList.add(Tuple.pair(moov, fetchBox));
        return linkedList;
    }

    private void replaceBox(SeekableByteChannel seekableByteChannel, Atom atom, ByteBuffer byteBuffer) throws IOException {
        seekableByteChannel.setPosition(atom.getOffset());
        seekableByteChannel.write(byteBuffer);
    }

    private boolean rewriteBox(ByteBuffer byteBuffer, Box box) {
        try {
            byteBuffer.clear();
            box.write(byteBuffer);
            if (byteBuffer.hasRemaining()) {
                if (byteBuffer.remaining() < 8) {
                    return false;
                }
                byteBuffer.putInt(byteBuffer.remaining());
                byteBuffer.put(new byte[]{(byte) 102, (byte) 114, (byte) 101, (byte) 101});
            }
            byteBuffer.flip();
            return true;
        } catch (BufferOverflowException e) {
            return false;
        }
    }

    private ByteBuffer fetchBox(SeekableByteChannel seekableByteChannel, Atom atom) throws IOException {
        seekableByteChannel.setPosition(atom.getOffset());
        return NIOUtils.fetchFromChannel(seekableByteChannel, (int) atom.getHeader().getSize());
    }

    private Box parseBox(ByteBuffer byteBuffer) {
        return BoxUtil.parseBox(byteBuffer, Header.read(byteBuffer), BoxFactory.getDefault());
    }

    private Atom getMoov(SeekableByteChannel seekableByteChannel) throws IOException {
        for (Atom atom : MP4Util.getRootAtoms(seekableByteChannel)) {
            if ("moov".equals(atom.getHeader().getFourcc())) {
                return atom;
            }
        }
        return null;
    }

    private List<Atom> getFragments(SeekableByteChannel seekableByteChannel) throws IOException {
        List<Atom> linkedList = new LinkedList();
        for (Atom atom : MP4Util.getRootAtoms(seekableByteChannel)) {
            if ("moof".equals(atom.getHeader().getFourcc())) {
                linkedList.add(atom);
            }
        }
        return linkedList;
    }
}
