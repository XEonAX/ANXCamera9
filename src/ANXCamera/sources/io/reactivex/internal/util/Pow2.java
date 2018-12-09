package io.reactivex.internal.util;

public final class Pow2 {
    private Pow2() {
        throw new IllegalStateException("No instances!");
    }

    public static int roundToPowerOfTwo(int i) {
        return 1 << (32 - Integer.numberOfLeadingZeros(i - 1));
    }

    public static boolean isPowerOfTwo(int i) {
        return (i & (i + -1)) == 0;
    }
}
