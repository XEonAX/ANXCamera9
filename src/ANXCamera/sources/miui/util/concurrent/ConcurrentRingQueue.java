package miui.util.concurrent;

import java.util.concurrent.atomic.AtomicInteger;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentRingQueue<T> implements Queue<T> {
    private int LX;
    private final boolean LZ;
    private final boolean Ma;
    private final AtomicInteger Mb = new AtomicInteger(0);
    private volatile Node<T> Mc = new Node();
    private final AtomicInteger Md = new AtomicInteger(0);
    private volatile Node<T> Me = this.Mc;
    private volatile int Mf;

    private static class Node<T> {
        Node<T> Mg;
        T element;

        private Node() {
        }
    }

    public ConcurrentRingQueue(int i, boolean z, boolean z2) {
        this.LX = i;
        this.LZ = z;
        this.Ma = z2;
        int i2 = 0;
        Node node = this.Mc;
        while (i2 < i) {
            node.Mg = new Node();
            node = node.Mg;
            i2++;
        }
        node.Mg = this.Mc;
    }

    public boolean put(T t) {
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.Md.get() == 0 && this.Md.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Mc;
        Node node2 = this.Me;
        int i = this.Mf;
        boolean z = true;
        if (node2.Mg != node) {
            node2.element = t;
            if (node2.Mg.Mg != node && this.Ma && i > 0) {
                node2.Mg = node2.Mg.Mg;
                this.Mf = i - 1;
            }
            this.Me = node2.Mg;
        } else if (this.LZ || i < 0) {
            node2.Mg = new Node();
            node2.Mg.Mg = node;
            node2.element = t;
            this.Mf = i + 1;
            this.Me = node2.Mg;
        } else {
            z = false;
        }
        this.Md.set(0);
        return z;
    }

    public T get() {
        while (true) {
            if (this.Mb.get() == 0 && this.Mb.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Mc;
        Node node2 = this.Me;
        Node node3 = node;
        T t = null;
        while (t == null && node3 != node2) {
            t = node3.element;
            node3.element = null;
            node3 = node3.Mg;
            node2 = this.Me;
        }
        if (t != null) {
            this.Mc = node3;
        }
        this.Mb.set(0);
        return t;
    }

    public boolean remove(T t) {
        if (t == null) {
            return false;
        }
        boolean z;
        while (true) {
            if (this.Mb.get() == 0 && this.Mb.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        for (Node node = this.Mc; node != this.Me; node = node.Mg) {
            if (t.equals(node.element)) {
                node.element = null;
                z = true;
                break;
            }
        }
        z = false;
        this.Mb.set(0);
        return z;
    }

    public int remove(Predicate<T> predicate) {
        if (predicate == null) {
            return 0;
        }
        int i;
        while (true) {
            if (this.Mb.get() == 0) {
                i = -1;
                if (this.Mb.compareAndSet(0, -1)) {
                    try {
                        break;
                    } finally {
                        this.Mb.set(0);
                    }
                }
            }
            Thread.yield();
        }
        i = 0;
        for (Node node = this.Mc; node != this.Me; node = node.Mg) {
            if (predicate.apply(node.element)) {
                node.element = null;
                i++;
            }
        }
        return i;
    }

    public int clear() {
        while (true) {
            if (this.Mb.get() == 0 && this.Mb.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node node = this.Mc;
        int i = 0;
        while (node != this.Me) {
            node.element = null;
            i++;
            node = node.Mg;
        }
        this.Mc = node;
        this.Mb.set(0);
        return i;
    }

    public boolean isEmpty() {
        return this.Me == this.Mc;
    }

    public int getCapacity() {
        int i = this.Mf;
        return i > 0 ? this.LX + i : this.LX;
    }

    public void increaseCapacity(int i) {
        if (!this.LZ && i > 0) {
            while (true) {
                if (this.Md.get() == 0 && this.Md.compareAndSet(0, -1)) {
                    this.Mf = -i;
                    this.LX += i;
                    this.Md.set(0);
                    return;
                }
                Thread.yield();
            }
        }
    }

    public void decreaseCapacity(int i) {
        if (this.Ma && i > 0) {
            while (true) {
                if (this.Md.get() == 0 && this.Md.compareAndSet(0, -1)) {
                    this.LX -= i;
                    this.Mf = i;
                    this.Md.set(0);
                    return;
                }
                Thread.yield();
            }
        }
    }
}
