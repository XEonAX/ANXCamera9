package org.jcodec.containers.mp4.boxes;

public class DataInfoBox extends NodeBox {
    public static String fourcc() {
        return "dinf";
    }

    public static DataInfoBox createDataInfoBox() {
        return new DataInfoBox(new Header(fourcc()));
    }

    public DataInfoBox(Header header) {
        super(header);
    }

    public DataRefBox getDref() {
        return (DataRefBox) NodeBox.findFirst(this, DataRefBox.class, "dref");
    }
}
