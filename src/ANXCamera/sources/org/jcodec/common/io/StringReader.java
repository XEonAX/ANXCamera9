package org.jcodec.common.io;

import java.io.IOException;
import java.io.InputStream;
import org.jcodec.platform.Platform;

public abstract class StringReader {
    public static String readString(InputStream inputStream, int i) throws IOException {
        byte[] _sureRead = _sureRead(inputStream, i);
        return _sureRead == null ? null : Platform.stringFromBytes(_sureRead);
    }

    public static byte[] _sureRead(InputStream inputStream, int i) throws IOException {
        byte[] bArr = new byte[i];
        if (sureRead(inputStream, bArr, bArr.length) == i) {
            return bArr;
        }
        return null;
    }

    public static int sureRead(InputStream inputStream, byte[] bArr, int i) throws IOException {
        int i2 = 0;
        while (i2 < i) {
            int read = inputStream.read(bArr, i2, i - i2);
            if (read == -1) {
                break;
            }
            i2 += read;
        }
        return i2;
    }

    public static void sureSkip(InputStream inputStream, long j) throws IOException {
        while (j > 0) {
            j -= inputStream.skip(j);
        }
    }
}
