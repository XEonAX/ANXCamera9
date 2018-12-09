package okhttp3.internal.http2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;
import okio.Source;

final class Hpack {
    static final Map<ByteString, Integer> NAME_TO_FIRST_INDEX = nameToFirstIndex();
    private static final int PREFIX_4_BITS = 15;
    private static final int PREFIX_5_BITS = 31;
    private static final int PREFIX_6_BITS = 63;
    private static final int PREFIX_7_BITS = 127;
    static final Header[] STATIC_HEADER_TABLE = new Header[]{new Header(Header.TARGET_AUTHORITY, ""), new Header(Header.TARGET_METHOD, "GET"), new Header(Header.TARGET_METHOD, "POST"), new Header(Header.TARGET_PATH, "/"), new Header(Header.TARGET_PATH, "/index.html"), new Header(Header.TARGET_SCHEME, "http"), new Header(Header.TARGET_SCHEME, "https"), new Header(Header.RESPONSE_STATUS, "200"), new Header(Header.RESPONSE_STATUS, "204"), new Header(Header.RESPONSE_STATUS, "206"), new Header(Header.RESPONSE_STATUS, "304"), new Header(Header.RESPONSE_STATUS, "400"), new Header(Header.RESPONSE_STATUS, "404"), new Header(Header.RESPONSE_STATUS, "500"), new Header("accept-charset", ""), new Header("accept-encoding", "gzip, deflate"), new Header("accept-language", ""), new Header("accept-ranges", ""), new Header("accept", ""), new Header("access-control-allow-origin", ""), new Header("age", ""), new Header("allow", ""), new Header("authorization", ""), new Header("cache-control", ""), new Header("content-disposition", ""), new Header("content-encoding", ""), new Header("content-language", ""), new Header("content-length", ""), new Header("content-location", ""), new Header("content-range", ""), new Header("content-type", ""), new Header("cookie", ""), new Header("date", ""), new Header("etag", ""), new Header("expect", ""), new Header("expires", ""), new Header("from", ""), new Header("host", ""), new Header("if-match", ""), new Header("if-modified-since", ""), new Header("if-none-match", ""), new Header("if-range", ""), new Header("if-unmodified-since", ""), new Header("last-modified", ""), new Header("link", ""), new Header("location", ""), new Header("max-forwards", ""), new Header("proxy-authenticate", ""), new Header("proxy-authorization", ""), new Header("range", ""), new Header("referer", ""), new Header("refresh", ""), new Header("retry-after", ""), new Header("server", ""), new Header("set-cookie", ""), new Header("strict-transport-security", ""), new Header("transfer-encoding", ""), new Header("user-agent", ""), new Header("vary", ""), new Header("via", ""), new Header("www-authenticate", "")};

    static final class Reader {
        Header[] dynamicTable;
        int dynamicTableByteCount;
        int headerCount;
        private final List<Header> headerList;
        private final int headerTableSizeSetting;
        private int maxDynamicTableByteCount;
        int nextHeaderIndex;
        private final BufferedSource source;

        Reader(int i, Source source) {
            this(i, i, source);
        }

        Reader(int i, int i2, Source source) {
            this.headerList = new ArrayList();
            this.dynamicTable = new Header[8];
            this.nextHeaderIndex = this.dynamicTable.length - 1;
            this.headerCount = 0;
            this.dynamicTableByteCount = 0;
            this.headerTableSizeSetting = i;
            this.maxDynamicTableByteCount = i2;
            this.source = Okio.buffer(source);
        }

        int maxDynamicTableByteCount() {
            return this.maxDynamicTableByteCount;
        }

        private void adjustDynamicTableByteCount() {
            if (this.maxDynamicTableByteCount >= this.dynamicTableByteCount) {
                return;
            }
            if (this.maxDynamicTableByteCount == 0) {
                clearDynamicTable();
            } else {
                evictToRecoverBytes(this.dynamicTableByteCount - this.maxDynamicTableByteCount);
            }
        }

        private void clearDynamicTable() {
            Arrays.fill(this.dynamicTable, null);
            this.nextHeaderIndex = this.dynamicTable.length - 1;
            this.headerCount = 0;
            this.dynamicTableByteCount = 0;
        }

        private int evictToRecoverBytes(int i) {
            int i2 = 0;
            if (i > 0) {
                int length = this.dynamicTable.length;
                while (true) {
                    length--;
                    if (length < this.nextHeaderIndex || i <= 0) {
                        System.arraycopy(this.dynamicTable, this.nextHeaderIndex + 1, this.dynamicTable, (this.nextHeaderIndex + 1) + i2, this.headerCount);
                        this.nextHeaderIndex += i2;
                    } else {
                        i -= this.dynamicTable[length].hpackSize;
                        this.dynamicTableByteCount -= this.dynamicTable[length].hpackSize;
                        this.headerCount--;
                        i2++;
                    }
                }
                System.arraycopy(this.dynamicTable, this.nextHeaderIndex + 1, this.dynamicTable, (this.nextHeaderIndex + 1) + i2, this.headerCount);
                this.nextHeaderIndex += i2;
            }
            return i2;
        }

        void readHeaders() throws IOException {
            while (!this.source.exhausted()) {
                int readByte = this.source.readByte() & 255;
                if (readByte == 128) {
                    throw new IOException("index == 0");
                } else if ((readByte & 128) == 128) {
                    readIndexedHeader(readInt(readByte, 127) - 1);
                } else if (readByte == 64) {
                    readLiteralHeaderWithIncrementalIndexingNewName();
                } else if ((readByte & 64) == 64) {
                    readLiteralHeaderWithIncrementalIndexingIndexedName(readInt(readByte, 63) - 1);
                } else if ((readByte & 32) == 32) {
                    this.maxDynamicTableByteCount = readInt(readByte, 31);
                    if (this.maxDynamicTableByteCount < 0 || this.maxDynamicTableByteCount > this.headerTableSizeSetting) {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Invalid dynamic table size update ");
                        stringBuilder.append(this.maxDynamicTableByteCount);
                        throw new IOException(stringBuilder.toString());
                    }
                    adjustDynamicTableByteCount();
                } else if (readByte == 16 || readByte == 0) {
                    readLiteralHeaderWithoutIndexingNewName();
                } else {
                    readLiteralHeaderWithoutIndexingIndexedName(readInt(readByte, 15) - 1);
                }
            }
        }

        public List<Header> getAndResetHeaderList() {
            List arrayList = new ArrayList(this.headerList);
            this.headerList.clear();
            return arrayList;
        }

        private void readIndexedHeader(int i) throws IOException {
            if (isStaticHeader(i)) {
                this.headerList.add(Hpack.STATIC_HEADER_TABLE[i]);
                return;
            }
            int dynamicTableIndex = dynamicTableIndex(i - Hpack.STATIC_HEADER_TABLE.length);
            if (dynamicTableIndex < 0 || dynamicTableIndex > this.dynamicTable.length - 1) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Header index too large ");
                stringBuilder.append(i + 1);
                throw new IOException(stringBuilder.toString());
            }
            this.headerList.add(this.dynamicTable[dynamicTableIndex]);
        }

        private int dynamicTableIndex(int i) {
            return (this.nextHeaderIndex + 1) + i;
        }

        private void readLiteralHeaderWithoutIndexingIndexedName(int i) throws IOException {
            this.headerList.add(new Header(getName(i), readByteString()));
        }

        private void readLiteralHeaderWithoutIndexingNewName() throws IOException {
            this.headerList.add(new Header(Hpack.checkLowercase(readByteString()), readByteString()));
        }

        private void readLiteralHeaderWithIncrementalIndexingIndexedName(int i) throws IOException {
            insertIntoDynamicTable(-1, new Header(getName(i), readByteString()));
        }

        private void readLiteralHeaderWithIncrementalIndexingNewName() throws IOException {
            insertIntoDynamicTable(-1, new Header(Hpack.checkLowercase(readByteString()), readByteString()));
        }

        private ByteString getName(int i) {
            if (isStaticHeader(i)) {
                return Hpack.STATIC_HEADER_TABLE[i].name;
            }
            return this.dynamicTable[dynamicTableIndex(i - Hpack.STATIC_HEADER_TABLE.length)].name;
        }

        private boolean isStaticHeader(int i) {
            return i >= 0 && i <= Hpack.STATIC_HEADER_TABLE.length - 1;
        }

        private void insertIntoDynamicTable(int i, Header header) {
            this.headerList.add(header);
            int i2 = header.hpackSize;
            if (i != -1) {
                i2 -= this.dynamicTable[dynamicTableIndex(i)].hpackSize;
            }
            if (i2 > this.maxDynamicTableByteCount) {
                clearDynamicTable();
                return;
            }
            int evictToRecoverBytes = evictToRecoverBytes((this.dynamicTableByteCount + i2) - this.maxDynamicTableByteCount);
            if (i == -1) {
                if (this.headerCount + 1 > this.dynamicTable.length) {
                    Object obj = new Header[(this.dynamicTable.length * 2)];
                    System.arraycopy(this.dynamicTable, 0, obj, this.dynamicTable.length, this.dynamicTable.length);
                    this.nextHeaderIndex = this.dynamicTable.length - 1;
                    this.dynamicTable = obj;
                }
                i = this.nextHeaderIndex;
                this.nextHeaderIndex = i - 1;
                this.dynamicTable[i] = header;
                this.headerCount++;
            } else {
                this.dynamicTable[i + (dynamicTableIndex(i) + evictToRecoverBytes)] = header;
            }
            this.dynamicTableByteCount += i2;
        }

        private int readByte() throws IOException {
            return this.source.readByte() & 255;
        }

        int readInt(int i, int i2) throws IOException {
            i &= i2;
            if (i < i2) {
                return i;
            }
            i = 0;
            while (true) {
                int readByte = readByte();
                if ((readByte & 128) == 0) {
                    return i2 + (readByte << i);
                }
                i2 += (readByte & 127) << i;
                i += 7;
            }
        }

        ByteString readByteString() throws IOException {
            int readByte = readByte();
            Object obj = (readByte & 128) == 128 ? 1 : null;
            readByte = readInt(readByte, 127);
            if (obj != null) {
                return ByteString.of(Huffman.get().decode(this.source.readByteArray((long) readByte)));
            }
            return this.source.readByteString((long) readByte);
        }
    }

    static final class Writer {
        private static final int SETTINGS_HEADER_TABLE_SIZE = 4096;
        private static final int SETTINGS_HEADER_TABLE_SIZE_LIMIT = 16384;
        Header[] dynamicTable;
        int dynamicTableByteCount;
        private boolean emitDynamicTableSizeUpdate;
        int headerCount;
        int headerTableSizeSetting;
        int maxDynamicTableByteCount;
        int nextHeaderIndex;
        private final Buffer out;
        private int smallestHeaderTableSizeSetting;
        private final boolean useCompression;

        Writer(Buffer buffer) {
            this(4096, true, buffer);
        }

        Writer(int i, boolean z, Buffer buffer) {
            this.smallestHeaderTableSizeSetting = Integer.MAX_VALUE;
            this.dynamicTable = new Header[8];
            this.nextHeaderIndex = this.dynamicTable.length - 1;
            this.headerCount = 0;
            this.dynamicTableByteCount = 0;
            this.headerTableSizeSetting = i;
            this.maxDynamicTableByteCount = i;
            this.useCompression = z;
            this.out = buffer;
        }

        private void clearDynamicTable() {
            Arrays.fill(this.dynamicTable, null);
            this.nextHeaderIndex = this.dynamicTable.length - 1;
            this.headerCount = 0;
            this.dynamicTableByteCount = 0;
        }

        private int evictToRecoverBytes(int i) {
            int i2 = 0;
            if (i > 0) {
                int length = this.dynamicTable.length;
                while (true) {
                    length--;
                    if (length < this.nextHeaderIndex || i <= 0) {
                        System.arraycopy(this.dynamicTable, this.nextHeaderIndex + 1, this.dynamicTable, (this.nextHeaderIndex + 1) + i2, this.headerCount);
                        Arrays.fill(this.dynamicTable, this.nextHeaderIndex + 1, (this.nextHeaderIndex + 1) + i2, null);
                        this.nextHeaderIndex += i2;
                    } else {
                        i -= this.dynamicTable[length].hpackSize;
                        this.dynamicTableByteCount -= this.dynamicTable[length].hpackSize;
                        this.headerCount--;
                        i2++;
                    }
                }
                System.arraycopy(this.dynamicTable, this.nextHeaderIndex + 1, this.dynamicTable, (this.nextHeaderIndex + 1) + i2, this.headerCount);
                Arrays.fill(this.dynamicTable, this.nextHeaderIndex + 1, (this.nextHeaderIndex + 1) + i2, null);
                this.nextHeaderIndex += i2;
            }
            return i2;
        }

        private void insertIntoDynamicTable(Header header) {
            int i = header.hpackSize;
            if (i > this.maxDynamicTableByteCount) {
                clearDynamicTable();
                return;
            }
            evictToRecoverBytes((this.dynamicTableByteCount + i) - this.maxDynamicTableByteCount);
            if (this.headerCount + 1 > this.dynamicTable.length) {
                Object obj = new Header[(this.dynamicTable.length * 2)];
                System.arraycopy(this.dynamicTable, 0, obj, this.dynamicTable.length, this.dynamicTable.length);
                this.nextHeaderIndex = this.dynamicTable.length - 1;
                this.dynamicTable = obj;
            }
            int i2 = this.nextHeaderIndex;
            this.nextHeaderIndex = i2 - 1;
            this.dynamicTable[i2] = header;
            this.headerCount++;
            this.dynamicTableByteCount += i;
        }

        /* JADX WARNING: Removed duplicated region for block: B:23:0x0076  */
        /* JADX WARNING: Removed duplicated region for block: B:35:0x00b5  */
        /* JADX WARNING: Removed duplicated region for block: B:34:0x00ad  */
        /* JADX WARNING: Removed duplicated region for block: B:23:0x0076  */
        /* JADX WARNING: Removed duplicated region for block: B:34:0x00ad  */
        /* JADX WARNING: Removed duplicated region for block: B:35:0x00b5  */
        void writeHeaders(java.util.List<okhttp3.internal.http2.Header> r14) throws java.io.IOException {
            /*
            r13 = this;
            r0 = r13.emitDynamicTableSizeUpdate;
            r1 = 0;
            if (r0 == 0) goto L_0x0020;
        L_0x0005:
            r0 = r13.smallestHeaderTableSizeSetting;
            r2 = r13.maxDynamicTableByteCount;
            r3 = 32;
            r4 = 31;
            if (r0 >= r2) goto L_0x0014;
        L_0x000f:
            r0 = r13.smallestHeaderTableSizeSetting;
            r13.writeInt(r0, r4, r3);
        L_0x0014:
            r13.emitDynamicTableSizeUpdate = r1;
            r0 = 2147483647; // 0x7fffffff float:NaN double:1.060997895E-314;
            r13.smallestHeaderTableSizeSetting = r0;
            r0 = r13.maxDynamicTableByteCount;
            r13.writeInt(r0, r4, r3);
        L_0x0020:
            r0 = r14.size();
            r2 = r1;
        L_0x0025:
            if (r2 >= r0) goto L_0x00f0;
        L_0x0027:
            r3 = r14.get(r2);
            r3 = (okhttp3.internal.http2.Header) r3;
            r4 = r3.name;
            r4 = r4.toAsciiLowercase();
            r5 = r3.value;
            r6 = okhttp3.internal.http2.Hpack.NAME_TO_FIRST_INDEX;
            r6 = r6.get(r4);
            r6 = (java.lang.Integer) r6;
            r7 = -1;
            r8 = 1;
            if (r6 == 0) goto L_0x0072;
        L_0x0043:
            r6 = r6.intValue();
            r6 = r6 + r8;
            if (r6 <= r8) goto L_0x006f;
        L_0x004a:
            r9 = 8;
            if (r6 >= r9) goto L_0x006f;
        L_0x004e:
            r9 = okhttp3.internal.http2.Hpack.STATIC_HEADER_TABLE;
            r10 = r6 + -1;
            r9 = r9[r10];
            r9 = r9.value;
            r9 = okhttp3.internal.Util.equal(r9, r5);
            if (r9 == 0) goto L_0x005d;
        L_0x005c:
            goto L_0x0073;
        L_0x005d:
            r9 = okhttp3.internal.http2.Hpack.STATIC_HEADER_TABLE;
            r9 = r9[r6];
            r9 = r9.value;
            r9 = okhttp3.internal.Util.equal(r9, r5);
            if (r9 == 0) goto L_0x006f;
        L_0x0069:
            r9 = r6 + 1;
            r12 = r9;
            r9 = r6;
            r6 = r12;
            goto L_0x0074;
        L_0x006f:
            r9 = r6;
            r6 = r7;
            goto L_0x0074;
        L_0x0072:
            r6 = r7;
        L_0x0073:
            r9 = r6;
        L_0x0074:
            if (r6 != r7) goto L_0x00ab;
        L_0x0076:
            r10 = r13.nextHeaderIndex;
            r10 = r10 + r8;
            r8 = r13.dynamicTable;
            r8 = r8.length;
        L_0x007c:
            if (r10 >= r8) goto L_0x00ab;
        L_0x007e:
            r11 = r13.dynamicTable;
            r11 = r11[r10];
            r11 = r11.name;
            r11 = okhttp3.internal.Util.equal(r11, r4);
            if (r11 == 0) goto L_0x00a8;
        L_0x008a:
            r11 = r13.dynamicTable;
            r11 = r11[r10];
            r11 = r11.value;
            r11 = okhttp3.internal.Util.equal(r11, r5);
            if (r11 == 0) goto L_0x009e;
        L_0x0096:
            r6 = r13.nextHeaderIndex;
            r10 = r10 - r6;
            r6 = okhttp3.internal.http2.Hpack.STATIC_HEADER_TABLE;
            r6 = r6.length;
            r6 = r6 + r10;
            goto L_0x00ab;
        L_0x009e:
            if (r9 != r7) goto L_0x00a8;
        L_0x00a0:
            r9 = r13.nextHeaderIndex;
            r9 = r10 - r9;
            r11 = okhttp3.internal.http2.Hpack.STATIC_HEADER_TABLE;
            r11 = r11.length;
            r9 = r9 + r11;
        L_0x00a8:
            r10 = r10 + 1;
            goto L_0x007c;
        L_0x00ab:
            if (r6 == r7) goto L_0x00b5;
        L_0x00ad:
            r3 = 127; // 0x7f float:1.78E-43 double:6.27E-322;
            r4 = 128; // 0x80 float:1.794E-43 double:6.32E-322;
            r13.writeInt(r6, r3, r4);
            goto L_0x00ec;
        L_0x00b5:
            r6 = 64;
            if (r9 != r7) goto L_0x00c8;
        L_0x00b9:
            r7 = r13.out;
            r7.writeByte(r6);
            r13.writeByteString(r4);
            r13.writeByteString(r5);
            r13.insertIntoDynamicTable(r3);
            goto L_0x00ec;
        L_0x00c8:
            r7 = okhttp3.internal.http2.Header.PSEUDO_PREFIX;
            r7 = r4.startsWith(r7);
            if (r7 == 0) goto L_0x00e1;
        L_0x00d0:
            r7 = okhttp3.internal.http2.Header.TARGET_AUTHORITY;
            r4 = r7.equals(r4);
            if (r4 != 0) goto L_0x00e1;
        L_0x00d8:
            r3 = 15;
            r13.writeInt(r9, r3, r1);
            r13.writeByteString(r5);
            goto L_0x00ec;
        L_0x00e1:
            r4 = 63;
            r13.writeInt(r9, r4, r6);
            r13.writeByteString(r5);
            r13.insertIntoDynamicTable(r3);
        L_0x00ec:
            r2 = r2 + 1;
            goto L_0x0025;
        L_0x00f0:
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.http2.Hpack.Writer.writeHeaders(java.util.List):void");
        }

        void writeInt(int i, int i2, int i3) {
            if (i < i2) {
                this.out.writeByte(i | i3);
                return;
            }
            this.out.writeByte(i3 | i2);
            i -= i2;
            while (i >= 128) {
                this.out.writeByte(128 | (i & 127));
                i >>>= 7;
            }
            this.out.writeByte(i);
        }

        void writeByteString(ByteString byteString) throws IOException {
            if (!this.useCompression || Huffman.get().encodedLength(byteString) >= byteString.size()) {
                writeInt(byteString.size(), 127, 0);
                this.out.write(byteString);
                return;
            }
            Object buffer = new Buffer();
            Huffman.get().encode(byteString, buffer);
            byteString = buffer.readByteString();
            writeInt(byteString.size(), 127, 128);
            this.out.write(byteString);
        }

        void setHeaderTableSizeSetting(int i) {
            this.headerTableSizeSetting = i;
            i = Math.min(i, 16384);
            if (this.maxDynamicTableByteCount != i) {
                if (i < this.maxDynamicTableByteCount) {
                    this.smallestHeaderTableSizeSetting = Math.min(this.smallestHeaderTableSizeSetting, i);
                }
                this.emitDynamicTableSizeUpdate = true;
                this.maxDynamicTableByteCount = i;
                adjustDynamicTableByteCount();
            }
        }

        private void adjustDynamicTableByteCount() {
            if (this.maxDynamicTableByteCount >= this.dynamicTableByteCount) {
                return;
            }
            if (this.maxDynamicTableByteCount == 0) {
                clearDynamicTable();
            } else {
                evictToRecoverBytes(this.dynamicTableByteCount - this.maxDynamicTableByteCount);
            }
        }
    }

    private Hpack() {
    }

    private static Map<ByteString, Integer> nameToFirstIndex() {
        Map linkedHashMap = new LinkedHashMap(STATIC_HEADER_TABLE.length);
        for (int i = 0; i < STATIC_HEADER_TABLE.length; i++) {
            if (!linkedHashMap.containsKey(STATIC_HEADER_TABLE[i].name)) {
                linkedHashMap.put(STATIC_HEADER_TABLE[i].name, Integer.valueOf(i));
            }
        }
        return Collections.unmodifiableMap(linkedHashMap);
    }

    static ByteString checkLowercase(ByteString byteString) throws IOException {
        int size = byteString.size();
        int i = 0;
        while (i < size) {
            byte b = byteString.getByte(i);
            if (b < (byte) 65 || b > (byte) 90) {
                i++;
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("PROTOCOL_ERROR response malformed: mixed case name: ");
                stringBuilder.append(byteString.utf8());
                throw new IOException(stringBuilder.toString());
            }
        }
        return byteString;
    }
}
