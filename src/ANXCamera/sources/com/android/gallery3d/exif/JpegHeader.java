package com.android.gallery3d.exif;

class JpegHeader {
    public static final short APP0 = (short) -32;
    public static final short APP1 = (short) -31;
    public static final short DAC = (short) -52;
    public static final short DHT = (short) -60;
    public static final short EOI = (short) -39;
    public static final short JPG = (short) -56;
    public static final short SOF0 = (short) -64;
    public static final short SOF15 = (short) -49;
    public static final short SOI = (short) -40;

    JpegHeader() {
    }

    public static final boolean isSofMarker(short s) {
        return (s < (short) -64 || s > (short) -49 || s == (short) -60 || s == (short) -56 || s == (short) -52) ? false : true;
    }
}
