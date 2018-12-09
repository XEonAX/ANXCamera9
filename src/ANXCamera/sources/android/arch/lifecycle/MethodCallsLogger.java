package android.arch.lifecycle;

import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.util.HashMap;
import java.util.Map;

@RestrictTo({Scope.LIBRARY_GROUP})
public class MethodCallsLogger {
    private Map<String, Integer> mCalledMethods = new HashMap();

    @RestrictTo({Scope.LIBRARY_GROUP})
    public boolean approveCall(String str, int i) {
        int intValue;
        Integer num = (Integer) this.mCalledMethods.get(str);
        int i2 = 0;
        if (num != null) {
            intValue = num.intValue();
        } else {
            intValue = 0;
        }
        if ((intValue & i) != 0) {
            i2 = 1;
        }
        this.mCalledMethods.put(str, Integer.valueOf(i | intValue));
        return i2 ^ 1;
    }
}
