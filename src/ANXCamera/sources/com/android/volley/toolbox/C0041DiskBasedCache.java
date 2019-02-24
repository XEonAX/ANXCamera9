package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0003Cache;
import com.android.volley.C0032VolleyLog;
import com.android.volley.Cache.C0002Entry;
import com.android.volley.toolbox.DiskBasedCache.C0039CacheHeader;
import com.android.volley.toolbox.DiskBasedCache.C0040CountingInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/* renamed from: com.android.volley.toolbox.DiskBasedCache */
public class C0041DiskBasedCache implements C0003Cache {
    private static final int CACHE_MAGIC = 538183203;
    private static final int DEFAULT_DISK_USAGE_BYTES = 5242880;
    private static final float HYSTERESIS_FACTOR = 0.9f;
    private final Map<String, C0039CacheHeader> mEntries;
    private final int mMaxCacheSizeInBytes;
    private final File mRootDirectory;
    private long mTotalSize;

    public C0041DiskBasedCache(File rootDirectory, int maxCacheSizeInBytes) {
        this.mEntries = new LinkedHashMap(16, 0.75f, true);
        this.mTotalSize = 0;
        this.mRootDirectory = rootDirectory;
        this.mMaxCacheSizeInBytes = maxCacheSizeInBytes;
    }

    public C0041DiskBasedCache(File rootDirectory) {
        this(rootDirectory, 5242880);
    }

    public synchronized void clear() {
        File[] files = this.mRootDirectory.listFiles();
        if (files != null) {
            for (File file : files) {
                file.delete();
            }
        }
        this.mEntries.clear();
        this.mTotalSize = 0;
        C0032VolleyLog.d("Cache cleared.", new Object[0]);
    }

    public synchronized C0002Entry get(String key) {
        C0039CacheHeader entry = (C0039CacheHeader) this.mEntries.get(key);
        if (entry == null) {
            return null;
        }
        File file = getFileForKey(key);
        C0040CountingInputStream cis = null;
        try {
            cis = new C0040CountingInputStream(new FileInputStream(file), null);
            C0039CacheHeader.readHeader(cis);
            C0002Entry toCacheEntry = entry.toCacheEntry(C0041DiskBasedCache.streamToBytes(cis, (int) (file.length() - ((long) C0040CountingInputStream.access$100(cis)))));
            try {
                cis.close();
                return toCacheEntry;
            } catch (IOException e) {
            }
        } catch (IOException e2) {
            try {
                C0032VolleyLog.d("%s: %s", file.getAbsolutePath(), e2.toString());
                remove(key);
                if (cis != null) {
                    cis.close();
                }
                return null;
            } catch (Throwable th) {
                if (cis != null) {
                    try {
                        cis.close();
                    } catch (IOException e3) {
                    }
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:8:0x0023, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void initialize() {
        int i$ = 0;
        if (this.mRootDirectory.exists()) {
            File[] files = this.mRootDirectory.listFiles();
            if (files != null) {
                File[] arr$ = files;
                int len$ = arr$.length;
                while (i$ < len$) {
                    File file = arr$[i$];
                    FileInputStream fis = null;
                    try {
                        fis = new FileInputStream(file);
                        C0039CacheHeader entry = C0039CacheHeader.readHeader(fis);
                        entry.size = file.length();
                        putEntry(entry.key, entry);
                        try {
                            fis.close();
                        } catch (IOException e) {
                        }
                    } catch (IOException e2) {
                        if (file != null) {
                            try {
                                file.delete();
                            } catch (Throwable th) {
                                if (fis != null) {
                                    try {
                                        fis.close();
                                    } catch (IOException e3) {
                                    }
                                }
                            }
                        }
                        if (fis != null) {
                            fis.close();
                        }
                    }
                    i$++;
                }
                return;
            }
            return;
        } else if (!this.mRootDirectory.mkdirs()) {
            C0032VolleyLog.e("Unable to create cache dir %s", this.mRootDirectory.getAbsolutePath());
        }
    }

    public synchronized void invalidate(String key, boolean fullExpire) {
        C0002Entry entry = get(key);
        if (entry != null) {
            entry.softTtl = 0;
            if (fullExpire) {
                entry.ttl = 0;
            }
            put(key, entry);
        }
    }

    public synchronized void put(String key, C0002Entry entry) {
        pruneIfNeeded(entry.data.length);
        File file = getFileForKey(key);
        try {
            FileOutputStream fos = new FileOutputStream(file);
            C0039CacheHeader e = new C0039CacheHeader(key, entry);
            if (e.writeHeader(fos)) {
                fos.write(entry.data);
                fos.close();
                putEntry(key, e);
            } else {
                fos.close();
                C0032VolleyLog.d("Failed to write header for %s", file.getAbsolutePath());
                throw new IOException();
            }
        } catch (IOException e2) {
            if (!file.delete()) {
                C0032VolleyLog.d("Could not clean up file %s", file.getAbsolutePath());
            }
        }
    }

    public synchronized void remove(String key) {
        boolean deleted = getFileForKey(key).delete();
        removeEntry(key);
        if (!deleted) {
            C0032VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", key, getFilenameForKey(key));
        }
    }

    private String getFilenameForKey(String key) {
        int firstHalfLength = key.length() / 2;
        String localFilename = String.valueOf(key.substring(0, firstHalfLength).hashCode());
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(localFilename);
        stringBuilder.append(String.valueOf(key.substring(firstHalfLength).hashCode()));
        return stringBuilder.toString();
    }

    public File getFileForKey(String key) {
        return new File(this.mRootDirectory, getFilenameForKey(key));
    }

    private void pruneIfNeeded(int neededSpace) {
        int i = neededSpace;
        if (this.mTotalSize + ((long) i) >= ((long) this.mMaxCacheSizeInBytes)) {
            long before;
            if (C0032VolleyLog.DEBUG) {
                C0032VolleyLog.v("Pruning old cache entries.", new Object[0]);
            }
            long before2 = this.mTotalSize;
            int prunedFiles = 0;
            long startTime = SystemClock.elapsedRealtime();
            Iterator<Entry<String, C0039CacheHeader>> iterator = this.mEntries.entrySet().iterator();
            while (iterator.hasNext()) {
                C0039CacheHeader e = (C0039CacheHeader) ((Entry) iterator.next()).getValue();
                if (getFileForKey(e.key).delete()) {
                    before = before2;
                    this.mTotalSize -= e.size;
                } else {
                    before = before2;
                    C0032VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", e.key, getFilenameForKey(e.key));
                }
                iterator.remove();
                prunedFiles++;
                if (((float) (this.mTotalSize + ((long) i))) < ((float) this.mMaxCacheSizeInBytes) * 0.9f) {
                    break;
                }
                before2 = before;
            }
            before = before2;
            if (C0032VolleyLog.DEBUG) {
                C0032VolleyLog.v("pruned %d files, %d bytes, %d ms", Integer.valueOf(prunedFiles), Long.valueOf(this.mTotalSize - before), Long.valueOf(SystemClock.elapsedRealtime() - startTime));
            }
        }
    }

    private void putEntry(String key, C0039CacheHeader entry) {
        if (this.mEntries.containsKey(key)) {
            this.mTotalSize += entry.size - ((C0039CacheHeader) this.mEntries.get(key)).size;
        } else {
            this.mTotalSize += entry.size;
        }
        this.mEntries.put(key, entry);
    }

    private void removeEntry(String key) {
        C0039CacheHeader entry = (C0039CacheHeader) this.mEntries.get(key);
        if (entry != null) {
            this.mTotalSize -= entry.size;
            this.mEntries.remove(key);
        }
    }

    private static byte[] streamToBytes(InputStream in, int length) throws IOException {
        byte[] bytes = new byte[length];
        int pos = 0;
        while (pos < length) {
            int read = in.read(bytes, pos, length - pos);
            int count = read;
            if (read == -1) {
                break;
            }
            pos += count;
        }
        if (pos == length) {
            return bytes;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Expected ");
        stringBuilder.append(length);
        stringBuilder.append(" bytes, read ");
        stringBuilder.append(pos);
        stringBuilder.append(" bytes");
        throw new IOException(stringBuilder.toString());
    }

    private static int read(InputStream is) throws IOException {
        int b = is.read();
        if (b != -1) {
            return b;
        }
        throw new EOFException();
    }

    static void writeInt(OutputStream os, int n) throws IOException {
        os.write((n >> 0) & 255);
        os.write((n >> 8) & 255);
        os.write((n >> 16) & 255);
        os.write((n >> 24) & 255);
    }

    static int readInt(InputStream is) throws IOException {
        return (((0 | (C0041DiskBasedCache.read(is) << 0)) | (C0041DiskBasedCache.read(is) << 8)) | (C0041DiskBasedCache.read(is) << 16)) | (C0041DiskBasedCache.read(is) << 24);
    }

    static void writeLong(OutputStream os, long n) throws IOException {
        os.write((byte) ((int) (n >>> null)));
        os.write((byte) ((int) (n >>> 8)));
        os.write((byte) ((int) (n >>> 16)));
        os.write((byte) ((int) (n >>> 24)));
        os.write((byte) ((int) (n >>> 32)));
        os.write((byte) ((int) (n >>> 40)));
        os.write((byte) ((int) (n >>> 48)));
        os.write((byte) ((int) (n >>> 56)));
    }

    static long readLong(InputStream is) throws IOException {
        return (((((((0 | ((((long) C0041DiskBasedCache.read(is)) & 255) << null)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 8)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 16)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 24)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 32)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 40)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 48)) | ((((long) C0041DiskBasedCache.read(is)) & 255) << 56);
    }

    static void writeString(OutputStream os, String s) throws IOException {
        byte[] b = s.getBytes("UTF-8");
        C0041DiskBasedCache.writeLong(os, (long) b.length);
        os.write(b, 0, b.length);
    }

    static String readString(InputStream is) throws IOException {
        return new String(C0041DiskBasedCache.streamToBytes(is, (int) C0041DiskBasedCache.readLong(is)), "UTF-8");
    }

    static void writeStringStringMap(Map<String, String> map, OutputStream os) throws IOException {
        if (map != null) {
            C0041DiskBasedCache.writeInt(os, map.size());
            for (Entry<String, String> entry : map.entrySet()) {
                C0041DiskBasedCache.writeString(os, (String) entry.getKey());
                C0041DiskBasedCache.writeString(os, (String) entry.getValue());
            }
            return;
        }
        C0041DiskBasedCache.writeInt(os, 0);
    }

    static Map<String, String> readStringStringMap(InputStream is) throws IOException {
        int size = C0041DiskBasedCache.readInt(is);
        Map<String, String> result = size == 0 ? Collections.emptyMap() : new HashMap(size);
        for (int i = 0; i < size; i++) {
            result.put(C0041DiskBasedCache.readString(is).intern(), C0041DiskBasedCache.readString(is).intern());
        }
        return result;
    }
}
