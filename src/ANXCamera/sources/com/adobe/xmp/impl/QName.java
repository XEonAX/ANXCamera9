package com.adobe.xmp.impl;

public class QName {
    private String localName;
    private String prefix;

    public QName(String str) {
        int indexOf = str.indexOf(58);
        if (indexOf >= 0) {
            this.prefix = str.substring(0, indexOf);
            this.localName = str.substring(indexOf + 1);
            return;
        }
        this.prefix = "";
        this.localName = str;
    }

    public QName(String str, String str2) {
        this.prefix = str;
        this.localName = str2;
    }

    public boolean hasPrefix() {
        return this.prefix != null && this.prefix.length() > 0;
    }

    public String getLocalName() {
        return this.localName;
    }

    public String getPrefix() {
        return this.prefix;
    }
}
