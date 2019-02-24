package org.jcodec.movtool;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.BoxFactory;
import org.jcodec.containers.mp4.BoxUtil;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Atom;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;

public class RelocateMP4Editor {
    public void modifyOrRelocate(File file, MP4Edit mP4Edit) throws IOException {
        if (!new InplaceMP4Editor().modify(file, mP4Edit)) {
            relocate(file, mP4Edit);
        }
    }

    public void relocate(File file, MP4Edit mP4Edit) throws IOException {
        Throwable th;
        Closeable rwChannel;
        try {
            rwChannel = NIOUtils.rwChannel(file);
            try {
                Atom moov = getMoov(rwChannel);
                MovieBox movieBox = (MovieBox) parseBox(fetchBox(rwChannel, moov));
                mP4Edit.apply(movieBox);
                if (moov.getOffset() + moov.getHeader().getSize() < rwChannel.size()) {
                    rwChannel.setPosition(moov.getOffset() + 4);
                    rwChannel.write(ByteBuffer.wrap(Header.FOURCC_FREE));
                    rwChannel.setPosition(rwChannel.size());
                } else {
                    rwChannel.setPosition(moov.getOffset());
                }
                MP4Util.writeMovie(rwChannel, movieBox);
                NIOUtils.closeQuietly(rwChannel);
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
}
