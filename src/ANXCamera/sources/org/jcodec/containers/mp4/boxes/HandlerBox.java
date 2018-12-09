package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.common.io.NIOUtils;

public class HandlerBox extends FullBox {
    private int componentFlags;
    private int componentFlagsMask;
    private String componentManufacturer;
    private String componentName;
    private String componentSubType;
    private String componentType;

    public HandlerBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "hdlr";
    }

    public static HandlerBox createHandlerBox(String str, String str2, String str3, int i, int i2) {
        HandlerBox handlerBox = new HandlerBox(new Header(fourcc()));
        handlerBox.componentType = str;
        handlerBox.componentSubType = str2;
        handlerBox.componentManufacturer = str3;
        handlerBox.componentFlags = i;
        handlerBox.componentFlagsMask = i2;
        handlerBox.componentName = "";
        return handlerBox;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.componentType = NIOUtils.readString(byteBuffer, 4);
        this.componentSubType = NIOUtils.readString(byteBuffer, 4);
        this.componentManufacturer = NIOUtils.readString(byteBuffer, 4);
        this.componentFlags = byteBuffer.getInt();
        this.componentFlagsMask = byteBuffer.getInt();
        this.componentName = NIOUtils.readString(byteBuffer, byteBuffer.remaining());
    }

    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.put(JCodecUtil2.asciiString(this.componentType));
        byteBuffer.put(JCodecUtil2.asciiString(this.componentSubType));
        byteBuffer.put(JCodecUtil2.asciiString(this.componentManufacturer));
        byteBuffer.putInt(this.componentFlags);
        byteBuffer.putInt(this.componentFlagsMask);
        if (this.componentName != null) {
            byteBuffer.put(JCodecUtil2.asciiString(this.componentName));
        }
    }

    public int estimateSize() {
        return (((12 + JCodecUtil2.asciiString(this.componentType).length) + JCodecUtil2.asciiString(this.componentSubType).length) + JCodecUtil2.asciiString(this.componentManufacturer).length) + 9;
    }

    public String getComponentType() {
        return this.componentType;
    }

    public String getComponentSubType() {
        return this.componentSubType;
    }

    public String getComponentManufacturer() {
        return this.componentManufacturer;
    }

    public int getComponentFlags() {
        return this.componentFlags;
    }

    public int getComponentFlagsMask() {
        return this.componentFlagsMask;
    }
}
