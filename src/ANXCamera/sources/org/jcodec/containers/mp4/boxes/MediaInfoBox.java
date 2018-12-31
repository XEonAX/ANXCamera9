package org.jcodec.containers.mp4.boxes;

public class MediaInfoBox extends NodeBox {
    public static String fourcc() {
        return "minf";
    }

    public static MediaInfoBox createMediaInfoBox() {
        return new MediaInfoBox(new Header(fourcc()));
    }

    public MediaInfoBox(Header header) {
        super(header);
    }

    public DataInfoBox getDinf() {
        return (DataInfoBox) NodeBox.findFirst(this, DataInfoBox.class, "dinf");
    }

    public NodeBox getStbl() {
        return (NodeBox) NodeBox.findFirst(this, NodeBox.class, "stbl");
    }
}
