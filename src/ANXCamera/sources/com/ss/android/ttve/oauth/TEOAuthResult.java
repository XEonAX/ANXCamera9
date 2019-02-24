package com.ss.android.ttve.oauth;

import java.util.HashMap;
import java.util.Map;

public enum TEOAuthResult {
    OK(0),
    TBD(1),
    EXPIRED(2),
    FAIL(3),
    NOT_MATCH(4);
    
    private static Map<Integer, TEOAuthResult> valueMaps;
    private int ordinal;

    static {
        valueMaps = new HashMap();
        TEOAuthResult[] values = values();
        int length = values.length;
        int i;
        while (i < length) {
            TEOAuthResult tEOAuthResult = values[i];
            valueMaps.put(Integer.valueOf(tEOAuthResult.ordinal), tEOAuthResult);
            i++;
        }
    }

    private TEOAuthResult(int i) {
        this.ordinal = i;
    }

    public static TEOAuthResult from(int i) {
        if (valueMaps.containsKey(Integer.valueOf(i))) {
            return (TEOAuthResult) valueMaps.get(Integer.valueOf(i));
        }
        return FAIL;
    }
}
