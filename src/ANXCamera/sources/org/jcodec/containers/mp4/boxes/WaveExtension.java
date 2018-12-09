package org.jcodec.containers.mp4.boxes;

public class WaveExtension extends NodeBox {
    public static String fourcc() {
        return "wave";
    }

    public WaveExtension(Header header) {
        super(header);
    }
}
