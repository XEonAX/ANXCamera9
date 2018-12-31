package org.greenrobot.greendao.internal;

import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.Property;

public class SqlUtils {
    private static final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();

    public static StringBuilder appendProperty(StringBuilder stringBuilder, String str, Property property) {
        if (str != null) {
            stringBuilder.append(str);
            stringBuilder.append('.');
        }
        stringBuilder.append('\"');
        stringBuilder.append(property.columnName);
        stringBuilder.append('\"');
        return stringBuilder;
    }

    public static StringBuilder appendColumn(StringBuilder stringBuilder, String str) {
        stringBuilder.append('\"');
        stringBuilder.append(str);
        stringBuilder.append('\"');
        return stringBuilder;
    }

    public static StringBuilder appendColumn(StringBuilder stringBuilder, String str, String str2) {
        stringBuilder.append(str);
        stringBuilder.append(".\"");
        stringBuilder.append(str2);
        stringBuilder.append('\"');
        return stringBuilder;
    }

    public static StringBuilder appendColumns(StringBuilder stringBuilder, String str, String[] strArr) {
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            appendColumn(stringBuilder, str, strArr[i]);
            if (i < length - 1) {
                stringBuilder.append(',');
            }
        }
        return stringBuilder;
    }

    public static StringBuilder appendColumns(StringBuilder stringBuilder, String[] strArr) {
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            stringBuilder.append('\"');
            stringBuilder.append(strArr[i]);
            stringBuilder.append('\"');
            if (i < length - 1) {
                stringBuilder.append(',');
            }
        }
        return stringBuilder;
    }

    public static StringBuilder appendPlaceholders(StringBuilder stringBuilder, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 < i - 1) {
                stringBuilder.append("?,");
            } else {
                stringBuilder.append('?');
            }
        }
        return stringBuilder;
    }

    public static StringBuilder appendColumnsEqualPlaceholders(StringBuilder stringBuilder, String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            appendColumn(stringBuilder, strArr[i]).append("=?");
            if (i < strArr.length - 1) {
                stringBuilder.append(',');
            }
        }
        return stringBuilder;
    }

    public static StringBuilder appendColumnsEqValue(StringBuilder stringBuilder, String str, String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            appendColumn(stringBuilder, str, strArr[i]).append("=?");
            if (i < strArr.length - 1) {
                stringBuilder.append(',');
            }
        }
        return stringBuilder;
    }

    public static String createSqlInsert(String str, String str2, String[] strArr) {
        StringBuilder stringBuilder = new StringBuilder(str);
        stringBuilder.append('\"');
        stringBuilder.append(str2);
        stringBuilder.append('\"');
        stringBuilder.append(" (");
        appendColumns(stringBuilder, strArr);
        stringBuilder.append(") VALUES (");
        appendPlaceholders(stringBuilder, strArr.length);
        stringBuilder.append(')');
        return stringBuilder.toString();
    }

    public static String createSqlSelect(String str, String str2, String[] strArr, boolean z) {
        if (str2 == null || str2.length() < 0) {
            throw new DaoException("Table alias required");
        }
        StringBuilder stringBuilder = new StringBuilder(z ? "SELECT DISTINCT " : "SELECT ");
        appendColumns(stringBuilder, str2, strArr).append(" FROM ");
        stringBuilder.append('\"');
        stringBuilder.append(str);
        stringBuilder.append('\"');
        stringBuilder.append(' ');
        stringBuilder.append(str2);
        stringBuilder.append(' ');
        return stringBuilder.toString();
    }

    public static String createSqlSelectCountStar(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder("SELECT COUNT(*) FROM ");
        stringBuilder.append('\"');
        stringBuilder.append(str);
        stringBuilder.append('\"');
        stringBuilder.append(' ');
        if (str2 != null) {
            stringBuilder.append(str2);
            stringBuilder.append(' ');
        }
        return stringBuilder.toString();
    }

    public static String createSqlDelete(String str, String[] strArr) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append('\"');
        stringBuilder.append(str);
        stringBuilder.append('\"');
        str = stringBuilder.toString();
        stringBuilder = new StringBuilder("DELETE FROM ");
        stringBuilder.append(str);
        if (strArr != null && strArr.length > 0) {
            stringBuilder.append(" WHERE ");
            appendColumnsEqValue(stringBuilder, str, strArr);
        }
        return stringBuilder.toString();
    }

    public static String createSqlUpdate(String str, String[] strArr, String[] strArr2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append('\"');
        stringBuilder.append(str);
        stringBuilder.append('\"');
        str = stringBuilder.toString();
        stringBuilder = new StringBuilder("UPDATE ");
        stringBuilder.append(str);
        stringBuilder.append(" SET ");
        appendColumnsEqualPlaceholders(stringBuilder, strArr);
        stringBuilder.append(" WHERE ");
        appendColumnsEqValue(stringBuilder, str, strArr2);
        return stringBuilder.toString();
    }

    public static String createSqlCount(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SELECT COUNT(*) FROM \"");
        stringBuilder.append(str);
        stringBuilder.append('\"');
        return stringBuilder.toString();
    }

    public static String escapeBlobArgument(byte[] bArr) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("X'");
        stringBuilder.append(toHex(bArr));
        stringBuilder.append('\'');
        return stringBuilder.toString();
    }

    public static String toHex(byte[] bArr) {
        char[] cArr = new char[(bArr.length * 2)];
        for (int i = 0; i < bArr.length; i++) {
            int i2 = bArr[i] & 255;
            int i3 = i * 2;
            cArr[i3] = HEX_ARRAY[i2 >>> 4];
            cArr[i3 + 1] = HEX_ARRAY[i2 & 15];
        }
        return new String(cArr);
    }
}
