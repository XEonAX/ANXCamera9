package org.jcodec.containers.mp4.boxes;

public class TrackFragmentBox extends NodeBox {
    public TrackFragmentBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "traf";
    }

    public int getTrackId() {
        TrackFragmentHeaderBox trackFragmentHeaderBox = (TrackFragmentHeaderBox) NodeBox.findFirst(this, TrackFragmentHeaderBox.class, TrackFragmentHeaderBox.fourcc());
        if (trackFragmentHeaderBox != null) {
            return trackFragmentHeaderBox.getTrackId();
        }
        throw new RuntimeException("Corrupt track fragment, no header atom found");
    }

    public static TrackFragmentBox createTrackFragmentBox() {
        return new TrackFragmentBox(new Header(fourcc()));
    }
}
