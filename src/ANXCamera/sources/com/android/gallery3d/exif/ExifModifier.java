package com.android.gallery3d.exif;

import java.io.Closeable;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

class ExifModifier {
    public static final boolean DEBUG = false;
    public static final String TAG = "ExifModifier";
    private final ByteBuffer mByteBuffer;
    private final ExifInterface mInterface;
    private int mOffsetBase;
    private final List<TagOffset> mTagOffsets = new ArrayList();
    private final ExifData mTagToModified;

    private static class TagOffset {
        final int mOffset;
        final ExifTag mTag;

        TagOffset(ExifTag exifTag, int i) {
            this.mTag = exifTag;
            this.mOffset = i;
        }
    }

    protected ExifModifier(ByteBuffer byteBuffer, ExifInterface exifInterface) throws IOException, ExifInvalidFormatException {
        Throwable th;
        this.mByteBuffer = byteBuffer;
        this.mOffsetBase = byteBuffer.position();
        this.mInterface = exifInterface;
        Closeable byteBufferInputStream;
        try {
            byteBufferInputStream = new ByteBufferInputStream(byteBuffer);
            try {
                ExifParser parse = ExifParser.parse(byteBufferInputStream, this.mInterface);
                this.mTagToModified = new ExifData(parse.getByteOrder());
                this.mOffsetBase += parse.getTiffStartPosition();
                this.mByteBuffer.position(0);
                ExifInterface.closeSilently(byteBufferInputStream);
            } catch (Throwable th2) {
                th = th2;
                ExifInterface.closeSilently(byteBufferInputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            byteBufferInputStream = null;
            ExifInterface.closeSilently(byteBufferInputStream);
            throw th;
        }
    }

    protected ByteOrder getByteOrder() {
        return this.mTagToModified.getByteOrder();
    }

    protected boolean commit() throws IOException, ExifInvalidFormatException {
        Throwable th;
        IfdData ifdData = null;
        Closeable byteBufferInputStream;
        try {
            byteBufferInputStream = new ByteBufferInputStream(this.mByteBuffer);
            try {
                IfdData[] ifdDataArr = new IfdData[]{this.mTagToModified.getIfdData(0), this.mTagToModified.getIfdData(1), this.mTagToModified.getIfdData(2), this.mTagToModified.getIfdData(3), this.mTagToModified.getIfdData(4)};
                int i = ifdDataArr[0] != null ? 1 : 0;
                if (ifdDataArr[1] != null) {
                    i |= 2;
                }
                if (ifdDataArr[2] != null) {
                    i |= 4;
                }
                if (ifdDataArr[4] != null) {
                    i |= 8;
                }
                if (ifdDataArr[3] != null) {
                    i |= 16;
                }
                ExifParser parse = ExifParser.parse(byteBufferInputStream, i, this.mInterface);
                for (int next = parse.next(); next != 5; next = parse.next()) {
                    switch (next) {
                        case 0:
                            ifdData = ifdDataArr[parse.getCurrentIfd()];
                            if (ifdData != null) {
                                break;
                            }
                            parse.skipRemainingTagsInCurrentIfd();
                            break;
                        case 1:
                            ExifTag tag = parse.getTag();
                            ExifTag tag2 = ifdData.getTag(tag.getTagId());
                            if (tag2 != null) {
                                if (tag2.getComponentCount() == tag.getComponentCount() && tag2.getDataType() == tag.getDataType()) {
                                    this.mTagOffsets.add(new TagOffset(tag2, tag.getOffset()));
                                    ifdData.removeTag(tag.getTagId());
                                    if (ifdData.getTagCount() != 0) {
                                        break;
                                    }
                                    parse.skipRemainingTagsInCurrentIfd();
                                    break;
                                }
                                ExifInterface.closeSilently(byteBufferInputStream);
                                return false;
                            }
                            continue;
                            break;
                        default:
                            break;
                    }
                }
                int length = ifdDataArr.length;
                int i2 = 0;
                while (i2 < length) {
                    IfdData ifdData2 = ifdDataArr[i2];
                    if (ifdData2 == null || ifdData2.getTagCount() <= 0) {
                        i2++;
                    } else {
                        ExifInterface.closeSilently(byteBufferInputStream);
                        return false;
                    }
                }
                modify();
                ExifInterface.closeSilently(byteBufferInputStream);
                return true;
            } catch (Throwable th2) {
                th = th2;
                ExifInterface.closeSilently(byteBufferInputStream);
                throw th;
            }
        } catch (Throwable th3) {
            Throwable th4 = th3;
            byteBufferInputStream = null;
            th = th4;
            ExifInterface.closeSilently(byteBufferInputStream);
            throw th;
        }
    }

    private void modify() {
        this.mByteBuffer.order(getByteOrder());
        for (TagOffset tagOffset : this.mTagOffsets) {
            writeTagValue(tagOffset.mTag, tagOffset.mOffset);
        }
    }

    private void writeTagValue(ExifTag exifTag, int i) {
        this.mByteBuffer.position(i + this.mOffsetBase);
        int i2 = 0;
        byte[] bArr;
        switch (exifTag.getDataType()) {
            case (short) 1:
            case (short) 7:
                bArr = new byte[exifTag.getComponentCount()];
                exifTag.getBytes(bArr);
                this.mByteBuffer.put(bArr);
                return;
            case (short) 2:
                bArr = exifTag.getStringByte();
                if (bArr.length == exifTag.getComponentCount()) {
                    bArr[bArr.length - 1] = (byte) 0;
                    this.mByteBuffer.put(bArr);
                    return;
                }
                this.mByteBuffer.put(bArr);
                this.mByteBuffer.put((byte) 0);
                return;
            case (short) 3:
                i = exifTag.getComponentCount();
                while (i2 < i) {
                    this.mByteBuffer.putShort((short) ((int) exifTag.getValueAt(i2)));
                    i2++;
                }
                return;
            case (short) 4:
            case (short) 9:
                i = exifTag.getComponentCount();
                while (i2 < i) {
                    this.mByteBuffer.putInt((int) exifTag.getValueAt(i2));
                    i2++;
                }
                return;
            case (short) 5:
            case (short) 10:
                i = exifTag.getComponentCount();
                while (i2 < i) {
                    Rational rational = exifTag.getRational(i2);
                    this.mByteBuffer.putInt((int) rational.getNumerator());
                    this.mByteBuffer.putInt((int) rational.getDenominator());
                    i2++;
                }
                return;
            default:
                return;
        }
    }

    public void modifyTag(ExifTag exifTag) {
        this.mTagToModified.addTag(exifTag);
    }
}
