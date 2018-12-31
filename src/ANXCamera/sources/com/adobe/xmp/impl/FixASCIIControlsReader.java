package com.adobe.xmp.impl;

import java.io.IOException;
import java.io.PushbackReader;
import java.io.Reader;

public class FixASCIIControlsReader extends PushbackReader {
    private static final int BUFFER_SIZE = 8;
    private static final int STATE_AMP = 1;
    private static final int STATE_DIG1 = 4;
    private static final int STATE_ERROR = 5;
    private static final int STATE_HASH = 2;
    private static final int STATE_HEX = 3;
    private static final int STATE_START = 0;
    private int control = 0;
    private int digits = 0;
    private int state = 0;

    public FixASCIIControlsReader(Reader reader) {
        super(reader, 8);
    }

    public int read(char[] cArr, int i, int i2) throws IOException {
        char[] cArr2 = new char[8];
        int i3 = i;
        int i4 = 0;
        int i5 = i4;
        loop0:
        while (true) {
            i = 1;
            while (i != 0 && i4 < i2) {
                i = super.read(cArr2, i5, 1) == 1 ? 1 : 0;
                if (i != 0) {
                    char processChar = processChar(cArr2[i5]);
                    if (this.state == 0) {
                        if (Utils.isControlChar(processChar)) {
                            processChar = ' ';
                        }
                        i5 = i3 + 1;
                        cArr[i3] = processChar;
                        i4++;
                        i3 = i5;
                    } else if (this.state == 5) {
                        unread(cArr2, 0, i5 + 1);
                    } else {
                        i5++;
                    }
                    i5 = 0;
                } else if (i5 > 0) {
                    unread(cArr2, 0, i5);
                    this.state = 5;
                    i5 = 0;
                }
            }
        }
        return (i4 > 0 || i != 0) ? i4 : -1;
    }

    private char processChar(char c) {
        switch (this.state) {
            case 0:
                if (c == '&') {
                    this.state = 1;
                }
                return c;
            case 1:
                if (c == '#') {
                    this.state = 2;
                } else {
                    this.state = 5;
                }
                return c;
            case 2:
                if (c == 'x') {
                    this.control = 0;
                    this.digits = 0;
                    this.state = 3;
                } else if ('0' > c || c > '9') {
                    this.state = 5;
                } else {
                    this.control = Character.digit(c, 10);
                    this.digits = 1;
                    this.state = 4;
                }
                return c;
            case 3:
                if (('0' <= c && c <= '9') || (('a' <= c && c <= 'f') || ('A' <= c && c <= 'F'))) {
                    this.control = (this.control * 16) + Character.digit(c, 16);
                    this.digits++;
                    if (this.digits <= 4) {
                        this.state = 3;
                    } else {
                        this.state = 5;
                    }
                } else if (c == ';' && Utils.isControlChar((char) this.control)) {
                    this.state = 0;
                    return (char) this.control;
                } else {
                    this.state = 5;
                }
                return c;
            case 4:
                if ('0' <= c && c <= '9') {
                    this.control = (this.control * 10) + Character.digit(c, 10);
                    this.digits++;
                    if (this.digits <= 5) {
                        this.state = 4;
                    } else {
                        this.state = 5;
                    }
                } else if (c == ';' && Utils.isControlChar((char) this.control)) {
                    this.state = 0;
                    return (char) this.control;
                } else {
                    this.state = 5;
                }
                return c;
            case 5:
                this.state = 0;
                return c;
            default:
                return c;
        }
    }
}
