package com.android.gallery3d.exif;

import java.io.BufferedOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Iterator;

class ExifOutputStream extends FilterOutputStream {
    private static final boolean DEBUG = false;
    private static final int EXIF_HEADER = 1165519206;
    private static final int MAX_EXIF_SIZE = 65535;
    private static final int STATE_FRAME_HEADER = 1;
    private static final int STATE_JPEG_DATA = 2;
    private static final int STATE_SOI = 0;
    private static final int STREAMBUFFER_SIZE = 65536;
    private static final String TAG = "ExifOutputStream";
    private static final short TAG_SIZE = (short) 12;
    private static final short TIFF_BIG_ENDIAN = (short) 19789;
    private static final short TIFF_HEADER = (short) 42;
    private static final short TIFF_HEADER_SIZE = (short) 8;
    private static final short TIFF_LITTLE_ENDIAN = (short) 18761;
    private ByteBuffer mBuffer = ByteBuffer.allocate(4);
    private int mByteToCopy;
    private int mByteToSkip;
    private ExifData mExifData;
    private final ExifInterface mInterface;
    private byte[] mSingleByteArray = new byte[1];
    private int mState = 0;

    protected ExifOutputStream(OutputStream outputStream, ExifInterface exifInterface) {
        super(new BufferedOutputStream(outputStream, 65536));
        this.mInterface = exifInterface;
    }

    protected void setExifData(ExifData exifData) {
        this.mExifData = exifData;
    }

    protected ExifData getExifData() {
        return this.mExifData;
    }

    private int requestByteToBuffer(int i, byte[] bArr, int i2, int i3) {
        i -= this.mBuffer.position();
        if (i3 <= i) {
            i = i3;
        }
        this.mBuffer.put(bArr, i2, i);
        return i;
    }

    public void write(byte[] bArr, int i, int i2) throws IOException {
        while (true) {
            if ((this.mByteToSkip > 0 || this.mByteToCopy > 0 || this.mState != 2) && i2 > 0) {
                int i3;
                if (this.mByteToSkip > 0) {
                    if (i2 > this.mByteToSkip) {
                        i3 = this.mByteToSkip;
                    } else {
                        i3 = i2;
                    }
                    i2 -= i3;
                    this.mByteToSkip -= i3;
                    i += i3;
                }
                if (this.mByteToCopy > 0) {
                    if (i2 > this.mByteToCopy) {
                        i3 = this.mByteToCopy;
                    } else {
                        i3 = i2;
                    }
                    this.out.write(bArr, i, i3);
                    i2 -= i3;
                    this.mByteToCopy -= i3;
                    i += i3;
                }
                if (i2 != 0) {
                    switch (this.mState) {
                        case 0:
                            i3 = requestByteToBuffer(2, bArr, i, i2);
                            i += i3;
                            i2 -= i3;
                            if (this.mBuffer.position() >= 2) {
                                this.mBuffer.rewind();
                                if (this.mBuffer.getShort() == (short) -40) {
                                    this.out.write(this.mBuffer.array(), 0, 2);
                                    this.mState = 1;
                                    this.mBuffer.rewind();
                                    writeExifData();
                                    break;
                                }
                                throw new IOException("Not a valid jpeg image, cannot write exif");
                            }
                            return;
                        case 1:
                            int requestByteToBuffer = requestByteToBuffer(4, bArr, i, i2);
                            i += requestByteToBuffer;
                            i2 -= requestByteToBuffer;
                            if (this.mBuffer.position() == 2 && this.mBuffer.getShort() == (short) -39) {
                                this.out.write(this.mBuffer.array(), 0, 2);
                                this.mBuffer.rewind();
                            }
                            if (this.mBuffer.position() >= 4) {
                                this.mBuffer.rewind();
                                short s = this.mBuffer.getShort();
                                if (s == (short) -31) {
                                    this.mByteToSkip = (this.mBuffer.getShort() & 65535) - 2;
                                    this.mState = 2;
                                } else if (JpegHeader.isSofMarker(s)) {
                                    this.out.write(this.mBuffer.array(), 0, 4);
                                    this.mState = 2;
                                } else {
                                    this.out.write(this.mBuffer.array(), 0, 4);
                                    this.mByteToCopy = (this.mBuffer.getShort() & 65535) - 2;
                                }
                                this.mBuffer.rewind();
                                break;
                            }
                            return;
                        default:
                            break;
                    }
                }
                return;
            }
        }
        if (i2 > 0) {
            this.out.write(bArr, i, i2);
        }
    }

    public void write(int i) throws IOException {
        this.mSingleByteArray[0] = (byte) (i & 255);
        write(this.mSingleByteArray);
    }

    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    private void writeExifData() throws IOException {
        if (this.mExifData != null) {
            ArrayList stripNullValueTags = stripNullValueTags(this.mExifData);
            createRequiredIfdAndTag();
            int calculateAllOffset = calculateAllOffset() + 8;
            if (calculateAllOffset <= 65535) {
                OrderedDataOutputStream orderedDataOutputStream = new OrderedDataOutputStream(this.out);
                orderedDataOutputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
                orderedDataOutputStream.writeShort((short) -31);
                orderedDataOutputStream.writeShort((short) calculateAllOffset);
                orderedDataOutputStream.writeInt(EXIF_HEADER);
                orderedDataOutputStream.writeShort((short) 0);
                if (this.mExifData.getByteOrder() == ByteOrder.BIG_ENDIAN) {
                    orderedDataOutputStream.writeShort(TIFF_BIG_ENDIAN);
                } else {
                    orderedDataOutputStream.writeShort(TIFF_LITTLE_ENDIAN);
                }
                orderedDataOutputStream.setByteOrder(this.mExifData.getByteOrder());
                orderedDataOutputStream.writeShort(TIFF_HEADER);
                orderedDataOutputStream.writeInt(8);
                writeAllTags(orderedDataOutputStream);
                writeThumbnail(orderedDataOutputStream);
                Iterator it = stripNullValueTags.iterator();
                while (it.hasNext()) {
                    this.mExifData.addTag((ExifTag) it.next());
                }
                return;
            }
            throw new IOException("Exif header is too large (>64Kb)");
        }
    }

    private ArrayList<ExifTag> stripNullValueTags(ExifData exifData) {
        ArrayList<ExifTag> arrayList = new ArrayList();
        if (exifData.getAllTags() != null) {
            for (ExifTag exifTag : exifData.getAllTags()) {
                if (exifTag.getValue() == null && !ExifInterface.isOffsetTag(exifTag.getTagId())) {
                    exifData.removeTag(exifTag.getTagId(), exifTag.getIfd());
                    arrayList.add(exifTag);
                }
            }
        }
        return arrayList;
    }

    private void writeThumbnail(OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        if (this.mExifData.hasCompressedThumbnail()) {
            orderedDataOutputStream.write(this.mExifData.getCompressedThumbnail());
        } else if (this.mExifData.hasUncompressedStrip()) {
            for (int i = 0; i < this.mExifData.getStripCount(); i++) {
                orderedDataOutputStream.write(this.mExifData.getStrip(i));
            }
        }
    }

    private void writeAllTags(OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        writeIfd(this.mExifData.getIfdData(0), orderedDataOutputStream);
        writeIfd(this.mExifData.getIfdData(2), orderedDataOutputStream);
        IfdData ifdData = this.mExifData.getIfdData(3);
        if (ifdData != null) {
            writeIfd(ifdData, orderedDataOutputStream);
        }
        ifdData = this.mExifData.getIfdData(4);
        if (ifdData != null) {
            writeIfd(ifdData, orderedDataOutputStream);
        }
        if (this.mExifData.getIfdData(1) != null) {
            writeIfd(this.mExifData.getIfdData(1), orderedDataOutputStream);
        }
    }

    private void writeIfd(IfdData ifdData, OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        ExifTag[] allTags = ifdData.getAllTags();
        orderedDataOutputStream.writeShort((short) allTags.length);
        int i = 0;
        for (ExifTag exifTag : allTags) {
            orderedDataOutputStream.writeShort(exifTag.getTagId());
            orderedDataOutputStream.writeShort(exifTag.getDataType());
            orderedDataOutputStream.writeInt(exifTag.getComponentCount());
            if (exifTag.getDataSize() > 4) {
                orderedDataOutputStream.writeInt(exifTag.getOffset());
            } else {
                writeTagValue(exifTag, orderedDataOutputStream);
                int dataSize = 4 - exifTag.getDataSize();
                for (int i2 = 0; i2 < dataSize; i2++) {
                    orderedDataOutputStream.write(0);
                }
            }
        }
        orderedDataOutputStream.writeInt(ifdData.getOffsetToNextIfd());
        int length = allTags.length;
        while (i < length) {
            ExifTag exifTag2 = allTags[i];
            if (exifTag2.getDataSize() > 4) {
                writeTagValue(exifTag2, orderedDataOutputStream);
            }
            i++;
        }
    }

    private int calculateOffsetOfIfd(IfdData ifdData, int i) {
        i += (2 + (ifdData.getTagCount() * 12)) + 4;
        for (ExifTag exifTag : ifdData.getAllTags()) {
            if (exifTag.getDataSize() > 4) {
                exifTag.setOffset(i);
                i += exifTag.getDataSize();
            }
        }
        return i;
    }

    private void createRequiredIfdAndTag() throws IOException {
        int i = 0;
        IfdData ifdData = this.mExifData.getIfdData(0);
        if (ifdData == null) {
            ifdData = new IfdData(0);
            this.mExifData.addIfdData(ifdData);
        }
        ExifTag buildUninitializedTag = this.mInterface.buildUninitializedTag(ExifInterface.TAG_EXIF_IFD);
        StringBuilder stringBuilder;
        if (buildUninitializedTag != null) {
            ExifTag buildUninitializedTag2;
            ifdData.setTag(buildUninitializedTag);
            IfdData ifdData2 = this.mExifData.getIfdData(2);
            if (ifdData2 == null) {
                ifdData2 = new IfdData(2);
                this.mExifData.addIfdData(ifdData2);
            }
            if (this.mExifData.getIfdData(4) != null) {
                buildUninitializedTag2 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_GPS_IFD);
                if (buildUninitializedTag2 != null) {
                    ifdData.setTag(buildUninitializedTag2);
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("No definition for crucial exif tag: ");
                    stringBuilder.append(ExifInterface.TAG_GPS_IFD);
                    throw new IOException(stringBuilder.toString());
                }
            }
            if (this.mExifData.getIfdData(3) != null) {
                ExifTag buildUninitializedTag3 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_INTEROPERABILITY_IFD);
                if (buildUninitializedTag3 != null) {
                    ifdData2.setTag(buildUninitializedTag3);
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("No definition for crucial exif tag: ");
                    stringBuilder.append(ExifInterface.TAG_INTEROPERABILITY_IFD);
                    throw new IOException(stringBuilder.toString());
                }
            }
            ifdData = this.mExifData.getIfdData(1);
            if (this.mExifData.hasCompressedThumbnail()) {
                if (ifdData == null) {
                    ifdData = new IfdData(1);
                    this.mExifData.addIfdData(ifdData);
                }
                ExifTag buildUninitializedTag4 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
                if (buildUninitializedTag4 != null) {
                    ifdData.setTag(buildUninitializedTag4);
                    buildUninitializedTag4 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
                    if (buildUninitializedTag4 != null) {
                        buildUninitializedTag4.setValue(this.mExifData.getCompressedThumbnail().length);
                        ifdData.setTag(buildUninitializedTag4);
                        ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
                        ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
                        return;
                    }
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("No definition for crucial exif tag: ");
                    stringBuilder.append(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
                    throw new IOException(stringBuilder.toString());
                }
                stringBuilder = new StringBuilder();
                stringBuilder.append("No definition for crucial exif tag: ");
                stringBuilder.append(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
                throw new IOException(stringBuilder.toString());
            } else if (this.mExifData.hasUncompressedStrip()) {
                if (ifdData == null) {
                    ifdData = new IfdData(1);
                    this.mExifData.addIfdData(ifdData);
                }
                int stripCount = this.mExifData.getStripCount();
                buildUninitializedTag2 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_OFFSETS);
                if (buildUninitializedTag2 != null) {
                    ExifTag buildUninitializedTag5 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_BYTE_COUNTS);
                    if (buildUninitializedTag5 != null) {
                        long[] jArr = new long[stripCount];
                        while (i < this.mExifData.getStripCount()) {
                            jArr[i] = (long) this.mExifData.getStrip(i).length;
                            i++;
                        }
                        buildUninitializedTag5.setValue(jArr);
                        ifdData.setTag(buildUninitializedTag2);
                        ifdData.setTag(buildUninitializedTag5);
                        ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
                        ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
                        return;
                    }
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("No definition for crucial exif tag: ");
                    stringBuilder.append(ExifInterface.TAG_STRIP_BYTE_COUNTS);
                    throw new IOException(stringBuilder.toString());
                }
                stringBuilder = new StringBuilder();
                stringBuilder.append("No definition for crucial exif tag: ");
                stringBuilder.append(ExifInterface.TAG_STRIP_OFFSETS);
                throw new IOException(stringBuilder.toString());
            } else if (ifdData != null) {
                ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
                ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
                ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
                ifdData.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
                return;
            } else {
                return;
            }
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("No definition for crucial exif tag: ");
        stringBuilder.append(ExifInterface.TAG_EXIF_IFD);
        throw new IOException(stringBuilder.toString());
    }

    private int calculateAllOffset() {
        int i = 0;
        IfdData ifdData = this.mExifData.getIfdData(0);
        int calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData, 8);
        ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_EXIF_IFD)).setValue(calculateOffsetOfIfd);
        IfdData ifdData2 = this.mExifData.getIfdData(2);
        calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData2, calculateOffsetOfIfd);
        IfdData ifdData3 = this.mExifData.getIfdData(3);
        if (ifdData3 != null) {
            ifdData2.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_INTEROPERABILITY_IFD)).setValue(calculateOffsetOfIfd);
            calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData3, calculateOffsetOfIfd);
        }
        ifdData2 = this.mExifData.getIfdData(4);
        if (ifdData2 != null) {
            ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_GPS_IFD)).setValue(calculateOffsetOfIfd);
            calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData2, calculateOffsetOfIfd);
        }
        ifdData2 = this.mExifData.getIfdData(1);
        if (ifdData2 != null) {
            ifdData.setOffsetToNextIfd(calculateOffsetOfIfd);
            calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData2, calculateOffsetOfIfd);
        }
        if (this.mExifData.hasCompressedThumbnail()) {
            ifdData2.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT)).setValue(calculateOffsetOfIfd);
            return calculateOffsetOfIfd + this.mExifData.getCompressedThumbnail().length;
        } else if (!this.mExifData.hasUncompressedStrip()) {
            return calculateOffsetOfIfd;
        } else {
            long[] jArr = new long[this.mExifData.getStripCount()];
            while (i < this.mExifData.getStripCount()) {
                jArr[i] = (long) calculateOffsetOfIfd;
                calculateOffsetOfIfd += this.mExifData.getStrip(i).length;
                i++;
            }
            ifdData2.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS)).setValue(jArr);
            return calculateOffsetOfIfd;
        }
    }

    static void writeTagValue(ExifTag exifTag, OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        int i = 0;
        byte[] bArr;
        int componentCount;
        switch (exifTag.getDataType()) {
            case (short) 1:
            case (short) 7:
                bArr = new byte[exifTag.getComponentCount()];
                exifTag.getBytes(bArr);
                orderedDataOutputStream.write(bArr);
                return;
            case (short) 2:
                bArr = exifTag.getStringByte();
                if (bArr.length == exifTag.getComponentCount()) {
                    bArr[bArr.length - 1] = (byte) 0;
                    orderedDataOutputStream.write(bArr);
                    return;
                }
                orderedDataOutputStream.write(bArr);
                orderedDataOutputStream.write(0);
                return;
            case (short) 3:
                componentCount = exifTag.getComponentCount();
                while (i < componentCount) {
                    orderedDataOutputStream.writeShort((short) ((int) exifTag.getValueAt(i)));
                    i++;
                }
                return;
            case (short) 4:
            case (short) 9:
                componentCount = exifTag.getComponentCount();
                while (i < componentCount) {
                    orderedDataOutputStream.writeInt((int) exifTag.getValueAt(i));
                    i++;
                }
                return;
            case (short) 5:
            case (short) 10:
                componentCount = exifTag.getComponentCount();
                while (i < componentCount) {
                    orderedDataOutputStream.writeRational(exifTag.getRational(i));
                    i++;
                }
                return;
            default:
                return;
        }
    }
}
