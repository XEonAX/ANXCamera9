package miui.util;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import miui.os.Build;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class FeatureParser {
    private static final String ASSET_DIR = "device_features/";
    private static final String SYSTEM_DIR = "/system/etc/device_features";
    private static final String TAG = "FeatureParser";
    private static final String TAG_BOOL = "bool";
    private static final String TAG_FLOAT = "float";
    private static final String TAG_INTEGER = "integer";
    private static final String TAG_INTEGER_ARRAY = "integer-array";
    private static final String TAG_ITEM = "item";
    private static final String TAG_STRING = "string";
    private static final String TAG_STRING_ARRAY = "string-array";
    public static final int TYPE_BOOL = 1;
    public static final int TYPE_FLOAT = 6;
    public static final int TYPE_INTEGER = 2;
    public static final int TYPE_INTEGER_ARRAY = 5;
    public static final int TYPE_STRING = 3;
    public static final int TYPE_STRING_ARRAY = 4;
    private static HashMap<String, Boolean> sBooleanMap = new HashMap();
    private static HashMap<String, Float> sFloatMap = new HashMap();
    private static HashMap<String, ArrayList<Integer>> sIntArrMap = new HashMap();
    private static HashMap<String, Integer> sIntMap = new HashMap();
    private static HashMap<String, ArrayList<String>> sStrArrMap = new HashMap();
    private static HashMap<String, String> sStrMap = new HashMap();

    static {
        read();
    }

    public static boolean getBoolean(String name, boolean defaultValue) {
        Boolean value = (Boolean) sBooleanMap.get(name);
        if (value != null) {
            return value.booleanValue();
        }
        return defaultValue;
    }

    public static String getString(String name) {
        return (String) sStrMap.get(name);
    }

    public static int getInteger(String name, int defaultValue) {
        Integer value = (Integer) sIntMap.get(name);
        if (value != null) {
            return value.intValue();
        }
        return defaultValue;
    }

    public static int[] getIntArray(String name) {
        ArrayList<Integer> intList = (ArrayList) sIntArrMap.get(name);
        if (intList == null) {
            return null;
        }
        int length = intList.size();
        int[] intArr = new int[length];
        for (int i = 0; i < length; i++) {
            intArr[i] = ((Integer) intList.get(i)).intValue();
        }
        return intArr;
    }

    public static String[] getStringArray(String name) {
        ArrayList<String> strList = (ArrayList) sStrArrMap.get(name);
        if (strList != null) {
            return (String[]) strList.toArray(new String[0]);
        }
        return null;
    }

    public static Float getFloat(String name, float defaultValue) {
        Float value = (Float) sFloatMap.get(name);
        return Float.valueOf(value != null ? value.floatValue() : defaultValue);
    }

    public static boolean hasFeature(String name, int type) {
        switch (type) {
            case 1:
                return sBooleanMap.containsKey(name);
            case 2:
                return sIntMap.containsKey(name);
            case 3:
                return sStrMap.containsKey(name);
            case 4:
                return sStrArrMap.containsKey(name);
            case 5:
                return sIntArrMap.containsKey(name);
            case 6:
                return sFloatMap.containsKey(name);
            default:
                return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:78:0x01bc A:{Splitter: B:1:0x0003, PHI: r1 , ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException)} */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x01b3 A:{Splitter: B:12:0x003d, PHI: r1 , ExcHandler: all (th java.lang.Throwable)} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:73:0x01b4, code:
            if (r1 != null) goto L_0x01b6;
     */
    /* JADX WARNING: Missing block: B:75:?, code:
            r1.close();
     */
    /* JADX WARNING: Missing block: B:79:0x01bd, code:
            if (r1 != null) goto L_0x01bf;
     */
    /* JADX WARNING: Missing block: B:81:?, code:
            r1.close();
     */
    /* JADX WARNING: Missing block: B:83:0x01c4, code:
            if (r1 != null) goto L_0x01c6;
     */
    /* JADX WARNING: Missing block: B:84:0x01c6, code:
            r1.close();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void read() {
        StringBuilder stringBuilder;
        ArrayList<String> strList = null;
        InputStream inputStream = null;
        String fileName = null;
        try {
            if (!"cancro".equals(Build.DEVICE)) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(Build.DEVICE);
                stringBuilder2.append(".xml");
                fileName = stringBuilder2.toString();
            } else if (Build.MODEL.startsWith("MI 3")) {
                fileName = "cancro_MI3.xml";
            } else if (Build.MODEL.startsWith("MI 4")) {
                fileName = "cancro_MI4.xml";
            }
            AssetManager assets = Resources.getSystem().getAssets();
            stringBuilder = new StringBuilder();
            stringBuilder.append(ASSET_DIR);
            stringBuilder.append(fileName);
            inputStream = assets.open(stringBuilder.toString());
        } catch (IOException e) {
            String str = TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("can't find ");
            stringBuilder3.append(fileName);
            stringBuilder3.append(" in assets/");
            stringBuilder3.append(ASSET_DIR);
            stringBuilder3.append(",it may be in ");
            stringBuilder3.append(SYSTEM_DIR);
            Log.i(str, stringBuilder3.toString());
        } catch (XmlPullParserException e2) {
        } catch (Throwable th) {
        }
        if (inputStream == null) {
            File file = new File(SYSTEM_DIR, fileName);
            if (file.exists()) {
                inputStream = new FileInputStream(file);
            } else {
                String str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("both assets/device_features/ and /system/etc/device_features don't exist ");
                stringBuilder.append(fileName);
                Log.e(str2, stringBuilder.toString());
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e3) {
                    }
                }
                return;
            }
        }
        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
        parser.setInput(inputStream, "UTF-8");
        String keyName = null;
        ArrayList<Integer> intList = null;
        for (int type = parser.getEventType(); 1 != type; type = parser.next()) {
            switch (type) {
                case 2:
                    String tagName = parser.getName();
                    if (parser.getAttributeCount() > 0) {
                        keyName = parser.getAttributeValue(0);
                    }
                    if (!TAG_INTEGER_ARRAY.equals(tagName)) {
                        if (!TAG_STRING_ARRAY.equals(tagName)) {
                            if (!TAG_BOOL.equals(tagName)) {
                                if (!TAG_INTEGER.equals(tagName)) {
                                    if (!TAG_STRING.equals(tagName)) {
                                        if (!TAG_FLOAT.equals(tagName)) {
                                            if (TAG_ITEM.equals(tagName)) {
                                                if (intList == null) {
                                                    if (strList != null) {
                                                        strList.add(parser.nextText());
                                                        break;
                                                    }
                                                }
                                                intList.add(Integer.valueOf(parser.nextText()));
                                                break;
                                            }
                                        }
                                        sFloatMap.put(keyName, Float.valueOf(Float.parseFloat(parser.nextText())));
                                        break;
                                    }
                                    sStrMap.put(keyName, parser.nextText());
                                    break;
                                }
                                sIntMap.put(keyName, Integer.valueOf(parser.nextText()));
                                break;
                            }
                            sBooleanMap.put(keyName, Boolean.valueOf(parser.nextText()));
                            break;
                        }
                        strList = new ArrayList();
                        break;
                    }
                    intList = new ArrayList();
                    break;
                    break;
                case 3:
                    String end_tag_name = parser.getName();
                    if (!TAG_INTEGER_ARRAY.equals(end_tag_name)) {
                        if (TAG_STRING_ARRAY.equals(end_tag_name)) {
                            sStrArrMap.put(keyName, strList);
                            strList = null;
                            break;
                        }
                    }
                    sIntArrMap.put(keyName, intList);
                    intList = null;
                    break;
                    break;
            }
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e4) {
            }
        }
    }
}
