package miui.external;

import android.content.Context;
import android.os.Build.VERSION;
import dalvik.system.BaseDexClassLoader;
import dalvik.system.DexClassLoader;
import dalvik.system.PathClassLoader;
import java.io.File;
import java.lang.reflect.Array;
import java.lang.reflect.Field;

class SdkLoader {
    private static final String DEX_ELEMENTS_FIELD_NAME = "dexElements";
    private static final String DEX_ELEMENT_TYPE_NAME = "dalvik.system.DexPathList$Element";
    private static final String DEX_PATH_LIST_CLASS_NAME = "dalvik.system.DexPathList";
    private static final String LIB_ELEMENTS_FIELD_NAME = "nativeLibraryPathElements";
    private static final String LIB_ELEMENT_TYPE_NAME;

    SdkLoader() {
    }

    static {
        String str;
        if (VERSION.SDK_INT < 26) {
            str = DEX_ELEMENT_TYPE_NAME;
        } else {
            str = "dalvik.system.DexPathList$NativeLibraryElement";
        }
        LIB_ELEMENT_TYPE_NAME = str;
    }

    public static boolean load(String str, String str2, String str3, ClassLoader classLoader) {
        return load(str, str2, str3, classLoader, null);
    }

    static boolean load(String str, String str2, String str3, ClassLoader classLoader, Context context) {
        if (str == null && (str3 == null || context == null)) {
            return false;
        }
        try {
            String str4;
            ClassLoader pathClassLoader;
            Object dexPathListVariable = getDexPathListVariable(classLoader);
            if (str != null) {
                str4 = str;
            } else if (VERSION.SDK_INT < 23) {
                loadLibBeforeAndroidM(dexPathListVariable, str3);
                return true;
            } else {
                str4 = context.getApplicationInfo().sourceDir;
                str2 = null;
            }
            if (str2 == null) {
                pathClassLoader = new PathClassLoader(str4, str3, classLoader.getParent());
            } else {
                pathClassLoader = new DexClassLoader(str4, str2, str3, classLoader.getParent());
            }
            Object dexPathListVariable2 = getDexPathListVariable(pathClassLoader);
            if (str != null) {
                loadDex(dexPathListVariable, dexPathListVariable2);
            }
            if (str3 != null) {
                loadLibrary(dexPathListVariable, dexPathListVariable2, str3);
            }
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        } catch (IllegalAccessException e2) {
            return false;
        } catch (ClassNotFoundException e3) {
            return false;
        } catch (NoSuchFieldException e4) {
            return false;
        }
    }

    private static Object getDexPathListVariable(ClassLoader classLoader) throws NoSuchFieldException {
        if (classLoader instanceof BaseDexClassLoader) {
            Field[] declaredFields = BaseDexClassLoader.class.getDeclaredFields();
            int length = declaredFields.length;
            int i = 0;
            while (i < length) {
                Field field = declaredFields[i];
                if (DEX_PATH_LIST_CLASS_NAME.equals(field.getType().getName())) {
                    field.setAccessible(true);
                    try {
                        return field.get(classLoader);
                    } catch (IllegalArgumentException e) {
                    } catch (IllegalAccessException e2) {
                    }
                } else {
                    i++;
                }
            }
        }
        throw new NoSuchFieldException("dexPathList field not found.");
    }

    private static void loadDex(Object obj, Object obj2) throws NoSuchFieldException, IllegalAccessException, ClassNotFoundException {
        replaceElement(obj, obj2, DEX_ELEMENTS_FIELD_NAME, DEX_ELEMENT_TYPE_NAME);
    }

    private static void loadLibrary(Object obj, Object obj2, String str) throws NoSuchFieldException, IllegalAccessException, ClassNotFoundException {
        if (VERSION.SDK_INT >= 23) {
            replaceElement(obj, obj2, LIB_ELEMENTS_FIELD_NAME, LIB_ELEMENT_TYPE_NAME);
        } else {
            loadLibBeforeAndroidM(obj, str);
        }
    }

    private static void replaceElement(Object obj, Object obj2, String str, String str2) throws NoSuchFieldException, IllegalAccessException, ClassNotFoundException {
        Object[] objArr = (Object[]) getElementsField(obj2, str, str2).get(obj2);
        Field elementsField = getElementsField(obj, str, str2);
        Object[] objArr2 = (Object[]) elementsField.get(obj);
        Object[] objArr3 = (Object[]) Array.newInstance(Class.forName(str2), objArr2.length + 1);
        objArr3[0] = objArr[0];
        System.arraycopy(objArr2, 0, objArr3, 1, objArr2.length);
        elementsField.set(obj, objArr3);
    }

    private static Field getElementsField(Object obj, String str, String str2) throws NoSuchFieldException {
        for (Field field : obj.getClass().getDeclaredFields()) {
            if (field.getName().equals(str)) {
                Class type = field.getType();
                if (type.isArray() && str2.equals(type.getComponentType().getName())) {
                    field.setAccessible(true);
                    return field;
                }
            }
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" field not found.");
        throw new NoSuchFieldException(stringBuilder.toString());
    }

    private static void loadLibBeforeAndroidM(Object obj, String str) throws NoSuchFieldException, IllegalAccessException {
        Field nativeLibraryDirectoriesField = getNativeLibraryDirectoriesField(obj);
        File[] fileArr = (File[]) nativeLibraryDirectoriesField.get(obj);
        Object obj2 = new File[(fileArr.length + 1)];
        obj2[0] = new File(str);
        System.arraycopy(fileArr, 0, obj2, 1, fileArr.length);
        nativeLibraryDirectoriesField.set(obj, obj2);
    }

    private static Field getNativeLibraryDirectoriesField(Object obj) throws NoSuchFieldException {
        for (Field field : obj.getClass().getDeclaredFields()) {
            Class type = field.getType();
            if (type.isArray() && type.getComponentType() == File.class) {
                field.setAccessible(true);
                return field;
            }
        }
        throw new NoSuchFieldException("nativeLibraryDirectories field not found.");
    }
}
