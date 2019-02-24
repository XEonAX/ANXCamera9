package miui.reflect;

public class ReflectionException extends RuntimeException {
    private static final long serialVersionUID = -7034897190745766941L;

    public ReflectionException(String str) {
        super(str);
    }

    public ReflectionException(String str, Throwable th) {
        super(str, th);
    }

    public ReflectionException(Throwable th) {
        super(th);
    }
}
