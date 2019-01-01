package miui.reflect;

public class IllegalArgumentException extends ReflectionException {
    private static final long serialVersionUID = -7034897190745766945L;

    public IllegalArgumentException(String str) {
        super(str);
    }

    public IllegalArgumentException(String str, Throwable th) {
        super(str, th);
    }

    public IllegalArgumentException(Throwable th) {
        super(th);
    }
}
