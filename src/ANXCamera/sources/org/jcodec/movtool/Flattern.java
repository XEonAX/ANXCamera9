package org.jcodec.movtool;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.Chunk;
import org.jcodec.containers.mp4.ChunkReader;
import org.jcodec.containers.mp4.ChunkWriter;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Movie;
import org.jcodec.containers.mp4.boxes.AliasBox;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.ChunkOffsetsBox;
import org.jcodec.containers.mp4.boxes.DataRefBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;
import org.jcodec.containers.mp4.boxes.NodeBox;
import org.jcodec.containers.mp4.boxes.TrakBox;
import org.jcodec.containers.mp4.boxes.UrlBox;
import org.jcodec.platform.Platform;

public class Flattern {
    public List<ProgressListener> listeners = new ArrayList();

    public interface ProgressListener {
        void trigger(int i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x003f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void main1(String[] strArr) throws Exception {
        Throwable th;
        if (strArr.length < 2) {
            System.out.println("Syntax: self <ref movie> <out movie>");
            System.exit(-1);
        }
        File file = new File(strArr[1]);
        Platform.deleteFile(file);
        SeekableByteChannel readableChannel;
        try {
            readableChannel = NIOUtils.readableChannel(new File(strArr[0]));
            try {
                new Flattern().flattern(MP4Util.parseFullMovieChannel(readableChannel), file);
                if (readableChannel != null) {
                    readableChannel.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (readableChannel != null) {
                    readableChannel.close();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            readableChannel = null;
            if (readableChannel != null) {
            }
            throw th;
        }
    }

    public void addProgressListener(ProgressListener progressListener) {
        this.listeners.add(progressListener);
    }

    public void flatternChannel(Movie movie, SeekableByteChannel seekableByteChannel) throws IOException {
        Movie movie2 = movie;
        SeekableByteChannel seekableByteChannel2 = seekableByteChannel;
        movie.getFtyp();
        MovieBox moov = movie.getMoov();
        if (moov.isPureRefMovie()) {
            long j;
            int i;
            seekableByteChannel2.setPosition(0);
            MP4Util.writeFullMovie(seekableByteChannel2, movie2);
            seekableByteChannel2.write(ByteBuffer.allocate(calcSpaceReq(moov)));
            long position = seekableByteChannel.position();
            writeHeader(Header.createHeader("mdat", 4294967297L), seekableByteChannel2);
            SeekableByteChannel[][] inputs = getInputs(moov);
            TrakBox[] tracks = moov.getTracks();
            ChunkReader[] chunkReaderArr = new ChunkReader[tracks.length];
            ChunkWriter[] chunkWriterArr = new ChunkWriter[tracks.length];
            Chunk[] chunkArr = new Chunk[tracks.length];
            long[] jArr = new long[tracks.length];
            int i2 = 0;
            int i3 = 0;
            while (i3 < tracks.length) {
                chunkReaderArr[i3] = new ChunkReader(tracks[i3]);
                int size = i2 + chunkReaderArr[i3].size();
                chunkWriterArr[i3] = new ChunkWriter(tracks[i3], inputs[i3], seekableByteChannel2);
                chunkArr[i3] = chunkReaderArr[i3].next();
                if (tracks[i3].isVideo()) {
                    jArr[i3] = (long) (2 * moov.getTimescale());
                }
                i3++;
                i2 = size;
            }
            int i4 = 0;
            int i5 = 0;
            while (true) {
                int i6;
                int i7;
                int i8;
                int i9 = -1;
                i3 = 0;
                while (true) {
                    i6 = i5;
                    if (i3 >= chunkReaderArr.length) {
                        break;
                    }
                    if (chunkArr[i3] == null) {
                        i7 = i4;
                        j = position;
                        i8 = i2;
                    } else {
                        if (i9 == -1) {
                            i7 = i4;
                            j = position;
                            i8 = i2;
                        } else {
                            i7 = i4;
                            i8 = i2;
                            j = position;
                            if (moov.rescale(chunkArr[i3].getStartTv(), (long) tracks[i3].getTimescale()) + jArr[i3] >= moov.rescale(chunkArr[i9].getStartTv(), (long) tracks[i9].getTimescale()) + jArr[i9]) {
                            }
                        }
                        i9 = i3;
                    }
                    i3++;
                    i5 = i6;
                    i4 = i7;
                    i2 = i8;
                    position = j;
                    movie2 = movie;
                }
                i7 = i4;
                j = position;
                i8 = i2;
                if (i9 == -1) {
                    break;
                }
                long j2 = j;
                Movie movie3 = movie;
                chunkWriterArr[i9].write(chunkArr[i9]);
                chunkArr[i9] = chunkReaderArr[i9].next();
                i = i7 + 1;
                int i10 = i8;
                i9 = calcProgress(i10, i, i6);
                i4 = i;
                i5 = i9;
                long j3 = j2;
                i2 = i10;
                movie2 = movie3;
                position = j3;
            }
            for (i = 0; i < tracks.length; i++) {
                chunkWriterArr[i].apply();
            }
            long position2 = seekableByteChannel.position() - j;
            seekableByteChannel2.setPosition(0);
            MP4Util.writeFullMovie(seekableByteChannel2, movie);
            position = j - seekableByteChannel.position();
            if (position >= 0) {
                writeHeader(Header.createHeader("free", position), seekableByteChannel2);
                seekableByteChannel2.setPosition(j);
                writeHeader(Header.createHeader("mdat", position2), seekableByteChannel2);
                return;
            }
            throw new RuntimeException("Not enough space to write the header");
        }
        throw new IllegalArgumentException("movie should be reference");
    }

    private void writeHeader(Header header, SeekableByteChannel seekableByteChannel) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(16);
        header.write(allocate);
        allocate.flip();
        seekableByteChannel.write(allocate);
    }

    private int calcProgress(int i, int i2, int i3) {
        i = (100 * i2) / i;
        if (i3 >= i) {
            return i3;
        }
        for (ProgressListener trigger : this.listeners) {
            trigger.trigger(i);
        }
        return i;
    }

    protected SeekableByteChannel[][] getInputs(MovieBox movieBox) throws IOException {
        TrakBox[] tracks = movieBox.getTracks();
        SeekableByteChannel[][] seekableByteChannelArr = new SeekableByteChannel[tracks.length][];
        int i = 0;
        while (i < tracks.length) {
            DataRefBox dataRefBox = (DataRefBox) NodeBox.findFirstPath(tracks[i], DataRefBox.class, Box.path("mdia.minf.dinf.dref"));
            if (dataRefBox != null) {
                List boxes = dataRefBox.getBoxes();
                SeekableByteChannel[] seekableByteChannelArr2 = new SeekableByteChannel[boxes.size()];
                SeekableByteChannel[] seekableByteChannelArr3 = new SeekableByteChannel[boxes.size()];
                for (int i2 = 0; i2 < seekableByteChannelArr2.length; i2++) {
                    seekableByteChannelArr3[i2] = resolveDataRef((Box) boxes.get(i2));
                }
                seekableByteChannelArr[i] = seekableByteChannelArr3;
                i++;
            } else {
                throw new RuntimeException("No data references");
            }
        }
        return seekableByteChannelArr;
    }

    private int calcSpaceReq(MovieBox movieBox) {
        TrakBox[] tracks = movieBox.getTracks();
        int i = 0;
        int i2 = 0;
        while (i < tracks.length) {
            ChunkOffsetsBox stco = tracks[i].getStco();
            if (stco != null) {
                i2 += stco.getChunkOffsets().length * 4;
            }
            i++;
        }
        return i2;
    }

    public SeekableByteChannel resolveDataRef(Box box) throws IOException {
        String url;
        if (box instanceof UrlBox) {
            url = ((UrlBox) box).getUrl();
            if (url.startsWith("file://")) {
                return NIOUtils.readableChannel(new File(url.substring(7)));
            }
            throw new RuntimeException("Only file:// urls are supported in data reference");
        } else if (box instanceof AliasBox) {
            url = ((AliasBox) box).getUnixPath();
            if (url != null) {
                return NIOUtils.readableChannel(new File(url));
            }
            throw new RuntimeException("Could not resolve alias");
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(box.getHeader().getFourcc());
            stringBuilder.append(" dataref type is not supported");
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0017  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void flattern(Movie movie, File file) throws IOException {
        Throwable th;
        Platform.deleteFile(file);
        SeekableByteChannel writableChannel;
        try {
            writableChannel = NIOUtils.writableChannel(file);
            try {
                flatternChannel(movie, writableChannel);
                if (writableChannel != null) {
                    writableChannel.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (writableChannel != null) {
                    writableChannel.close();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            writableChannel = null;
            if (writableChannel != null) {
            }
            throw th;
        }
    }
}
