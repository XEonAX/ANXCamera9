package org.jcodec.common;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.demuxer.MP4Demuxer;
import org.jcodec.platform.Platform;

public class JCodecUtil {
    private static final Map<Format, Class<?>> demuxers = new HashMap();

    static {
        demuxers.put(Format.MOV, MP4Demuxer.class);
    }

    public static Format detectFormat(File file) throws IOException {
        return detectFormatBuffer(NIOUtils.fetchFromFileL(file, 204800));
    }

    public static Format detectFormatBuffer(ByteBuffer byteBuffer) {
        int i = 0;
        Format format = null;
        for (Entry entry : demuxers.entrySet()) {
            int probe = probe(byteBuffer.duplicate(), (Class) entry.getValue());
            if (probe > i) {
                format = (Format) entry.getKey();
                i = probe;
            }
        }
        return format;
    }

    public static byte[] asciiString(String str) {
        char[] toCharArray = str.toCharArray();
        byte[] bArr = new byte[toCharArray.length];
        for (int i = 0; i < toCharArray.length; i++) {
            bArr[i] = (byte) toCharArray[i];
        }
        return bArr;
    }

    private static int probe(ByteBuffer byteBuffer, Class<?> cls) {
        try {
            return ((Integer) Platform.invokeStaticMethod(cls, "probe", new Object[]{byteBuffer})).intValue();
        } catch (Exception e) {
            return 0;
        }
    }
}
