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
    private Writer bi;
    final ThreadPoolExecutor bj = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), new a());
    private final Callable<Void> bk = new Callable<Void>() {
        /* JADX WARNING: Missing block: B:11:0x0027, code:
            return null;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public Void call() throws Exception {
            synchronized (a.this) {
                if (a.this.bi == null) {
                    return null;
                }
                a.this.trimToSize();
                if (a.this.journalRebuildRequired()) {
                    a.this.rebuildJournal();
                    a.this.redundantOpCount = 0;
                }
            }
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
        private final c bm;
        private boolean bn;
        private final boolean[] written;

        /* synthetic */ b(a aVar, c cVar, AnonymousClass1 anonymousClass1) {
            this(cVar);
        }

        private b(c cVar) {
            this.bm = cVar;
            this.written = cVar.readable ? null : new boolean[a.this.valueCount];
        }

        private InputStream e(int i) throws IOException {
            synchronized (a.this) {
                if (this.bm.bo != this) {
                    throw new IllegalStateException();
                } else if (this.bm.readable) {
                    try {
                        InputStream fileInputStream = new FileInputStream(this.bm.g(i));
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
                if (this.bm.bo == this) {
                    if (!this.bm.readable) {
                        this.written[i] = true;
                    }
                    h = this.bm.h(i);
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
            this.bn = true;
        }

        public void abort() throws IOException {
            a.this.a(this, false);
        }

        public void abortUnlessCommitted() {
            if (!this.bn) {
                try {
                    abort();
                } catch (IOException e) {
                }
            }
        }
    }

    /* compiled from: DiskLruCache */
    private final class c {
        private b bo;
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
        private final File[] bp;
        private final String key;
        private final long[] lengths;
        private final long sequenceNumber;

        /* synthetic */ d(a aVar, String str, long j, File[] fileArr, long[] jArr, AnonymousClass1 anonymousClass1) {
            this(str, j, fileArr, jArr);
        }

        private d(String str, long j, File[] fileArr, long[] jArr) {
            this.key = str;
            this.sequenceNumber = j;
            this.bp = fileArr;
            this.lengths = jArr;
        }

        public b L() throws IOException {
            return a.this.a(this.key, this.sequenceNumber);
        }

        public File f(int i) {
            return this.bp[i];
        }

        public String getString(int i) throws IOException {
            return a.inputStreamToString(new FileInputStream(this.bp[i]));
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
                this.bi = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
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
                cVar.bo = null;
                cVar.setLengths(split);
            } else if (indexOf2 == -1 && indexOf == DIRTY.length() && str.startsWith(DIRTY)) {
                cVar.bo = new b(this, cVar, null);
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
            if (cVar.bo == null) {
                while (i < this.valueCount) {
                    this.size += cVar.lengths[i];
                    i++;
                }
            } else {
                cVar.bo = null;
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
        if (this.bi != null) {
            this.bi.close();
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
                if (cVar.bo != null) {
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
            this.bi = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
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
        this.bi.append(READ);
        this.bi.append(' ');
        this.bi.append(str);
        this.bi.append(10);
        if (journalRebuildRequired()) {
            this.bj.submit(this.bk);
        }
        return new d(this, str, cVar.sequenceNumber, cVar.cleanFiles, cVar.lengths, null);
    }

    public b f(String str) throws IOException {
        return a(str, -1);
    }

    /* JADX WARNING: Missing block: B:9:0x001e, code:
            return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized b a(String str, long j) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        if (j == -1 || (cVar != null && cVar.sequenceNumber == j)) {
            if (cVar == null) {
                cVar = new c(this, str, null);
                this.lruEntries.put(str, cVar);
            } else if (cVar.bo != null) {
                return null;
            }
            b bVar = new b(this, cVar, null);
            cVar.bo = bVar;
            this.bi.append(DIRTY);
            this.bi.append(' ');
            this.bi.append(str);
            this.bi.append(10);
            this.bi.flush();
            return bVar;
        }
    }

    public File getDirectory() {
        return this.directory;
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public synchronized void setMaxSize(long j) {
        this.maxSize = j;
        this.bj.submit(this.bk);
    }

    public synchronized long size() {
        return this.size;
    }

    /* JADX WARNING: Missing block: B:43:0x0107, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized void a(b bVar, boolean z) throws IOException {
        c a = bVar.bm;
        if (a.bo == bVar) {
            int i = 0;
            if (z && !a.readable) {
                int i2 = 0;
                while (i2 < this.valueCount) {
                    if (!bVar.written[i2]) {
                        bVar.abort();
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Newly created entry didn't create value for index ");
                        stringBuilder.append(i2);
                        throw new IllegalStateException(stringBuilder.toString());
                    } else if (a.h(i2).exists()) {
                        i2++;
                    } else {
                        bVar.abort();
                        return;
                    }
                }
            }
            while (i < this.valueCount) {
                File h = a.h(i);
                if (!z) {
                    c(h);
                } else if (h.exists()) {
                    File g = a.g(i);
                    h.renameTo(g);
                    long j = a.lengths[i];
                    long length = g.length();
                    a.lengths[i] = length;
                    this.size = (this.size - j) + length;
                }
                i++;
            }
            this.redundantOpCount++;
            a.bo = null;
            if ((a.readable | z) != 0) {
                a.readable = true;
                this.bi.append(CLEAN);
                this.bi.append(' ');
                this.bi.append(a.key);
                this.bi.append(a.K());
                this.bi.append(10);
                if (z) {
                    long j2 = this.nextSequenceNumber;
                    this.nextSequenceNumber = 1 + j2;
                    a.sequenceNumber = j2;
                }
            } else {
                this.lruEntries.remove(a.key);
                this.bi.append(REMOVE);
                this.bi.append(' ');
                this.bi.append(a.key);
                this.bi.append(10);
            }
            this.bi.flush();
            if (this.size > this.maxSize || journalRebuildRequired()) {
                this.bj.submit(this.bk);
            }
        } else {
            throw new IllegalStateException();
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean remove(String str) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        int i = 0;
        if (cVar != null && cVar.bo == null) {
            while (i < this.valueCount) {
                File g = cVar.g(i);
                if (!g.exists() || g.delete()) {
                    this.size -= cVar.lengths[i];
                    cVar.lengths[i] = 0;
                    i++;
                } else {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("failed to delete ");
                    stringBuilder.append(g);
                    throw new IOException(stringBuilder.toString());
                }
            }
            this.redundantOpCount++;
            this.bi.append(REMOVE);
            this.bi.append(' ');
            this.bi.append(str);
            this.bi.append(10);
            this.lruEntries.remove(str);
            if (journalRebuildRequired()) {
                this.bj.submit(this.bk);
            }
        }
    }

    public synchronized boolean isClosed() {
        return this.bi == null;
    }

    private void checkNotClosed() {
        if (this.bi == null) {
            throw new IllegalStateException("cache is closed");
        }
    }

    public synchronized void flush() throws IOException {
        checkNotClosed();
        trimToSize();
        this.bi.flush();
    }

    public synchronized void close() throws IOException {
        if (this.bi != null) {
            Iterator it = new ArrayList(this.lruEntries.values()).iterator();
            while (it.hasNext()) {
                c cVar = (c) it.next();
                if (cVar.bo != null) {
                    cVar.bo.abort();
                }
            }
            trimToSize();
            this.bi.close();
            this.bi = null;
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
