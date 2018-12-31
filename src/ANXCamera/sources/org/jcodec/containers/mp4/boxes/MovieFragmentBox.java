package org.jcodec.containers.mp4.boxes;

public class MovieFragmentBox extends NodeBox {
    private MovieBox moov;

    public MovieFragmentBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "moof";
    }

    public MovieBox getMovie() {
        return this.moov;
    }

    public void setMovie(MovieBox movieBox) {
        this.moov = movieBox;
    }

    public TrackFragmentBox[] getTracks() {
        return (TrackFragmentBox[]) NodeBox.findAll(this, TrackFragmentBox.class, TrackFragmentBox.fourcc());
    }

    public int getSequenceNumber() {
        MovieFragmentHeaderBox movieFragmentHeaderBox = (MovieFragmentHeaderBox) NodeBox.findFirst(this, MovieFragmentHeaderBox.class, MovieFragmentHeaderBox.fourcc());
        if (movieFragmentHeaderBox != null) {
            return movieFragmentHeaderBox.getSequenceNumber();
        }
        throw new RuntimeException("Corrupt movie fragment, no header atom found");
    }

    public static MovieFragmentBox createMovieFragmentBox() {
        return new MovieFragmentBox(new Header(fourcc()));
    }
}
