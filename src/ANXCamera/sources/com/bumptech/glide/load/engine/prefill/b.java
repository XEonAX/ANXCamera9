package com.bumptech.glide.load.engine.prefill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: PreFillQueue */
final class b {
    private final Map<c, Integer> iC;
    private final List<c> iD;
    private int iE;
    private int iF;

    public b(Map<c, Integer> map) {
        this.iC = map;
        this.iD = new ArrayList(map.keySet());
        for (Integer intValue : map.values()) {
            this.iE += intValue.intValue();
        }
    }

    public c bP() {
        c cVar = (c) this.iD.get(this.iF);
        Integer num = (Integer) this.iC.get(cVar);
        if (num.intValue() == 1) {
            this.iC.remove(cVar);
            this.iD.remove(this.iF);
        } else {
            this.iC.put(cVar, Integer.valueOf(num.intValue() - 1));
        }
        this.iE--;
        this.iF = this.iD.isEmpty() ? 0 : (this.iF + 1) % this.iD.size();
        return cVar;
    }

    public int getSize() {
        return this.iE;
    }

    public boolean isEmpty() {
        return this.iE == 0;
    }
}
