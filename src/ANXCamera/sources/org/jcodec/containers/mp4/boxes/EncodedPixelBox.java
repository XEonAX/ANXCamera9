package org.jcodec.containers.mp4.boxes;

public class EncodedPixelBox extends ClearApertureBox {
    public static final String ENOF = "enof";

    public static EncodedPixelBox createEncodedPixelBox(int i, int i2) {
        EncodedPixelBox encodedPixelBox = new EncodedPixelBox(new Header(ENOF));
        encodedPixelBox.width = (float) i;
        encodedPixelBox.height = (float) i2;
        return encodedPixelBox;
    }

    public EncodedPixelBox(Header header) {
        super(header);
    }
}
