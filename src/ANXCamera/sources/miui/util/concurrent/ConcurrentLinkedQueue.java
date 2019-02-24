package miui.util.concurrent;

import java.util.Iterator;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentLinkedQueue<T> implements Queue<T> {
    private final java.util.concurrent.ConcurrentLinkedQueue<T> Mg = new java.util.concurrent.ConcurrentLinkedQueue();

    public boolean put(T t) {
        return this.Mg.offer(t);
    }

    public T get() {
        return this.Mg.poll();
    }

    public boolean remove(T t) {
        return this.Mg.remove(t);
    }

    public int remove(Predicate<T> predicate) {
        Iterator it = this.Mg.iterator();
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
        int size = this.Mg.size();
        this.Mg.clear();
        return size;
    }

    public boolean isEmpty() {
        return this.Mg.isEmpty();
    }

    public int getCapacity() {
        return -1;
    }
}
