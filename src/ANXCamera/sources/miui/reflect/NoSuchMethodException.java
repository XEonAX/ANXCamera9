package miui.reflect;

public class NoSuchMethodException extends ReflectionException {
    private static final long serialVersionUID = -7034897190745766942L;

    public NoSuchMethodException(String str) {
        super(str);
    }

    public NoSuchMethodException(String str, Throwable th) {
        super(str, th);
    }

    public NoSuchMethodException(Throwable th) {
        super(th);
    }
}
