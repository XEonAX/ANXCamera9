package com.adobe.xmp.options;

public final class IteratorOptions extends Options {
    public static final int INCLUDE_ALIASES = 2048;
    public static final int JUST_CHILDREN = 256;
    public static final int JUST_LEAFNAME = 1024;
    public static final int JUST_LEAFNODES = 512;
    public static final int OMIT_QUALIFIERS = 4096;

    public boolean isJustChildren() {
        return getOption(256);
    }

    public boolean isJustLeafname() {
        return getOption(1024);
    }

    public boolean isJustLeafnodes() {
        return getOption(512);
    }

    public boolean isOmitQualifiers() {
        return getOption(4096);
    }

    public IteratorOptions setJustChildren(boolean z) {
        setOption(256, z);
        return this;
    }

    public IteratorOptions setJustLeafname(boolean z) {
        setOption(1024, z);
        return this;
    }

    public IteratorOptions setJustLeafnodes(boolean z) {
        setOption(512, z);
        return this;
    }

    public IteratorOptions setOmitQualifiers(boolean z) {
        setOption(4096, z);
        return this;
    }

    protected String defineOptionName(int i) {
        if (i == 256) {
            return "JUST_CHILDREN";
        }
        if (i == 512) {
            return "JUST_LEAFNODES";
        }
        if (i == 1024) {
            return "JUST_LEAFNAME";
        }
        if (i != 4096) {
            return null;
        }
        return "OMIT_QUALIFIERS";
    }

    protected int getValidOptions() {
        return 5888;
    }
}
