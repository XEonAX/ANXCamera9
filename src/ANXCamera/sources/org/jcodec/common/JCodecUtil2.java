package org.jcodec.common;

import org.jcodec.platform.Platform;

public class JCodecUtil2 {
    public static byte[] asciiString(String str) {
        return Platform.getBytes(str);
    }
}
