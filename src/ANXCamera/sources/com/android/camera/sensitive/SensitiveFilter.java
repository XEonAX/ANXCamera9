package com.android.camera.sensitive;

import java.io.Serializable;
import java.util.NavigableSet;

public class SensitiveFilter implements Serializable {
    public static final String CLOUD_FILE_PATH = "/data/data/com.android.camera/sensi_words";
    static final int DEFAULT_INITIAL_CAPACITY = 8388608;
    public static final String LOCAL_FILE_PATH = "/data/data/com.android.camera/";
    private static SensitiveFilter sensitiveFilter = null;
    private static final long serialVersionUID = 1;
    protected SensitiveNode[] nodes = new SensitiveNode[DEFAULT_INITIAL_CAPACITY];

    /* JADX WARNING: Removed duplicated region for block: B:44:0x00bc A:{SYNTHETIC, Splitter: B:44:0x00bc} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c4 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c9 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:70:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00ce A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00e0 A:{SYNTHETIC, Splitter: B:56:0x00e0} */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x00e8 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x00ed A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00f2 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00bc A:{SYNTHETIC, Splitter: B:44:0x00bc} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c4 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c9 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00ce A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:70:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00e0 A:{SYNTHETIC, Splitter: B:56:0x00e0} */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x00e8 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x00ed A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00f2 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00e0 A:{SYNTHETIC, Splitter: B:56:0x00e0} */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x00e8 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x00ed A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00f2 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00bc A:{SYNTHETIC, Splitter: B:44:0x00bc} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c4 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c9 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:70:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00ce A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00e0 A:{SYNTHETIC, Splitter: B:56:0x00e0} */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x00e8 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x00ed A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00f2 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00bc A:{SYNTHETIC, Splitter: B:44:0x00bc} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c4 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c9 A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00ce A:{Catch:{ IOException -> 0x00c0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:70:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00e0 A:{SYNTHETIC, Splitter: B:56:0x00e0} */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x00e8 A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x00ed A:{Catch:{ IOException -> 0x00e4 }} */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00f2 A:{Catch:{ IOException -> 0x00e4 }} */
    private SensitiveFilter() {
        /*
        r8 = this;
        r8.<init>();
        r0 = 8388608; // 0x800000 float:1.17549435E-38 double:4.144523E-317;
        r0 = new com.android.camera.sensitive.SensitiveNode[r0];
        r8.nodes = r0;
        r0 = 0;
        r1 = new java.io.File;	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        r2 = "/data/data/com.android.camera/sensi_words";
        r1.<init>(r2);	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        r2 = r1.exists();	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        if (r2 == 0) goto L_0x0022;
    L_0x001b:
        r2 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        r2.<init>(r1);	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        r1 = r2;
        goto L_0x002c;
    L_0x0022:
        r1 = r8.getClass();	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
        r2 = "/assets/sensi/sensi_words.txt";
        r1 = r1.getResourceAsStream(r2);	 Catch:{ IOException -> 0x00af, all -> 0x00aa }
    L_0x002c:
        r2 = miui.util.IOUtils.toString(r1);	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r3 = new java.lang.String;	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r4 = 0;
        r2 = android.util.Base64.decode(r2, r4);	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r3.<init>(r2);	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r2 = new java.io.ByteArrayInputStream;	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r3 = r3.getBytes();	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r2.<init>(r3);	 Catch:{ IOException -> 0x00a4, all -> 0x009e }
        r3 = new java.io.InputStreamReader;	 Catch:{ IOException -> 0x0099, all -> 0x0094 }
        r4 = java.nio.charset.StandardCharsets.UTF_8;	 Catch:{ IOException -> 0x0099, all -> 0x0094 }
        r3.<init>(r2, r4);	 Catch:{ IOException -> 0x0099, all -> 0x0094 }
        r4 = new java.io.BufferedReader;	 Catch:{ IOException -> 0x008f, all -> 0x0089 }
        r4.<init>(r3);	 Catch:{ IOException -> 0x008f, all -> 0x0089 }
        r0 = r4.readLine();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
    L_0x0053:
        if (r0 == 0) goto L_0x005d;
    L_0x0055:
        r0 = r4.readLine();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        r8.put(r0);	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        goto L_0x0053;
    L_0x005d:
        r4.close();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        r3.close();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        r2.close();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        r1.close();	 Catch:{ IOException -> 0x0083, all -> 0x007c }
        r4.close();	 Catch:{ IOException -> 0x00c0 }
        r3.close();	 Catch:{ IOException -> 0x00c0 }
        r2.close();	 Catch:{ IOException -> 0x00c0 }
        if (r1 == 0) goto L_0x00db;
    L_0x0077:
        r1.close();	 Catch:{ IOException -> 0x00c0 }
        goto L_0x00db;
    L_0x007c:
        r0 = move-exception;
        r7 = r1;
        r1 = r0;
        r0 = r4;
        r4 = r7;
        goto L_0x00de;
    L_0x0083:
        r0 = move-exception;
        r7 = r1;
        r1 = r0;
        r0 = r4;
        r4 = r7;
        goto L_0x00b3;
    L_0x0089:
        r4 = move-exception;
        r7 = r4;
        r4 = r1;
        r1 = r7;
        goto L_0x00de;
    L_0x008f:
        r4 = move-exception;
        r7 = r4;
        r4 = r1;
        r1 = r7;
        goto L_0x00b3;
    L_0x0094:
        r3 = move-exception;
        r4 = r1;
        r1 = r3;
        r3 = r0;
        goto L_0x00de;
    L_0x0099:
        r3 = move-exception;
        r4 = r1;
        r1 = r3;
        r3 = r0;
        goto L_0x00b3;
    L_0x009e:
        r2 = move-exception;
        r3 = r0;
        r4 = r1;
        r1 = r2;
        r2 = r3;
        goto L_0x00de;
    L_0x00a4:
        r2 = move-exception;
        r3 = r0;
        r4 = r1;
        r1 = r2;
        r2 = r3;
        goto L_0x00b3;
    L_0x00aa:
        r1 = move-exception;
        r2 = r0;
        r3 = r2;
        r4 = r3;
        goto L_0x00de;
    L_0x00af:
        r1 = move-exception;
        r2 = r0;
        r3 = r2;
        r4 = r3;
    L_0x00b3:
        r5 = "SensitiveFilter";
        r6 = "IOException in SensitiveFilter constructor";
        com.android.camera.log.Log.e(r5, r6, r1);	 Catch:{ all -> 0x00dd }
        if (r0 == 0) goto L_0x00c2;
    L_0x00bc:
        r0.close();	 Catch:{ IOException -> 0x00c0 }
        goto L_0x00c2;
    L_0x00c0:
        r0 = move-exception;
        goto L_0x00d2;
    L_0x00c2:
        if (r3 == 0) goto L_0x00c7;
    L_0x00c4:
        r3.close();	 Catch:{ IOException -> 0x00c0 }
    L_0x00c7:
        if (r2 == 0) goto L_0x00cc;
    L_0x00c9:
        r2.close();	 Catch:{ IOException -> 0x00c0 }
    L_0x00cc:
        if (r4 == 0) goto L_0x00db;
    L_0x00ce:
        r4.close();	 Catch:{ IOException -> 0x00c0 }
        goto L_0x00db;
        r1 = "SensitiveFilter";
        r2 = "IOException in SensitiveFilter constructor finally";
        com.android.camera.log.Log.e(r1, r2, r0);
        goto L_0x00dc;
    L_0x00dc:
        return;
    L_0x00dd:
        r1 = move-exception;
    L_0x00de:
        if (r0 == 0) goto L_0x00e6;
    L_0x00e0:
        r0.close();	 Catch:{ IOException -> 0x00e4 }
        goto L_0x00e6;
    L_0x00e4:
        r0 = move-exception;
        goto L_0x00f6;
    L_0x00e6:
        if (r3 == 0) goto L_0x00eb;
    L_0x00e8:
        r3.close();	 Catch:{ IOException -> 0x00e4 }
    L_0x00eb:
        if (r2 == 0) goto L_0x00f0;
    L_0x00ed:
        r2.close();	 Catch:{ IOException -> 0x00e4 }
    L_0x00f0:
        if (r4 == 0) goto L_0x00ff;
    L_0x00f2:
        r4.close();	 Catch:{ IOException -> 0x00e4 }
        goto L_0x00ff;
        r2 = "SensitiveFilter";
        r3 = "IOException in SensitiveFilter constructor finally";
        com.android.camera.log.Log.e(r2, r3, r0);
    L_0x00ff:
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.sensitive.SensitiveFilter.<init>():void");
    }

    public static synchronized SensitiveFilter getInstance() {
        SensitiveFilter sensitiveFilter;
        synchronized (SensitiveFilter.class) {
            if (sensitiveFilter == null) {
                sensitiveFilter = new SensitiveFilter();
            }
            sensitiveFilter = sensitiveFilter;
        }
        return sensitiveFilter;
    }

    public boolean put(String str) {
        if (this.nodes == null || str == null || str.trim().length() < 2) {
            return false;
        }
        StringPointer stringPointer = new StringPointer(str.trim());
        int nextTwoCharHash = stringPointer.nextTwoCharHash(0);
        int nextTwoCharMix = stringPointer.nextTwoCharMix(0);
        nextTwoCharHash &= this.nodes.length - 1;
        SensitiveNode sensitiveNode = this.nodes[nextTwoCharHash];
        if (sensitiveNode == null) {
            sensitiveNode = new SensitiveNode(nextTwoCharMix);
            sensitiveNode.words.add(stringPointer);
            this.nodes[nextTwoCharHash] = sensitiveNode;
        } else {
            while (sensitiveNode != null) {
                if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                    sensitiveNode.words.add(stringPointer);
                    return true;
                } else if (sensitiveNode.next == null) {
                    new SensitiveNode(nextTwoCharMix, sensitiveNode).words.add(stringPointer);
                    return true;
                } else {
                    sensitiveNode = sensitiveNode.next;
                }
            }
        }
        return true;
    }

    public String replaceSensitiveWord(String str, char c) {
        StringPointer stringPointer = new StringPointer(str);
        int i = 0;
        boolean z = false;
        while (true) {
            boolean z2 = true;
            if (i >= stringPointer.length - 1) {
                break;
            }
            int i2;
            SensitiveNode sensitiveNode = this.nodes[stringPointer.nextTwoCharHash(i) & (this.nodes.length - 1)];
            if (sensitiveNode != null) {
                int nextTwoCharMix = stringPointer.nextTwoCharMix(i);
                while (sensitiveNode != null) {
                    if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                        NavigableSet headSet = sensitiveNode.words.headSet(stringPointer.substring(i), true);
                        if (headSet != null) {
                            for (StringPointer stringPointer2 : headSet.descendingSet()) {
                                if (stringPointer.nextStartsWith(i, stringPointer2)) {
                                    stringPointer.fill(i, stringPointer2.length + i, c);
                                    i2 = stringPointer2.length;
                                    break;
                                }
                            }
                            continue;
                        } else {
                            continue;
                        }
                    }
                    sensitiveNode = sensitiveNode.next;
                }
            }
            z2 = z;
            i2 = true;
            i += i2;
            z = z2;
        }
        if (z) {
            return stringPointer.toString();
        }
        return str;
    }

    public String getSensitiveWord(String str) {
        String str2 = "";
        StringPointer stringPointer = new StringPointer(str);
        int i = 0;
        while (true) {
            int i2 = 1;
            if (i >= stringPointer.length - 1) {
                return str2;
            }
            SensitiveNode sensitiveNode = this.nodes[stringPointer.nextTwoCharHash(i) & (this.nodes.length - 1)];
            if (sensitiveNode != null) {
                int nextTwoCharMix = stringPointer.nextTwoCharMix(i);
                while (sensitiveNode != null) {
                    if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                        NavigableSet headSet = sensitiveNode.words.headSet(stringPointer.substring(i), true);
                        if (headSet != null) {
                            for (StringPointer stringPointer2 : headSet.descendingSet()) {
                                if (stringPointer.nextStartsWith(i, stringPointer2)) {
                                    str2 = new String(stringPointer2.value);
                                    i2 = stringPointer2.length;
                                    break;
                                }
                            }
                            continue;
                        } else {
                            continue;
                        }
                    }
                    sensitiveNode = sensitiveNode.next;
                }
            }
            i += i2;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:92:0x00ed  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x00f2 A:{SYNTHETIC, Splitter: B:94:0x00f2} */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x00fb A:{SYNTHETIC, Splitter: B:98:0x00fb} */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x00db A:{SYNTHETIC, Splitter: B:83:0x00db} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00e4 A:{SYNTHETIC, Splitter: B:87:0x00e4} */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00bf  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x00c4 A:{SYNTHETIC, Splitter: B:72:0x00c4} */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00cd A:{SYNTHETIC, Splitter: B:76:0x00cd} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00aa A:{SYNTHETIC, Splitter: B:59:0x00aa} */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00b3 A:{SYNTHETIC, Splitter: B:63:0x00b3} */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x00ed  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x00f2 A:{SYNTHETIC, Splitter: B:94:0x00f2} */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x00fb A:{SYNTHETIC, Splitter: B:98:0x00fb} */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x00db A:{SYNTHETIC, Splitter: B:83:0x00db} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00e4 A:{SYNTHETIC, Splitter: B:87:0x00e4} */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00bf  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x00c4 A:{SYNTHETIC, Splitter: B:72:0x00c4} */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00cd A:{SYNTHETIC, Splitter: B:76:0x00cd} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00aa A:{SYNTHETIC, Splitter: B:59:0x00aa} */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00b3 A:{SYNTHETIC, Splitter: B:63:0x00b3} */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x00ed  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x00f2 A:{SYNTHETIC, Splitter: B:94:0x00f2} */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x00fb A:{SYNTHETIC, Splitter: B:98:0x00fb} */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x00db A:{SYNTHETIC, Splitter: B:83:0x00db} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00e4 A:{SYNTHETIC, Splitter: B:87:0x00e4} */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00bf  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x00c4 A:{SYNTHETIC, Splitter: B:72:0x00c4} */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00cd A:{SYNTHETIC, Splitter: B:76:0x00cd} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00aa A:{SYNTHETIC, Splitter: B:59:0x00aa} */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00b3 A:{SYNTHETIC, Splitter: B:63:0x00b3} */
    public static boolean loadSensitiveWords(java.lang.String r6, java.lang.String r7) {
        /*
        r0 = 0;
        r1 = 0;
        r2 = new java.net.URL;	 Catch:{ MalformedURLException -> 0x00e8, ZipException -> 0x00d1, Exception -> 0x00ba, all -> 0x00a0 }
        r2.<init>(r6);	 Catch:{ MalformedURLException -> 0x00e8, ZipException -> 0x00d1, Exception -> 0x00ba, all -> 0x00a0 }
        r6 = r2.openConnection();	 Catch:{ MalformedURLException -> 0x00e8, ZipException -> 0x00d1, Exception -> 0x00ba, all -> 0x00a0 }
        r6 = (java.net.HttpURLConnection) r6;	 Catch:{ MalformedURLException -> 0x00e8, ZipException -> 0x00d1, Exception -> 0x00ba, all -> 0x00a0 }
        r2 = 20000; // 0x4e20 float:2.8026E-41 double:9.8813E-320;
        r6.setConnectTimeout(r2);	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r6.setReadTimeout(r2);	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r2 = "GET";
        r6.setRequestMethod(r2);	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r6.setDoOutput(r0);	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r6.connect();	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r2 = r6.getResponseCode();	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r3 = 200; // 0xc8 float:2.8E-43 double:9.9E-322;
        if (r2 != r3) goto L_0x007a;
    L_0x002c:
        r2 = r6.getInputStream();	 Catch:{ MalformedURLException -> 0x009d, ZipException -> 0x009a, Exception -> 0x0097, all -> 0x0094 }
        r3 = new java.io.File;	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
        r4 = "sensi_words";
        r3.<init>(r7, r4);	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
        r7 = r3.exists();	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
        if (r7 != 0) goto L_0x0040;
    L_0x003d:
        r3.createNewFile();	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
    L_0x0040:
        r7 = new java.io.FileOutputStream;	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
        r7.<init>(r3);	 Catch:{ MalformedURLException -> 0x0075, ZipException -> 0x0070, Exception -> 0x006b, all -> 0x0067 }
    L_0x0046:
        r1 = r2.read();	 Catch:{ MalformedURLException -> 0x0065, ZipException -> 0x0063, Exception -> 0x0061, all -> 0x005a }
        r3 = -1;
        if (r1 == r3) goto L_0x0051;
    L_0x004d:
        r7.write(r1);	 Catch:{ MalformedURLException -> 0x0065, ZipException -> 0x0063, Exception -> 0x0061, all -> 0x005a }
        goto L_0x0046;
    L_0x0051:
        r2.close();	 Catch:{ MalformedURLException -> 0x0065, ZipException -> 0x0063, Exception -> 0x0061, all -> 0x005a }
        r7.close();	 Catch:{ MalformedURLException -> 0x0065, ZipException -> 0x0063, Exception -> 0x0061, all -> 0x005a }
        r0 = 1;
        r1 = r2;
        goto L_0x007b;
    L_0x005a:
        r0 = move-exception;
        r1 = r2;
        r5 = r0;
        r0 = r7;
        r7 = r5;
        goto L_0x00a3;
    L_0x0061:
        r1 = move-exception;
        goto L_0x006d;
    L_0x0063:
        r1 = move-exception;
        goto L_0x0072;
    L_0x0065:
        r1 = move-exception;
        goto L_0x0077;
    L_0x0067:
        r7 = move-exception;
        r0 = r1;
        r1 = r2;
        goto L_0x00a3;
    L_0x006b:
        r7 = move-exception;
        r7 = r1;
    L_0x006d:
        r1 = r2;
        goto L_0x00bd;
    L_0x0070:
        r7 = move-exception;
        r7 = r1;
    L_0x0072:
        r1 = r2;
        goto L_0x00d4;
    L_0x0075:
        r7 = move-exception;
        r7 = r1;
    L_0x0077:
        r1 = r2;
        goto L_0x00eb;
    L_0x007a:
        r7 = r1;
    L_0x007b:
        if (r6 == 0) goto L_0x0080;
    L_0x007d:
        r6.disconnect();
    L_0x0080:
        if (r1 == 0) goto L_0x0088;
    L_0x0082:
        r1.close();	 Catch:{ IOException -> 0x0086 }
        goto L_0x0088;
    L_0x0086:
        r6 = move-exception;
        goto L_0x0089;
    L_0x0089:
        if (r7 == 0) goto L_0x0092;
    L_0x008b:
        r7.close();	 Catch:{ IOException -> 0x008f }
        goto L_0x0092;
    L_0x008f:
        r6 = move-exception;
        goto L_0x00ff;
    L_0x0092:
        goto L_0x00ff;
    L_0x0094:
        r7 = move-exception;
        r0 = r1;
        goto L_0x00a3;
    L_0x0097:
        r7 = move-exception;
        r7 = r1;
        goto L_0x00bd;
    L_0x009a:
        r7 = move-exception;
        r7 = r1;
        goto L_0x00d4;
    L_0x009d:
        r7 = move-exception;
        r7 = r1;
        goto L_0x00eb;
    L_0x00a0:
        r7 = move-exception;
        r6 = r1;
        r0 = r6;
    L_0x00a3:
        if (r6 == 0) goto L_0x00a8;
    L_0x00a5:
        r6.disconnect();
    L_0x00a8:
        if (r1 == 0) goto L_0x00b0;
    L_0x00aa:
        r1.close();	 Catch:{ IOException -> 0x00ae }
        goto L_0x00b0;
    L_0x00ae:
        r6 = move-exception;
        goto L_0x00b1;
    L_0x00b1:
        if (r0 == 0) goto L_0x00b9;
    L_0x00b3:
        r0.close();	 Catch:{ IOException -> 0x00b7 }
        goto L_0x00b9;
    L_0x00b7:
        r6 = move-exception;
    L_0x00b9:
        throw r7;
    L_0x00ba:
        r6 = move-exception;
        r6 = r1;
        r7 = r6;
    L_0x00bd:
        if (r6 == 0) goto L_0x00c2;
    L_0x00bf:
        r6.disconnect();
    L_0x00c2:
        if (r1 == 0) goto L_0x00ca;
    L_0x00c4:
        r1.close();	 Catch:{ IOException -> 0x00c8 }
        goto L_0x00ca;
    L_0x00c8:
        r6 = move-exception;
        goto L_0x00cb;
    L_0x00cb:
        if (r7 == 0) goto L_0x0092;
    L_0x00cd:
        r7.close();	 Catch:{ IOException -> 0x008f }
        goto L_0x0092;
    L_0x00d1:
        r6 = move-exception;
        r6 = r1;
        r7 = r6;
    L_0x00d4:
        if (r6 == 0) goto L_0x00d9;
    L_0x00d6:
        r6.disconnect();
    L_0x00d9:
        if (r1 == 0) goto L_0x00e1;
    L_0x00db:
        r1.close();	 Catch:{ IOException -> 0x00df }
        goto L_0x00e1;
    L_0x00df:
        r6 = move-exception;
        goto L_0x00e2;
    L_0x00e2:
        if (r7 == 0) goto L_0x0092;
    L_0x00e4:
        r7.close();	 Catch:{ IOException -> 0x008f }
        goto L_0x0092;
    L_0x00e8:
        r6 = move-exception;
        r6 = r1;
        r7 = r6;
    L_0x00eb:
        if (r6 == 0) goto L_0x00f0;
    L_0x00ed:
        r6.disconnect();
    L_0x00f0:
        if (r1 == 0) goto L_0x00f8;
    L_0x00f2:
        r1.close();	 Catch:{ IOException -> 0x00f6 }
        goto L_0x00f8;
    L_0x00f6:
        r6 = move-exception;
        goto L_0x00f9;
    L_0x00f9:
        if (r7 == 0) goto L_0x0092;
    L_0x00fb:
        r7.close();	 Catch:{ IOException -> 0x008f }
        goto L_0x0092;
    L_0x00ff:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.sensitive.SensitiveFilter.loadSensitiveWords(java.lang.String, java.lang.String):boolean");
    }
}
