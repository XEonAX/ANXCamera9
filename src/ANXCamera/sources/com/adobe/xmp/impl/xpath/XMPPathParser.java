package com.adobe.xmp.impl.xpath;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.impl.Utils;
import com.adobe.xmp.properties.XMPAliasInfo;

public final class XMPPathParser {
    private XMPPathParser() {
    }

    public static XMPPath expandXPath(String str, String str2) throws XMPException {
        if (str == null || str2 == null) {
            throw new XMPException("Parameter must not be null", 4);
        }
        XMPPath xMPPath = new XMPPath();
        PathPosition pathPosition = new PathPosition();
        pathPosition.path = str2;
        parseRootNode(str, pathPosition, xMPPath);
        while (pathPosition.stepEnd < str2.length()) {
            XMPPathSegment parseStructSegment;
            pathPosition.stepBegin = pathPosition.stepEnd;
            skipPathDelimiter(str2, pathPosition);
            pathPosition.stepEnd = pathPosition.stepBegin;
            if (str2.charAt(pathPosition.stepBegin) != '[') {
                parseStructSegment = parseStructSegment(pathPosition);
            } else {
                parseStructSegment = parseIndexSegment(pathPosition);
            }
            StringBuilder stringBuilder;
            if (parseStructSegment.getKind() == 1) {
                if (parseStructSegment.getName().charAt(0) == '@') {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("?");
                    stringBuilder.append(parseStructSegment.getName().substring(1));
                    parseStructSegment.setName(stringBuilder.toString());
                    if (!"?xml:lang".equals(parseStructSegment.getName())) {
                        throw new XMPException("Only xml:lang allowed with '@'", 102);
                    }
                }
                if (parseStructSegment.getName().charAt(0) == '?') {
                    pathPosition.nameStart++;
                    parseStructSegment.setKind(2);
                }
                verifyQualName(pathPosition.path.substring(pathPosition.nameStart, pathPosition.nameEnd));
            } else if (parseStructSegment.getKind() != 6) {
                continue;
            } else {
                if (parseStructSegment.getName().charAt(1) == '@') {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("[?");
                    stringBuilder.append(parseStructSegment.getName().substring(2));
                    parseStructSegment.setName(stringBuilder.toString());
                    if (!parseStructSegment.getName().startsWith("[?xml:lang=")) {
                        throw new XMPException("Only xml:lang allowed with '@'", 102);
                    }
                }
                if (parseStructSegment.getName().charAt(1) == '?') {
                    pathPosition.nameStart++;
                    parseStructSegment.setKind(5);
                    verifyQualName(pathPosition.path.substring(pathPosition.nameStart, pathPosition.nameEnd));
                }
            }
            xMPPath.add(parseStructSegment);
        }
        return xMPPath;
    }

    private static void skipPathDelimiter(String str, PathPosition pathPosition) throws XMPException {
        if (str.charAt(pathPosition.stepBegin) == '/') {
            pathPosition.stepBegin++;
            if (pathPosition.stepBegin >= str.length()) {
                throw new XMPException("Empty XMPPath segment", 102);
            }
        }
        if (str.charAt(pathPosition.stepBegin) == '*') {
            pathPosition.stepBegin++;
            if (pathPosition.stepBegin >= str.length() || str.charAt(pathPosition.stepBegin) != '[') {
                throw new XMPException("Missing '[' after '*'", 102);
            }
        }
    }

    private static XMPPathSegment parseStructSegment(PathPosition pathPosition) throws XMPException {
        pathPosition.nameStart = pathPosition.stepBegin;
        while (pathPosition.stepEnd < pathPosition.path.length() && "/[*".indexOf(pathPosition.path.charAt(pathPosition.stepEnd)) < 0) {
            pathPosition.stepEnd++;
        }
        pathPosition.nameEnd = pathPosition.stepEnd;
        if (pathPosition.stepEnd != pathPosition.stepBegin) {
            return new XMPPathSegment(pathPosition.path.substring(pathPosition.stepBegin, pathPosition.stepEnd), 1);
        }
        throw new XMPException("Empty XMPPath segment", 102);
    }

    private static XMPPathSegment parseIndexSegment(PathPosition pathPosition) throws XMPException {
        XMPPathSegment xMPPathSegment;
        pathPosition.stepEnd++;
        if ('0' > pathPosition.path.charAt(pathPosition.stepEnd) || pathPosition.path.charAt(pathPosition.stepEnd) > '9') {
            while (pathPosition.stepEnd < pathPosition.path.length() && pathPosition.path.charAt(pathPosition.stepEnd) != ']' && pathPosition.path.charAt(pathPosition.stepEnd) != '=') {
                pathPosition.stepEnd++;
            }
            if (pathPosition.stepEnd >= pathPosition.path.length()) {
                throw new XMPException("Missing ']' or '=' for array index", 102);
            } else if (pathPosition.path.charAt(pathPosition.stepEnd) != ']') {
                pathPosition.nameStart = pathPosition.stepBegin + 1;
                pathPosition.nameEnd = pathPosition.stepEnd;
                pathPosition.stepEnd++;
                char charAt = pathPosition.path.charAt(pathPosition.stepEnd);
                if (charAt == '\'' || charAt == '\"') {
                    pathPosition.stepEnd++;
                    while (pathPosition.stepEnd < pathPosition.path.length()) {
                        if (pathPosition.path.charAt(pathPosition.stepEnd) == charAt) {
                            if (pathPosition.stepEnd + 1 >= pathPosition.path.length() || pathPosition.path.charAt(pathPosition.stepEnd + 1) != charAt) {
                                break;
                            }
                            pathPosition.stepEnd++;
                        }
                        pathPosition.stepEnd++;
                    }
                    if (pathPosition.stepEnd < pathPosition.path.length()) {
                        pathPosition.stepEnd++;
                        xMPPathSegment = new XMPPathSegment(null, 6);
                    } else {
                        throw new XMPException("No terminating quote for array selector", 102);
                    }
                }
                throw new XMPException("Invalid quote in array selector", 102);
            } else if ("[last()".equals(pathPosition.path.substring(pathPosition.stepBegin, pathPosition.stepEnd))) {
                xMPPathSegment = new XMPPathSegment(null, 4);
            } else {
                throw new XMPException("Invalid non-numeric array index", 102);
            }
        }
        while (pathPosition.stepEnd < pathPosition.path.length() && '0' <= pathPosition.path.charAt(pathPosition.stepEnd) && pathPosition.path.charAt(pathPosition.stepEnd) <= '9') {
            pathPosition.stepEnd++;
        }
        xMPPathSegment = new XMPPathSegment(null, 3);
        if (pathPosition.stepEnd >= pathPosition.path.length() || pathPosition.path.charAt(pathPosition.stepEnd) != ']') {
            throw new XMPException("Missing ']' for array index", 102);
        }
        pathPosition.stepEnd++;
        xMPPathSegment.setName(pathPosition.path.substring(pathPosition.stepBegin, pathPosition.stepEnd));
        return xMPPathSegment;
    }

    private static void parseRootNode(String str, PathPosition pathPosition, XMPPath xMPPath) throws XMPException {
        while (pathPosition.stepEnd < pathPosition.path.length() && "/[*".indexOf(pathPosition.path.charAt(pathPosition.stepEnd)) < 0) {
            pathPosition.stepEnd++;
        }
        if (pathPosition.stepEnd != pathPosition.stepBegin) {
            String verifyXPathRoot = verifyXPathRoot(str, pathPosition.path.substring(pathPosition.stepBegin, pathPosition.stepEnd));
            XMPAliasInfo findAlias = XMPMetaFactory.getSchemaRegistry().findAlias(verifyXPathRoot);
            if (findAlias == null) {
                xMPPath.add(new XMPPathSegment(str, Integer.MIN_VALUE));
                xMPPath.add(new XMPPathSegment(verifyXPathRoot, 1));
                return;
            }
            xMPPath.add(new XMPPathSegment(findAlias.getNamespace(), Integer.MIN_VALUE));
            XMPPathSegment xMPPathSegment = new XMPPathSegment(verifyXPathRoot(findAlias.getNamespace(), findAlias.getPropName()), 1);
            xMPPathSegment.setAlias(true);
            xMPPathSegment.setAliasForm(findAlias.getAliasForm().getOptions());
            xMPPath.add(xMPPathSegment);
            if (findAlias.getAliasForm().isArrayAltText()) {
                xMPPathSegment = new XMPPathSegment("[?xml:lang='x-default']", 5);
                xMPPathSegment.setAlias(true);
                xMPPathSegment.setAliasForm(findAlias.getAliasForm().getOptions());
                xMPPath.add(xMPPathSegment);
                return;
            } else if (findAlias.getAliasForm().isArray()) {
                xMPPathSegment = new XMPPathSegment("[1]", 3);
                xMPPathSegment.setAlias(true);
                xMPPathSegment.setAliasForm(findAlias.getAliasForm().getOptions());
                xMPPath.add(xMPPathSegment);
                return;
            } else {
                return;
            }
        }
        throw new XMPException("Empty initial XMPPath step", 102);
    }

    private static void verifyQualName(String str) throws XMPException {
        int indexOf = str.indexOf(58);
        if (indexOf > 0) {
            str = str.substring(0, indexOf);
            if (Utils.isXMLNameNS(str)) {
                if (XMPMetaFactory.getSchemaRegistry().getNamespaceURI(str) == null) {
                    throw new XMPException("Unknown namespace prefix for qualified name", 102);
                }
                return;
            }
        }
        throw new XMPException("Ill-formed qualified name", 102);
    }

    private static void verifySimpleXMLName(String str) throws XMPException {
        if (!Utils.isXMLName(str)) {
            throw new XMPException("Bad XML name", 102);
        }
    }

    private static String verifyXPathRoot(String str, String str2) throws XMPException {
        if (str == null || str.length() == 0) {
            throw new XMPException("Schema namespace URI is required", 101);
        } else if (str2.charAt(0) == '?' || str2.charAt(0) == '@') {
            throw new XMPException("Top level name must not be a qualifier", 102);
        } else if (str2.indexOf(47) >= 0 || str2.indexOf(91) >= 0) {
            throw new XMPException("Top level name must be simple", 102);
        } else {
            String namespacePrefix = XMPMetaFactory.getSchemaRegistry().getNamespacePrefix(str);
            if (namespacePrefix != null) {
                int indexOf = str2.indexOf(58);
                if (indexOf < 0) {
                    verifySimpleXMLName(str2);
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(namespacePrefix);
                    stringBuilder.append(str2);
                    return stringBuilder.toString();
                }
                verifySimpleXMLName(str2.substring(0, indexOf));
                verifySimpleXMLName(str2.substring(indexOf));
                String substring = str2.substring(0, indexOf + 1);
                str = XMPMetaFactory.getSchemaRegistry().getNamespacePrefix(str);
                if (str == null) {
                    throw new XMPException("Unknown schema namespace prefix", 101);
                } else if (substring.equals(str)) {
                    return str2;
                } else {
                    throw new XMPException("Schema namespace URI and prefix mismatch", 101);
                }
            }
            throw new XMPException("Unregistered schema namespace URI", 101);
        }
    }
}
