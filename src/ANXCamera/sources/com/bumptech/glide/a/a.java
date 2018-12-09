package com.bumptech.glide.a;

import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* compiled from: DiskLruCache */
public final class a implements Closeable {
    static final long ANY_SEQUENCE_NUMBER = -1;
    private static final String CLEAN = "CLEAN";
    private static final String DIRTY = "DIRTY";
    static final String JOURNAL_FILE = "journal";
    static final String JOURNAL_FILE_BACKUP = "journal.bkp";
    static final String JOURNAL_FILE_TEMP = "journal.tmp";
    static final String MAGIC = "libcore.io.DiskLruCache";
    private static final String READ = "READ";
    private static final String REMOVE = "REMOVE";
    static final String VERSION_1 = "1";
    private final int appVersion;
    private Writer bh;
    final ThreadPoolExecutor bi = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), new a());
    private final Callable<Void> bj = new Callable<Void>() {
        /* JADX WARNING: Missing block: B:11:0x0027, code:
            return null;
     */
        public java.lang.Void call() throws java.lang.Exception {
            /*
            r4 = this;
            r0 = com.bumptech.glide.a.a.this;
            monitor-enter(r0);
            r1 = com.bumptech.glide.a.a.this;	 Catch:{ all -> 0x0028 }
            r1 = r1.bh;	 Catch:{ all -> 0x0028 }
            r2 = 0;
            if (r1 != 0) goto L_0x000e;
        L_0x000c:
            monitor-exit(r0);	 Catch:{ all -> 0x0028 }
            return r2;
        L_0x000e:
            r1 = com.bumptech.glide.a.a.this;	 Catch:{ all -> 0x0028 }
            r1.trimToSize();	 Catch:{ all -> 0x0028 }
            r1 = com.bumptech.glide.a.a.this;	 Catch:{ all -> 0x0028 }
            r1 = r1.journalRebuildRequired();	 Catch:{ all -> 0x0028 }
            if (r1 == 0) goto L_0x0026;
        L_0x001b:
            r1 = com.bumptech.glide.a.a.this;	 Catch:{ all -> 0x0028 }
            r1.rebuildJournal();	 Catch:{ all -> 0x0028 }
            r1 = com.bumptech.glide.a.a.this;	 Catch:{ all -> 0x0028 }
            r3 = 0;
            r1.redundantOpCount = r3;	 Catch:{ all -> 0x0028 }
        L_0x0026:
            monitor-exit(r0);	 Catch:{ all -> 0x0028 }
            return r2;
        L_0x0028:
            r1 = move-exception;
            monitor-exit(r0);	 Catch:{ all -> 0x0028 }
            throw r1;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.a.a.1.call():java.lang.Void");
        }
    };
    private final File directory;
    private final File journalFile;
    private final File journalFileBackup;
    private final File journalFileTmp;
    private final LinkedHashMap<String, c> lruEntries = new LinkedHashMap(0, 0.75f, true);
    private long maxSize;
    private long nextSequenceNumber = 0;
    private int redundantOpCount;
    private long size = 0;
    private final int valueCount;

    /* compiled from: DiskLruCache */
    private static final class a implements ThreadFactory {
        private a() {
        }

        /* synthetic */ a(AnonymousClass1 anonymousClass1) {
            this();
        }

        public synchronized Thread newThread(Runnable runnable) {
            Thread thread;
            thread = new Thread(runnable, "glide-disk-lru-cache-thread");
            thread.setPriority(1);
            return thread;
        }
    }

    /* compiled from: DiskLruCache */
    public final class b {
        private final c bl;
        private boolean bm;
        private final boolean[] written;

        /* synthetic */ b(a aVar, c cVar, AnonymousClass1 anonymousClass1) {
            this(cVar);
        }

        private b(c cVar) {
            this.bl = cVar;
            this.written = cVar.readable ? null : new boolean[a.this.valueCount];
        }

        private InputStream e(int i) throws IOException {
            synchronized (a.this) {
                if (this.bl.bn != this) {
                    throw new IllegalStateException();
                } else if (this.bl.readable) {
                    try {
                        InputStream fileInputStream = new FileInputStream(this.bl.g(i));
                        return fileInputStream;
                    } catch (FileNotFoundException e) {
                        return null;
                    }
                } else {
                    return null;
                }
            }
        }

        public String getString(int i) throws IOException {
            InputStream e = e(i);
            return e != null ? a.inputStreamToString(e) : null;
        }

        public File f(int i) throws IOException {
            File h;
            synchronized (a.this) {
                if (this.bl.bn == this) {
                    if (!this.bl.readable) {
                        this.written[i] = true;
                    }
                    h = this.bl.h(i);
                    if (!a.this.directory.exists()) {
                        a.this.directory.mkdirs();
                    }
                } else {
                    throw new IllegalStateException();
                }
            }
            return h;
        }

        public void set(int i, String str) throws IOException {
            Throwable th;
            Closeable closeable = null;
            try {
                Closeable outputStreamWriter = new OutputStreamWriter(new FileOutputStream(f(i)), c.UTF_8);
                try {
                    outputStreamWriter.write(str);
                    c.closeQuietly(outputStreamWriter);
                } catch (Throwable th2) {
                    th = th2;
                    closeable = outputStreamWriter;
                    c.closeQuietly(closeable);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                c.closeQuietly(closeable);
                throw th;
            }
        }

        public void commit() throws IOException {
            a.this.a(this, true);
            this.bm = true;
        }

        public void abort() throws IOException {
            a.this.a(this, false);
        }

        public void abortUnlessCommitted() {
            if (!this.bm) {
                try {
                    abort();
                } catch (IOException e) {
                }
            }
        }
    }

    /* compiled from: DiskLruCache */
    private final class c {
        private b bn;
        File[] cleanFiles;
        File[] dirtyFiles;
        private final String key;
        private final long[] lengths;
        private boolean readable;
        private long sequenceNumber;

        /* synthetic */ c(a aVar, String str, AnonymousClass1 anonymousClass1) {
            this(str);
        }

        private c(String str) {
            this.key = str;
            this.lengths = new long[a.this.valueCount];
            this.cleanFiles = new File[a.this.valueCount];
            this.dirtyFiles = new File[a.this.valueCount];
            StringBuilder stringBuilder = new StringBuilder(str);
            stringBuilder.append('.');
            int length = stringBuilder.length();
            for (int i = 0; i < a.this.valueCount; i++) {
                stringBuilder.append(i);
                this.cleanFiles[i] = new File(a.this.directory, stringBuilder.toString());
                stringBuilder.append(".tmp");
                this.dirtyFiles[i] = new File(a.this.directory, stringBuilder.toString());
                stringBuilder.setLength(length);
            }
        }

        public String K() throws IOException {
            StringBuilder stringBuilder = new StringBuilder();
            for (long j : this.lengths) {
                stringBuilder.append(' ');
                stringBuilder.append(j);
            }
            return stringBuilder.toString();
        }

        private void setLengths(String[] strArr) throws IOException {
            if (strArr.length == a.this.valueCount) {
                int i = 0;
                while (i < strArr.length) {
                    try {
                        this.lengths[i] = Long.parseLong(strArr[i]);
                        i++;
                    } catch (NumberFormatException e) {
                        throw invalidLengths(strArr);
                    }
                }
                return;
            }
            throw invalidLengths(strArr);
        }

        private IOException invalidLengths(String[] strArr) throws IOException {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("unexpected journal line: ");
            stringBuilder.append(Arrays.toString(strArr));
            throw new IOException(stringBuilder.toString());
        }

        public File g(int i) {
            return this.cleanFiles[i];
        }

        public File h(int i) {
            return this.dirtyFiles[i];
        }
    }

    /* compiled from: DiskLruCache */
    public final class d {
        private final File[] bo;
        private final String key;
        private final long[] lengths;
        private final long sequenceNumber;

        /* synthetic */ d(a aVar, String str, long j, File[] fileArr, long[] jArr, AnonymousClass1 anonymousClass1) {
            this(str, j, fileArr, jArr);
        }

        private d(String str, long j, File[] fileArr, long[] jArr) {
            this.key = str;
            this.sequenceNumber = j;
            this.bo = fileArr;
            this.lengths = jArr;
        }

        public b L() throws IOException {
            return a.this.a(this.key, this.sequenceNumber);
        }

        public File f(int i) {
            return this.bo[i];
        }

        public String getString(int i) throws IOException {
            return a.inputStreamToString(new FileInputStream(this.bo[i]));
        }

        public long getLength(int i) {
            return this.lengths[i];
        }
    }

    private a(File file, int i, int i2, long j) {
        File file2 = file;
        this.directory = file2;
        this.appVersion = i;
        this.journalFile = new File(file2, JOURNAL_FILE);
        this.journalFileTmp = new File(file2, JOURNAL_FILE_TEMP);
        this.journalFileBackup = new File(file2, JOURNAL_FILE_BACKUP);
        this.valueCount = i2;
        this.maxSize = j;
    }

    public static a a(File file, int i, int i2, long j) throws IOException {
        if (j <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        } else if (i2 > 0) {
            File file2 = new File(file, JOURNAL_FILE_BACKUP);
            if (file2.exists()) {
                File file3 = new File(file, JOURNAL_FILE);
                if (file3.exists()) {
                    file2.delete();
                } else {
                    a(file2, file3, false);
                }
            }
            a aVar = new a(file, i, i2, j);
            if (aVar.journalFile.exists()) {
                try {
                    aVar.readJournal();
                    aVar.processJournal();
                    return aVar;
                } catch (IOException e) {
                    PrintStream printStream = System.out;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("DiskLruCache ");
                    stringBuilder.append(file);
                    stringBuilder.append(" is corrupt: ");
                    stringBuilder.append(e.getMessage());
                    stringBuilder.append(", removing");
                    printStream.println(stringBuilder.toString());
                    aVar.delete();
                }
            }
            file.mkdirs();
            aVar = new a(file, i, i2, j);
            aVar.rebuildJournal();
            return aVar;
        } else {
            throw new IllegalArgumentException("valueCount <= 0");
        }
    }

    private void readJournal() throws IOException {
        Closeable bVar = new b(new FileInputStream(this.journalFile), c.US_ASCII);
        int i;
        try {
            String readLine = bVar.readLine();
            String readLine2 = bVar.readLine();
            String readLine3 = bVar.readLine();
            String readLine4 = bVar.readLine();
            String readLine5 = bVar.readLine();
            if (MAGIC.equals(readLine) && "1".equals(readLine2) && Integer.toString(this.appVersion).equals(readLine3) && Integer.toString(this.valueCount).equals(readLine4) && "".equals(readLine5)) {
                i = 0;
                while (true) {
                    readJournalLine(bVar.readLine());
                    i++;
                }
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected journal header: [");
                stringBuilder.append(readLine);
                stringBuilder.append(", ");
                stringBuilder.append(readLine2);
                stringBuilder.append(", ");
                stringBuilder.append(readLine4);
                stringBuilder.append(", ");
                stringBuilder.append(readLine5);
                stringBuilder.append("]");
                throw new IOException(stringBuilder.toString());
            }
        } catch (EOFException e) {
            this.redundantOpCount = i - this.lruEntries.size();
            if (bVar.M()) {
                rebuildJournal();
            } else {
                this.bh = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
            }
            c.closeQuietly(bVar);
        } catch (Throwable th) {
            c.closeQuietly(bVar);
        }
    }

    private void readJournalLine(String str) throws IOException {
        int indexOf = str.indexOf(32);
        StringBuilder stringBuilder;
        if (indexOf != -1) {
            String substring;
            int i = indexOf + 1;
            int indexOf2 = str.indexOf(32, i);
            if (indexOf2 == -1) {
                substring = str.substring(i);
                if (indexOf == REMOVE.length() && str.startsWith(REMOVE)) {
                    this.lruEntries.remove(substring);
                    return;
                }
            }
            substring = str.substring(i, indexOf2);
            c cVar = (c) this.lruEntries.get(substring);
            if (cVar == null) {
                cVar = new c(this, substring, null);
                this.lruEntries.put(substring, cVar);
            }
            if (indexOf2 != -1 && indexOf == CLEAN.length() && str.startsWith(CLEAN)) {
                String[] split = str.substring(indexOf2 + 1).split(" ");
                cVar.readable = true;
                cVar.bn = null;
                cVar.setLengths(split);
            } else if (indexOf2 == -1 && indexOf == DIRTY.length() && str.startsWith(DIRTY)) {
                cVar.bn = new b(this, cVar, null);
            } else if (!(indexOf2 == -1 && indexOf == READ.length() && str.startsWith(READ))) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected journal line: ");
                stringBuilder.append(str);
                throw new IOException(stringBuilder.toString());
            }
            return;
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected journal line: ");
        stringBuilder.append(str);
        throw new IOException(stringBuilder.toString());
    }

    private void processJournal() throws IOException {
        c(this.journalFileTmp);
        Iterator it = this.lruEntries.values().iterator();
        while (it.hasNext()) {
            c cVar = (c) it.next();
            int i = 0;
            if (cVar.bn == null) {
                while (i < this.valueCount) {
                    this.size += cVar.lengths[i];
                    i++;
                }
            } else {
                cVar.bn = null;
                while (i < this.valueCount) {
                    c(cVar.g(i));
                    c(cVar.h(i));
                    i++;
                }
                it.remove();
            }
        }
    }

    private synchronized void rebuildJournal() throws IOException {
        if (this.bh != null) {
            this.bh.close();
        }
        Writer bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFileTmp), c.US_ASCII));
        try {
            bufferedWriter.write(MAGIC);
            bufferedWriter.write("\n");
            bufferedWriter.write("1");
            bufferedWriter.write("\n");
            bufferedWriter.write(Integer.toString(this.appVersion));
            bufferedWriter.write("\n");
            bufferedWriter.write(Integer.toString(this.valueCount));
            bufferedWriter.write("\n");
            bufferedWriter.write("\n");
            for (c cVar : this.lruEntries.values()) {
                StringBuilder stringBuilder;
                if (cVar.bn != null) {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("DIRTY ");
                    stringBuilder.append(cVar.key);
                    stringBuilder.append(10);
                    bufferedWriter.write(stringBuilder.toString());
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("CLEAN ");
                    stringBuilder.append(cVar.key);
                    stringBuilder.append(cVar.K());
                    stringBuilder.append(10);
                    bufferedWriter.write(stringBuilder.toString());
                }
            }
            if (this.journalFile.exists()) {
                a(this.journalFile, this.journalFileBackup, true);
            }
            a(this.journalFileTmp, this.journalFile, false);
            this.journalFileBackup.delete();
            this.bh = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
        } finally {
            bufferedWriter.close();
        }
    }

    private static void c(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    private static void a(File file, File file2, boolean z) throws IOException {
        if (z) {
            c(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }

    public synchronized d c(String str) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        if (cVar == null) {
            return null;
        }
        if (!cVar.readable) {
            return null;
        }
        for (File exists : cVar.cleanFiles) {
            if (!exists.exists()) {
                return null;
            }
        }
        this.redundantOpCount++;
        this.bh.append(READ);
        this.bh.append(' ');
        this.bh.append(str);
        this.bh.append(10);
        if (journalRebuildRequired()) {
            this.bi.submit(this.bj);
        }
        return new d(this, str, cVar.sequenceNumber, cVar.cleanFiles, cVar.lengths, null);
    }

    public b f(String str) throws IOException {
        return a(str, -1);
    }

    /* JADX WARNING: Missing block: B:9:0x001e, code:
            return null;
     */
    private synchronized com.bumptech.glide.a.a.b a(java.lang.String r6, long r7) throws java.io.IOException {
        /*
        r5 = this;
        monitor-enter(r5);
        r5.checkNotClosed();	 Catch:{ all -> 0x005d }
        r0 = r5.lruEntries;	 Catch:{ all -> 0x005d }
        r0 = r0.get(r6);	 Catch:{ all -> 0x005d }
        r0 = (com.bumptech.glide.a.a.c) r0;	 Catch:{ all -> 0x005d }
        r1 = -1;
        r1 = (r7 > r1 ? 1 : (r7 == r1 ? 0 : -1));
        r2 = 0;
        if (r1 == 0) goto L_0x001f;
    L_0x0013:
        if (r0 == 0) goto L_0x001d;
    L_0x0015:
        r3 = r0.sequenceNumber;	 Catch:{ all -> 0x005d }
        r7 = (r3 > r7 ? 1 : (r3 == r7 ? 0 : -1));
        if (r7 == 0) goto L_0x001f;
    L_0x001d:
        monitor-exit(r5);
        return r2;
    L_0x001f:
        if (r0 != 0) goto L_0x002c;
    L_0x0021:
        r0 = new com.bumptech.glide.a.a$c;	 Catch:{ all -> 0x005d }
        r0.<init>(r5, r6, r2);	 Catch:{ all -> 0x005d }
        r7 = r5.lruEntries;	 Catch:{ all -> 0x005d }
        r7.put(r6, r0);	 Catch:{ all -> 0x005d }
        goto L_0x0034;
    L_0x002c:
        r7 = r0.bn;	 Catch:{ all -> 0x005d }
        if (r7 == 0) goto L_0x0034;
    L_0x0032:
        monitor-exit(r5);
        return r2;
    L_0x0034:
        r7 = new com.bumptech.glide.a.a$b;	 Catch:{ all -> 0x005d }
        r7.<init>(r5, r0, r2);	 Catch:{ all -> 0x005d }
        r0.bn = r7;	 Catch:{ all -> 0x005d }
        r8 = r5.bh;	 Catch:{ all -> 0x005d }
        r0 = "DIRTY";
        r8.append(r0);	 Catch:{ all -> 0x005d }
        r8 = r5.bh;	 Catch:{ all -> 0x005d }
        r0 = 32;
        r8.append(r0);	 Catch:{ all -> 0x005d }
        r8 = r5.bh;	 Catch:{ all -> 0x005d }
        r8.append(r6);	 Catch:{ all -> 0x005d }
        r6 = r5.bh;	 Catch:{ all -> 0x005d }
        r8 = 10;
        r6.append(r8);	 Catch:{ all -> 0x005d }
        r6 = r5.bh;	 Catch:{ all -> 0x005d }
        r6.flush();	 Catch:{ all -> 0x005d }
        monitor-exit(r5);
        return r7;
    L_0x005d:
        r6 = move-exception;
        monitor-exit(r5);
        throw r6;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.a.a.a(java.lang.String, long):com.bumptech.glide.a.a$b");
    }

    public File getDirectory() {
        return this.directory;
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public synchronized void setMaxSize(long j) {
        this.maxSize = j;
        this.bi.submit(this.bj);
    }

    public synchronized long size() {
        return this.size;
    }

    /* JADX WARNING: Missing block: B:43:0x0107, code:
            return;
     */
    private synchronized void a(com.bumptech.glide.a.a.b r10, boolean r11) throws java.io.IOException {
        /*
        r9 = this;
        monitor-enter(r9);
        r0 = r10.bl;	 Catch:{ all -> 0x010e }
        r1 = r0.bn;	 Catch:{ all -> 0x010e }
        if (r1 != r10) goto L_0x0108;
    L_0x000b:
        r1 = 0;
        if (r11 == 0) goto L_0x004d;
    L_0x000e:
        r2 = r0.readable;	 Catch:{ all -> 0x010e }
        if (r2 != 0) goto L_0x004d;
    L_0x0014:
        r2 = r1;
    L_0x0015:
        r3 = r9.valueCount;	 Catch:{ all -> 0x010e }
        if (r2 >= r3) goto L_0x004d;
    L_0x0019:
        r3 = r10.written;	 Catch:{ all -> 0x010e }
        r3 = r3[r2];	 Catch:{ all -> 0x010e }
        if (r3 == 0) goto L_0x0033;
    L_0x0021:
        r3 = r0.h(r2);	 Catch:{ all -> 0x010e }
        r3 = r3.exists();	 Catch:{ all -> 0x010e }
        if (r3 != 0) goto L_0x0030;
    L_0x002b:
        r10.abort();	 Catch:{ all -> 0x010e }
        monitor-exit(r9);
        return;
    L_0x0030:
        r2 = r2 + 1;
        goto L_0x0015;
    L_0x0033:
        r10.abort();	 Catch:{ all -> 0x010e }
        r10 = new java.lang.IllegalStateException;	 Catch:{ all -> 0x010e }
        r11 = new java.lang.StringBuilder;	 Catch:{ all -> 0x010e }
        r11.<init>();	 Catch:{ all -> 0x010e }
        r0 = "Newly created entry didn't create value for index ";
        r11.append(r0);	 Catch:{ all -> 0x010e }
        r11.append(r2);	 Catch:{ all -> 0x010e }
        r11 = r11.toString();	 Catch:{ all -> 0x010e }
        r10.<init>(r11);	 Catch:{ all -> 0x010e }
        throw r10;	 Catch:{ all -> 0x010e }
    L_0x004d:
        r10 = r9.valueCount;	 Catch:{ all -> 0x010e }
        if (r1 >= r10) goto L_0x0081;
    L_0x0051:
        r10 = r0.h(r1);	 Catch:{ all -> 0x010e }
        if (r11 == 0) goto L_0x007b;
    L_0x0057:
        r2 = r10.exists();	 Catch:{ all -> 0x010e }
        if (r2 == 0) goto L_0x007e;
    L_0x005d:
        r2 = r0.g(r1);	 Catch:{ all -> 0x010e }
        r10.renameTo(r2);	 Catch:{ all -> 0x010e }
        r10 = r0.lengths;	 Catch:{ all -> 0x010e }
        r3 = r10[r1];	 Catch:{ all -> 0x010e }
        r5 = r2.length();	 Catch:{ all -> 0x010e }
        r10 = r0.lengths;	 Catch:{ all -> 0x010e }
        r10[r1] = r5;	 Catch:{ all -> 0x010e }
        r7 = r9.size;	 Catch:{ all -> 0x010e }
        r7 = r7 - r3;
        r7 = r7 + r5;
        r9.size = r7;	 Catch:{ all -> 0x010e }
        goto L_0x007e;
    L_0x007b:
        c(r10);	 Catch:{ all -> 0x010e }
    L_0x007e:
        r1 = r1 + 1;
        goto L_0x004d;
    L_0x0081:
        r10 = r9.redundantOpCount;	 Catch:{ all -> 0x010e }
        r1 = 1;
        r10 = r10 + r1;
        r9.redundantOpCount = r10;	 Catch:{ all -> 0x010e }
        r10 = 0;
        r0.bn = r10;	 Catch:{ all -> 0x010e }
        r10 = r0.readable;	 Catch:{ all -> 0x010e }
        r10 = r10 | r11;
        r2 = 10;
        r3 = 32;
        if (r10 == 0) goto L_0x00c9;
    L_0x0096:
        r0.readable = r1;	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r1 = "CLEAN";
        r10.append(r1);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r10.append(r3);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r1 = r0.key;	 Catch:{ all -> 0x010e }
        r10.append(r1);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r1 = r0.K();	 Catch:{ all -> 0x010e }
        r10.append(r1);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r10.append(r2);	 Catch:{ all -> 0x010e }
        if (r11 == 0) goto L_0x00ec;
    L_0x00be:
        r10 = r9.nextSequenceNumber;	 Catch:{ all -> 0x010e }
        r1 = 1;
        r1 = r1 + r10;
        r9.nextSequenceNumber = r1;	 Catch:{ all -> 0x010e }
        r0.sequenceNumber = r10;	 Catch:{ all -> 0x010e }
        goto L_0x00ec;
    L_0x00c9:
        r10 = r9.lruEntries;	 Catch:{ all -> 0x010e }
        r11 = r0.key;	 Catch:{ all -> 0x010e }
        r10.remove(r11);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r11 = "REMOVE";
        r10.append(r11);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r10.append(r3);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r11 = r0.key;	 Catch:{ all -> 0x010e }
        r10.append(r11);	 Catch:{ all -> 0x010e }
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r10.append(r2);	 Catch:{ all -> 0x010e }
    L_0x00ec:
        r10 = r9.bh;	 Catch:{ all -> 0x010e }
        r10.flush();	 Catch:{ all -> 0x010e }
        r10 = r9.size;	 Catch:{ all -> 0x010e }
        r0 = r9.maxSize;	 Catch:{ all -> 0x010e }
        r10 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1));
        if (r10 > 0) goto L_0x00ff;
    L_0x00f9:
        r10 = r9.journalRebuildRequired();	 Catch:{ all -> 0x010e }
        if (r10 == 0) goto L_0x0106;
    L_0x00ff:
        r10 = r9.bi;	 Catch:{ all -> 0x010e }
        r11 = r9.bj;	 Catch:{ all -> 0x010e }
        r10.submit(r11);	 Catch:{ all -> 0x010e }
    L_0x0106:
        monitor-exit(r9);
        return;
    L_0x0108:
        r10 = new java.lang.IllegalStateException;	 Catch:{ all -> 0x010e }
        r10.<init>();	 Catch:{ all -> 0x010e }
        throw r10;	 Catch:{ all -> 0x010e }
    L_0x010e:
        r10 = move-exception;
        monitor-exit(r9);
        throw r10;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.a.a.a(com.bumptech.glide.a.a$b, boolean):void");
    }

    private boolean journalRebuildRequired() {
        return this.redundantOpCount >= 2000 && this.redundantOpCount >= this.lruEntries.size();
    }

    /* JADX WARNING: Missing block: B:19:0x008c, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:21:0x008e, code:
            return false;
     */
    public synchronized boolean remove(java.lang.String r7) throws java.io.IOException {
        /*
        r6 = this;
        monitor-enter(r6);
        r6.checkNotClosed();	 Catch:{ all -> 0x008f }
        r0 = r6.lruEntries;	 Catch:{ all -> 0x008f }
        r0 = r0.get(r7);	 Catch:{ all -> 0x008f }
        r0 = (com.bumptech.glide.a.a.c) r0;	 Catch:{ all -> 0x008f }
        r1 = 0;
        if (r0 == 0) goto L_0x008d;
    L_0x000f:
        r2 = r0.bn;	 Catch:{ all -> 0x008f }
        if (r2 == 0) goto L_0x0017;
    L_0x0015:
        goto L_0x008d;
    L_0x0017:
        r2 = r6.valueCount;	 Catch:{ all -> 0x008f }
        if (r1 >= r2) goto L_0x0059;
    L_0x001b:
        r2 = r0.g(r1);	 Catch:{ all -> 0x008f }
        r3 = r2.exists();	 Catch:{ all -> 0x008f }
        if (r3 == 0) goto L_0x0043;
    L_0x0025:
        r3 = r2.delete();	 Catch:{ all -> 0x008f }
        if (r3 == 0) goto L_0x002c;
    L_0x002b:
        goto L_0x0043;
    L_0x002c:
        r7 = new java.io.IOException;	 Catch:{ all -> 0x008f }
        r0 = new java.lang.StringBuilder;	 Catch:{ all -> 0x008f }
        r0.<init>();	 Catch:{ all -> 0x008f }
        r1 = "failed to delete ";
        r0.append(r1);	 Catch:{ all -> 0x008f }
        r0.append(r2);	 Catch:{ all -> 0x008f }
        r0 = r0.toString();	 Catch:{ all -> 0x008f }
        r7.<init>(r0);	 Catch:{ all -> 0x008f }
        throw r7;	 Catch:{ all -> 0x008f }
    L_0x0043:
        r2 = r6.size;	 Catch:{ all -> 0x008f }
        r4 = r0.lengths;	 Catch:{ all -> 0x008f }
        r4 = r4[r1];	 Catch:{ all -> 0x008f }
        r2 = r2 - r4;
        r6.size = r2;	 Catch:{ all -> 0x008f }
        r2 = r0.lengths;	 Catch:{ all -> 0x008f }
        r3 = 0;
        r2[r1] = r3;	 Catch:{ all -> 0x008f }
        r1 = r1 + 1;
        goto L_0x0017;
    L_0x0059:
        r0 = r6.redundantOpCount;	 Catch:{ all -> 0x008f }
        r1 = 1;
        r0 = r0 + r1;
        r6.redundantOpCount = r0;	 Catch:{ all -> 0x008f }
        r0 = r6.bh;	 Catch:{ all -> 0x008f }
        r2 = "REMOVE";
        r0.append(r2);	 Catch:{ all -> 0x008f }
        r0 = r6.bh;	 Catch:{ all -> 0x008f }
        r2 = 32;
        r0.append(r2);	 Catch:{ all -> 0x008f }
        r0 = r6.bh;	 Catch:{ all -> 0x008f }
        r0.append(r7);	 Catch:{ all -> 0x008f }
        r0 = r6.bh;	 Catch:{ all -> 0x008f }
        r2 = 10;
        r0.append(r2);	 Catch:{ all -> 0x008f }
        r0 = r6.lruEntries;	 Catch:{ all -> 0x008f }
        r0.remove(r7);	 Catch:{ all -> 0x008f }
        r7 = r6.journalRebuildRequired();	 Catch:{ all -> 0x008f }
        if (r7 == 0) goto L_0x008b;
    L_0x0084:
        r7 = r6.bi;	 Catch:{ all -> 0x008f }
        r0 = r6.bj;	 Catch:{ all -> 0x008f }
        r7.submit(r0);	 Catch:{ all -> 0x008f }
    L_0x008b:
        monitor-exit(r6);
        return r1;
    L_0x008d:
        monitor-exit(r6);
        return r1;
    L_0x008f:
        r7 = move-exception;
        monitor-exit(r6);
        throw r7;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.a.a.remove(java.lang.String):boolean");
    }

    public synchronized boolean isClosed() {
        return this.bh == null;
    }

    private void checkNotClosed() {
        if (this.bh == null) {
            throw new IllegalStateException("cache is closed");
        }
    }

    public synchronized void flush() throws IOException {
        checkNotClosed();
        trimToSize();
        this.bh.flush();
    }

    public synchronized void close() throws IOException {
        if (this.bh != null) {
            Iterator it = new ArrayList(this.lruEntries.values()).iterator();
            while (it.hasNext()) {
                c cVar = (c) it.next();
                if (cVar.bn != null) {
                    cVar.bn.abort();
                }
            }
            trimToSize();
            this.bh.close();
            this.bh = null;
        }
    }

    private void trimToSize() throws IOException {
        while (this.size > this.maxSize) {
            remove((String) ((Entry) this.lruEntries.entrySet().iterator().next()).getKey());
        }
    }

    public void delete() throws IOException {
        close();
        c.deleteContents(this.directory);
    }

    private static String inputStreamToString(InputStream inputStream) throws IOException {
        return c.readFully(new InputStreamReader(inputStream, c.UTF_8));
    }
}
