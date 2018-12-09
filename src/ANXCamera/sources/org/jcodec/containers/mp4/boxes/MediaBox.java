package org.jcodec.containers.mp4.boxes;

public class MediaBox extends NodeBox {
    public static String fourcc() {
        return "mdia";
    }

    public static MediaBox createMediaBox() {
        return new MediaBox(new Header(fourcc()));
    }

    public MediaBox(Header header) {
        super(header);
    }

    public MediaInfoBox getMinf() {
        return (MediaInfoBox) NodeBox.findFirst(this, MediaInfoBox.class, "minf");
    }
}
