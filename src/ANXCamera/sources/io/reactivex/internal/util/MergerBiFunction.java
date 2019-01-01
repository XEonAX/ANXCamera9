package io.reactivex.internal.util;

import io.reactivex.functions.BiFunction;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public final class MergerBiFunction<T> implements BiFunction<List<T>, List<T>, List<T>> {
    final Comparator<? super T> comparator;

    public MergerBiFunction(Comparator<? super T> comparator) {
        this.comparator = comparator;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0053  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0075  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0064  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public List<T> apply(List<T> list, List<T> list2) throws Exception {
        int size = list.size() + list2.size();
        if (size == 0) {
            return new ArrayList();
        }
        Object next;
        Object next2;
        List<T> arrayList = new ArrayList(size);
        Iterator it = list.iterator();
        Iterator it2 = list2.iterator();
        if (it.hasNext()) {
            next = it.next();
        } else {
            next = null;
        }
        if (it2.hasNext()) {
            next2 = it2.next();
            while (next != null && next2 != null) {
                if (this.comparator.compare(next, next2) >= 0) {
                    arrayList.add(next);
                    if (it.hasNext()) {
                        next = it.next();
                    } else {
                        next = null;
                    }
                } else {
                    arrayList.add(next2);
                    if (it2.hasNext()) {
                        next2 = it2.next();
                    }
                    next2 = it2.next();
                }
            }
            if (next == null) {
                arrayList.add(next);
                while (it.hasNext()) {
                    arrayList.add(it.next());
                }
            } else if (next2 != null) {
                arrayList.add(next2);
                while (it2.hasNext()) {
                    arrayList.add(it2.next());
                }
            }
            return arrayList;
        }
        next2 = null;
        while (next != null) {
            if (this.comparator.compare(next, next2) >= 0) {
            }
        }
        if (next == null) {
        }
        return arrayList;
    }
}
