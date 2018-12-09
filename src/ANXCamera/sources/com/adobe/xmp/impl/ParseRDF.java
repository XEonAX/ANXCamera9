package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPError;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.XMPSchemaRegistry;
import com.adobe.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

public class ParseRDF implements XMPConst, XMPError {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final String DEFAULT_PREFIX = "_dflt";
    public static final int RDFTERM_ABOUT = 3;
    public static final int RDFTERM_ABOUT_EACH = 10;
    public static final int RDFTERM_ABOUT_EACH_PREFIX = 11;
    public static final int RDFTERM_BAG_ID = 12;
    public static final int RDFTERM_DATATYPE = 7;
    public static final int RDFTERM_DESCRIPTION = 8;
    public static final int RDFTERM_FIRST_CORE = 1;
    public static final int RDFTERM_FIRST_OLD = 10;
    public static final int RDFTERM_FIRST_SYNTAX = 1;
    public static final int RDFTERM_ID = 2;
    public static final int RDFTERM_LAST_CORE = 7;
    public static final int RDFTERM_LAST_OLD = 12;
    public static final int RDFTERM_LAST_SYNTAX = 9;
    public static final int RDFTERM_LI = 9;
    public static final int RDFTERM_NODE_ID = 6;
    public static final int RDFTERM_OTHER = 0;
    public static final int RDFTERM_PARSE_TYPE = 4;
    public static final int RDFTERM_RDF = 1;
    public static final int RDFTERM_RESOURCE = 5;

    static XMPMetaImpl parse(Node node) throws XMPException {
        XMPMetaImpl xMPMetaImpl = new XMPMetaImpl();
        rdf_RDF(xMPMetaImpl, node);
        return xMPMetaImpl;
    }

    static void rdf_RDF(XMPMetaImpl xMPMetaImpl, Node node) throws XMPException {
        if (node.hasAttributes()) {
            rdf_NodeElementList(xMPMetaImpl, xMPMetaImpl.getRoot(), node);
            return;
        }
        throw new XMPException("Invalid attributes of rdf:RDF element", 202);
    }

    private static void rdf_NodeElementList(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node) throws XMPException {
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            Node item = node.getChildNodes().item(i);
            if (!isWhitespaceNode(item)) {
                rdf_NodeElement(xMPMetaImpl, xMPNode, item, true);
            }
        }
    }

    private static void rdf_NodeElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        int rDFTermKind = getRDFTermKind(node);
        if (rDFTermKind != 8 && rDFTermKind != 0) {
            throw new XMPException("Node element must be rdf:Description or typed node", 202);
        } else if (z && rDFTermKind == 0) {
            throw new XMPException("Top level typed node not allowed", 203);
        } else {
            rdf_NodeElementAttrs(xMPMetaImpl, xMPNode, node, z);
            rdf_PropertyElementList(xMPMetaImpl, xMPNode, node, z);
        }
    }

    private static void rdf_NodeElementAttrs(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        int i = 0;
        int i2 = 0;
        while (i < node.getAttributes().getLength()) {
            Node item = node.getAttributes().item(i);
            if (!("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName())))) {
                int rDFTermKind = getRDFTermKind(item);
                if (rDFTermKind != 0) {
                    if (rDFTermKind != 6) {
                        switch (rDFTermKind) {
                            case 2:
                            case 3:
                                break;
                            default:
                                throw new XMPException("Invalid nodeElement attribute", 202);
                        }
                    }
                    if (i2 <= 0) {
                        i2++;
                        if (z && rDFTermKind == 3) {
                            if (xMPNode.getName() == null || xMPNode.getName().length() <= 0) {
                                xMPNode.setName(item.getNodeValue());
                            } else if (!xMPNode.getName().equals(item.getNodeValue())) {
                                throw new XMPException("Mismatched top level rdf:about values", 203);
                            }
                        }
                    } else {
                        throw new XMPException("Mutally exclusive about, ID, nodeID attributes", 202);
                    }
                }
                addChildNode(xMPMetaImpl, xMPNode, item, item.getNodeValue(), z);
            }
            i++;
        }
    }

    private static void rdf_PropertyElementList(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            Node item = node.getChildNodes().item(i);
            if (!isWhitespaceNode(item)) {
                if (item.getNodeType() == (short) 1) {
                    rdf_PropertyElement(xMPMetaImpl, xMPNode, item, z);
                } else {
                    throw new XMPException("Expected property element node not found", 202);
                }
            }
        }
    }

    private static void rdf_PropertyElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        if (isPropertyElementName(getRDFTermKind(node))) {
            int i;
            Node item;
            NamedNodeMap attributes = node.getAttributes();
            int i2 = 0;
            List list = null;
            for (i = 0; i < attributes.getLength(); i++) {
                item = attributes.item(i);
                if ("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName()))) {
                    if (list == null) {
                        list = new ArrayList();
                    }
                    list.add(item.getNodeName());
                }
            }
            if (list != null) {
                for (String removeNamedItem : list) {
                    attributes.removeNamedItem(removeNamedItem);
                }
            }
            if (attributes.getLength() > 3) {
                rdf_EmptyPropertyElement(xMPMetaImpl, xMPNode, node, z);
            } else {
                for (i = 0; i < attributes.getLength(); i++) {
                    item = attributes.item(i);
                    String localName = item.getLocalName();
                    String namespaceURI = item.getNamespaceURI();
                    String nodeValue = item.getNodeValue();
                    if (!XMPConst.XML_LANG.equals(item.getNodeName()) || ("ID".equals(localName) && XMPConst.NS_RDF.equals(namespaceURI))) {
                        if ("datatype".equals(localName) && XMPConst.NS_RDF.equals(namespaceURI)) {
                            rdf_LiteralPropertyElement(xMPMetaImpl, xMPNode, node, z);
                        } else if (!"parseType".equals(localName) || !XMPConst.NS_RDF.equals(namespaceURI)) {
                            rdf_EmptyPropertyElement(xMPMetaImpl, xMPNode, node, z);
                        } else if ("Literal".equals(nodeValue)) {
                            rdf_ParseTypeLiteralPropertyElement();
                        } else if ("Resource".equals(nodeValue)) {
                            rdf_ParseTypeResourcePropertyElement(xMPMetaImpl, xMPNode, node, z);
                        } else if ("Collection".equals(nodeValue)) {
                            rdf_ParseTypeCollectionPropertyElement();
                        } else {
                            rdf_ParseTypeOtherPropertyElement();
                        }
                        return;
                    }
                }
                if (node.hasChildNodes()) {
                    while (i2 < node.getChildNodes().getLength()) {
                        if (node.getChildNodes().item(i2).getNodeType() != (short) 3) {
                            rdf_ResourcePropertyElement(xMPMetaImpl, xMPNode, node, z);
                            return;
                        }
                        i2++;
                    }
                    rdf_LiteralPropertyElement(xMPMetaImpl, xMPNode, node, z);
                } else {
                    rdf_EmptyPropertyElement(xMPMetaImpl, xMPNode, node, z);
                }
            }
            return;
        }
        throw new XMPException("Invalid property element name", 202);
    }

    private static void rdf_ResourcePropertyElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        if (!z || !"iX:changes".equals(node.getNodeName())) {
            int i;
            String namespaceURI;
            xMPNode = addChildNode(xMPMetaImpl, xMPNode, node, "", z);
            for (i = 0; i < node.getAttributes().getLength(); i++) {
                Node item = node.getAttributes().item(i);
                if (!("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName())))) {
                    String localName = item.getLocalName();
                    namespaceURI = item.getNamespaceURI();
                    if (XMPConst.XML_LANG.equals(item.getNodeName())) {
                        addQualifierNode(xMPNode, XMPConst.XML_LANG, item.getNodeValue());
                    } else if (!"ID".equals(localName) || !XMPConst.NS_RDF.equals(namespaceURI)) {
                        throw new XMPException("Invalid attribute for resource property element", 202);
                    }
                }
            }
            i = 0;
            int i2 = i;
            while (i < node.getChildNodes().getLength()) {
                Node item2 = node.getChildNodes().item(i);
                if (!isWhitespaceNode(item2)) {
                    if (item2.getNodeType() == (short) 1 && i2 == 0) {
                        boolean equals = XMPConst.NS_RDF.equals(item2.getNamespaceURI());
                        namespaceURI = item2.getLocalName();
                        if (equals && "Bag".equals(namespaceURI)) {
                            xMPNode.getOptions().setArray(true);
                        } else if (equals && "Seq".equals(namespaceURI)) {
                            xMPNode.getOptions().setArray(true).setArrayOrdered(true);
                        } else if (equals && "Alt".equals(namespaceURI)) {
                            xMPNode.getOptions().setArray(true).setArrayOrdered(true).setArrayAlternate(true);
                        } else {
                            xMPNode.getOptions().setStruct(true);
                            if (!(equals || "Description".equals(namespaceURI))) {
                                String namespaceURI2 = item2.getNamespaceURI();
                                if (namespaceURI2 != null) {
                                    StringBuilder stringBuilder = new StringBuilder();
                                    stringBuilder.append(namespaceURI2);
                                    stringBuilder.append(':');
                                    stringBuilder.append(namespaceURI);
                                    addQualifierNode(xMPNode, XMPConst.RDF_TYPE, stringBuilder.toString());
                                } else {
                                    throw new XMPException("All XML elements must be in a namespace", 203);
                                }
                            }
                        }
                        rdf_NodeElement(xMPMetaImpl, xMPNode, item2, false);
                        if (xMPNode.getHasValueChild()) {
                            fixupQualifiedNode(xMPNode);
                        } else if (xMPNode.getOptions().isArrayAlternate()) {
                            XMPNodeUtils.detectAltText(xMPNode);
                        }
                        i2 = true;
                    } else if (i2 != 0) {
                        throw new XMPException("Invalid child of resource property element", 202);
                    } else {
                        throw new XMPException("Children of resource property element must be XML elements", 202);
                    }
                }
                i++;
            }
            if (i2 == 0) {
                throw new XMPException("Missing child of resource property element", 202);
            }
        }
    }

    private static void rdf_LiteralPropertyElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        Node item;
        XMPNode addChildNode = addChildNode(xMPMetaImpl, xMPNode, node, null, z);
        int i = 0;
        for (int i2 = 0; i2 < node.getAttributes().getLength(); i2++) {
            item = node.getAttributes().item(i2);
            if (!("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName())))) {
                String namespaceURI = item.getNamespaceURI();
                String localName = item.getLocalName();
                if (XMPConst.XML_LANG.equals(item.getNodeName())) {
                    addQualifierNode(addChildNode, XMPConst.XML_LANG, item.getNodeValue());
                } else if (!(XMPConst.NS_RDF.equals(namespaceURI) && ("ID".equals(localName) || "datatype".equals(localName)))) {
                    throw new XMPException("Invalid attribute for literal property element", 202);
                }
            }
        }
        String str = "";
        while (i < node.getChildNodes().getLength()) {
            item = node.getChildNodes().item(i);
            if (item.getNodeType() == (short) 3) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(item.getNodeValue());
                str = stringBuilder.toString();
                i++;
            } else {
                throw new XMPException("Invalid child of literal property element", 202);
            }
        }
        addChildNode.setValue(str);
    }

    private static void rdf_ParseTypeLiteralPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeLiteral property element not allowed", 203);
    }

    private static void rdf_ParseTypeResourcePropertyElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        xMPNode = addChildNode(xMPMetaImpl, xMPNode, node, "", z);
        xMPNode.getOptions().setStruct(true);
        for (int i = 0; i < node.getAttributes().getLength(); i++) {
            Node item = node.getAttributes().item(i);
            if (!("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName())))) {
                String localName = item.getLocalName();
                String namespaceURI = item.getNamespaceURI();
                if (XMPConst.XML_LANG.equals(item.getNodeName())) {
                    addQualifierNode(xMPNode, XMPConst.XML_LANG, item.getNodeValue());
                } else if (!(XMPConst.NS_RDF.equals(namespaceURI) && ("ID".equals(localName) || "parseType".equals(localName)))) {
                    throw new XMPException("Invalid attribute for ParseTypeResource property element", 202);
                }
            }
        }
        rdf_PropertyElementList(xMPMetaImpl, xMPNode, node, false);
        if (xMPNode.getHasValueChild()) {
            fixupQualifiedNode(xMPNode);
        }
    }

    private static void rdf_ParseTypeCollectionPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeCollection property element not allowed", 203);
    }

    private static void rdf_ParseTypeOtherPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeOther property element not allowed", 203);
    }

    /* JADX WARNING: Removed duplicated region for block: B:57:0x00fe  */
    private static void rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl r14, com.adobe.xmp.impl.XMPNode r15, org.w3c.dom.Node r16, boolean r17) throws com.adobe.xmp.XMPException {
        /*
        r0 = r14;
        r1 = r16.hasChildNodes();
        r2 = 202; // 0xca float:2.83E-43 double:1.0E-321;
        if (r1 != 0) goto L_0x0177;
    L_0x000e:
        r1 = 0;
        r3 = 0;
        r4 = r1;
        r5 = r4;
        r7 = r5;
        r8 = r7;
        r6 = r3;
        r3 = r8;
    L_0x0016:
        r9 = r16.getAttributes();
        r9 = r9.getLength();
        r10 = 2;
        r11 = 1;
        if (r3 >= r9) goto L_0x00c2;
    L_0x0022:
        r9 = r16.getAttributes();
        r9 = r9.item(r3);
        r12 = "xmlns";
        r13 = r9.getPrefix();
        r12 = r12.equals(r13);
        if (r12 != 0) goto L_0x00be;
    L_0x0036:
        r12 = r9.getPrefix();
        if (r12 != 0) goto L_0x004a;
    L_0x003c:
        r12 = "xmlns";
        r13 = r9.getNodeName();
        r12 = r12.equals(r13);
        if (r12 == 0) goto L_0x004a;
    L_0x0048:
        goto L_0x00be;
    L_0x004a:
        r12 = getRDFTermKind(r9);
        r13 = 203; // 0xcb float:2.84E-43 double:1.003E-321;
        if (r12 == 0) goto L_0x0089;
    L_0x0052:
        if (r12 == r10) goto L_0x0088;
    L_0x0054:
        switch(r12) {
            case 5: goto L_0x006d;
            case 6: goto L_0x005f;
            default: goto L_0x0057;
        };
    L_0x0057:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Unrecognized attribute of empty property element";
        r0.<init>(r1, r2);
        throw r0;
    L_0x005f:
        if (r5 != 0) goto L_0x0065;
        r8 = r11;
        goto L_0x00be;
    L_0x0065:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Empty property element can't have both rdf:resource and rdf:nodeID";
        r0.<init>(r1, r2);
        throw r0;
    L_0x006d:
        if (r8 != 0) goto L_0x0080;
    L_0x006f:
        if (r4 != 0) goto L_0x0078;
        if (r4 != 0) goto L_0x0076;
        r6 = r9;
    L_0x0076:
        r5 = r11;
        goto L_0x00be;
    L_0x0078:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Empty property element can't have both rdf:value and rdf:resource";
        r0.<init>(r1, r13);
        throw r0;
    L_0x0080:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Empty property element can't have both rdf:resource and rdf:nodeID";
        r0.<init>(r1, r2);
        throw r0;
    L_0x0088:
        goto L_0x00be;
    L_0x0089:
        r10 = "value";
        r12 = r9.getLocalName();
        r10 = r10.equals(r12);
        if (r10 == 0) goto L_0x00b0;
    L_0x0095:
        r10 = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
        r12 = r9.getNamespaceURI();
        r10 = r10.equals(r12);
        if (r10 == 0) goto L_0x00b0;
    L_0x00a1:
        if (r5 != 0) goto L_0x00a8;
        r6 = r9;
        r4 = r11;
        goto L_0x00be;
    L_0x00a8:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Empty property element can't have both rdf:value and rdf:resource";
        r0.<init>(r1, r13);
        throw r0;
    L_0x00b0:
        r10 = "xml:lang";
        r9 = r9.getNodeName();
        r9 = r10.equals(r9);
        if (r9 != 0) goto L_0x00be;
        r7 = r11;
    L_0x00be:
        r3 = r3 + 1;
        goto L_0x0016;
    L_0x00c2:
        r3 = "";
        r8 = r15;
        r9 = r16;
        r12 = r17;
        r3 = addChildNode(r0, r8, r9, r3, r12);
        if (r4 != 0) goto L_0x00dd;
    L_0x00d0:
        if (r5 == 0) goto L_0x00d3;
    L_0x00d2:
        goto L_0x00dd;
    L_0x00d3:
        if (r7 == 0) goto L_0x00f2;
    L_0x00d5:
        r4 = r3.getOptions();
        r4.setStruct(r11);
        goto L_0x00f3;
    L_0x00dd:
        if (r6 == 0) goto L_0x00e4;
    L_0x00df:
        r5 = r6.getNodeValue();
        goto L_0x00e6;
    L_0x00e4:
        r5 = "";
    L_0x00e6:
        r3.setValue(r5);
        if (r4 != 0) goto L_0x00f2;
    L_0x00eb:
        r4 = r3.getOptions();
        r4.setURI(r11);
    L_0x00f2:
        r11 = r1;
    L_0x00f3:
        r4 = r1;
    L_0x00f4:
        r5 = r16.getAttributes();
        r5 = r5.getLength();
        if (r4 >= r5) goto L_0x0176;
    L_0x00fe:
        r5 = r16.getAttributes();
        r5 = r5.item(r4);
        if (r5 == r6) goto L_0x0172;
    L_0x0108:
        r7 = "xmlns";
        r8 = r5.getPrefix();
        r7 = r7.equals(r8);
        if (r7 != 0) goto L_0x0172;
    L_0x0114:
        r7 = r5.getPrefix();
        if (r7 != 0) goto L_0x0127;
    L_0x011a:
        r7 = "xmlns";
        r8 = r5.getNodeName();
        r7 = r7.equals(r8);
        if (r7 == 0) goto L_0x0127;
    L_0x0126:
        goto L_0x0172;
    L_0x0127:
        r7 = getRDFTermKind(r5);
        if (r7 == 0) goto L_0x0145;
    L_0x012d:
        if (r7 == r10) goto L_0x0144;
    L_0x012f:
        switch(r7) {
            case 5: goto L_0x013a;
            case 6: goto L_0x0144;
            default: goto L_0x0132;
        };
    L_0x0132:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Unrecognized attribute of empty property element";
        r0.<init>(r1, r2);
        throw r0;
    L_0x013a:
        r7 = "rdf:resource";
        r5 = r5.getNodeValue();
        addQualifierNode(r3, r7, r5);
        goto L_0x0172;
    L_0x0144:
        goto L_0x0172;
    L_0x0145:
        if (r11 != 0) goto L_0x0154;
        r7 = r5.getNodeName();
        r5 = r5.getNodeValue();
        addQualifierNode(r3, r7, r5);
        goto L_0x0172;
    L_0x0154:
        r7 = "xml:lang";
        r8 = r5.getNodeName();
        r7 = r7.equals(r8);
        if (r7 == 0) goto L_0x016a;
    L_0x0160:
        r7 = "xml:lang";
        r5 = r5.getNodeValue();
        addQualifierNode(r3, r7, r5);
        goto L_0x0172;
    L_0x016a:
        r7 = r5.getNodeValue();
        addChildNode(r0, r3, r5, r7, r1);
    L_0x0172:
        r4 = r4 + 1;
        goto L_0x00f4;
    L_0x0176:
        return;
    L_0x0177:
        r0 = new com.adobe.xmp.XMPException;
        r1 = "Nested content not allowed with rdf:resource or property attributes";
        r0.<init>(r1, r2);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ParseRDF.rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl, com.adobe.xmp.impl.XMPNode, org.w3c.dom.Node, boolean):void");
    }

    private static XMPNode addChildNode(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, String str, boolean z) throws XMPException {
        XMPSchemaRegistry schemaRegistry = XMPMetaFactory.getSchemaRegistry();
        String namespaceURI = node.getNamespaceURI();
        if (namespaceURI != null) {
            if (XMPConst.NS_DC_DEPRECATED.equals(namespaceURI)) {
                namespaceURI = XMPConst.NS_DC;
            }
            String namespacePrefix = schemaRegistry.getNamespacePrefix(namespaceURI);
            if (namespacePrefix == null) {
                namespacePrefix = schemaRegistry.registerNamespace(namespaceURI, node.getPrefix() != null ? node.getPrefix() : DEFAULT_PREFIX);
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(namespacePrefix);
            stringBuilder.append(node.getLocalName());
            String stringBuilder2 = stringBuilder.toString();
            PropertyOptions propertyOptions = new PropertyOptions();
            boolean z2 = false;
            if (z) {
                xMPNode = XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), namespaceURI, DEFAULT_PREFIX, true);
                xMPNode.setImplicit(false);
                if (schemaRegistry.findAlias(stringBuilder2) != null) {
                    xMPMetaImpl.getRoot().setHasAliases(true);
                    xMPNode.setHasAliases(true);
                    z2 = true;
                }
            }
            boolean equals = "rdf:li".equals(stringBuilder2);
            boolean equals2 = "rdf:value".equals(stringBuilder2);
            XMPNode xMPNode2 = new XMPNode(stringBuilder2, str, propertyOptions);
            xMPNode2.setAlias(z2);
            if (equals2) {
                xMPNode.addChild(1, xMPNode2);
            } else {
                xMPNode.addChild(xMPNode2);
            }
            if (equals2) {
                if (z || !xMPNode.getOptions().isStruct()) {
                    throw new XMPException("Misplaced rdf:value element", 202);
                }
                xMPNode.setHasValueChild(true);
            }
            if (equals) {
                if (xMPNode.getOptions().isArray()) {
                    xMPNode2.setName(XMPConst.ARRAY_ITEM_NAME);
                } else {
                    throw new XMPException("Misplaced rdf:li element", 202);
                }
            }
            return xMPNode2;
        }
        throw new XMPException("XML namespace required for all elements and attributes", 202);
    }

    private static XMPNode addQualifierNode(XMPNode xMPNode, String str, String str2) throws XMPException {
        if (XMPConst.XML_LANG.equals(str)) {
            str2 = Utils.normalizeLangValue(str2);
        }
        XMPNode xMPNode2 = new XMPNode(str, str2, null);
        xMPNode.addQualifier(xMPNode2);
        return xMPNode2;
    }

    private static void fixupQualifiedNode(XMPNode xMPNode) throws XMPException {
        int i = 1;
        XMPNode child = xMPNode.getChild(1);
        if (child.getOptions().getHasLanguage()) {
            if (xMPNode.getOptions().getHasLanguage()) {
                throw new XMPException("Redundant xml:lang for rdf:value element", 203);
            }
            XMPNode qualifier = child.getQualifier(1);
            child.removeQualifier(qualifier);
            xMPNode.addQualifier(qualifier);
        }
        while (i <= child.getQualifierLength()) {
            xMPNode.addQualifier(child.getQualifier(i));
            i++;
        }
        for (i = 2; i <= xMPNode.getChildrenLength(); i++) {
            xMPNode.addQualifier(xMPNode.getChild(i));
        }
        xMPNode.setHasValueChild(false);
        xMPNode.getOptions().setStruct(false);
        xMPNode.getOptions().mergeWith(child.getOptions());
        xMPNode.setValue(child.getValue());
        xMPNode.removeChildren();
        Iterator iterateChildren = child.iterateChildren();
        while (iterateChildren.hasNext()) {
            xMPNode.addChild((XMPNode) iterateChildren.next());
        }
    }

    private static boolean isWhitespaceNode(Node node) {
        if (node.getNodeType() != (short) 3) {
            return false;
        }
        String nodeValue = node.getNodeValue();
        for (int i = 0; i < nodeValue.length(); i++) {
            if (!Character.isWhitespace(nodeValue.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private static boolean isPropertyElementName(int i) {
        if (i == 8 || isOldTerm(i)) {
            return false;
        }
        return isCoreSyntaxTerm(i) ^ 1;
    }

    private static boolean isOldTerm(int i) {
        return 10 <= i && i <= 12;
    }

    private static boolean isCoreSyntaxTerm(int i) {
        return 1 <= i && i <= 7;
    }

    private static int getRDFTermKind(Node node) {
        String localName = node.getLocalName();
        Object namespaceURI = node.getNamespaceURI();
        if (namespaceURI == null && (("about".equals(localName) || "ID".equals(localName)) && (node instanceof Attr) && XMPConst.NS_RDF.equals(((Attr) node).getOwnerElement().getNamespaceURI()))) {
            namespaceURI = XMPConst.NS_RDF;
        }
        if (XMPConst.NS_RDF.equals(namespaceURI)) {
            if ("li".equals(localName)) {
                return 9;
            }
            if ("parseType".equals(localName)) {
                return 4;
            }
            if ("Description".equals(localName)) {
                return 8;
            }
            if ("about".equals(localName)) {
                return 3;
            }
            if ("resource".equals(localName)) {
                return 5;
            }
            if ("RDF".equals(localName)) {
                return 1;
            }
            if ("ID".equals(localName)) {
                return 2;
            }
            if ("nodeID".equals(localName)) {
                return 6;
            }
            if ("datatype".equals(localName)) {
                return 7;
            }
            if ("aboutEach".equals(localName)) {
                return 10;
            }
            if ("aboutEachPrefix".equals(localName)) {
                return 11;
            }
            if ("bagID".equals(localName)) {
                return 12;
            }
        }
        return 0;
    }
}
