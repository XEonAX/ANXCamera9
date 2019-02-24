package com.android.camera.data.data.config;

import java.util.List;

public class TopViewPositionArray {
    private static final int[][] VIEW_POSITION_ARRAY;

    static {
        r1 = new int[6][];
        r1[0] = new int[]{10};
        r1[1] = new int[]{0, 10};
        r1[2] = new int[]{0, 5, 10};
        r1[3] = new int[]{0, 3, 7, 10};
        r1[4] = new int[]{0, 2, 5, 8, 10};
        r1[5] = new int[]{0, 1, 4, 6, 9, 10};
        VIEW_POSITION_ARRAY = r1;
    }

    public static SupportedConfigs fillNotUseViewPosition(List<TopConfigItem> list) {
        if (list == null) {
            return new SupportedConfigs();
        }
        SupportedConfigs supportedConfigs = new SupportedConfigs(11);
        TopConfigItem topConfigItem = new TopConfigItem(176);
        int i = 0;
        for (int i2 = 0; i2 < 11; i2++) {
            supportedConfigs.add(topConfigItem);
        }
        int i3 = list.size() <= 2 ? 1 : 0;
        int size = list.size();
        int[] iArr = VIEW_POSITION_ARRAY[size - 1];
        while (i < size) {
            TopConfigItem topConfigItem2 = (TopConfigItem) list.get(i);
            topConfigItem2.index = i;
            if (i3 == 0 || topConfigItem2.gravity != 17) {
                topConfigItem2.bindViewPosition = iArr[i];
            } else {
                topConfigItem2.bindViewPosition = 5;
            }
            supportedConfigs.set(topConfigItem2.bindViewPosition, topConfigItem2);
            i++;
        }
        return supportedConfigs;
    }
}
