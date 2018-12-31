package com.bumptech.glide.load.engine.bitmap_recycle;

import java.util.Map.Entry;
import java.util.TreeMap;

class PrettyPrintTreeMap<K, V> extends TreeMap<K, V> {
    PrettyPrintTreeMap() {
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("( ");
        for (Entry entry : entrySet()) {
            stringBuilder.append('{');
            stringBuilder.append(entry.getKey());
            stringBuilder.append(':');
            stringBuilder.append(entry.getValue());
            stringBuilder.append("}, ");
        }
        if (!isEmpty()) {
            stringBuilder.replace(stringBuilder.length() - 2, stringBuilder.length(), "");
        }
        stringBuilder.append(" )");
        return stringBuilder.toString();
    }
}
