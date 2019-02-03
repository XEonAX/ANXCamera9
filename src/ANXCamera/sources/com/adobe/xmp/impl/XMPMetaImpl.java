package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPDateTime;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPPathFactory;
import com.adobe.xmp.XMPUtils;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.IteratorOptions;
import com.adobe.xmp.options.ParseOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPProperty;
import java.util.Calendar;
import java.util.Iterator;

public class XMPMetaImpl implements XMPConst, XMPMeta {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int VALUE_BASE64 = 7;
    private static final int VALUE_BOOLEAN = 1;
    private static final int VALUE_CALENDAR = 6;
    private static final int VALUE_DATE = 5;
    private static final int VALUE_DOUBLE = 4;
    private static final int VALUE_INTEGER = 2;
    private static final int VALUE_LONG = 3;
    private static final int VALUE_STRING = 0;
    private String packetHeader;
    private XMPNode tree;

    public XMPMetaImpl() {
        this.packetHeader = null;
        this.tree = new XMPNode(null, null, null);
    }

    public XMPMetaImpl(XMPNode xMPNode) {
        this.packetHeader = null;
        this.tree = xMPNode;
    }

    public void appendArrayItem(String str, String str2, PropertyOptions propertyOptions, String str3, PropertyOptions propertyOptions2) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        if (propertyOptions == null) {
            propertyOptions = new PropertyOptions();
        }
        if (propertyOptions.isOnlyArrayOptions()) {
            propertyOptions = XMPNodeUtils.verifySetOptions(propertyOptions, null);
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPNode findNode = XMPNodeUtils.findNode(this.tree, expandXPath, false, null);
            if (findNode != null) {
                if (!findNode.getOptions().isArray()) {
                    throw new XMPException("The named property is not an array", 102);
                }
            } else if (propertyOptions.isArray()) {
                findNode = XMPNodeUtils.findNode(this.tree, expandXPath, true, propertyOptions);
                if (findNode == null) {
                    throw new XMPException("Failure creating array node", 102);
                }
            } else {
                throw new XMPException("Explicit arrayOptions required to create new array", 103);
            }
            doSetArrayItem(findNode, -1, str3, propertyOptions2, true);
            return;
        }
        throw new XMPException("Only array form flags allowed for arrayOptions", 103);
    }

    public void appendArrayItem(String str, String str2, String str3) throws XMPException {
        appendArrayItem(str, str2, null, str3, null);
    }

    public int countArrayItems(String str, String str2) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return 0;
        }
        if (findNode.getOptions().isArray()) {
            return findNode.getChildrenLength();
        }
        throw new XMPException("The named property is not an array", 102);
    }

    public void deleteArrayItem(String str, String str2, int i) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertArrayName(str2);
            deleteProperty(str, XMPPathFactory.composeArrayItemPath(str2, i));
        } catch (XMPException e) {
        }
    }

    public void deleteProperty(String str, String str2) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
            if (findNode != null) {
                XMPNodeUtils.deleteNode(findNode);
            }
        } catch (XMPException e) {
        }
    }

    public void deleteQualifier(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(XMPPathFactory.composeQualifierPath(str3, str4));
            deleteProperty(str, stringBuilder.toString());
        } catch (XMPException e) {
        }
    }

    public void deleteStructField(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertStructName(str2);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(XMPPathFactory.composeStructFieldPath(str3, str4));
            deleteProperty(str, stringBuilder.toString());
        } catch (XMPException e) {
        }
    }

    public boolean doesPropertyExist(String str, String str2) {
        boolean z = false;
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            if (XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null) != null) {
                z = true;
            }
            return z;
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesArrayItemExist(String str, String str2, int i) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertArrayName(str2);
            return doesPropertyExist(str, XMPPathFactory.composeArrayItemPath(str2, i));
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesStructFieldExist(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertStructName(str2);
            str3 = XMPPathFactory.composeStructFieldPath(str3, str4);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(str3);
            return doesPropertyExist(str, stringBuilder.toString());
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesQualifierExist(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            str3 = XMPPathFactory.composeQualifierPath(str3, str4);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(str3);
            return doesPropertyExist(str, stringBuilder.toString());
        } catch (XMPException e) {
            return false;
        }
    }

    public XMPProperty getArrayItem(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        return getProperty(str, XMPPathFactory.composeArrayItemPath(str2, i));
    }

    public XMPProperty getLocalizedText(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertSpecificLang(str4);
        if (str3 != null) {
            str3 = Utils.normalizeLangValue(str3);
        } else {
            str3 = null;
        }
        str4 = Utils.normalizeLangValue(str4);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        Object[] chooseLocalizedText = XMPNodeUtils.chooseLocalizedText(findNode, str3, str4);
        int intValue = ((Integer) chooseLocalizedText[0]).intValue();
        findNode = (XMPNode) chooseLocalizedText[1];
        if (intValue != 0) {
            return new XMPProperty() {
                public Object getValue() {
                    return findNode.getValue();
                }

                public PropertyOptions getOptions() {
                    return findNode.getOptions();
                }

                public String getLanguage() {
                    return findNode.getQualifier(1).getValue();
                }

                public String toString() {
                    return findNode.getValue().toString();
                }
            };
        }
        return null;
    }

    /* JADX WARNING: Missing block: B:38:0x00d6, code:
            if (r3 != false) goto L_0x0165;
     */
    /* JADX WARNING: Missing block: B:45:0x00ed, code:
            if (r3 != false) goto L_0x0165;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setLocalizedText(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertSpecificLang(str4);
        if (str3 != null) {
            str3 = Utils.normalizeLangValue(str3);
        } else {
            str3 = null;
        }
        str4 = Utils.normalizeLangValue(str4);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), true, new PropertyOptions(7680));
        if (findNode != null) {
            XMPNode xMPNode;
            boolean z;
            if (!findNode.getOptions().isArrayAltText()) {
                if (findNode.hasChildren() || !findNode.getOptions().isArrayAlternate()) {
                    throw new XMPException("Specified property is no alt-text array", 102);
                }
                findNode.getOptions().setArrayAltText(true);
            }
            Iterator iterateChildren = findNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                xMPNode = (XMPNode) iterateChildren.next();
                if (!xMPNode.hasQualifier() || !XMPConst.XML_LANG.equals(xMPNode.getQualifier(1).getName())) {
                    throw new XMPException("Language qualifier must be first", 102);
                } else if (XMPConst.X_DEFAULT.equals(xMPNode.getQualifier(1).getValue())) {
                    z = true;
                    break;
                }
            }
            xMPNode = null;
            z = false;
            if (xMPNode != null && findNode.getChildrenLength() > 1) {
                findNode.removeChild(xMPNode);
                findNode.addChild(1, xMPNode);
            }
            Object[] chooseLocalizedText = XMPNodeUtils.chooseLocalizedText(findNode, str3, str4);
            int intValue = ((Integer) chooseLocalizedText[0]).intValue();
            XMPNode xMPNode2 = (XMPNode) chooseLocalizedText[1];
            boolean equals = XMPConst.X_DEFAULT.equals(str4);
            switch (intValue) {
                case 0:
                    XMPNodeUtils.appendLangItem(findNode, XMPConst.X_DEFAULT, str5);
                    if (!equals) {
                        XMPNodeUtils.appendLangItem(findNode, str4, str5);
                    }
                case 1:
                    if (!equals) {
                        if (z && xMPNode != xMPNode2 && xMPNode != null && xMPNode.getValue().equals(xMPNode2.getValue())) {
                            xMPNode.setValue(str5);
                        }
                        xMPNode2.setValue(str5);
                        break;
                    }
                    Iterator iterateChildren2 = findNode.iterateChildren();
                    while (iterateChildren2.hasNext()) {
                        XMPNode xMPNode3 = (XMPNode) iterateChildren2.next();
                        if (xMPNode3 != xMPNode) {
                            Object value;
                            String value2 = xMPNode3.getValue();
                            if (xMPNode != null) {
                                value = xMPNode.getValue();
                            } else {
                                value = null;
                            }
                            if (value2.equals(value)) {
                                xMPNode3.setValue(str5);
                            }
                        }
                    }
                    if (xMPNode != null) {
                        xMPNode.setValue(str5);
                        break;
                    }
                    break;
                case 2:
                    if (z && xMPNode != xMPNode2 && xMPNode != null && xMPNode.getValue().equals(xMPNode2.getValue())) {
                        xMPNode.setValue(str5);
                    }
                    xMPNode2.setValue(str5);
                    break;
                case 3:
                    XMPNodeUtils.appendLangItem(findNode, str4, str5);
                    break;
                case 4:
                    if (xMPNode != null && findNode.getChildrenLength() == 1) {
                        xMPNode.setValue(str5);
                    }
                    XMPNodeUtils.appendLangItem(findNode, str4, str5);
                    break;
                case 5:
                    XMPNodeUtils.appendLangItem(findNode, str4, str5);
                    break;
                default:
                    throw new XMPException("Unexpected result from ChooseLocalizedText", 9);
            }
            z = true;
            if (!z && findNode.getChildrenLength() == 1) {
                XMPNodeUtils.appendLangItem(findNode, XMPConst.X_DEFAULT, str5);
                return;
            }
            return;
        }
        throw new XMPException("Failed to find or create array node", 102);
    }

    public void setLocalizedText(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setLocalizedText(str, str2, str3, str4, str5, null);
    }

    public XMPProperty getProperty(String str, String str2) throws XMPException {
        return getProperty(str, str2, 0);
    }

    protected XMPProperty getProperty(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        final XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        if (i == 0 || !findNode.getOptions().isCompositeProperty()) {
            final Object evaluateNodeValue = evaluateNodeValue(i, findNode);
            return new XMPProperty() {
                public Object getValue() {
                    return evaluateNodeValue;
                }

                public PropertyOptions getOptions() {
                    return findNode.getOptions();
                }

                public String getLanguage() {
                    return null;
                }

                public String toString() {
                    return evaluateNodeValue.toString();
                }
            };
        }
        throw new XMPException("Property must be simple when a value type is requested", 102);
    }

    protected Object getPropertyObject(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        if (i == 0 || !findNode.getOptions().isCompositeProperty()) {
            return evaluateNodeValue(i, findNode);
        }
        throw new XMPException("Property must be simple when a value type is requested", 102);
    }

    public Boolean getPropertyBoolean(String str, String str2) throws XMPException {
        return (Boolean) getPropertyObject(str, str2, 1);
    }

    public void setPropertyBoolean(String str, String str2, boolean z, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, z ? XMPConst.TRUESTR : XMPConst.FALSESTR, propertyOptions);
    }

    public void setPropertyBoolean(String str, String str2, boolean z) throws XMPException {
        setProperty(str, str2, z ? XMPConst.TRUESTR : XMPConst.FALSESTR, null);
    }

    public Integer getPropertyInteger(String str, String str2) throws XMPException {
        return (Integer) getPropertyObject(str, str2, 2);
    }

    public void setPropertyInteger(String str, String str2, int i, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Integer(i), propertyOptions);
    }

    public void setPropertyInteger(String str, String str2, int i) throws XMPException {
        setProperty(str, str2, new Integer(i), null);
    }

    public Long getPropertyLong(String str, String str2) throws XMPException {
        return (Long) getPropertyObject(str, str2, 3);
    }

    public void setPropertyLong(String str, String str2, long j, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Long(j), propertyOptions);
    }

    public void setPropertyLong(String str, String str2, long j) throws XMPException {
        setProperty(str, str2, new Long(j), null);
    }

    public Double getPropertyDouble(String str, String str2) throws XMPException {
        return (Double) getPropertyObject(str, str2, 4);
    }

    public void setPropertyDouble(String str, String str2, double d, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Double(d), propertyOptions);
    }

    public void setPropertyDouble(String str, String str2, double d) throws XMPException {
        setProperty(str, str2, new Double(d), null);
    }

    public XMPDateTime getPropertyDate(String str, String str2) throws XMPException {
        return (XMPDateTime) getPropertyObject(str, str2, 5);
    }

    public void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, xMPDateTime, propertyOptions);
    }

    public void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime) throws XMPException {
        setProperty(str, str2, xMPDateTime, null);
    }

    public Calendar getPropertyCalendar(String str, String str2) throws XMPException {
        return (Calendar) getPropertyObject(str, str2, 6);
    }

    public void setPropertyCalendar(String str, String str2, Calendar calendar, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, calendar, propertyOptions);
    }

    public void setPropertyCalendar(String str, String str2, Calendar calendar) throws XMPException {
        setProperty(str, str2, calendar, null);
    }

    public byte[] getPropertyBase64(String str, String str2) throws XMPException {
        return (byte[]) getPropertyObject(str, str2, 7);
    }

    public String getPropertyString(String str, String str2) throws XMPException {
        return (String) getPropertyObject(str, str2, 0);
    }

    public void setPropertyBase64(String str, String str2, byte[] bArr, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, bArr, propertyOptions);
    }

    public void setPropertyBase64(String str, String str2, byte[] bArr) throws XMPException {
        setProperty(str, str2, bArr, null);
    }

    public XMPProperty getQualifier(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append(XMPPathFactory.composeQualifierPath(str3, str4));
        return getProperty(str, stringBuilder.toString());
    }

    public XMPProperty getStructField(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertStructName(str2);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append(XMPPathFactory.composeStructFieldPath(str3, str4));
        return getProperty(str, stringBuilder.toString());
    }

    public XMPIterator iterator() throws XMPException {
        return iterator(null, null, null);
    }

    public XMPIterator iterator(IteratorOptions iteratorOptions) throws XMPException {
        return iterator(null, null, iteratorOptions);
    }

    public XMPIterator iterator(String str, String str2, IteratorOptions iteratorOptions) throws XMPException {
        return new XMPIteratorImpl(this, str, str2, iteratorOptions);
    }

    public void setArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode != null) {
            doSetArrayItem(findNode, i, str3, propertyOptions, false);
            return;
        }
        throw new XMPException("Specified array does not exist", 102);
    }

    public void setArrayItem(String str, String str2, int i, String str3) throws XMPException {
        setArrayItem(str, str2, i, str3, null);
    }

    public void insertArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode != null) {
            doSetArrayItem(findNode, i, str3, propertyOptions, true);
            return;
        }
        throw new XMPException("Specified array does not exist", 102);
    }

    public void insertArrayItem(String str, String str2, int i, String str3) throws XMPException {
        insertArrayItem(str, str2, i, str3, null);
    }

    public void setProperty(String str, String str2, Object obj, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        propertyOptions = XMPNodeUtils.verifySetOptions(propertyOptions, obj);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), true, propertyOptions);
        if (findNode != null) {
            setNode(findNode, obj, propertyOptions, false);
            return;
        }
        throw new XMPException("Specified property does not exist", 102);
    }

    public void setProperty(String str, String str2, Object obj) throws XMPException {
        setProperty(str, str2, obj, null);
    }

    public void setQualifier(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        if (doesPropertyExist(str, str2)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(XMPPathFactory.composeQualifierPath(str3, str4));
            setProperty(str, stringBuilder.toString(), str5, propertyOptions);
            return;
        }
        throw new XMPException("Specified property does not exist!", 102);
    }

    public void setQualifier(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setQualifier(str, str2, str3, str4, str5, null);
    }

    public void setStructField(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertStructName(str2);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append(XMPPathFactory.composeStructFieldPath(str3, str4));
        setProperty(str, stringBuilder.toString(), str5, propertyOptions);
    }

    public void setStructField(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setStructField(str, str2, str3, str4, str5, null);
    }

    public String getObjectName() {
        return this.tree.getName() != null ? this.tree.getName() : "";
    }

    public void setObjectName(String str) {
        this.tree.setName(str);
    }

    public String getPacketHeader() {
        return this.packetHeader;
    }

    public void setPacketHeader(String str) {
        this.packetHeader = str;
    }

    public Object clone() {
        return new XMPMetaImpl((XMPNode) this.tree.clone());
    }

    public String dumpObject() {
        return getRoot().dumpNode(true);
    }

    public void sort() {
        this.tree.sort();
    }

    public void normalize(ParseOptions parseOptions) throws XMPException {
        if (parseOptions == null) {
            parseOptions = new ParseOptions();
        }
        XMPNormalizer.process(this, parseOptions);
    }

    public XMPNode getRoot() {
        return this.tree;
    }

    private void doSetArrayItem(XMPNode xMPNode, int i, String str, PropertyOptions propertyOptions, boolean z) throws XMPException {
        XMPNode xMPNode2 = new XMPNode(XMPConst.ARRAY_ITEM_NAME, null);
        propertyOptions = XMPNodeUtils.verifySetOptions(propertyOptions, str);
        int childrenLength = z ? xMPNode.getChildrenLength() + 1 : xMPNode.getChildrenLength();
        if (i == -1) {
            i = childrenLength;
        }
        if (1 > i || i > childrenLength) {
            throw new XMPException("Array index out of bounds", 104);
        }
        if (!z) {
            xMPNode.removeChild(i);
        }
        xMPNode.addChild(i, xMPNode2);
        setNode(xMPNode2, str, propertyOptions, false);
    }

    void setNode(XMPNode xMPNode, Object obj, PropertyOptions propertyOptions, boolean z) throws XMPException {
        if (z) {
            xMPNode.clear();
        }
        xMPNode.getOptions().mergeWith(propertyOptions);
        if (!xMPNode.getOptions().isCompositeProperty()) {
            XMPNodeUtils.setNodeValue(xMPNode, obj);
        } else if (obj == null || obj.toString().length() <= 0) {
            xMPNode.removeChildren();
        } else {
            throw new XMPException("Composite nodes can't have values", 102);
        }
    }

    private Object evaluateNodeValue(int i, XMPNode xMPNode) throws XMPException {
        String value = xMPNode.getValue();
        switch (i) {
            case 1:
                return new Boolean(XMPUtils.convertToBoolean(value));
            case 2:
                return new Integer(XMPUtils.convertToInteger(value));
            case 3:
                return new Long(XMPUtils.convertToLong(value));
            case 4:
                return new Double(XMPUtils.convertToDouble(value));
            case 5:
                return XMPUtils.convertToDate(value);
            case 6:
                return XMPUtils.convertToDate(value).getCalendar();
            case 7:
                return XMPUtils.decodeBase64(value);
            default:
                if (value == null && !xMPNode.getOptions().isCompositeProperty()) {
                    value = "";
                }
                return value;
        }
    }
}
