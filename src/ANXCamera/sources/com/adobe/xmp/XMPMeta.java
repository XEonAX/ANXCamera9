package com.adobe.xmp;

import com.adobe.xmp.options.IteratorOptions;
import com.adobe.xmp.options.ParseOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPProperty;
import java.util.Calendar;

public interface XMPMeta extends Cloneable {
    void appendArrayItem(String str, String str2, PropertyOptions propertyOptions, String str3, PropertyOptions propertyOptions2) throws XMPException;

    void appendArrayItem(String str, String str2, String str3) throws XMPException;

    Object clone();

    int countArrayItems(String str, String str2) throws XMPException;

    void deleteArrayItem(String str, String str2, int i);

    void deleteProperty(String str, String str2);

    void deleteQualifier(String str, String str2, String str3, String str4);

    void deleteStructField(String str, String str2, String str3, String str4);

    boolean doesArrayItemExist(String str, String str2, int i);

    boolean doesPropertyExist(String str, String str2);

    boolean doesQualifierExist(String str, String str2, String str3, String str4);

    boolean doesStructFieldExist(String str, String str2, String str3, String str4);

    String dumpObject();

    XMPProperty getArrayItem(String str, String str2, int i) throws XMPException;

    XMPProperty getLocalizedText(String str, String str2, String str3, String str4) throws XMPException;

    String getObjectName();

    String getPacketHeader();

    XMPProperty getProperty(String str, String str2) throws XMPException;

    byte[] getPropertyBase64(String str, String str2) throws XMPException;

    Boolean getPropertyBoolean(String str, String str2) throws XMPException;

    Calendar getPropertyCalendar(String str, String str2) throws XMPException;

    XMPDateTime getPropertyDate(String str, String str2) throws XMPException;

    Double getPropertyDouble(String str, String str2) throws XMPException;

    Integer getPropertyInteger(String str, String str2) throws XMPException;

    Long getPropertyLong(String str, String str2) throws XMPException;

    String getPropertyString(String str, String str2) throws XMPException;

    XMPProperty getQualifier(String str, String str2, String str3, String str4) throws XMPException;

    XMPProperty getStructField(String str, String str2, String str3, String str4) throws XMPException;

    void insertArrayItem(String str, String str2, int i, String str3) throws XMPException;

    void insertArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException;

    XMPIterator iterator() throws XMPException;

    XMPIterator iterator(IteratorOptions iteratorOptions) throws XMPException;

    XMPIterator iterator(String str, String str2, IteratorOptions iteratorOptions) throws XMPException;

    void normalize(ParseOptions parseOptions) throws XMPException;

    void setArrayItem(String str, String str2, int i, String str3) throws XMPException;

    void setArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException;

    void setLocalizedText(String str, String str2, String str3, String str4, String str5) throws XMPException;

    void setLocalizedText(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException;

    void setObjectName(String str);

    void setProperty(String str, String str2, Object obj) throws XMPException;

    void setProperty(String str, String str2, Object obj, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyBase64(String str, String str2, byte[] bArr) throws XMPException;

    void setPropertyBase64(String str, String str2, byte[] bArr, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyBoolean(String str, String str2, boolean z) throws XMPException;

    void setPropertyBoolean(String str, String str2, boolean z, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyCalendar(String str, String str2, Calendar calendar) throws XMPException;

    void setPropertyCalendar(String str, String str2, Calendar calendar, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime) throws XMPException;

    void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyDouble(String str, String str2, double d) throws XMPException;

    void setPropertyDouble(String str, String str2, double d, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyInteger(String str, String str2, int i) throws XMPException;

    void setPropertyInteger(String str, String str2, int i, PropertyOptions propertyOptions) throws XMPException;

    void setPropertyLong(String str, String str2, long j) throws XMPException;

    void setPropertyLong(String str, String str2, long j, PropertyOptions propertyOptions) throws XMPException;

    void setQualifier(String str, String str2, String str3, String str4, String str5) throws XMPException;

    void setQualifier(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException;

    void setStructField(String str, String str2, String str3, String str4, String str5) throws XMPException;

    void setStructField(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException;

    void sort();
}
