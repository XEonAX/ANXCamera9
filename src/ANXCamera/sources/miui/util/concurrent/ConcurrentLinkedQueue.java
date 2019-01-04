package miui.util.concurrent;

import java.util.Iterator;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentLinkedQueue<T> implements Queue<T> {
    private final java.util.concurrent.ConcurrentLinkedQueue<T> LW = new java.util.concurrent.ConcurrentLinkedQueue();

    public boolean put(T t) {
        return this.LW.offer(t);
    }

    public T get() {
        return this.LW.poll();
    }

    public boolean remove(T t) {
        return this.LW.remove(t);
    }

    public int remove(Predicate<T> predicate) {
        Iterator it = this.LW.iterator();
        int i = 0;
        while (it.hasNext()) {
            if (predicate.apply(it.next())) {
                it.remove();
                i++;
            }
        }
        return i;
    }

    public int clear() {
        int size = this.LW.size();
        this.LW.clear();
        return size;
    }

    public boolean isEmpty() {
        return this.LW.isEmpty();
    }

    public int getCapacity() {
        return -1;
    }
}
