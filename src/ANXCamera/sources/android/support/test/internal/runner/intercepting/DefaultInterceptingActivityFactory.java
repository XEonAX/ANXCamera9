package android.support.test.internal.runner.intercepting;

import android.app.Activity;
import android.content.Intent;
import android.support.test.runner.intercepting.InterceptingActivityFactory;

public final class DefaultInterceptingActivityFactory implements InterceptingActivityFactory {
    public boolean shouldIntercept(ClassLoader classLoader, String str, Intent intent) {
        return false;
    }

    public Activity create(ClassLoader classLoader, String str, Intent intent) {
        throw new UnsupportedOperationException();
    }
}
