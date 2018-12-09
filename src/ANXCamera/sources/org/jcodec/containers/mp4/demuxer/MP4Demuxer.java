package org.jcodec.containers.mp4.demuxer;

import java.nio.ByteBuffer;
import org.jcodec.common.Fourcc;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.platform.Platform;

public class MP4Demuxer {
    public static int probe(ByteBuffer byteBuffer) {
        byteBuffer = byteBuffer.duplicate();
        int i = 0;
        int i2 = i;
        while (true) {
            int i3 = 8;
            if (byteBuffer.remaining() < 8) {
                break;
            }
            long unsignedInt = Platform.unsignedInt(byteBuffer.getInt());
            int i4 = byteBuffer.getInt();
            if (unsignedInt != 1) {
                if (unsignedInt < 8) {
                    break;
                }
            }
            unsignedInt = byteBuffer.getLong();
            i3 = 16;
            if ((i4 == Fourcc.ftyp && unsignedInt < 64) || ((i4 == Fourcc.moov && unsignedInt < 104857600) || i4 == Fourcc.free || i4 == Fourcc.mdat || i4 == Fourcc.wide)) {
                i++;
            }
            i2++;
            if (unsignedInt >= 2147483647L) {
                break;
            }
            NIOUtils.skip(byteBuffer, (int) (unsignedInt - ((long) i3)));
        }
        if (i2 == 0) {
            return 0;
        }
        return (i * 100) / i2;
    }
}
