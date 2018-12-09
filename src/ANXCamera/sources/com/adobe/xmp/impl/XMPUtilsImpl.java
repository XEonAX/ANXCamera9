package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPAliasInfo;
import java.util.Iterator;

public class XMPUtilsImpl implements XMPConst {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String COMMAS = ",，､﹐﹑、،՝";
    private static final String CONTROLS = "  ";
    private static final String QUOTES = "\"[]«»〝〞〟―‹›";
    private static final String SEMICOLA = ";；﹔؛;";
    private static final String SPACES = " 　〿";
    private static final int UCK_COMMA = 2;
    private static final int UCK_CONTROL = 5;
    private static final int UCK_NORMAL = 0;
    private static final int UCK_QUOTE = 4;
    private static final int UCK_SEMICOLON = 3;
    private static final int UCK_SPACE = 1;

    private XMPUtilsImpl() {
    }

    public static String catenateArrayItems(XMPMeta xMPMeta, String str, String str2, String str3, String str4, boolean z) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertImplementation(xMPMeta);
        if (str3 == null || str3.length() == 0) {
            str3 = "; ";
        }
        if (str4 == null || str4.length() == 0) {
            str4 = "\"";
        }
        XMPMetaImpl xMPMetaImpl = (XMPMetaImpl) xMPMeta;
        XMPNode findNode = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return "";
        }
        if (!findNode.getOptions().isArray() || findNode.getOptions().isArrayAlternate()) {
            throw new XMPException("Named property must be non-alternate array", 4);
        }
        checkSeparator(str3);
        char charAt = str4.charAt(0);
        char checkQuotes = checkQuotes(str4, charAt);
        StringBuffer stringBuffer = new StringBuffer();
        Iterator iterateChildren = findNode.iterateChildren();
        while (iterateChildren.hasNext()) {
            XMPNode xMPNode = (XMPNode) iterateChildren.next();
            if (xMPNode.getOptions().isCompositeProperty()) {
                throw new XMPException("Array items must be simple", 4);
            }
            stringBuffer.append(applyQuotes(xMPNode.getValue(), charAt, checkQuotes, z));
            if (iterateChildren.hasNext()) {
                stringBuffer.append(str3);
            }
        }
        return stringBuffer.toString();
    }

    public static void separateArrayItems(XMPMeta xMPMeta, String str, String str2, String str3, PropertyOptions propertyOptions, boolean z) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        if (str3 != null) {
            ParameterAsserts.assertImplementation(xMPMeta);
            XMPNode separateFindCreateArray = separateFindCreateArray(str, str2, propertyOptions, (XMPMetaImpl) xMPMeta);
            int length = str3.length();
            int i = 0;
            int i2 = 0;
            char c = i2;
            while (i < length) {
                while (i < length) {
                    c = str3.charAt(i);
                    i2 = classifyCharacter(c);
                    if (i2 == 0 || i2 == 4) {
                        break;
                    }
                    i++;
                }
                if (i < length) {
                    String substring;
                    int i3 = 1;
                    char c2;
                    if (i2 != 4) {
                        c2 = c;
                        int i4 = i2;
                        i2 = i;
                        while (i2 < length) {
                            c2 = str3.charAt(i2);
                            i4 = classifyCharacter(c2);
                            if (!(i4 == 0 || i4 == 4 || (i4 == 2 && z))) {
                                if (i4 == 1) {
                                    int i5 = i2 + 1;
                                    if (i5 >= length) {
                                        break;
                                    }
                                    c2 = str3.charAt(i5);
                                    i5 = classifyCharacter(c2);
                                    if (i5 != 0) {
                                        if (i5 != 4) {
                                            if (i5 != 2 || !z) {
                                                break;
                                            }
                                        } else {
                                            continue;
                                        }
                                    } else {
                                        continue;
                                    }
                                } else {
                                    break;
                                }
                            }
                            i2++;
                        }
                        substring = str3.substring(i, i2);
                        i = i2;
                        i2 = i4;
                        c = c2;
                    } else {
                        c2 = getClosingQuote(c);
                        i++;
                        substring = "";
                        char c3 = c;
                        while (i < length) {
                            c3 = str3.charAt(i);
                            i2 = classifyCharacter(c3);
                            StringBuilder stringBuilder;
                            if (i2 == 4 && isSurroundingQuote(c3, c, c2)) {
                                char charAt;
                                int i6 = i + 1;
                                if (i6 < length) {
                                    charAt = str3.charAt(i6);
                                    classifyCharacter(charAt);
                                } else {
                                    charAt = ';';
                                }
                                if (c3 != charAt) {
                                    if (isClosingingQuote(c3, c, c2)) {
                                        c = c3;
                                        i = i6;
                                        break;
                                    }
                                    stringBuilder = new StringBuilder();
                                    stringBuilder.append(substring);
                                    stringBuilder.append(c3);
                                    substring = stringBuilder.toString();
                                } else {
                                    StringBuilder stringBuilder2 = new StringBuilder();
                                    stringBuilder2.append(substring);
                                    stringBuilder2.append(c3);
                                    substring = stringBuilder2.toString();
                                    i = i6;
                                }
                            } else {
                                stringBuilder = new StringBuilder();
                                stringBuilder.append(substring);
                                stringBuilder.append(c3);
                                substring = stringBuilder.toString();
                            }
                            i++;
                        }
                        c = c3;
                    }
                    while (i3 <= separateFindCreateArray.getChildrenLength()) {
                        if (substring.equals(separateFindCreateArray.getChild(i3).getValue())) {
                            break;
                        }
                        i3++;
                    }
                    i3 = -1;
                    if (i3 < 0) {
                        separateFindCreateArray.addChild(new XMPNode(XMPConst.ARRAY_ITEM_NAME, substring, null));
                    }
                } else {
                    return;
                }
            }
            return;
        }
        throw new XMPException("Parameter must not be null", 4);
    }

    private static XMPNode separateFindCreateArray(String str, String str2, PropertyOptions propertyOptions, XMPMetaImpl xMPMetaImpl) throws XMPException {
        propertyOptions = XMPNodeUtils.verifySetOptions(propertyOptions, null);
        if (propertyOptions.isOnlyArrayOptions()) {
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPNode findNode = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), expandXPath, false, null);
            if (findNode != null) {
                PropertyOptions options = findNode.getOptions();
                if (!options.isArray() || options.isArrayAlternate()) {
                    throw new XMPException("Named property must be non-alternate array", 102);
                } else if (propertyOptions.equalArrayTypes(options)) {
                    throw new XMPException("Mismatch of specified and existing array form", 102);
                }
            }
            findNode = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), expandXPath, true, propertyOptions.setArray(true));
            if (findNode == null) {
                throw new XMPException("Failed to create named array", 102);
            }
            return findNode;
        }
        throw new XMPException("Options can only provide array form", 103);
    }

    public static void removeProperties(XMPMeta xMPMeta, String str, String str2, boolean z, boolean z2) throws XMPException {
        ParameterAsserts.assertImplementation(xMPMeta);
        XMPMetaImpl xMPMetaImpl = (XMPMetaImpl) xMPMeta;
        if (str2 == null || str2.length() <= 0) {
            if (str == null || str.length() <= 0) {
                Iterator iterateChildren = xMPMetaImpl.getRoot().iterateChildren();
                while (iterateChildren.hasNext()) {
                    if (removeSchemaChildren((XMPNode) iterateChildren.next(), z)) {
                        iterateChildren.remove();
                    }
                }
                return;
            }
            XMPNode findSchemaNode = XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), str, false);
            if (findSchemaNode != null && removeSchemaChildren(findSchemaNode, z)) {
                xMPMetaImpl.getRoot().removeChild(findSchemaNode);
            }
            if (z2) {
                XMPAliasInfo[] findAliases = XMPMetaFactory.getSchemaRegistry().findAliases(str);
                for (XMPAliasInfo xMPAliasInfo : findAliases) {
                    XMPNode findNode = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), XMPPathParser.expandXPath(xMPAliasInfo.getNamespace(), xMPAliasInfo.getPropName()), false, null);
                    if (findNode != null) {
                        findNode.getParent().removeChild(findNode);
                    }
                }
            }
        } else if (str == null || str.length() == 0) {
            throw new XMPException("Property name requires schema namespace", 4);
        } else {
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPNode findNode2 = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), expandXPath, false, null);
            if (findNode2 == null) {
                return;
            }
            if (z || !Utils.isInternalProperty(expandXPath.getSegment(0).getName(), expandXPath.getSegment(1).getName())) {
                XMPNode parent = findNode2.getParent();
                parent.removeChild(findNode2);
                if (parent.getOptions().isSchemaNode() && !parent.hasChildren()) {
                    parent.getParent().removeChild(parent);
                }
            }
        }
    }

    public static void appendProperties(XMPMeta xMPMeta, XMPMeta xMPMeta2, boolean z, boolean z2, boolean z3) throws XMPException {
        ParameterAsserts.assertImplementation(xMPMeta);
        ParameterAsserts.assertImplementation(xMPMeta2);
        XMPMetaImpl xMPMetaImpl = (XMPMetaImpl) xMPMeta2;
        Iterator iterateChildren = ((XMPMetaImpl) xMPMeta).getRoot().iterateChildren();
        while (iterateChildren.hasNext()) {
            XMPNode xMPNode = (XMPNode) iterateChildren.next();
            XMPNode findSchemaNode = XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), xMPNode.getName(), false);
            boolean z4 = true;
            if (findSchemaNode == null) {
                findSchemaNode = new XMPNode(xMPNode.getName(), xMPNode.getValue(), new PropertyOptions().setSchemaNode(true));
                xMPMetaImpl.getRoot().addChild(findSchemaNode);
            } else {
                z4 = false;
            }
            Iterator iterateChildren2 = xMPNode.iterateChildren();
            while (iterateChildren2.hasNext()) {
                XMPNode xMPNode2 = (XMPNode) iterateChildren2.next();
                if (z || !Utils.isInternalProperty(xMPNode.getName(), xMPNode2.getName())) {
                    appendSubtree(xMPMetaImpl, xMPNode2, findSchemaNode, z2, z3);
                }
            }
            if (!findSchemaNode.hasChildren() && (z4 || z3)) {
                xMPMetaImpl.getRoot().removeChild(findSchemaNode);
            }
        }
    }

    private static boolean removeSchemaChildren(XMPNode xMPNode, boolean z) {
        Iterator iterateChildren = xMPNode.iterateChildren();
        while (iterateChildren.hasNext()) {
            XMPNode xMPNode2 = (XMPNode) iterateChildren.next();
            if (z || !Utils.isInternalProperty(xMPNode.getName(), xMPNode2.getName())) {
                iterateChildren.remove();
            }
        }
        return xMPNode.hasChildren() ^ 1;
    }

    private static void appendSubtree(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, XMPNode xMPNode2, boolean z, boolean z2) throws XMPException {
        XMPNode findChildNode = XMPNodeUtils.findChildNode(xMPNode2, xMPNode.getName(), false);
        boolean z3 = z2 && (xMPNode.getOptions().isSimple() ? !(xMPNode.getValue() == null || xMPNode.getValue().length() == 0) : xMPNode.hasChildren());
        if (z2 && z3) {
            if (findChildNode != null) {
                xMPNode2.removeChild(findChildNode);
            }
        } else if (findChildNode == null) {
            xMPNode2.addChild((XMPNode) xMPNode.clone());
        } else if (z) {
            xMPMetaImpl.setNode(findChildNode, xMPNode.getValue(), xMPNode.getOptions(), true);
            xMPNode2.removeChild(findChildNode);
            xMPNode2.addChild((XMPNode) xMPNode.clone());
        } else {
            PropertyOptions options = xMPNode.getOptions();
            if (options == findChildNode.getOptions()) {
                Iterator iterateChildren;
                if (options.isStruct()) {
                    Iterator iterateChildren2 = xMPNode.iterateChildren();
                    while (iterateChildren2.hasNext()) {
                        appendSubtree(xMPMetaImpl, (XMPNode) iterateChildren2.next(), findChildNode, z, z2);
                        if (z2 && !findChildNode.hasChildren()) {
                            xMPNode2.removeChild(findChildNode);
                        }
                    }
                } else if (options.isArrayAltText()) {
                    iterateChildren = xMPNode.iterateChildren();
                    while (iterateChildren.hasNext()) {
                        xMPNode = (XMPNode) iterateChildren.next();
                        if (xMPNode.hasQualifier()) {
                            if (XMPConst.XML_LANG.equals(xMPNode.getQualifier(1).getName())) {
                                int lookupLanguageItem = XMPNodeUtils.lookupLanguageItem(findChildNode, xMPNode.getQualifier(1).getValue());
                                if (z2 && (xMPNode.getValue() == null || xMPNode.getValue().length() == 0)) {
                                    if (lookupLanguageItem != -1) {
                                        findChildNode.removeChild(lookupLanguageItem);
                                        if (!findChildNode.hasChildren()) {
                                            xMPNode2.removeChild(findChildNode);
                                        }
                                    }
                                } else if (lookupLanguageItem == -1) {
                                    if (XMPConst.X_DEFAULT.equals(xMPNode.getQualifier(1).getValue()) && findChildNode.hasChildren()) {
                                        XMPNode xMPNode3 = new XMPNode(xMPNode.getName(), xMPNode.getValue(), xMPNode.getOptions());
                                        xMPNode.cloneSubtree(xMPNode3);
                                        findChildNode.addChild(1, xMPNode3);
                                    } else {
                                        xMPNode.cloneSubtree(findChildNode);
                                    }
                                }
                            }
                        }
                    }
                } else if (options.isArray()) {
                    iterateChildren = xMPNode.iterateChildren();
                    while (iterateChildren.hasNext()) {
                        xMPNode = (XMPNode) iterateChildren.next();
                        Iterator iterateChildren3 = findChildNode.iterateChildren();
                        z2 = false;
                        while (iterateChildren3.hasNext()) {
                            if (itemValuesMatch(xMPNode, (XMPNode) iterateChildren3.next())) {
                                z2 = true;
                            }
                        }
                        if (!z2) {
                            xMPNode = (XMPNode) xMPNode.clone();
                            xMPNode2.addChild(xMPNode);
                            findChildNode = xMPNode;
                        }
                    }
                }
            }
        }
    }

    private static boolean itemValuesMatch(XMPNode xMPNode, XMPNode xMPNode2) throws XMPException {
        PropertyOptions options = xMPNode.getOptions();
        if (options.equals(xMPNode2.getOptions())) {
            return false;
        }
        Iterator iterateChildren;
        XMPNode xMPNode3;
        if (options.getOptions() == 0) {
            if (!xMPNode.getValue().equals(xMPNode2.getValue()) || xMPNode.getOptions().getHasLanguage() != xMPNode2.getOptions().getHasLanguage()) {
                return false;
            }
            if (!xMPNode.getOptions().getHasLanguage() || xMPNode.getQualifier(1).getValue().equals(xMPNode2.getQualifier(1).getValue())) {
                return true;
            }
            return false;
        } else if (!options.isStruct()) {
            iterateChildren = xMPNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                boolean z;
                xMPNode3 = (XMPNode) iterateChildren.next();
                Iterator iterateChildren2 = xMPNode2.iterateChildren();
                while (iterateChildren2.hasNext()) {
                    if (itemValuesMatch(xMPNode3, (XMPNode) iterateChildren2.next())) {
                        z = true;
                        break;
                    }
                }
                z = false;
                if (!z) {
                    return false;
                }
            }
        } else if (xMPNode.getChildrenLength() != xMPNode2.getChildrenLength()) {
            return false;
        } else {
            iterateChildren = xMPNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                xMPNode3 = (XMPNode) iterateChildren.next();
                XMPNode findChildNode = XMPNodeUtils.findChildNode(xMPNode2, xMPNode3.getName(), false);
                if (findChildNode == null || !itemValuesMatch(xMPNode3, findChildNode)) {
                    return false;
                }
            }
        }
        return true;
    }

    private static void checkSeparator(String str) throws XMPException {
        int i = 0;
        int i2 = 0;
        while (i < str.length()) {
            int classifyCharacter = classifyCharacter(str.charAt(i));
            if (classifyCharacter == 3) {
                if (i2 == 0) {
                    i2 = 1;
                } else {
                    throw new XMPException("Separator can have only one semicolon", 4);
                }
            } else if (classifyCharacter != 1) {
                throw new XMPException("Separator can have only spaces and one semicolon", 4);
            }
            i++;
        }
        if (i2 == 0) {
            throw new XMPException("Separator must have one semicolon", 4);
        }
    }

    private static char checkQuotes(String str, char c) throws XMPException {
        if (classifyCharacter(c) == 4) {
            char c2;
            if (str.length() == 1) {
                c2 = c;
            } else {
                c2 = str.charAt(1);
                if (classifyCharacter(c2) != 4) {
                    throw new XMPException("Invalid quoting character", 4);
                }
            }
            if (c2 == getClosingQuote(c)) {
                return c2;
            }
            throw new XMPException("Mismatched quote pair", 4);
        }
        throw new XMPException("Invalid quoting character", 4);
    }

    private static int classifyCharacter(char c) {
        if (SPACES.indexOf(c) >= 0 || (8192 <= c && c <= 8203)) {
            return 1;
        }
        if (COMMAS.indexOf(c) >= 0) {
            return 2;
        }
        if (SEMICOLA.indexOf(c) >= 0) {
            return 3;
        }
        if (QUOTES.indexOf(c) >= 0 || ((12296 <= c && c <= 12303) || (8216 <= c && c <= 8223))) {
            return 4;
        }
        if (c < ' ' || CONTROLS.indexOf(c) >= 0) {
            return 5;
        }
        return 0;
    }

    private static char getClosingQuote(char c) {
        switch (c) {
            case '\"':
                return '\"';
            case '[':
                return ']';
            case 171:
                return 187;
            case 187:
                return 171;
            case 8213:
                return 8213;
            case 8216:
                return 8217;
            case 8218:
                return 8219;
            case 8220:
                return 8221;
            case 8222:
                return 8223;
            case 8249:
                return 8250;
            case 8250:
                return 8249;
            case 12296:
                return 12297;
            case 12298:
                return 12299;
            case 12300:
                return 12301;
            case 12302:
                return 12303;
            case 12317:
                return 12319;
            default:
                return 0;
        }
    }

    private static String applyQuotes(String str, char c, char c2, boolean z) {
        if (str == null) {
            str = "";
        }
        int i = 0;
        int i2 = i;
        while (i < str.length()) {
            int classifyCharacter = classifyCharacter(str.charAt(i));
            if (i == 0 && classifyCharacter == 4) {
                break;
            }
            if (classifyCharacter != 1) {
                if (classifyCharacter == 3 || classifyCharacter == 5 || (classifyCharacter == 2 && !z)) {
                    break;
                }
                i2 = 0;
            } else if (i2 != 0) {
                break;
            } else {
                i2 = 1;
            }
            i++;
        }
        if (i >= str.length()) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer(str.length() + 2);
        i2 = 0;
        while (i2 <= i && classifyCharacter(str.charAt(i)) != 4) {
            i2++;
        }
        stringBuffer.append(c);
        stringBuffer.append(str.substring(0, i2));
        while (i2 < str.length()) {
            stringBuffer.append(str.charAt(i2));
            if (classifyCharacter(str.charAt(i2)) == 4 && isSurroundingQuote(str.charAt(i2), c, c2)) {
                stringBuffer.append(str.charAt(i2));
            }
            i2++;
        }
        stringBuffer.append(c2);
        return stringBuffer.toString();
    }

    private static boolean isSurroundingQuote(char c, char c2, char c3) {
        return c == c2 || isClosingingQuote(c, c2, c3);
    }

    private static boolean isClosingingQuote(char c, char c2, char c3) {
        return c == c3 || ((c2 == 12317 && c == 12318) || c == 12319);
    }
}
