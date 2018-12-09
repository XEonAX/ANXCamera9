package com.android.camera;

import com.android.camera.log.Log;

public class Exif {
    private static final String TAG = "CameraExif";

    public static int getOrientation(byte[] bArr) {
        if (bArr == null) {
            return 0;
        }
        int i;
        int pack;
        int i2;
        int i3 = 0;
        while (i3 + 3 < bArr.length) {
            i = i3 + 1;
            if ((bArr[i3] & 255) == 255) {
                i3 = bArr[i] & 255;
                if (i3 != 255) {
                    i++;
                    if (!(i3 == 216 || i3 == 1)) {
                        if (i3 != 217 && i3 != 218) {
                            pack = pack(bArr, i, 2, false);
                            if (pack >= 2) {
                                i2 = i + pack;
                                if (i2 <= bArr.length) {
                                    if (i3 == 225 && pack >= 8 && pack(bArr, i + 2, 4, false) == 1165519206 && pack(bArr, i + 6, 2, false) == 0) {
                                        i3 = i + 8;
                                        i = pack - 8;
                                        break;
                                    }
                                    i3 = i2;
                                }
                            }
                            Log.e(TAG, "Invalid length");
                            return 0;
                        }
                    }
                }
                i3 = i;
            }
            i3 = i;
        }
        i = 0;
        if (i > 8) {
            pack = pack(bArr, i3, 4, false);
            if (pack == 1229531648 || pack == 1296891946) {
                boolean z = pack == 1229531648;
                int pack2 = pack(bArr, i3 + 4, 4, z) + 2;
                if (pack2 >= 10 && pack2 <= i) {
                    i3 += pack2;
                    i -= pack2;
                    pack2 = pack(bArr, i3 - 2, 2, z);
                    while (true) {
                        i2 = pack2 - 1;
                        if (pack2 <= 0 || i < 12) {
                            break;
                        } else if (pack(bArr, i3, 2, z) == 274) {
                            int pack3 = pack(bArr, i3 + 8, 2, z);
                            if (pack3 == 1) {
                                return 0;
                            }
                            if (pack3 == 3) {
                                return 180;
                            }
                            if (pack3 == 6) {
                                return 90;
                            }
                            if (pack3 == 8) {
                                return 270;
                            }
                            Log.i(TAG, "Unsupported orientation");
                            return 0;
                        } else {
                            i3 += 12;
                            i -= 12;
                            pack2 = i2;
                        }
                    }
                } else {
                    Log.e(TAG, "Invalid offset");
                    return 0;
                }
            }
            Log.e(TAG, "Invalid byte order");
            return 0;
        }
        Log.i(TAG, "Orientation not found");
        return 0;
    }

    private static int pack(byte[] bArr, int i, int i2, boolean z) {
        int i3;
        if (z) {
            i += i2 - 1;
            i3 = -1;
        } else {
            i3 = 1;
        }
        int i4 = 0;
        while (true) {
            int i5 = i2 - 1;
            if (i2 <= 0) {
                return i4;
            }
            i4 = (bArr[i] & 255) | (i4 << 8);
            i += i3;
            i2 = i5;
        }
    }
}
