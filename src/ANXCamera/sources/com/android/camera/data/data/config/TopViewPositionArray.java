package com.android.camera.data.data.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TopViewPositionArray {
    private static Map<Integer, Integer> sCurrentUsePostion = new HashMap();
    private static int[] sViewPositionArray = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    public static List<TopConfigItem> fillNotUseViewPosition(List<TopConfigItem> list) {
        if (list == null) {
            return list;
        }
        Map hashMap = new HashMap(sCurrentUsePostion);
        sCurrentUsePostion.clear();
        for (TopConfigItem topConfigItem : list) {
            Integer num = (Integer) hashMap.get(Integer.valueOf(topConfigItem.configItem));
            if (num == null) {
                for (int i : sViewPositionArray) {
                    if (!hashMap.containsValue(Integer.valueOf(i)) && !sCurrentUsePostion.containsValue(Integer.valueOf(i))) {
                        topConfigItem.bindViewPosition = i;
                        sCurrentUsePostion.put(Integer.valueOf(topConfigItem.configItem), Integer.valueOf(i));
                        break;
                    }
                }
            } else {
                topConfigItem.bindViewPosition = num.intValue();
                sCurrentUsePostion.put(Integer.valueOf(topConfigItem.configItem), num);
            }
        }
        return list;
    }

    public static int getCurrentUseViewPositionFromConfig(int i) {
        Integer num = (Integer) sCurrentUsePostion.get(Integer.valueOf(i));
        if (num == null) {
            return 0;
        }
        return num.intValue();
    }
}
