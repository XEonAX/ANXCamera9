package miui.util;

import java.util.ArrayList;
import java.util.HashMap;

public class FeatureParser {
    private static final String ASSET_DIR = "device_features/";
    private static final String SYSTEM_DIR = "/sdcard/etc/device_features";
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

    /* JADX WARNING: Removed duplicated region for block: B:78:0x01bc A:{ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), PHI: r1 , Splitter: B:1:0x0003} */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x01b3 A:{ExcHandler: all (th java.lang.Throwable), PHI: r1 , Splitter: B:12:0x003d} */
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
    private static void read() {
        /*
        r0 = 0;
        r1 = r0;
        r2 = 0;
        r3 = "cancro";
        r4 = miui.os.Build.DEVICE;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3 = r3.equals(r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r3 == 0) goto L_0x0029;
    L_0x000d:
        r3 = miui.os.Build.MODEL;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = "MI 3";
        r3 = r3.startsWith(r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r3 == 0) goto L_0x001b;
    L_0x0017:
        r3 = "cancro_MI3.xml";
        r2 = r3;
        goto L_0x003d;
    L_0x001b:
        r3 = miui.os.Build.MODEL;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = "MI 4";
        r3 = r3.startsWith(r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r3 == 0) goto L_0x003d;
    L_0x0025:
        r3 = "cancro_MI4.xml";
        r2 = r3;
        goto L_0x003d;
    L_0x0029:
        r3 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3.<init>();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = miui.os.Build.DEVICE;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3.append(r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = ".xml";
        r3.append(r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3 = r3.toString();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r2 = r3;
    L_0x003d:
        r3 = android.content.res.Resources.getSystem();	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3 = r3.getAssets();	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4.<init>();	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = "device_features/";
        r4.append(r5);	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4.append(r2);	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = r4.toString();	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r3 = r3.open(r4);	 Catch:{ IOException -> 0x005c, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r1 = r3;
        goto L_0x0087;
    L_0x005c:
        r3 = move-exception;
        r4 = "FeatureParser";
        r5 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5.<init>();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = "can't find ";
        r5.append(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5.append(r2);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = " in assets/";
        r5.append(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = "device_features/";
        r5.append(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = ",it may be in ";
        r5.append(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = "/system/etc/device_features";
        r5.append(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = r5.toString();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        android.util.Log.i(r4, r5);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
    L_0x0087:
        if (r1 != 0) goto L_0x00bb;
    L_0x0089:
        r3 = new java.io.File;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = "/sdcard/etc/device_features";
        r3.<init>(r4, r2);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = r3.exists();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r4 == 0) goto L_0x009d;
    L_0x0096:
        r4 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4.<init>(r3);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r1 = r4;
        goto L_0x00bb;
    L_0x009d:
        r0 = "FeatureParser";
        r4 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4.<init>();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = "both assets/device_features/ and /system/etc/device_features don't exist ";
        r4.append(r5);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4.append(r2);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = r4.toString();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        android.util.Log.e(r0, r4);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r1 == 0) goto L_0x00ba;
    L_0x00b5:
        r1.close();	 Catch:{ IOException -> 0x00b9 }
        goto L_0x00ba;
    L_0x00b9:
        r0 = move-exception;
    L_0x00ba:
        return;
    L_0x00bb:
        r3 = org.xmlpull.v1.XmlPullParserFactory.newInstance();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r4 = r3.newPullParser();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = "UTF-8";
        r4.setInput(r1, r5);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = r4.getEventType();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = 0;
        r7 = 0;
        r8 = 0;
    L_0x00d0:
        r9 = 1;
        if (r9 == r5) goto L_0x01ab;
    L_0x00d3:
        switch(r5) {
            case 2: goto L_0x00fc;
            case 3: goto L_0x00d8;
            default: goto L_0x00d6;
        };	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
    L_0x00d6:
        goto L_0x01a4;
    L_0x00d8:
        r9 = r4.getName();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = "integer-array";
        r10 = r10.equals(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r10 == 0) goto L_0x00ec;
    L_0x00e4:
        r10 = sIntArrMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10.put(r7, r8);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r8 = 0;
        goto L_0x01a4;
    L_0x00ec:
        r10 = "string-array";
        r10 = r10.equals(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r10 == 0) goto L_0x01a4;
    L_0x00f4:
        r10 = sStrArrMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10.put(r7, r0);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r0 = 0;
        goto L_0x01a4;
    L_0x00fc:
        r9 = r4.getName();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r6 = r9;
        r9 = r4.getAttributeCount();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 <= 0) goto L_0x010d;
    L_0x0107:
        r9 = 0;
        r9 = r4.getAttributeValue(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r7 = r9;
    L_0x010d:
        r9 = "integer-array";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x011d;
    L_0x0115:
        r9 = new java.util.ArrayList;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.<init>();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r8 = r9;
        goto L_0x01a4;
    L_0x011d:
        r9 = "string-array";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x012d;
    L_0x0125:
        r9 = new java.util.ArrayList;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.<init>();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r0 = r9;
        goto L_0x01a4;
    L_0x012d:
        r9 = "bool";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x0143;
    L_0x0135:
        r9 = sBooleanMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = java.lang.Boolean.valueOf(r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.put(r7, r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        goto L_0x01a4;
    L_0x0143:
        r9 = "integer";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x0159;
    L_0x014b:
        r9 = sIntMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = java.lang.Integer.valueOf(r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.put(r7, r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        goto L_0x01a4;
    L_0x0159:
        r9 = "string";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x016b;
    L_0x0161:
        r9 = sStrMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.put(r7, r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        goto L_0x01a4;
    L_0x016b:
        r9 = "float";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x0185;
    L_0x0173:
        r9 = sFloatMap;	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = java.lang.Float.parseFloat(r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r10 = java.lang.Float.valueOf(r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9.put(r7, r10);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        goto L_0x01a4;
    L_0x0185:
        r9 = "item";
        r9 = r9.equals(r6);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        if (r9 == 0) goto L_0x01a4;
    L_0x018d:
        if (r8 == 0) goto L_0x019b;
    L_0x018f:
        r9 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r9 = java.lang.Integer.valueOf(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r8.add(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        goto L_0x01a4;
    L_0x019b:
        if (r0 == 0) goto L_0x01a4;
    L_0x019d:
        r9 = r4.nextText();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r0.add(r9);	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
    L_0x01a4:
        r9 = r4.next();	 Catch:{ IOException -> 0x01c3, XmlPullParserException -> 0x01bc, all -> 0x01b3 }
        r5 = r9;
        goto L_0x00d0;
    L_0x01ab:
        if (r1 == 0) goto L_0x01ca;
    L_0x01ad:
        r1.close();	 Catch:{ IOException -> 0x01b1 }
    L_0x01b0:
        goto L_0x01ca;
    L_0x01b1:
        r0 = move-exception;
        goto L_0x01b0;
    L_0x01b3:
        r0 = move-exception;
        if (r1 == 0) goto L_0x01bb;
    L_0x01b6:
        r1.close();	 Catch:{ IOException -> 0x01ba }
        goto L_0x01bb;
    L_0x01ba:
        r2 = move-exception;
    L_0x01bb:
        throw r0;
    L_0x01bc:
        r0 = move-exception;
        if (r1 == 0) goto L_0x01ca;
    L_0x01bf:
        r1.close();	 Catch:{ IOException -> 0x01b1 }
        goto L_0x01b0;
    L_0x01c3:
        r0 = move-exception;
        if (r1 == 0) goto L_0x01ca;
    L_0x01c6:
        r1.close();	 Catch:{ IOException -> 0x01b1 }
        goto L_0x01b0;
    L_0x01ca:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: miui.util.FeatureParser.read():void");
    }
}
