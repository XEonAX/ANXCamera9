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
    public static org.jcodec.containers.mp4.boxes.MovieBox parseMovie(java.io.File r1) throws java.io.IOException {
        /*
        r1 = org.jcodec.common.io.NIOUtils.readableChannel(r1);	 Catch:{ all -> 0x0011 }
        r0 = parseMovieChannel(r1);	 Catch:{ all -> 0x000f }
        if (r1 == 0) goto L_0x000e;
    L_0x000b:
        r1.close();
    L_0x000e:
        return r0;
    L_0x000f:
        r0 = move-exception;
        goto L_0x0013;
    L_0x0011:
        r0 = move-exception;
        r1 = 0;
    L_0x0013:
        if (r1 == 0) goto L_0x0018;
    L_0x0015:
        r1.close();
    L_0x0018:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jcodec.containers.mp4.MP4Util.parseMovie(java.io.File):org.jcodec.containers.mp4.boxes.MovieBox");
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    public static org.jcodec.containers.mp4.boxes.MovieBox createRefMovieFromFile(java.io.File r3) throws java.io.IOException {
        /*
        r0 = org.jcodec.common.io.NIOUtils.readableChannel(r3);	 Catch:{ all -> 0x0026 }
        r1 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0024 }
        r1.<init>();	 Catch:{ all -> 0x0024 }
        r2 = "file://";
        r1.append(r2);	 Catch:{ all -> 0x0024 }
        r3 = r3.getCanonicalPath();	 Catch:{ all -> 0x0024 }
        r1.append(r3);	 Catch:{ all -> 0x0024 }
        r3 = r1.toString();	 Catch:{ all -> 0x0024 }
        r3 = createRefMovie(r0, r3);	 Catch:{ all -> 0x0024 }
        if (r0 == 0) goto L_0x0023;
    L_0x0020:
        r0.close();
    L_0x0023:
        return r3;
    L_0x0024:
        r3 = move-exception;
        goto L_0x0028;
    L_0x0026:
        r3 = move-exception;
        r0 = 0;
    L_0x0028:
        if (r0 == 0) goto L_0x002d;
    L_0x002a:
        r0.close();
    L_0x002d:
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jcodec.containers.mp4.MP4Util.createRefMovieFromFile(java.io.File):org.jcodec.containers.mp4.boxes.MovieBox");
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
    public static org.jcodec.containers.mp4.MP4Util.Movie parseFullMovie(java.io.File r1) throws java.io.IOException {
        /*
        r1 = org.jcodec.common.io.NIOUtils.readableChannel(r1);	 Catch:{ all -> 0x0011 }
        r0 = parseFullMovieChannel(r1);	 Catch:{ all -> 0x000f }
        if (r1 == 0) goto L_0x000e;
    L_0x000b:
        r1.close();
    L_0x000e:
        return r0;
    L_0x000f:
        r0 = move-exception;
        goto L_0x0013;
    L_0x0011:
        r0 = move-exception;
        r1 = 0;
    L_0x0013:
        if (r1 == 0) goto L_0x0018;
    L_0x0015:
        r1.close();
    L_0x0018:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jcodec.containers.mp4.MP4Util.parseFullMovie(java.io.File):org.jcodec.containers.mp4.MP4Util$Movie");
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    public static org.jcodec.containers.mp4.MP4Util.Movie createRefFullMovieFromFile(java.io.File r3) throws java.io.IOException {
        /*
        r0 = org.jcodec.common.io.NIOUtils.readableChannel(r3);	 Catch:{ all -> 0x0026 }
        r1 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0024 }
        r1.<init>();	 Catch:{ all -> 0x0024 }
        r2 = "file://";
        r1.append(r2);	 Catch:{ all -> 0x0024 }
        r3 = r3.getCanonicalPath();	 Catch:{ all -> 0x0024 }
        r1.append(r3);	 Catch:{ all -> 0x0024 }
        r3 = r1.toString();	 Catch:{ all -> 0x0024 }
        r3 = createRefFullMovie(r0, r3);	 Catch:{ all -> 0x0024 }
        if (r0 == 0) goto L_0x0023;
    L_0x0020:
        r0.close();
    L_0x0023:
        return r3;
    L_0x0024:
        r3 = move-exception;
        goto L_0x0028;
    L_0x0026:
        r3 = move-exception;
        r0 = 0;
    L_0x0028:
        if (r0 == 0) goto L_0x002d;
    L_0x002a:
        r0.close();
    L_0x002d:
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jcodec.containers.mp4.MP4Util.createRefFullMovieFromFile(java.io.File):org.jcodec.containers.mp4.MP4Util$Movie");
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
