package com.adobe.xmp.options;

import com.adobe.xmp.XMPException;
import java.util.HashMap;
import java.util.Map;

public abstract class Options {
    private Map optionNames = null;
    private int options = 0;

    protected abstract String defineOptionName(int i);

    protected abstract int getValidOptions();

    public Options(int i) throws XMPException {
        assertOptionsValid(i);
        setOptions(i);
    }

    public void clear() {
        this.options = 0;
    }

    public boolean isExactly(int i) {
        return getOptions() == i;
    }

    public boolean containsAllOptions(int i) {
        return (getOptions() & i) == i;
    }

    public boolean containsOneOf(int i) {
        return (i & getOptions()) != 0;
    }

    protected boolean getOption(int i) {
        return (i & this.options) != 0;
    }

    public void setOption(int i, boolean z) {
        if (z) {
            i |= this.options;
        } else {
            i = (~i) & this.options;
        }
        this.options = i;
    }

    public int getOptions() {
        return this.options;
    }

    public void setOptions(int i) throws XMPException {
        assertOptionsValid(i);
        this.options = i;
    }

    public boolean equals(Object obj) {
        return getOptions() == ((Options) obj).getOptions();
    }

    public int hashCode() {
        return getOptions();
    }

    public String getOptionsString() {
        if (this.options == 0) {
            return "<none>";
        }
        StringBuffer stringBuffer = new StringBuffer();
        int i = this.options;
        while (i != 0) {
            int i2 = (i - 1) & i;
            stringBuffer.append(getOptionName(i ^ i2));
            if (i2 != 0) {
                stringBuffer.append(" | ");
            }
            i = i2;
        }
        return stringBuffer.toString();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("0x");
        stringBuilder.append(Integer.toHexString(this.options));
        return stringBuilder.toString();
    }

    protected void assertConsistency(int i) throws XMPException {
    }

    private void assertOptionsValid(int i) throws XMPException {
        int i2 = (~getValidOptions()) & i;
        if (i2 == 0) {
            assertConsistency(i);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("The option bit(s) 0x");
        stringBuilder.append(Integer.toHexString(i2));
        stringBuilder.append(" are invalid!");
        throw new XMPException(stringBuilder.toString(), 103);
    }

    private String getOptionName(int i) {
        Map procureOptionNames = procureOptionNames();
        Integer num = new Integer(i);
        String str = (String) procureOptionNames.get(num);
        if (str != null) {
            return str;
        }
        str = defineOptionName(i);
        if (str == null) {
            return "<option name not defined>";
        }
        procureOptionNames.put(num, str);
        return str;
    }

    private Map procureOptionNames() {
        if (this.optionNames == null) {
            this.optionNames = new HashMap();
        }
        return this.optionNames;
    }
}
