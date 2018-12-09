package com.ss.android.medialib;

import android.view.Surface;
import java.nio.ByteBuffer;

public interface AVCEncoderInterface {
    public static final int BITRATE_MODE_CBR = 2;
    public static final int BITRATE_MODE_CQ = 0;
    public static final int BITRATE_MODE_VBR = 1;
    public static final int ENCODE_PROFILE_BASELINE = 1;
    public static final int ENCODE_PROFILE_HIGH = 8;
    public static final int ENCODE_PROFILE_MAIN = 2;

    int getProfile();

    int onEncoderData(int i, int i2, int i3, boolean z);

    void onEncoderData(ByteBuffer byteBuffer, int i, boolean z);

    void onEncoderData(byte[] bArr, int i, boolean z);

    Surface onInitHardEncoder(int i, int i2, int i3, int i4, int i5, int i6, boolean z);

    Surface onInitHardEncoder(int i, int i2, int i3, int i4, boolean z);

    void onSetCodecConfig(ByteBuffer byteBuffer);

    void onSwapGlBuffers();

    void onUninitHardEncoder();

    void onWriteFile(ByteBuffer byteBuffer, int i, int i2, int i3);

    void onWriteFile(ByteBuffer byteBuffer, long j, long j2, int i, int i2);

    void setColorFormat(int i);
}
