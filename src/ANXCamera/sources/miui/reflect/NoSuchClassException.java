package miui.reflect;

public class NoSuchClassException extends ReflectionException {
    private static final long serialVersionUID = -7034897190745766944L;

    public NoSuchClassException(String str) {
        super(str);
    }

    public NoSuchClassException(String str, Throwable th) {
        super(str, th);
    }

    public NoSuchClassException(Throwable th) {
        super(th);
    }
}
