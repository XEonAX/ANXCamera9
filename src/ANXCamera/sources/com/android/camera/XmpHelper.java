package com.android.camera;

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
    public static final String XIAOMI_XMP_METADATA_NAMESPACE = "http://ns.xiaomi.com/photos/1.0/camera/";
    public static final String XIAOMI_XMP_METADATA_PREFIX = "MiCamera";
    public static final String XIAOMI_XMP_METADATA_PROPERTY_NAME = "XMPMeta";
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
            XMPMetaFactory.getSchemaRegistry().registerNamespace(XIAOMI_XMP_METADATA_NAMESPACE, XIAOMI_XMP_METADATA_PREFIX);
        } catch (XMPException e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to register namespaces: ");
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
            r9 = new com.android.camera.XmpHelper.Section();
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
            r5 = new com.android.camera.XmpHelper.Section();
            r5.marker = r3;
            r5.length = r4;
            r4 = r4 - 2;
            r5.data = new byte[r4];
            r8.read(r5.data, 0, r4);
            r1.add(r5);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static List<Section> parse(InputStream inputStream, boolean z) {
        try {
            List<Section> arrayList;
            if (inputStream.read() == 255 && inputStream.read() == 216) {
                arrayList = new ArrayList();
                while (true) {
                    int read = inputStream.read();
                    if (read != -1) {
                        if (read == 255) {
                            while (true) {
                                read = inputStream.read();
                                if (read != 255) {
                                    break;
                                }
                            }
                        } else {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e) {
                                }
                            }
                            return null;
                        }
                    }
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e2) {
                        }
                    }
                    return arrayList;
                }
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e3) {
                    }
                }
                return null;
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e4) {
                }
            }
            return null;
            return arrayList;
            return null;
        } catch (IOException e5) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Could not parse file: ");
            stringBuilder.append(e5);
            Log.d(str, stringBuilder.toString());
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e6) {
                }
            }
            return null;
        } catch (Throwable th) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e7) {
                }
            }
        }
    }
}
