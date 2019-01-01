package com.google.zxing.oned.rss;

public final class RSSUtils {
    private RSSUtils() {
    }

    public static int getRSSvalue(int[] widths, int maxWidth, boolean noNarrow) {
        int elements = widths.length;
        int n = 0;
        for (int width : widths) {
            n += width;
        }
        int val = 0;
        int i = 0;
        int width2 = 0;
        int n2 = n;
        while (width2 < elements - 1) {
            n = 1;
            i |= 1 << width2;
            while (n < widths[width2]) {
                int subVal = combins((n2 - n) - 1, (elements - width2) - 2);
                if (noNarrow && i == 0 && (n2 - n) - ((elements - width2) - 1) >= (elements - width2) - 1) {
                    subVal -= combins((n2 - n) - (elements - width2), (elements - width2) - 2);
                }
                if ((elements - width2) - 1 > 1) {
                    int lessVal = 0;
                    for (int mxwElement = (n2 - n) - ((elements - width2) - 2); mxwElement > maxWidth; mxwElement--) {
                        lessVal += combins(((n2 - n) - mxwElement) - 1, (elements - width2) - 3);
                    }
                    subVal -= ((elements - 1) - width2) * lessVal;
                } else if (n2 - n > maxWidth) {
                    subVal--;
                }
                val += subVal;
                n++;
                i &= ~(1 << width2);
            }
            n2 -= n;
            width2++;
        }
        return val;
    }

    private static int combins(int n, int r) {
        int minDenom;
        int maxDenom;
        if (n - r > r) {
            minDenom = r;
            maxDenom = n - r;
        } else {
            minDenom = n - r;
            maxDenom = r;
        }
        int val = 1;
        int j = 1;
        for (int i = n; i > maxDenom; i--) {
            val *= i;
            if (j <= minDenom) {
                val /= j;
                j++;
            }
        }
        while (j <= minDenom) {
            val /= j;
            j++;
        }
        return val;
    }
}
