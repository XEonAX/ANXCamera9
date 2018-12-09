package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPDateTime;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.XMPUtils;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.ParseOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPAliasInfo;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class XMPNormalizer {
    private static Map dcArrayForms;

    static {
        initDCArrays();
    }

    private XMPNormalizer() {
    }

    static XMPMeta process(XMPMetaImpl xMPMetaImpl, ParseOptions parseOptions) throws XMPException {
        XMPNode root = xMPMetaImpl.getRoot();
        touchUpDataModel(xMPMetaImpl);
        moveExplicitAliases(root, parseOptions);
        tweakOldXMP(root);
        deleteEmptySchemas(root);
        return xMPMetaImpl;
    }

    private static void tweakOldXMP(XMPNode xMPNode) throws XMPException {
        if (xMPNode.getName() != null && xMPNode.getName().length() >= 36) {
            String toLowerCase = xMPNode.getName().toLowerCase();
            if (toLowerCase.startsWith("uuid:")) {
                toLowerCase = toLowerCase.substring(5);
            }
            if (Utils.checkUUIDFormat(toLowerCase)) {
                XMPNode findNode = XMPNodeUtils.findNode(xMPNode, XMPPathParser.expandXPath(XMPConst.NS_XMP_MM, "InstanceID"), true, null);
                if (findNode != null) {
                    findNode.setOptions(null);
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("uuid:");
                    stringBuilder.append(toLowerCase);
                    findNode.setValue(stringBuilder.toString());
                    findNode.removeChildren();
                    findNode.removeQualifiers();
                    xMPNode.setName(null);
                    return;
                }
                throw new XMPException("Failure creating xmpMM:InstanceID", 9);
            }
        }
    }

    private static void touchUpDataModel(XMPMetaImpl xMPMetaImpl) throws XMPException {
        XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), XMPConst.NS_DC, true);
        Iterator iterateChildren = xMPMetaImpl.getRoot().iterateChildren();
        while (iterateChildren.hasNext()) {
            XMPNode xMPNode = (XMPNode) iterateChildren.next();
            if (XMPConst.NS_DC.equals(xMPNode.getName())) {
                normalizeDCArrays(xMPNode);
            } else if (XMPConst.NS_EXIF.equals(xMPNode.getName())) {
                fixGPSTimeStamp(xMPNode);
                xMPNode = XMPNodeUtils.findChildNode(xMPNode, "exif:UserComment", false);
                if (xMPNode != null) {
                    repairAltText(xMPNode);
                }
            } else if (XMPConst.NS_DM.equals(xMPNode.getName())) {
                xMPNode = XMPNodeUtils.findChildNode(xMPNode, "xmpDM:copyright", false);
                if (xMPNode != null) {
                    migrateAudioCopyright(xMPMetaImpl, xMPNode);
                }
            } else if (XMPConst.NS_XMP_RIGHTS.equals(xMPNode.getName())) {
                xMPNode = XMPNodeUtils.findChildNode(xMPNode, "xmpRights:UsageTerms", false);
                if (xMPNode != null) {
                    repairAltText(xMPNode);
                }
            }
        }
    }

    private static void normalizeDCArrays(XMPNode xMPNode) throws XMPException {
        for (int i = 1; i <= xMPNode.getChildrenLength(); i++) {
            XMPNode child = xMPNode.getChild(i);
            PropertyOptions propertyOptions = (PropertyOptions) dcArrayForms.get(child.getName());
            if (propertyOptions != null) {
                if (child.getOptions().isSimple()) {
                    XMPNode xMPNode2 = new XMPNode(child.getName(), propertyOptions);
                    child.setName(XMPConst.ARRAY_ITEM_NAME);
                    xMPNode2.addChild(child);
                    xMPNode.replaceChild(i, xMPNode2);
                    if (propertyOptions.isArrayAltText() && !child.getOptions().getHasLanguage()) {
                        child.addQualifier(new XMPNode(XMPConst.XML_LANG, XMPConst.X_DEFAULT, null));
                    }
                } else {
                    child.getOptions().setOption(7680, false);
                    child.getOptions().mergeWith(propertyOptions);
                    if (propertyOptions.isArrayAltText()) {
                        repairAltText(child);
                    }
                }
            }
        }
    }

    private static void repairAltText(XMPNode xMPNode) throws XMPException {
        if (xMPNode != null && xMPNode.getOptions().isArray()) {
            xMPNode.getOptions().setArrayOrdered(true).setArrayAlternate(true).setArrayAltText(true);
            Iterator iterateChildren = xMPNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                XMPNode xMPNode2 = (XMPNode) iterateChildren.next();
                if (xMPNode2.getOptions().isCompositeProperty()) {
                    iterateChildren.remove();
                } else if (!xMPNode2.getOptions().getHasLanguage()) {
                    String value = xMPNode2.getValue();
                    if (value == null || value.length() == 0) {
                        iterateChildren.remove();
                    } else {
                        xMPNode2.addQualifier(new XMPNode(XMPConst.XML_LANG, "x-repair", null));
                    }
                }
            }
        }
    }

    private static void moveExplicitAliases(XMPNode xMPNode, ParseOptions parseOptions) throws XMPException {
        if (xMPNode.getHasAliases()) {
            xMPNode.setHasAliases(false);
            boolean strictAliasing = parseOptions.getStrictAliasing();
            for (XMPNode xMPNode2 : xMPNode.getUnmodifiableChildren()) {
                if (xMPNode2.getHasAliases()) {
                    Iterator iterateChildren = xMPNode2.iterateChildren();
                    while (iterateChildren.hasNext()) {
                        XMPNode xMPNode3 = (XMPNode) iterateChildren.next();
                        if (xMPNode3.isAlias()) {
                            xMPNode3.setAlias(false);
                            XMPAliasInfo findAlias = XMPMetaFactory.getSchemaRegistry().findAlias(xMPNode3.getName());
                            if (findAlias != null) {
                                XMPNode xMPNode4 = null;
                                XMPNode findSchemaNode = XMPNodeUtils.findSchemaNode(xMPNode, findAlias.getNamespace(), null, true);
                                findSchemaNode.setImplicit(false);
                                StringBuilder stringBuilder = new StringBuilder();
                                stringBuilder.append(findAlias.getPrefix());
                                stringBuilder.append(findAlias.getPropName());
                                XMPNode findChildNode = XMPNodeUtils.findChildNode(findSchemaNode, stringBuilder.toString(), false);
                                if (findChildNode == null) {
                                    if (findAlias.getAliasForm().isSimple()) {
                                        StringBuilder stringBuilder2 = new StringBuilder();
                                        stringBuilder2.append(findAlias.getPrefix());
                                        stringBuilder2.append(findAlias.getPropName());
                                        xMPNode3.setName(stringBuilder2.toString());
                                        findSchemaNode.addChild(xMPNode3);
                                        iterateChildren.remove();
                                    } else {
                                        StringBuilder stringBuilder3 = new StringBuilder();
                                        stringBuilder3.append(findAlias.getPrefix());
                                        stringBuilder3.append(findAlias.getPropName());
                                        xMPNode4 = new XMPNode(stringBuilder3.toString(), findAlias.getAliasForm().toPropertyOptions());
                                        findSchemaNode.addChild(xMPNode4);
                                        transplantArrayItemAlias(iterateChildren, xMPNode3, xMPNode4);
                                    }
                                } else if (findAlias.getAliasForm().isSimple()) {
                                    if (strictAliasing) {
                                        compareAliasedSubtrees(xMPNode3, findChildNode, true);
                                    }
                                    iterateChildren.remove();
                                } else {
                                    if (findAlias.getAliasForm().isArrayAltText()) {
                                        int lookupLanguageItem = XMPNodeUtils.lookupLanguageItem(findChildNode, XMPConst.X_DEFAULT);
                                        if (lookupLanguageItem != -1) {
                                            xMPNode4 = findChildNode.getChild(lookupLanguageItem);
                                        }
                                    } else if (findChildNode.hasChildren()) {
                                        xMPNode4 = findChildNode.getChild(1);
                                    }
                                    if (xMPNode4 == null) {
                                        transplantArrayItemAlias(iterateChildren, xMPNode3, findChildNode);
                                    } else {
                                        if (strictAliasing) {
                                            compareAliasedSubtrees(xMPNode3, xMPNode4, true);
                                        }
                                        iterateChildren.remove();
                                    }
                                }
                            }
                        }
                    }
                    xMPNode2.setHasAliases(false);
                }
            }
        }
    }

    private static void transplantArrayItemAlias(Iterator it, XMPNode xMPNode, XMPNode xMPNode2) throws XMPException {
        if (xMPNode2.getOptions().isArrayAltText()) {
            if (xMPNode.getOptions().getHasLanguage()) {
                throw new XMPException("Alias to x-default already has a language qualifier", 203);
            }
            xMPNode.addQualifier(new XMPNode(XMPConst.XML_LANG, XMPConst.X_DEFAULT, null));
        }
        it.remove();
        xMPNode.setName(XMPConst.ARRAY_ITEM_NAME);
        xMPNode2.addChild(xMPNode);
    }

    private static void fixGPSTimeStamp(XMPNode xMPNode) throws XMPException {
        XMPNode findChildNode = XMPNodeUtils.findChildNode(xMPNode, "exif:GPSTimeStamp", false);
        if (findChildNode != null) {
            try {
                XMPDateTime convertToDate = XMPUtils.convertToDate(findChildNode.getValue());
                if (convertToDate.getYear() == 0 && convertToDate.getMonth() == 0 && convertToDate.getDay() == 0) {
                    XMPNode findChildNode2 = XMPNodeUtils.findChildNode(xMPNode, "exif:DateTimeOriginal", false);
                    if (findChildNode2 == null) {
                        findChildNode2 = XMPNodeUtils.findChildNode(xMPNode, "exif:DateTimeDigitized", false);
                    }
                    XMPDateTime convertToDate2 = XMPUtils.convertToDate(findChildNode2.getValue());
                    Calendar calendar = convertToDate.getCalendar();
                    calendar.set(1, convertToDate2.getYear());
                    calendar.set(2, convertToDate2.getMonth());
                    calendar.set(5, convertToDate2.getDay());
                    findChildNode.setValue(XMPUtils.convertFromDate(new XMPDateTimeImpl(calendar)));
                }
            } catch (XMPException e) {
            }
        }
    }

    private static void deleteEmptySchemas(XMPNode xMPNode) {
        Iterator iterateChildren = xMPNode.iterateChildren();
        while (iterateChildren.hasNext()) {
            if (!((XMPNode) iterateChildren.next()).hasChildren()) {
                iterateChildren.remove();
            }
        }
    }

    private static void compareAliasedSubtrees(XMPNode xMPNode, XMPNode xMPNode2, boolean z) throws XMPException {
        if (!xMPNode.getValue().equals(xMPNode2.getValue()) || xMPNode.getChildrenLength() != xMPNode2.getChildrenLength()) {
            throw new XMPException("Mismatch between alias and base nodes", 203);
        } else if (z || (xMPNode.getName().equals(xMPNode2.getName()) && xMPNode.getOptions().equals(xMPNode2.getOptions()) && xMPNode.getQualifierLength() == xMPNode2.getQualifierLength())) {
            Iterator iterateChildren = xMPNode.iterateChildren();
            Iterator iterateChildren2 = xMPNode2.iterateChildren();
            while (iterateChildren.hasNext() && iterateChildren2.hasNext()) {
                compareAliasedSubtrees((XMPNode) iterateChildren.next(), (XMPNode) iterateChildren2.next(), false);
            }
            Iterator iterateQualifier = xMPNode.iterateQualifier();
            Iterator iterateQualifier2 = xMPNode2.iterateQualifier();
            while (iterateQualifier.hasNext() && iterateQualifier2.hasNext()) {
                compareAliasedSubtrees((XMPNode) iterateQualifier.next(), (XMPNode) iterateQualifier2.next(), false);
            }
        } else {
            throw new XMPException("Mismatch between alias and base nodes", 203);
        }
    }

    private static void migrateAudioCopyright(XMPMeta xMPMeta, XMPNode xMPNode) {
        try {
            XMPNode findSchemaNode = XMPNodeUtils.findSchemaNode(((XMPMetaImpl) xMPMeta).getRoot(), XMPConst.NS_DC, true);
            String value = xMPNode.getValue();
            String str = "\n\n";
            findSchemaNode = XMPNodeUtils.findChildNode(findSchemaNode, "dc:rights", false);
            if (findSchemaNode == null || !findSchemaNode.hasChildren()) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(value);
                XMPMeta xMPMeta2 = xMPMeta;
                xMPMeta2.setLocalizedText(XMPConst.NS_DC, "rights", "", XMPConst.X_DEFAULT, stringBuilder.toString(), null);
            } else {
                int lookupLanguageItem = XMPNodeUtils.lookupLanguageItem(findSchemaNode, XMPConst.X_DEFAULT);
                if (lookupLanguageItem < 0) {
                    XMPMeta xMPMeta3 = xMPMeta;
                    xMPMeta3.setLocalizedText(XMPConst.NS_DC, "rights", "", XMPConst.X_DEFAULT, findSchemaNode.getChild(1).getValue(), null);
                    lookupLanguageItem = XMPNodeUtils.lookupLanguageItem(findSchemaNode, XMPConst.X_DEFAULT);
                }
                XMPNode child = findSchemaNode.getChild(lookupLanguageItem);
                String value2 = child.getValue();
                int indexOf = value2.indexOf(str);
                if (indexOf >= 0) {
                    indexOf += 2;
                    if (!value2.substring(indexOf).equals(value)) {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append(value2.substring(0, indexOf));
                        stringBuilder2.append(value);
                        child.setValue(stringBuilder2.toString());
                    }
                } else if (!value.equals(value2)) {
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append(value2);
                    stringBuilder3.append(str);
                    stringBuilder3.append(value);
                    child.setValue(stringBuilder3.toString());
                }
            }
            xMPNode.getParent().removeChild(xMPNode);
        } catch (XMPException e) {
        }
    }

    private static void initDCArrays() {
        dcArrayForms = new HashMap();
        PropertyOptions propertyOptions = new PropertyOptions();
        propertyOptions.setArray(true);
        dcArrayForms.put("dc:contributor", propertyOptions);
        dcArrayForms.put("dc:language", propertyOptions);
        dcArrayForms.put("dc:publisher", propertyOptions);
        dcArrayForms.put("dc:relation", propertyOptions);
        dcArrayForms.put("dc:subject", propertyOptions);
        dcArrayForms.put("dc:type", propertyOptions);
        propertyOptions = new PropertyOptions();
        propertyOptions.setArray(true);
        propertyOptions.setArrayOrdered(true);
        dcArrayForms.put("dc:creator", propertyOptions);
        dcArrayForms.put("dc:date", propertyOptions);
        propertyOptions = new PropertyOptions();
        propertyOptions.setArray(true);
        propertyOptions.setArrayOrdered(true);
        propertyOptions.setArrayAlternate(true);
        propertyOptions.setArrayAltText(true);
        dcArrayForms.put("dc:description", propertyOptions);
        dcArrayForms.put("dc:rights", propertyOptions);
        dcArrayForms.put("dc:title", propertyOptions);
    }
}
