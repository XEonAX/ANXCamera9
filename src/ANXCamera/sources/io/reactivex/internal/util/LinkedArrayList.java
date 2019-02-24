package io.reactivex.internal.util;

import java.util.ArrayList;
import java.util.List;

public class LinkedArrayList {
    final int capacityHint;
    Object[] head;
    int indexInTail;
    volatile int size;
    Object[] tail;

    public LinkedArrayList(int i) {
        this.capacityHint = i;
    }

    public void add(Object obj) {
        if (this.size == 0) {
            this.head = new Object[(this.capacityHint + 1)];
            this.tail = this.head;
            this.head[0] = obj;
            this.indexInTail = 1;
            this.size = 1;
        } else if (this.indexInTail == this.capacityHint) {
            Object[] objArr = new Object[(this.capacityHint + 1)];
            objArr[0] = obj;
            this.tail[this.capacityHint] = objArr;
            this.tail = objArr;
            this.indexInTail = 1;
            this.size++;
        } else {
            this.tail[this.indexInTail] = obj;
            this.indexInTail++;
            this.size++;
        }
    }

    public Object[] head() {
        return this.head;
    }

    public int size() {
        return this.size;
    }

    public String toString() {
        int i = this.capacityHint;
        int i2 = this.size;
        List arrayList = new ArrayList(i2 + 1);
        Object[] head = head();
        int i3 = 0;
        int i4 = i3;
        while (i3 < i2) {
            arrayList.add(head[i4]);
            i3++;
            i4++;
            if (i4 == i) {
                head = (Object[]) head[i];
                i4 = 0;
            }
        }
        return arrayList.toString();
    }
}
