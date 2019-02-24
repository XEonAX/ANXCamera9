package miui.external;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.IBinder;
import java.lang.reflect.Field;
import miui.external.SdkConstants.SdkError;

final class SdkErrorInstrumentation extends Instrumentation implements SdkConstants {
    private SdkError mError;

    private SdkErrorInstrumentation(SdkError sdkError) {
        this.mError = sdkError;
    }

    static void handleSdkError(SdkError sdkError) {
        try {
            Class cls = Class.forName("android.app.ActivityThread");
            Object invoke = cls.getMethod("currentActivityThread", new Class[0]).invoke(null, new Object[0]);
            Field declaredField = getDeclaredField(cls, invoke, (Instrumentation) cls.getMethod("getInstrumentation", new Class[0]).invoke(invoke, new Object[0]), null, null);
            Instrumentation instrumentation = (Instrumentation) declaredField.get(invoke);
            SdkErrorInstrumentation sdkErrorInstrumentation = new SdkErrorInstrumentation(sdkError);
            for (Class cls2 = Instrumentation.class; cls2 != null; cls2 = cls2.getSuperclass()) {
                for (Field field : cls2.getDeclaredFields()) {
                    field.setAccessible(true);
                    field.set(sdkErrorInstrumentation, field.get(instrumentation));
                }
            }
            declaredField.set(invoke, sdkErrorInstrumentation);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Field getDeclaredField(Class<?> cls, Object obj, Object obj2, String str, Class<?> cls2) throws NoSuchFieldException {
        int length;
        Field[] declaredFields = cls.getDeclaredFields();
        int i = 0;
        if (!(obj == null || obj2 == null)) {
            length = declaredFields.length;
            int i2 = 0;
            while (i2 < length) {
                Field field = declaredFields[i2];
                field.setAccessible(true);
                try {
                    if (field.get(obj) == obj2) {
                        return field;
                    }
                    i2++;
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e2) {
                    e2.printStackTrace();
                }
            }
        }
        if (str != null) {
            for (Field field2 : declaredFields) {
                if (field2.getName().equals(str)) {
                    field2.setAccessible(true);
                    return field2;
                }
            }
        }
        Field field3 = null;
        if (cls2 == null) {
            int length2 = declaredFields.length;
            while (i < length2) {
                Field field4 = declaredFields[i];
                if (field4.getType() == cls2 || field4.getType().isInstance(cls2)) {
                    if (field3 == null) {
                        field3 = field4;
                    } else {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("More than one matched field found: ");
                        stringBuilder.append(field3.getName());
                        stringBuilder.append(" and ");
                        stringBuilder.append(field4.getName());
                        throw new NoSuchFieldException(stringBuilder.toString());
                    }
                }
                i++;
            }
            if (field3 != null) {
                field3.setAccessible(true);
            } else {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("No such field found of value ");
                stringBuilder2.append(obj2);
                throw new NoSuchFieldException(stringBuilder2.toString());
            }
        }
        return field3;
    }

    public Activity newActivity(Class<?> cls, Context context, IBinder iBinder, Application application, Intent intent, ActivityInfo activityInfo, CharSequence charSequence, Activity activity, String str, Object obj) throws InstantiationException, IllegalAccessException {
        Instrumentation instrumentation;
        Class cls2;
        Intent intent2;
        if (cls.getSimpleName().startsWith("SdkError")) {
            instrumentation = this;
            cls2 = cls;
            intent2 = intent;
        } else {
            Intent intent3;
            Class cls3 = SdkErrorActivity.class;
            if (intent == null) {
                intent3 = new Intent();
            } else {
                intent3 = intent;
            }
            instrumentation = this;
            intent3.putExtra(SdkError.INTENT_EXTRA_KEY, instrumentation.mError);
            cls2 = cls3;
            intent2 = intent3;
        }
        return super.newActivity(cls2, context, iBinder, application, intent2, activityInfo, charSequence, activity, str, obj);
    }

    public Activity newActivity(ClassLoader classLoader, String str, Intent intent) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!str.startsWith("SdkError")) {
            str = SdkErrorActivity.class.getName();
            if (intent == null) {
                intent = new Intent();
            }
            intent.putExtra(SdkError.INTENT_EXTRA_KEY, this.mError);
        }
        return super.newActivity(classLoader, str, intent);
    }
}
