package org.jcodec.containers.mp4.boxes;

import android.support.v4.internal.view.SupportMenu;
import java.nio.ByteBuffer;
import org.jcodec.platform.Platform;

public class SegmentIndexBox extends FullBox {
    public long earliest_presentation_time;
    public long first_offset;
    public long reference_ID;
    public int reference_count;
    public Reference[] references;
    public int reserved;
    public long timescale;

    public static class Reference {
        public long SAP_delta_time;
        public int SAP_type;
        public boolean reference_type;
        public long referenced_size;
        public boolean starts_with_SAP;
        public long subsegment_duration;

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Reference [reference_type=");
            stringBuilder.append(this.reference_type);
            stringBuilder.append(", referenced_size=");
            stringBuilder.append(this.referenced_size);
            stringBuilder.append(", subsegment_duration=");
            stringBuilder.append(this.subsegment_duration);
            stringBuilder.append(", starts_with_SAP=");
            stringBuilder.append(this.starts_with_SAP);
            stringBuilder.append(", SAP_type=");
            stringBuilder.append(this.SAP_type);
            stringBuilder.append(", SAP_delta_time=");
            stringBuilder.append(this.SAP_delta_time);
            stringBuilder.append("]");
            return stringBuilder.toString();
        }
    }

    public SegmentIndexBox(Header header) {
        super(header);
    }

    public static SegmentIndexBox createSegmentIndexBox() {
        return new SegmentIndexBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "sidx";
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.reference_ID = Platform.unsignedInt(byteBuffer.getInt());
        this.timescale = Platform.unsignedInt(byteBuffer.getInt());
        if (this.version == (byte) 0) {
            this.earliest_presentation_time = Platform.unsignedInt(byteBuffer.getInt());
            this.first_offset = Platform.unsignedInt(byteBuffer.getInt());
        } else {
            this.earliest_presentation_time = byteBuffer.getLong();
            this.first_offset = byteBuffer.getLong();
        }
        this.reserved = byteBuffer.getShort();
        this.reference_count = byteBuffer.getShort() & SupportMenu.USER_MASK;
        this.references = new Reference[this.reference_count];
        for (int i = 0; i < this.reference_count; i++) {
            long unsignedInt = Platform.unsignedInt(byteBuffer.getInt());
            long unsignedInt2 = Platform.unsignedInt(byteBuffer.getInt());
            long unsignedInt3 = Platform.unsignedInt(byteBuffer.getInt());
            Reference reference = new Reference();
            boolean z = true;
            reference.reference_type = ((unsignedInt >>> 31) & 1) == 1;
            reference.referenced_size = unsignedInt & 2147483647L;
            reference.subsegment_duration = unsignedInt2;
            if (((unsignedInt3 >>> 31) & 1) != 1) {
                z = false;
            }
            reference.starts_with_SAP = z;
            reference.SAP_type = (int) ((unsignedInt3 >>> 28) & 7);
            reference.SAP_delta_time = 268435455 & unsignedInt3;
            this.references[i] = reference;
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt((int) this.reference_ID);
        byteBuffer.putInt((int) this.timescale);
        if (this.version == (byte) 0) {
            byteBuffer.putInt((int) this.earliest_presentation_time);
            byteBuffer.putInt((int) this.first_offset);
        } else {
            byteBuffer.putLong(this.earliest_presentation_time);
            byteBuffer.putLong(this.first_offset);
        }
        byteBuffer.putShort((short) this.reserved);
        byteBuffer.putShort((short) this.reference_count);
        for (int i = 0; i < this.reference_count; i++) {
            int i2;
            Reference reference = this.references[i];
            int i3 = (int) (((long) (reference.reference_type << 31)) | reference.referenced_size);
            int i4 = (int) reference.subsegment_duration;
            if (reference.starts_with_SAP) {
                i2 = Integer.MIN_VALUE;
            } else {
                i2 = 0;
            }
            int i5 = (int) (((long) (i2 | ((reference.SAP_type & 7) << 28))) | (reference.SAP_delta_time & 268435455));
            byteBuffer.putInt(i3);
            byteBuffer.putInt(i4);
            byteBuffer.putInt(i5);
        }
    }

    public int estimateSize() {
        return 40 + (this.reference_count * 12);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SegmentIndexBox [reference_ID=");
        stringBuilder.append(this.reference_ID);
        stringBuilder.append(", timescale=");
        stringBuilder.append(this.timescale);
        stringBuilder.append(", earliest_presentation_time=");
        stringBuilder.append(this.earliest_presentation_time);
        stringBuilder.append(", first_offset=");
        stringBuilder.append(this.first_offset);
        stringBuilder.append(", reserved=");
        stringBuilder.append(this.reserved);
        stringBuilder.append(", reference_count=");
        stringBuilder.append(this.reference_count);
        stringBuilder.append(", references=");
        stringBuilder.append(Platform.arrayToString(this.references));
        stringBuilder.append(", version=");
        stringBuilder.append(this.version);
        stringBuilder.append(", flags=");
        stringBuilder.append(this.flags);
        stringBuilder.append(", header=");
        stringBuilder.append(this.header);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
