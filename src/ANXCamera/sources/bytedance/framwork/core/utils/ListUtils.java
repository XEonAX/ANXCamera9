package bytedance.framwork.core.utils;

import java.util.List;

public class ListUtils {
    public static boolean isEmpty(List<?> list) {
        return list == null || list.size() == 0;
    }
}
