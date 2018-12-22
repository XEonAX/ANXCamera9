package miui.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import miui.util.Pools.Manager;
import miui.util.Pools.Pool;

public class IOUtils {
    private static final int Je = 4096;
    private static final ThreadLocal<SoftReference<byte[]>> Jf = new ThreadLocal();
    private static final ThreadLocal<SoftReference<char[]>> Jg = new ThreadLocal();
    private static final Pool<ByteArrayOutputStream> Jh = Pools.createSoftReferencePool(new Manager<ByteArrayOutputStream>() {
        /* renamed from: dv */
        public ByteArrayOutputStream createInstance() {
            return new ByteArrayOutputStream();
        }

        /* renamed from: a */
        public void onRelease(ByteArrayOutputStream byteArrayOutputStream) {
            byteArrayOutputStream.reset();
        }
    }, 2);
    private static final Pool<CharArrayWriter> Ji = Pools.createSoftReferencePool(new Manager<CharArrayWriter>() {
        /* renamed from: dw */
        public CharArrayWriter createInstance() {
            return new CharArrayWriter();
        }

        /* renamed from: a */
        public void onRelease(CharArrayWriter charArrayWriter) {
            charArrayWriter.reset();
        }
    }, 2);
    private static final Pool<StringWriter> Jj = Pools.createSoftReferencePool(new Manager<StringWriter>() {
        /* renamed from: dx */
        public StringWriter createInstance() {
            return new StringWriter();
        }

        /* renamed from: a */
        public void onRelease(StringWriter stringWriter) {
            stringWriter.getBuffer().setLength(0);
        }
    }, 2);
    private static final String LINE_SEPARATOR;

    static {
        StringWriter stringWriter = (StringWriter) Jj.acquire();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        printWriter.println();
        printWriter.flush();
        LINE_SEPARATOR = stringWriter.toString();
        printWriter.close();
        Jj.release(stringWriter);
    }

    protected IOUtils() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    public static void closeQuietly(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(Writer writer) {
        if (writer != null) {
            try {
                writer.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(InputStream inputStream) {
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(OutputStream outputStream) {
        if (outputStream != null) {
            try {
                outputStream.flush();
            } catch (IOException e) {
            }
            try {
                outputStream.close();
            } catch (IOException e2) {
            }
        }
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static byte[] toByteArray(InputStream inputStream) throws IOException {
        OutputStream outputStream = (ByteArrayOutputStream) Jh.acquire();
        copy(inputStream, outputStream);
        byte[] toByteArray = outputStream.toByteArray();
        Jh.release(outputStream);
        return toByteArray;
    }

    public static byte[] toByteArray(Reader reader) throws IOException {
        OutputStream outputStream = (ByteArrayOutputStream) Jh.acquire();
        copy(reader, outputStream);
        byte[] toByteArray = outputStream.toByteArray();
        Jh.release(outputStream);
        return toByteArray;
    }

    public static byte[] toByteArray(Reader reader, String str) throws IOException {
        OutputStream outputStream = (ByteArrayOutputStream) Jh.acquire();
        copy(reader, outputStream, str);
        byte[] toByteArray = outputStream.toByteArray();
        Jh.release(outputStream);
        return toByteArray;
    }

    public static char[] toCharArray(InputStream inputStream) throws IOException {
        Writer writer = (CharArrayWriter) Ji.acquire();
        copy(inputStream, writer);
        char[] toCharArray = writer.toCharArray();
        Ji.release(writer);
        return toCharArray;
    }

    public static char[] toCharArray(InputStream inputStream, String str) throws IOException {
        Writer writer = (CharArrayWriter) Ji.acquire();
        copy(inputStream, writer, str);
        char[] toCharArray = writer.toCharArray();
        Ji.release(writer);
        return toCharArray;
    }

    public static char[] toCharArray(Reader reader) throws IOException {
        Writer writer = (CharArrayWriter) Ji.acquire();
        copy(reader, writer);
        char[] toCharArray = writer.toCharArray();
        Ji.release(writer);
        return toCharArray;
    }

    public static String toString(InputStream inputStream) throws IOException {
        Writer writer = (StringWriter) Jj.acquire();
        copy(inputStream, writer);
        String stringWriter = writer.toString();
        Jj.release(writer);
        return stringWriter;
    }

    public static String toString(InputStream inputStream, String str) throws IOException {
        Writer writer = (StringWriter) Jj.acquire();
        copy(inputStream, writer, str);
        String stringWriter = writer.toString();
        Jj.release(writer);
        return stringWriter;
    }

    public static String toString(Reader reader) throws IOException {
        Writer writer = (StringWriter) Jj.acquire();
        copy(reader, writer);
        String stringWriter = writer.toString();
        Jj.release(writer);
        return stringWriter;
    }

    public static List<String> readLines(InputStream inputStream) throws IOException {
        return readLines(new InputStreamReader(inputStream));
    }

    public static List<String> readLines(InputStream inputStream, String str) throws IOException {
        Reader inputStreamReader;
        if (str == null || str.length() == 0) {
            inputStreamReader = new InputStreamReader(inputStream);
        } else {
            inputStreamReader = new InputStreamReader(inputStream, str);
        }
        return readLines(inputStreamReader);
    }

    public static List<String> readLines(Reader reader) throws IOException {
        BufferedReader bufferedReader;
        if (reader instanceof BufferedReader) {
            bufferedReader = (BufferedReader) reader;
        } else {
            bufferedReader = new BufferedReader(reader);
        }
        List<String> arrayList = new ArrayList();
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                return arrayList;
            }
            arrayList.add(readLine);
        }
    }

    public static InputStream toInputStream(String str) {
        return new ByteArrayInputStream(str.getBytes());
    }

    public static InputStream toInputStream(String str, String str2) throws UnsupportedEncodingException {
        byte[] bytes = (str2 == null || str2.length() == 0) ? str.getBytes() : str.getBytes(str2);
        return new ByteArrayInputStream(bytes);
    }

    public static void write(OutputStream outputStream, byte[] bArr) throws IOException {
        if (bArr != null) {
            outputStream.write(bArr);
        }
    }

    public static void write(Writer writer, byte[] bArr) throws IOException {
        if (bArr != null) {
            writer.write(new String(bArr));
        }
    }

    public static void write(Writer writer, byte[] bArr, String str) throws IOException {
        if (bArr != null) {
            String str2 = (str == null || str.length() == 0) ? new String(bArr) : new String(bArr, str);
            writer.write(str2);
        }
    }

    public static void write(Writer writer, char[] cArr) throws IOException {
        if (cArr != null) {
            writer.write(cArr);
        }
    }

    public static void write(OutputStream outputStream, char[] cArr) throws IOException {
        if (cArr != null) {
            outputStream.write(new String(cArr).getBytes());
        }
    }

    public static void write(OutputStream outputStream, char[] cArr, String str) throws IOException {
        if (cArr != null) {
            byte[] bytes;
            if (str == null || str.length() == 0) {
                bytes = new String(cArr).getBytes();
            } else {
                bytes = new String(cArr).getBytes(str);
            }
            outputStream.write(bytes);
        }
    }

    public static void write(Writer writer, String str) throws IOException {
        if (str != null) {
            writer.write(str);
        }
    }

    public static void write(OutputStream outputStream, String str) throws IOException {
        if (str != null) {
            outputStream.write(str.getBytes());
        }
    }

    public static void write(OutputStream outputStream, String str, String str2) throws IOException {
        if (str != null) {
            byte[] bytes = (str2 == null || str2.length() == 0) ? str.getBytes() : str.getBytes(str2);
            outputStream.write(bytes);
        }
    }

    public static void writeLines(OutputStream outputStream, Collection<Object> collection, String str) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    outputStream.write(next.toString().getBytes());
                }
                outputStream.write(str.getBytes());
            }
        }
    }

    public static void writeLines(OutputStream outputStream, Collection<Object> collection, String str, String str2) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    outputStream.write(next.toString().getBytes(str2));
                }
                outputStream.write(str.getBytes(str2));
            }
        }
    }

    public static void writeLines(Writer writer, Collection<Object> collection, String str) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    writer.write(next.toString());
                }
                writer.write(str);
            }
        }
    }

    public static long copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] dt = dt();
        long j = 0;
        while (true) {
            int read = inputStream.read(dt);
            if (read != -1) {
                outputStream.write(dt, 0, read);
                j += (long) read;
            } else {
                outputStream.flush();
                return j;
            }
        }
    }

    public static void copy(InputStream inputStream, Writer writer) throws IOException {
        copy(new InputStreamReader(inputStream), writer);
    }

    public static void copy(InputStream inputStream, Writer writer, String str) throws IOException {
        Reader inputStreamReader;
        if (str == null || str.length() == 0) {
            inputStreamReader = new InputStreamReader(inputStream);
        } else {
            inputStreamReader = new InputStreamReader(inputStream, str);
        }
        copy(inputStreamReader, writer);
    }

    public static void copy(Reader reader, OutputStream outputStream) throws IOException {
        copy(reader, new OutputStreamWriter(outputStream));
    }

    public static void copy(Reader reader, OutputStream outputStream, String str) throws IOException {
        Writer outputStreamWriter;
        if (str == null || str.length() == 0) {
            outputStreamWriter = new OutputStreamWriter(outputStream);
        } else {
            outputStreamWriter = new OutputStreamWriter(outputStream, str);
        }
        copy(reader, outputStreamWriter);
    }

    public static long copy(Reader reader, Writer writer) throws IOException {
        char[] du = du();
        long j = 0;
        while (true) {
            int read = reader.read(du);
            if (read != -1) {
                writer.write(du, 0, read);
                j += (long) read;
            } else {
                writer.flush();
                return j;
            }
        }
    }

    private static byte[] dt() {
        byte[] bArr;
        SoftReference softReference = (SoftReference) Jf.get();
        if (softReference != null) {
            bArr = (byte[]) softReference.get();
        } else {
            bArr = null;
        }
        if (bArr != null) {
            return bArr;
        }
        Object obj = new byte[4096];
        Jf.set(new SoftReference(obj));
        return obj;
    }

    private static char[] du() {
        char[] cArr;
        SoftReference softReference = (SoftReference) Jg.get();
        if (softReference != null) {
            cArr = (char[]) softReference.get();
        } else {
            cArr = null;
        }
        if (cArr != null) {
            return cArr;
        }
        Object obj = new char[4096];
        Jg.set(new SoftReference(obj));
        return obj;
    }
}
