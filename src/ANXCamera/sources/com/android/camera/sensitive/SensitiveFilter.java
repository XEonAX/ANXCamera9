package com.android.camera.sensitive;

import android.util.Base64;
import com.android.camera.log.Log;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.NavigableSet;
import java.util.zip.ZipException;
import miui.util.IOUtils;

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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private SensitiveFilter() {
        InputStream byteArrayInputStream;
        InputStreamReader inputStreamReader;
        InputStream inputStream;
        Throwable e;
        InputStream inputStream2;
        Throwable th;
        BufferedReader bufferedReader = null;
        try {
            InputStream fileInputStream;
            File file = new File(CLOUD_FILE_PATH);
            if (file.exists()) {
                fileInputStream = new FileInputStream(file);
            } else {
                fileInputStream = getClass().getResourceAsStream("/assets/sensi/sensi_words.txt");
            }
            try {
                byteArrayInputStream = new ByteArrayInputStream(new String(Base64.decode(IOUtils.toString(fileInputStream), 0)).getBytes());
            } catch (Throwable e2) {
                inputStreamReader = null;
                inputStream = fileInputStream;
                e = e2;
                byteArrayInputStream = inputStreamReader;
                try {
                    Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (byteArrayInputStream != null) {
                    }
                    if (inputStream != null) {
                    }
                } catch (Throwable th2) {
                    e = th2;
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (byteArrayInputStream != null) {
                    }
                    if (inputStream != null) {
                    }
                    throw e;
                }
            } catch (Throwable e22) {
                inputStreamReader = null;
                inputStream = fileInputStream;
                e = e22;
                byteArrayInputStream = inputStreamReader;
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (byteArrayInputStream != null) {
                }
                if (inputStream != null) {
                }
                throw e;
            }
            try {
                inputStreamReader = new InputStreamReader(byteArrayInputStream, StandardCharsets.UTF_8);
                try {
                    BufferedReader bufferedReader2 = new BufferedReader(inputStreamReader);
                    try {
                        String readLine = bufferedReader2.readLine();
                        while (readLine != null) {
                            readLine = bufferedReader2.readLine();
                            put(readLine);
                        }
                        bufferedReader2.close();
                        inputStreamReader.close();
                        byteArrayInputStream.close();
                        fileInputStream.close();
                    } catch (Throwable e3) {
                        inputStream2 = fileInputStream;
                        e = e3;
                        bufferedReader = bufferedReader2;
                        inputStream = inputStream2;
                        Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                        if (bufferedReader != null) {
                            bufferedReader.close();
                        }
                        if (inputStreamReader != null) {
                            inputStreamReader.close();
                        }
                        if (byteArrayInputStream != null) {
                            byteArrayInputStream.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                            return;
                        }
                        return;
                    } catch (Throwable e32) {
                        inputStream2 = fileInputStream;
                        e = e32;
                        bufferedReader = bufferedReader2;
                        inputStream = inputStream2;
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (Throwable e322) {
                                Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor finally", e322);
                                throw e;
                            }
                        }
                        if (inputStreamReader != null) {
                            inputStreamReader.close();
                        }
                        if (byteArrayInputStream != null) {
                            byteArrayInputStream.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                        }
                        throw e;
                    }
                    try {
                        bufferedReader2.close();
                        inputStreamReader.close();
                        byteArrayInputStream.close();
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                    } catch (Throwable e3222) {
                        Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor finally", e3222);
                    }
                } catch (Throwable e4) {
                    th = e4;
                    inputStream = fileInputStream;
                    e = th;
                    Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (byteArrayInputStream != null) {
                    }
                    if (inputStream != null) {
                    }
                } catch (Throwable e42) {
                    th = e42;
                    inputStream = fileInputStream;
                    e = th;
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (byteArrayInputStream != null) {
                    }
                    if (inputStream != null) {
                    }
                    throw e;
                }
            } catch (Throwable e5) {
                inputStream = fileInputStream;
                e = e5;
                inputStreamReader = null;
                Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (byteArrayInputStream != null) {
                }
                if (inputStream != null) {
                }
            } catch (Throwable e52) {
                inputStream = fileInputStream;
                e = e52;
                inputStreamReader = null;
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (byteArrayInputStream != null) {
                }
                if (inputStream != null) {
                }
                throw e;
            }
        } catch (IOException e6) {
            e = e6;
            byteArrayInputStream = null;
            inputStreamReader = byteArrayInputStream;
            inputStream = inputStreamReader;
            Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
            if (bufferedReader != null) {
            }
            if (inputStreamReader != null) {
            }
            if (byteArrayInputStream != null) {
            }
            if (inputStream != null) {
            }
        } catch (Throwable th3) {
            e = th3;
            byteArrayInputStream = null;
            inputStreamReader = byteArrayInputStream;
            inputStream = inputStreamReader;
            if (bufferedReader != null) {
            }
            if (inputStreamReader != null) {
            }
            if (byteArrayInputStream != null) {
            }
            if (inputStream != null) {
            }
            throw e;
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean loadSensitiveWords(String str, String str2) {
        FileOutputStream fileOutputStream;
        Throwable th;
        boolean z = false;
        InputStream inputStream = null;
        HttpURLConnection httpURLConnection;
        FileOutputStream fileOutputStream2;
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setConnectTimeout(20000);
                httpURLConnection.setReadTimeout(20000);
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setDoOutput(false);
                httpURLConnection.connect();
                if (httpURLConnection.getResponseCode() == 200) {
                    InputStream inputStream2 = httpURLConnection.getInputStream();
                    try {
                        File file = new File(str2, "sensi_words");
                        if (!file.exists()) {
                            file.createNewFile();
                        }
                        fileOutputStream2 = new FileOutputStream(file);
                        while (true) {
                            try {
                                int read = inputStream2.read();
                                if (read == -1) {
                                    break;
                                }
                                fileOutputStream2.write(read);
                            } catch (MalformedURLException e) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e2) {
                                    }
                                }
                                if (fileOutputStream2 != null) {
                                    fileOutputStream2.close();
                                }
                                return z;
                            } catch (ZipException e3) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e4) {
                                    }
                                }
                                if (fileOutputStream2 != null) {
                                    fileOutputStream2.close();
                                }
                                return z;
                            } catch (Exception e5) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e6) {
                                    }
                                }
                                if (fileOutputStream2 != null) {
                                    fileOutputStream2.close();
                                }
                                return z;
                            } catch (Throwable th2) {
                                inputStream = inputStream2;
                                Throwable th3 = th2;
                                fileOutputStream = fileOutputStream2;
                                th = th3;
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e7) {
                                    }
                                }
                                if (fileOutputStream != null) {
                                    try {
                                        fileOutputStream.close();
                                    } catch (IOException e8) {
                                    }
                                }
                                throw th;
                            }
                        }
                        inputStream2.close();
                        fileOutputStream2.close();
                        z = true;
                        inputStream = inputStream2;
                    } catch (MalformedURLException e9) {
                        fileOutputStream2 = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                        }
                        if (inputStream != null) {
                        }
                        if (fileOutputStream2 != null) {
                        }
                        return z;
                    } catch (ZipException e10) {
                        fileOutputStream2 = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                        }
                        if (inputStream != null) {
                        }
                        if (fileOutputStream2 != null) {
                        }
                        return z;
                    } catch (Exception e11) {
                        fileOutputStream2 = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                        }
                        if (inputStream != null) {
                        }
                        if (fileOutputStream2 != null) {
                        }
                        return z;
                    } catch (Throwable th4) {
                        th = th4;
                        fileOutputStream = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                        }
                        if (inputStream != null) {
                        }
                        if (fileOutputStream != null) {
                        }
                        throw th;
                    }
                }
                fileOutputStream2 = null;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e12) {
                    }
                }
                if (fileOutputStream2 != null) {
                    try {
                        fileOutputStream2.close();
                    } catch (IOException e13) {
                    }
                }
            } catch (MalformedURLException e14) {
                fileOutputStream2 = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream2 != null) {
                }
                return z;
            } catch (ZipException e15) {
                fileOutputStream2 = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream2 != null) {
                }
                return z;
            } catch (Exception e16) {
                fileOutputStream2 = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream2 != null) {
                }
                return z;
            } catch (Throwable th5) {
                th = th5;
                fileOutputStream = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                throw th;
            }
        } catch (MalformedURLException e17) {
            httpURLConnection = null;
            fileOutputStream2 = httpURLConnection;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream2 != null) {
            }
            return z;
        } catch (ZipException e18) {
            httpURLConnection = null;
            fileOutputStream2 = httpURLConnection;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream2 != null) {
            }
            return z;
        } catch (Exception e19) {
            httpURLConnection = null;
            fileOutputStream2 = httpURLConnection;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream2 != null) {
            }
            return z;
        } catch (Throwable th6) {
            th = th6;
            httpURLConnection = null;
            fileOutputStream = httpURLConnection;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream != null) {
            }
            throw th;
        }
        return z;
    }
}
