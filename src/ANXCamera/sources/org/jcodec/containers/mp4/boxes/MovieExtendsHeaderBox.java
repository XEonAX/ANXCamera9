package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class MovieExtendsHeaderBox extends FullBox {
    private int fragmentDuration;

    public MovieExtendsHeaderBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "mehd";
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.fragmentDuration = byteBuffer.getInt();
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.fragmentDuration);
    }

    public int estimateSize() {
        return 16;
    }

    public int getFragmentDuration() {
        return this.fragmentDuration;
    }

    public void setFragmentDuration(int i) {
        this.fragmentDuration = i;
    }

    public static MovieExtendsHeaderBox createMovieExtendsHeaderBox() {
        return new MovieExtendsHeaderBox(new Header(fourcc()));
    }
}
