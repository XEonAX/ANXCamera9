package com.xiaomi.camera.liveshot.util;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.options.SerializeOptions;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class XmpHelper {
    public static final String GOOGLE_MICROVIDEO_NAMESPACE = "http://ns.google.com/photos/1.0/camera/";
    private static final int MAX_XMP_BUFFER_SIZE = 65502;
    public static final String MICROVIDEO_OFFSET = "MicroVideoOffset";
    public static final String MICROVIDEO_PREFIX = "GCamera";
    public static final String MICROVIDEO_PRESENTATION_TIMESTAMP = "MicroVideoPresentationTimestampUs";
    public static final String MICROVIDEO_TYPE = "MicroVideo";
    public static final String MICROVIDEO_VERSION = "MicroVideoVersion";
    private static final int M_APP1 = 225;
    private static final int M_SOI = 216;
    private static final int M_SOS = 218;
    private static final String TAG = XmpHelper.class.getSimpleName();
    private static final String XMP_HEADER = "http://ns.adobe.com/xap/1.0/\u0000";
    private static final int XMP_HEADER_SIZE = 29;

    private static class Section {
        public byte[] data;
        public int length;
        public int marker;

        private Section() {
        }
    }

    static {
        try {
            XMPMetaFactory.getSchemaRegistry().registerNamespace(GOOGLE_MICROVIDEO_NAMESPACE, MICROVIDEO_PREFIX);
        } catch (XMPException e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to register ns http://ns.google.com/photos/1.0/camera/: ");
            stringBuilder.append(e);
            Log.d(str, stringBuilder.toString());
        }
    }

    private XmpHelper() {
    }

    public static XMPMeta extractXMPMeta(String str) {
        if (str.toLowerCase().endsWith(Storage.JPEG_SUFFIX) || str.toLowerCase().endsWith(".jpeg")) {
            try {
                return extractXMPMeta(new FileInputStream(str));
            } catch (FileNotFoundException e) {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Could not read from ");
                stringBuilder.append(str);
                stringBuilder.append(": ");
                stringBuilder.append(e);
                Log.e(str2, stringBuilder.toString());
                return null;
            }
        }
        Log.d(TAG, "XMP parse: only jpeg file is supported");
        return null;
    }

    public static XMPMeta extractXMPMeta(InputStream inputStream) {
        List<Section> parse = parse(inputStream, true);
        if (parse == null) {
            return null;
        }
        for (Section section : parse) {
            if (hasXMPHeader(section.data)) {
                byte[] bArr = new byte[(getXMPContentEnd(section.data) - 29)];
                System.arraycopy(section.data, 29, bArr, 0, bArr.length);
                try {
                    return XMPMetaFactory.parseFromBuffer(bArr);
                } catch (XMPException e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("XMP parse error: ");
                    stringBuilder.append(e);
                    Log.d(str, stringBuilder.toString());
                    return null;
                }
            }
        }
        return null;
    }

    public static XMPMeta createXMPMeta() {
        return XMPMetaFactory.create();
    }

    public static XMPMeta extractOrCreateXMPMeta(String str) {
        XMPMeta extractXMPMeta = extractXMPMeta(str);
        return extractXMPMeta == null ? createXMPMeta() : extractXMPMeta;
    }

    public static boolean writeXMPMeta(String str, XMPMeta xMPMeta) {
        String str2;
        StringBuilder stringBuilder;
        if (str.toLowerCase().endsWith(Storage.JPEG_SUFFIX) || str.toLowerCase().endsWith(".jpeg")) {
            try {
                List insertXMPSection = insertXMPSection(parse(new FileInputStream(str), false), xMPMeta);
                if (insertXMPSection == null) {
                    return false;
                }
                OutputStream fileOutputStream;
                try {
                    fileOutputStream = new FileOutputStream(str);
                    writeJpegFile(fileOutputStream, insertXMPSection);
                    fileOutputStream.close();
                    return true;
                } catch (IOException e) {
                    str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Failed to write to ");
                    stringBuilder.append(str);
                    stringBuilder.append(": ");
                    stringBuilder.append(e);
                    Log.d(str2, stringBuilder.toString());
                    return false;
                } catch (Throwable th) {
                    r2.addSuppressed(th);
                }
            } catch (FileNotFoundException e2) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Could not read from ");
                stringBuilder.append(str);
                stringBuilder.append(": ");
                stringBuilder.append(e2);
                Log.e(str2, stringBuilder.toString());
                return false;
            }
        }
        Log.d(TAG, "XMP parse: only jpeg file is supported");
        return false;
    }

    public static boolean writeXMPMeta(InputStream inputStream, OutputStream outputStream, XMPMeta xMPMeta) {
        List insertXMPSection = insertXMPSection(parse(inputStream, false), xMPMeta);
        if (insertXMPSection == null) {
            return false;
        }
        try {
            writeJpegFile(outputStream, insertXMPSection);
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                }
            }
            return true;
        } catch (IOException e2) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Write to stream failed: ");
            stringBuilder.append(e2);
            Log.d(str, stringBuilder.toString());
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e3) {
                }
            }
            return false;
        } catch (Throwable th) {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e4) {
                }
            }
        }
    }

    private static void writeJpegFile(OutputStream outputStream, List<Section> list) throws IOException {
        outputStream.write(255);
        outputStream.write(216);
        for (Section section : list) {
            outputStream.write(255);
            outputStream.write(section.marker);
            if (section.length > 0) {
                int i = section.length & 255;
                outputStream.write(section.length >> 8);
                outputStream.write(i);
            }
            outputStream.write(section.data);
        }
    }

    private static List<Section> insertXMPSection(List<Section> list, XMPMeta xMPMeta) {
        if (list != null) {
            int i = 1;
            if (list.size() > 1) {
                try {
                    SerializeOptions serializeOptions = new SerializeOptions();
                    serializeOptions.setUseCompactFormat(true);
                    serializeOptions.setOmitPacketWrapper(true);
                    byte[] serializeToBuffer = XMPMetaFactory.serializeToBuffer(xMPMeta, serializeOptions);
                    if (serializeToBuffer.length > MAX_XMP_BUFFER_SIZE) {
                        return null;
                    }
                    byte[] bArr = new byte[(serializeToBuffer.length + 29)];
                    System.arraycopy(XMP_HEADER.getBytes(), 0, bArr, 0, 29);
                    System.arraycopy(serializeToBuffer, 0, bArr, 29, serializeToBuffer.length);
                    Section section = new Section();
                    section.marker = 225;
                    section.length = bArr.length + 2;
                    section.data = bArr;
                    int i2 = 0;
                    while (i2 < list.size()) {
                        if (((Section) list.get(i2)).marker == 225 && hasXMPHeader(((Section) list.get(i2)).data)) {
                            list.set(i2, section);
                            return list;
                        }
                        i2++;
                    }
                    List<Section> arrayList = new ArrayList();
                    if (((Section) list.get(0)).marker != 225) {
                        i = 0;
                    }
                    arrayList.addAll(list.subList(0, i));
                    arrayList.add(section);
                    arrayList.addAll(list.subList(i, list.size()));
                    return arrayList;
                } catch (XMPException e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Serialize xmp failed: ");
                    stringBuilder.append(e);
                    Log.d(str, stringBuilder.toString());
                    return null;
                }
            }
        }
        return null;
    }

    private static boolean hasXMPHeader(byte[] bArr) {
        if (bArr.length < 29) {
            return false;
        }
        try {
            byte[] bArr2 = new byte[29];
            System.arraycopy(bArr, 0, bArr2, 0, 29);
            if (new String(bArr2, "UTF-8").equals(XMP_HEADER)) {
                return true;
            }
            return false;
        } catch (UnsupportedEncodingException e) {
            return false;
        }
    }

    private static int getXMPContentEnd(byte[] bArr) {
        int length = bArr.length - 1;
        while (length >= 1) {
            if (bArr[length] == (byte) 62 && bArr[length - 1] != (byte) 63) {
                return length + 1;
            }
            length--;
        }
        return bArr.length;
    }

    /* JADX WARNING: Missing block: B:20:0x0031, code:
            if (r3 != -1) goto L_0x003c;
     */
    /* JADX WARNING: Missing block: B:21:0x0034, code:
            if (r8 == null) goto L_0x003b;
     */
    /* JADX WARNING: Missing block: B:23:?, code:
            r8.close();
     */
    /* JADX WARNING: Missing block: B:27:0x0040, code:
            if (r3 != 218) goto L_0x0069;
     */
    /* JADX WARNING: Missing block: B:28:0x0042, code:
            if (r9 != false) goto L_0x0061;
     */
    /* JADX WARNING: Missing block: B:30:?, code:
            r9 = new com.xiaomi.camera.liveshot.util.XmpHelper.Section();
            r9.marker = r3;
            r9.length = -1;
            r9.data = new byte[r8.available()];
            r8.read(r9.data, 0, r9.data.length);
            r1.add(r9);
     */
    /* JADX WARNING: Missing block: B:31:0x0061, code:
            if (r8 == null) goto L_0x0068;
     */
    /* JADX WARNING: Missing block: B:33:?, code:
            r8.close();
     */
    /* JADX WARNING: Missing block: B:37:?, code:
            r5 = r8.read();
            r7 = r8.read();
     */
    /* JADX WARNING: Missing block: B:38:0x0071, code:
            if (r5 == -1) goto L_0x00a2;
     */
    /* JADX WARNING: Missing block: B:39:0x0073, code:
            if (r7 != -1) goto L_0x0076;
     */
    /* JADX WARNING: Missing block: B:40:0x0076, code:
            r4 = (r5 << 8) | r7;
     */
    /* JADX WARNING: Missing block: B:41:0x0079, code:
            if (r9 == false) goto L_0x0087;
     */
    /* JADX WARNING: Missing block: B:43:0x007d, code:
            if (r3 != 225) goto L_0x0080;
     */
    /* JADX WARNING: Missing block: B:44:0x0080, code:
            r8.skip((long) (r4 - 2));
     */
    /* JADX WARNING: Missing block: B:45:0x0087, code:
            r5 = new com.xiaomi.camera.liveshot.util.XmpHelper.Section();
            r5.marker = r3;
            r5.length = r4;
            r4 = r4 - 2;
            r5.data = new byte[r4];
            r8.read(r5.data, 0, r4);
            r1.add(r5);
     */
    private static java.util.List<com.xiaomi.camera.liveshot.util.XmpHelper.Section> parse(java.io.InputStream r8, boolean r9) {
        /*
        r0 = 0;
        r1 = r8.read();	 Catch:{ IOException -> 0x00be }
        r2 = 255; // 0xff float:3.57E-43 double:1.26E-321;
        if (r1 != r2) goto L_0x00b3;
    L_0x0009:
        r1 = r8.read();	 Catch:{ IOException -> 0x00be }
        r3 = 216; // 0xd8 float:3.03E-43 double:1.067E-321;
        if (r1 == r3) goto L_0x0013;
    L_0x0011:
        goto L_0x00b3;
    L_0x0013:
        r1 = new java.util.ArrayList;	 Catch:{ IOException -> 0x00be }
        r1.<init>();	 Catch:{ IOException -> 0x00be }
    L_0x0018:
        r3 = r8.read();	 Catch:{ IOException -> 0x00be }
        r4 = -1;
        if (r3 == r4) goto L_0x00aa;
    L_0x001f:
        if (r3 == r2) goto L_0x002a;
        if (r8 == 0) goto L_0x0029;
    L_0x0024:
        r8.close();	 Catch:{ IOException -> 0x0028 }
        goto L_0x0029;
    L_0x0028:
        r8 = move-exception;
    L_0x0029:
        return r0;
    L_0x002a:
        r3 = r8.read();	 Catch:{ IOException -> 0x00be }
        if (r3 != r2) goto L_0x0031;
    L_0x0030:
        goto L_0x002a;
    L_0x0031:
        if (r3 != r4) goto L_0x003c;
        if (r8 == 0) goto L_0x003b;
    L_0x0036:
        r8.close();	 Catch:{ IOException -> 0x003a }
        goto L_0x003b;
    L_0x003a:
        r8 = move-exception;
    L_0x003b:
        return r0;
        r5 = 218; // 0xda float:3.05E-43 double:1.077E-321;
        r6 = 0;
        if (r3 != r5) goto L_0x0069;
    L_0x0042:
        if (r9 != 0) goto L_0x0060;
    L_0x0044:
        r9 = new com.xiaomi.camera.liveshot.util.XmpHelper$Section;	 Catch:{ IOException -> 0x00be }
        r9.<init>();	 Catch:{ IOException -> 0x00be }
        r9.marker = r3;	 Catch:{ IOException -> 0x00be }
        r9.length = r4;	 Catch:{ IOException -> 0x00be }
        r2 = r8.available();	 Catch:{ IOException -> 0x00be }
        r2 = new byte[r2];	 Catch:{ IOException -> 0x00be }
        r9.data = r2;	 Catch:{ IOException -> 0x00be }
        r2 = r9.data;	 Catch:{ IOException -> 0x00be }
        r3 = r9.data;	 Catch:{ IOException -> 0x00be }
        r3 = r3.length;	 Catch:{ IOException -> 0x00be }
        r8.read(r2, r6, r3);	 Catch:{ IOException -> 0x00be }
        r1.add(r9);	 Catch:{ IOException -> 0x00be }
        if (r8 == 0) goto L_0x0068;
    L_0x0063:
        r8.close();	 Catch:{ IOException -> 0x0067 }
        goto L_0x0068;
    L_0x0067:
        r8 = move-exception;
    L_0x0068:
        return r1;
    L_0x0069:
        r5 = r8.read();	 Catch:{ IOException -> 0x00be }
        r7 = r8.read();	 Catch:{ IOException -> 0x00be }
        if (r5 == r4) goto L_0x00a1;
    L_0x0073:
        if (r7 != r4) goto L_0x0076;
    L_0x0075:
        goto L_0x00a1;
    L_0x0076:
        r4 = r5 << 8;
        r4 = r4 | r7;
        if (r9 == 0) goto L_0x0087;
    L_0x007b:
        r5 = 225; // 0xe1 float:3.15E-43 double:1.11E-321;
        if (r3 != r5) goto L_0x0080;
    L_0x007f:
        goto L_0x0087;
    L_0x0080:
        r4 = r4 + -2;
        r3 = (long) r4;	 Catch:{ IOException -> 0x00be }
        r8.skip(r3);	 Catch:{ IOException -> 0x00be }
        goto L_0x009f;
    L_0x0087:
        r5 = new com.xiaomi.camera.liveshot.util.XmpHelper$Section;	 Catch:{ IOException -> 0x00be }
        r5.<init>();	 Catch:{ IOException -> 0x00be }
        r5.marker = r3;	 Catch:{ IOException -> 0x00be }
        r5.length = r4;	 Catch:{ IOException -> 0x00be }
        r4 = r4 + -2;
        r3 = new byte[r4];	 Catch:{ IOException -> 0x00be }
        r5.data = r3;	 Catch:{ IOException -> 0x00be }
        r3 = r5.data;	 Catch:{ IOException -> 0x00be }
        r8.read(r3, r6, r4);	 Catch:{ IOException -> 0x00be }
        r1.add(r5);	 Catch:{ IOException -> 0x00be }
    L_0x009f:
        goto L_0x0018;
        if (r8 == 0) goto L_0x00a9;
    L_0x00a4:
        r8.close();	 Catch:{ IOException -> 0x00a8 }
        goto L_0x00a9;
    L_0x00a8:
        r8 = move-exception;
    L_0x00a9:
        return r0;
        if (r8 == 0) goto L_0x00b2;
    L_0x00ad:
        r8.close();	 Catch:{ IOException -> 0x00b1 }
        goto L_0x00b2;
    L_0x00b1:
        r8 = move-exception;
    L_0x00b2:
        return r1;
        if (r8 == 0) goto L_0x00bb;
    L_0x00b6:
        r8.close();	 Catch:{ IOException -> 0x00ba }
        goto L_0x00bb;
    L_0x00ba:
        r8 = move-exception;
    L_0x00bb:
        return r0;
    L_0x00bc:
        r9 = move-exception;
        goto L_0x00de;
    L_0x00be:
        r9 = move-exception;
        r1 = TAG;	 Catch:{ all -> 0x00bc }
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00bc }
        r2.<init>();	 Catch:{ all -> 0x00bc }
        r3 = "Could not parse file: ";
        r2.append(r3);	 Catch:{ all -> 0x00bc }
        r2.append(r9);	 Catch:{ all -> 0x00bc }
        r9 = r2.toString();	 Catch:{ all -> 0x00bc }
        com.android.camera.log.Log.d(r1, r9);	 Catch:{ all -> 0x00bc }
        if (r8 == 0) goto L_0x00dd;
    L_0x00d8:
        r8.close();	 Catch:{ IOException -> 0x00dc }
        goto L_0x00dd;
    L_0x00dc:
        r8 = move-exception;
    L_0x00dd:
        return r0;
    L_0x00de:
        if (r8 == 0) goto L_0x00e5;
    L_0x00e0:
        r8.close();	 Catch:{ IOException -> 0x00e4 }
        goto L_0x00e5;
    L_0x00e4:
        r8 = move-exception;
    L_0x00e5:
        throw r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.liveshot.util.XmpHelper.parse(java.io.InputStream, boolean):java.util.List<com.xiaomi.camera.liveshot.util.XmpHelper$Section>");
    }
}
