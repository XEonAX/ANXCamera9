package org.jcodec.common;

import java.util.ArrayList;
import java.util.List;

public class StringUtils {
    private static String[] splitWorker(String str, char c, boolean z) {
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return new String[0];
        }
        List arrayList = new ArrayList();
        int i = 0;
        int i2 = i;
        int i3 = i2;
        int i4 = i3;
        while (i < length) {
            if (str.charAt(i) == c) {
                if (i2 != 0 || z) {
                    arrayList.add(str.substring(i3, i));
                    i2 = 0;
                    i4 = 1;
                }
                i3 = i + 1;
                i = i3;
            } else {
                i++;
                i4 = 0;
                i2 = 1;
            }
        }
        if (i2 != 0 || (z && r7 != 0)) {
            arrayList.add(str.substring(i3, i));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static String[] splitC(String str, char c) {
        return splitWorker(str, c, false);
    }
}
