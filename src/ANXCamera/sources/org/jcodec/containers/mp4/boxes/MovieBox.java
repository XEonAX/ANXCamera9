package org.jcodec.containers.mp4.boxes;

public class MovieBox extends NodeBox {
    public MovieBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "moov";
    }

    public static MovieBox createMovieBox() {
        return new MovieBox(new Header(fourcc()));
    }

    public TrakBox[] getTracks() {
        return (TrakBox[]) NodeBox.findAll(this, TrakBox.class, "trak");
    }

    public int getTimescale() {
        return getMovieHeader().getTimescale();
    }

    public long rescale(long j, long j2) {
        return (j * ((long) getTimescale())) / j2;
    }

    private MovieHeaderBox getMovieHeader() {
        return (MovieHeaderBox) NodeBox.findFirst(this, MovieHeaderBox.class, "mvhd");
    }

    public boolean isPureRefMovie() {
        boolean z = true;
        for (TrakBox isPureRef : getTracks()) {
            z &= isPureRef.isPureRef();
        }
        return z;
    }
}
