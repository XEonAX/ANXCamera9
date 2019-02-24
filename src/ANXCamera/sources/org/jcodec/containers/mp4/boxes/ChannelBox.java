package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.model.Label;

public class ChannelBox extends FullBox {
    private int channelBitmap;
    private int channelLayout;
    private ChannelDescription[] descriptions;

    public static class ChannelDescription {
        private int channelFlags;
        private int channelLabel;
        private float[] coordinates = new float[3];

        public ChannelDescription(int i, int i2, float[] fArr) {
            this.channelLabel = i;
            this.channelFlags = i2;
            this.coordinates = fArr;
        }

        public int getChannelLabel() {
            return this.channelLabel;
        }

        public int getChannelFlags() {
            return this.channelFlags;
        }

        public float[] getCoordinates() {
            return this.coordinates;
        }

        public Label getLabel() {
            return Label.getByVal(this.channelLabel);
        }
    }

    public ChannelBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "chan";
    }

    public static ChannelBox createChannelBox() {
        return new ChannelBox(new Header(fourcc()));
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.channelLayout = byteBuffer.getInt();
        this.channelBitmap = byteBuffer.getInt();
        int i = byteBuffer.getInt();
        this.descriptions = new ChannelDescription[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.descriptions[i2] = new ChannelDescription(byteBuffer.getInt(), byteBuffer.getInt(), new float[]{Float.intBitsToFloat(byteBuffer.getInt()), Float.intBitsToFloat(byteBuffer.getInt()), Float.intBitsToFloat(byteBuffer.getInt())});
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.channelLayout);
        byteBuffer.putInt(this.channelBitmap);
        byteBuffer.putInt(this.descriptions.length);
        for (ChannelDescription channelDescription : this.descriptions) {
            byteBuffer.putInt(channelDescription.getChannelLabel());
            byteBuffer.putInt(channelDescription.getChannelFlags());
            byteBuffer.putFloat(channelDescription.getCoordinates()[0]);
            byteBuffer.putFloat(channelDescription.getCoordinates()[1]);
            byteBuffer.putFloat(channelDescription.getCoordinates()[2]);
        }
    }

    public int estimateSize() {
        return 24 + (this.descriptions.length * 20);
    }

    public int getChannelLayout() {
        return this.channelLayout;
    }

    public int getChannelBitmap() {
        return this.channelBitmap;
    }

    public ChannelDescription[] getDescriptions() {
        return this.descriptions;
    }

    public void setChannelLayout(int i) {
        this.channelLayout = i;
    }

    public void setDescriptions(ChannelDescription[] channelDescriptionArr) {
        this.descriptions = channelDescriptionArr;
    }
}
