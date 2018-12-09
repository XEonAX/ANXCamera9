package android.support.test.internal.util;

final /* synthetic */ class LogUtil$$Lambda$1 implements Supplier {
    private final String arg$1;

    LogUtil$$Lambda$1(String str) {
        this.arg$1 = str;
    }

    public Object get() {
        return LogUtil.lambda$logDebugWithProcess$1$LogUtil(this.arg$1);
    }
}
