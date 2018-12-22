package miui.util.concurrent;

public interface Queue<T> {

    public interface Predicate<T> {
        boolean apply(T t);
    }

    int clear();

    T get();

    int getCapacity();

    boolean isEmpty();

    boolean put(T t);

    int remove(Predicate<T> predicate);

    boolean remove(T t);
}
