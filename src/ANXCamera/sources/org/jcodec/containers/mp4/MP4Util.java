package org.jcodec.containers.mp4;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.jcodec.common.io.IOUtils;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.FileTypeBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;
import org.jcodec.containers.mp4.boxes.MovieFragmentBox;
import org.jcodec.containers.mp4.boxes.TrakBox;

public class MP4Util {

    public static class Atom {
        private Header header;
        private long offset;

        public Atom(Header header, long j) {
            this.header = header;
            this.offset = j;
        }

        public long getOffset() {
            return this.offset;
        }

        public Header getHeader() {
            return this.header;
        }

        public Box parseBox(SeekableByteChannel seekableByteChannel) throws IOException {
            seekableByteChannel.setPosition(this.offset + this.header.headerSize());
            return BoxUtil.parseBox(NIOUtils.fetchFromChannel(seekableByteChannel, (int) this.header.getBodySize()), this.header, BoxFactory.getDefault());
        }

        public void copy(SeekableByteChannel seekableByteChannel, WritableByteChannel writableByteChannel) throws IOException {
            seekableByteChannel.setPosition(this.offset);
            NIOUtils.copy(seekableByteChannel, writableByteChannel, this.header.getSize());
        }
    }

    public static class Movie {
        private FileTypeBox ftyp;
        private MovieBox moov;

        public Movie(FileTypeBox fileTypeBox, MovieBox movieBox) {
            this.ftyp = fileTypeBox;
            this.moov = movieBox;
        }

        public FileTypeBox getFtyp() {
            return this.ftyp;
        }

        public MovieBox getMoov() {
            return this.moov;
        }
    }

    public static MovieBox createRefMovie(SeekableByteChannel seekableByteChannel, String str) throws IOException {
        MovieBox parseMovieChannel = parseMovieChannel(seekableByteChannel);
        TrakBox[] tracks = parseMovieChannel.getTracks();
        for (TrakBox dataRef : tracks) {
            dataRef.setDataRef(str);
        }
        return parseMovieChannel;
    }

    public static MovieBox parseMovieChannel(SeekableByteChannel seekableByteChannel) throws IOException {
        for (Atom atom : getRootAtoms(seekableByteChannel)) {
            if ("moov".equals(atom.getHeader().getFourcc())) {
                return (MovieBox) atom.parseBox(seekableByteChannel);
            }
        }
        return null;
    }

    public static Movie createRefFullMovie(SeekableByteChannel seekableByteChannel, String str) throws IOException {
        Movie parseFullMovieChannel = parseFullMovieChannel(seekableByteChannel);
        TrakBox[] tracks = parseFullMovieChannel.moov.getTracks();
        for (TrakBox dataRef : tracks) {
            dataRef.setDataRef(str);
        }
        return parseFullMovieChannel;
    }

    public static Movie parseFullMovieChannel(SeekableByteChannel seekableByteChannel) throws IOException {
        FileTypeBox fileTypeBox = null;
        for (Atom atom : getRootAtoms(seekableByteChannel)) {
            if ("ftyp".equals(atom.getHeader().getFourcc())) {
                fileTypeBox = (FileTypeBox) atom.parseBox(seekableByteChannel);
            } else if ("moov".equals(atom.getHeader().getFourcc())) {
                return new Movie(fileTypeBox, (MovieBox) atom.parseBox(seekableByteChannel));
            }
        }
        return null;
    }

    public static List<MovieFragmentBox> parseMovieFragments(SeekableByteChannel seekableByteChannel) throws IOException {
        List linkedList = new LinkedList();
        MovieBox movieBox = null;
        for (Atom atom : getRootAtoms(seekableByteChannel)) {
            if ("moov".equals(atom.getHeader().getFourcc())) {
                movieBox = (MovieBox) atom.parseBox(seekableByteChannel);
            } else if ("moof".equalsIgnoreCase(atom.getHeader().getFourcc())) {
                linkedList.add((MovieFragmentBox) atom.parseBox(seekableByteChannel));
            }
        }
        Iterator it = linkedList.iterator();
        while (it.hasNext()) {
            ((MovieFragmentBox) it.next()).setMovie(movieBox);
        }
        return linkedList;
    }

    public static List<Atom> getRootAtoms(SeekableByteChannel seekableByteChannel) throws IOException {
        long j = 0;
        seekableByteChannel.setPosition(0);
        List<Atom> arrayList = new ArrayList();
        while (j < seekableByteChannel.size()) {
            seekableByteChannel.setPosition(j);
            Header read = Header.read(NIOUtils.fetchFromChannel(seekableByteChannel, 16));
            if (read == null) {
                break;
            }
            arrayList.add(new Atom(read, j));
            j += read.getSize();
        }
        return arrayList;
    }

    public static Atom findFirstAtom(String str, SeekableByteChannel seekableByteChannel) throws IOException {
        for (Atom atom : getRootAtoms(seekableByteChannel)) {
            if (str.equals(atom.getHeader().getFourcc())) {
                return atom;
            }
        }
        return null;
    }

    public static Atom atom(SeekableByteChannel seekableByteChannel) throws IOException {
        long position = seekableByteChannel.position();
        Header read = Header.read(NIOUtils.fetchFromChannel(seekableByteChannel, 16));
        return read == null ? null : new Atom(read, position);
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0015  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static MovieBox parseMovie(File file) throws IOException {
        Throwable th;
        SeekableByteChannel readableChannel;
        try {
            readableChannel = NIOUtils.readableChannel(file);
            try {
                MovieBox parseMovieChannel = parseMovieChannel(readableChannel);
                if (readableChannel != null) {
                    readableChannel.close();
                }
                return parseMovieChannel;
            } catch (Throwable th2) {
                th = th2;
                if (readableChannel != null) {
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            readableChannel = null;
            if (readableChannel != null) {
                readableChannel.close();
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static MovieBox createRefMovieFromFile(File file) throws IOException {
        Throwable th;
        SeekableByteChannel readableChannel;
        try {
            readableChannel = NIOUtils.readableChannel(file);
            try {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("file://");
                stringBuilder.append(file.getCanonicalPath());
                MovieBox createRefMovie = createRefMovie(readableChannel, stringBuilder.toString());
                if (readableChannel != null) {
                    readableChannel.close();
                }
                return createRefMovie;
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

    public static void writeMovieToFile(File file, MovieBox movieBox) throws IOException {
        Throwable th;
        Closeable writableChannel;
        try {
            writableChannel = NIOUtils.writableChannel(file);
            try {
                writeMovie(writableChannel, movieBox);
                IOUtils.closeQuietly(writableChannel);
            } catch (Throwable th2) {
                th = th2;
                IOUtils.closeQuietly(writableChannel);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            writableChannel = null;
            IOUtils.closeQuietly(writableChannel);
            throw th;
        }
    }

    public static void writeMovie(SeekableByteChannel seekableByteChannel, MovieBox movieBox) throws IOException {
        doWriteMovieToChannel(seekableByteChannel, movieBox, 0);
    }

    public static void doWriteMovieToChannel(SeekableByteChannel seekableByteChannel, MovieBox movieBox, int i) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate((estimateMoovBoxSize(movieBox) + i) * 4);
        movieBox.write(allocate);
        allocate.flip();
        seekableByteChannel.write(allocate);
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0015  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Movie parseFullMovie(File file) throws IOException {
        Throwable th;
        SeekableByteChannel readableChannel;
        try {
            readableChannel = NIOUtils.readableChannel(file);
            try {
                Movie parseFullMovieChannel = parseFullMovieChannel(readableChannel);
                if (readableChannel != null) {
                    readableChannel.close();
                }
                return parseFullMovieChannel;
            } catch (Throwable th2) {
                th = th2;
                if (readableChannel != null) {
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            readableChannel = null;
            if (readableChannel != null) {
                readableChannel.close();
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Movie createRefFullMovieFromFile(File file) throws IOException {
        Throwable th;
        SeekableByteChannel readableChannel;
        try {
            readableChannel = NIOUtils.readableChannel(file);
            try {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("file://");
                stringBuilder.append(file.getCanonicalPath());
                Movie createRefFullMovie = createRefFullMovie(readableChannel, stringBuilder.toString());
                if (readableChannel != null) {
                    readableChannel.close();
                }
                return createRefFullMovie;
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

    public static void writeFullMovieToFile(File file, Movie movie) throws IOException {
        Throwable th;
        Closeable writableChannel;
        try {
            writableChannel = NIOUtils.writableChannel(file);
            try {
                writeFullMovie(writableChannel, movie);
                IOUtils.closeQuietly(writableChannel);
            } catch (Throwable th2) {
                th = th2;
                IOUtils.closeQuietly(writableChannel);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            writableChannel = null;
            IOUtils.closeQuietly(writableChannel);
            throw th;
        }
    }

    public static void writeFullMovie(SeekableByteChannel seekableByteChannel, Movie movie) throws IOException {
        doWriteFullMovieToChannel(seekableByteChannel, movie, 0);
    }

    public static void doWriteFullMovieToChannel(SeekableByteChannel seekableByteChannel, Movie movie, int i) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate((estimateMoovBoxSize(movie.getMoov()) + i) + 128);
        movie.getFtyp().write(allocate);
        movie.getMoov().write(allocate);
        allocate.flip();
        seekableByteChannel.write(allocate);
    }

    public static int estimateMoovBoxSize(MovieBox movieBox) {
        return movieBox.estimateSize() + 4096;
    }

    public static ByteBuffer writeBox(Box box, int i) {
        ByteBuffer allocate = ByteBuffer.allocate(i);
        box.write(allocate);
        allocate.flip();
        return allocate;
    }
}
