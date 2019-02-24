package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;

/* compiled from: ISO8601Converter */
class ParseState {
    private int pos = 0;
    private String str;

    public ParseState(String str) {
        this.str = str;
    }

    public int length() {
        return this.str.length();
    }

    public boolean hasNext() {
        return this.pos < this.str.length();
    }

    public char ch(int i) {
        return i < this.str.length() ? this.str.charAt(i) : 0;
    }

    public char ch() {
        return this.pos < this.str.length() ? this.str.charAt(this.pos) : 0;
    }

    public void skip() {
        this.pos++;
    }

    public int pos() {
        return this.pos;
    }

    public int gatherInt(String str, int i) throws XMPException {
        int ch = ch(this.pos);
        int i2 = 0;
        int i3 = i2;
        while (48 <= ch && ch <= 57) {
            i3 = (i3 * 10) + (ch - 48);
            this.pos++;
            ch = ch(this.pos);
            i2 = 1;
        }
        if (i2 == 0) {
            throw new XMPException(str, 5);
        } else if (i3 > i) {
            return i;
        } else {
            if (i3 < 0) {
                return 0;
            }
            return i3;
        }
    }
}
