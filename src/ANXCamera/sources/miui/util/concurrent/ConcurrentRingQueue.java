package miui.util.concurrent;

import java.util.concurrent.atomic.AtomicInteger;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentRingQueue<T> implements Queue<T> {
    private int Mh;
    private final boolean Mi;
    private final boolean Mj;
    private final AtomicInteger Mk = new AtomicInteger(0);
    private volatile Node<T> Ml = new Node();
    private final AtomicInteger Mm = new AtomicInteger(0);
    private volatile Node<T> Mn = this.Ml;
    private volatile int Mo;

    private static class Node<T> {
        Node<T> Mp;
        T element;

        private Node() {
        }
    }

    public ConcurrentRingQueue(int i, boolean z, boolean z2) {
        this.Mh = i;
        this.Mi = z;
        this.Mj = z2;
        int i2 = 0;
        Node node = this.Ml;
        while (i2 < i) {
            node.Mp = new Node();
            node = node.Mp;
            i2++;
        }
        node.Mp = this.Ml;
    }

    public boolean put(T t) {
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.Mm.get() == 0 && this.Mm.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Ml;
        Node node2 = this.Mn;
        int i = this.Mo;
        boolean z = true;
        if (node2.Mp != node) {
            node2.element = t;
            if (node2.Mp.Mp != node && this.Mj && i > 0) {
                node2.Mp = node2.Mp.Mp;
                this.Mo = i - 1;
            }
            this.Mn = node2.Mp;
        } else if (this.Mi || i < 0) {
            node2.Mp = new Node();
            node2.Mp.Mp = node;
            node2.element = t;
            this.Mo = i + 1;
            this.Mn = node2.Mp;
        } else {
            z = false;
        }
        this.Mm.set(0);
        return z;
    }

    public T get() {
        while (true) {
            if (this.Mk.get() == 0 && this.Mk.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Ml;
        Node node2 = this.Mn;
        Node node3 = node;
        T t = null;
        while (t == null && node3 != node2) {
            t = node3.element;
            node3.element = null;
            node3 = node3.Mp;
            node2 = this.Mn;
        }
        if (t != null) {
            this.Ml = node3;
        }
        this.Mk.set(0);
        return t;
    }

    public boolean remove(T t) {
        if (t == null) {
            return false;
        }
        boolean z;
        while (true) {
            if (this.Mk.get() == 0 && this.Mk.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        for (Node node = this.Ml; node != this.Mn; node = node.Mp) {
            if (t.equals(node.element)) {
                node.element = null;
                z = true;
                break;
            }
        }
        z = false;
        this.Mk.set(0);
        return z;
    }

    public int remove(Predicate<T> predicate) {
        if (predicate == null) {
            return 0;
        }
        int i;
        while (true) {
            if (this.Mk.get() == 0) {
                i = -1;
                if (this.Mk.compareAndSet(0, -1)) {
                    try {
                        break;
                    } finally {
                        this.Mk.set(0);
                    }
                }
            }
            Thread.yield();
        }
        i = 0;
        for (Node node = this.Ml; node != this.Mn; node = node.Mp) {
            if (predicate.apply(node.element)) {
                node.element = null;
                i++;
            }
        }
        return i;
    }

    public int clear() {
        while (true) {
            if (this.Mk.get() == 0 && this.Mk.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Ml;
        int i = 0;
        while (node != this.Mn) {
            node.element = null;
            i++;
            node = node.Mp;
        }
        this.Ml = node;
        this.Mk.set(0);
        return i;
    }

    public boolean isEmpty() {
        return this.Mn == this.Ml;
    }

    public int getCapacity() {
        int i = this.Mo;
        return i > 0 ? this.Mh + i : this.Mh;
    }

    public void increaseCapacity(int i) {
        if (!this.Mi && i > 0) {
            while (true) {
                if (this.Mm.get() == 0 && this.Mm.compareAndSet(0, -1)) {
                    this.Mo = -i;
                    this.Mh += i;
                    this.Mm.set(0);
                    return;
                }
                Thread.yield();
            }
        }
    }

    public void decreaseCapacity(int i) {
        if (this.Mj && i > 0) {
            while (true) {
                if (this.Mm.get() == 0 && this.Mm.compareAndSet(0, -1)) {
                    this.Mh -= i;
                    this.Mo = i;
                    this.Mm.set(0);
                    return;
                }
                Thread.yield();
            }
        }
    }
}
