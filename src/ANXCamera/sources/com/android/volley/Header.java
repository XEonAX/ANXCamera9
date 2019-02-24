package com.android.volley;

import android.text.TextUtils;

public final class Header {
    private final String mName;
    private final String mValue;

    public Header(String str, String str2) {
        this.mName = str;
        this.mValue = str2;
    }

    public final String getName() {
        return this.mName;
    }

    public final String getValue() {
        return this.mValue;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Header header = (Header) obj;
        if (!(TextUtils.equals(this.mName, header.mName) && TextUtils.equals(this.mValue, header.mValue))) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.mName.hashCode()) + this.mValue.hashCode();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Header[name=");
        stringBuilder.append(this.mName);
        stringBuilder.append(",value=");
        stringBuilder.append(this.mValue);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
