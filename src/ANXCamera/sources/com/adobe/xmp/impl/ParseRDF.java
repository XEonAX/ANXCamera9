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

    /* JADX WARNING: Removed duplicated region for block: B:57:0x0101  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void rdf_EmptyPropertyElement(XMPMetaImpl xMPMetaImpl, XMPNode xMPNode, Node node, boolean z) throws XMPException {
        XMPMetaImpl xMPMetaImpl2 = xMPMetaImpl;
        if (node.hasChildNodes()) {
            throw new XMPException("Nested content not allowed with rdf:resource or property attributes", 202);
        }
        boolean z2 = false;
        boolean z3 = z2;
        boolean z4 = z3;
        boolean z5 = z4;
        Node node2 = null;
        int i = z5;
        while (true) {
            boolean z6 = true;
            if (i < node.getAttributes().getLength()) {
                Node item = node.getAttributes().item(i);
                if (!("xmlns".equals(item.getPrefix()) || (item.getPrefix() == null && "xmlns".equals(item.getNodeName())))) {
                    int rDFTermKind = getRDFTermKind(item);
                    if (rDFTermKind != 0) {
                        if (rDFTermKind != 2) {
                            switch (rDFTermKind) {
                                case 5:
                                    if (z5) {
                                        throw new XMPException("Empty property element can't have both rdf:resource and rdf:nodeID", 202);
                                    } else if (!z2) {
                                        if (!z2) {
                                            node2 = item;
                                        }
                                        z3 = true;
                                        break;
                                    } else {
                                        throw new XMPException("Empty property element can't have both rdf:value and rdf:resource", 203);
                                    }
                                case 6:
                                    if (!z3) {
                                        z5 = true;
                                        break;
                                    }
                                    throw new XMPException("Empty property element can't have both rdf:resource and rdf:nodeID", 202);
                                default:
                                    throw new XMPException("Unrecognized attribute of empty property element", 202);
                            }
                        }
                        continue;
                    } else if ("value".equals(item.getLocalName()) && XMPConst.NS_RDF.equals(item.getNamespaceURI())) {
                        if (z3) {
                            throw new XMPException("Empty property element can't have both rdf:value and rdf:resource", 203);
                        }
                        node2 = item;
                        z2 = true;
                    } else if (!XMPConst.XML_LANG.equals(item.getNodeName())) {
                        z4 = true;
                    }
                }
                i++;
            } else {
                int i2;
                XMPNode addChildNode = addChildNode(xMPMetaImpl2, xMPNode, node, "", z);
                if (z2 || z3) {
                    addChildNode.setValue(node2 != null ? node2.getNodeValue() : "");
                    if (!z2) {
                        addChildNode.getOptions().setURI(true);
                    }
                } else if (z4) {
                    addChildNode.getOptions().setStruct(true);
                    for (i2 = 0; i2 < node.getAttributes().getLength(); i2++) {
                        Node item2 = node.getAttributes().item(i2);
                        if (!(item2 == node2 || "xmlns".equals(item2.getPrefix()) || (item2.getPrefix() == null && "xmlns".equals(item2.getNodeName())))) {
                            int rDFTermKind2 = getRDFTermKind(item2);
                            if (rDFTermKind2 != 0) {
                                if (rDFTermKind2 != 2) {
                                    switch (rDFTermKind2) {
                                        case 5:
                                            addQualifierNode(addChildNode, "rdf:resource", item2.getNodeValue());
                                            break;
                                        case 6:
                                            break;
                                        default:
                                            throw new XMPException("Unrecognized attribute of empty property element", 202);
                                    }
                                }
                                continue;
                            } else if (!z6) {
                                addQualifierNode(addChildNode, item2.getNodeName(), item2.getNodeValue());
                            } else if (XMPConst.XML_LANG.equals(item2.getNodeName())) {
                                addQualifierNode(addChildNode, XMPConst.XML_LANG, item2.getNodeValue());
                            } else {
                                addChildNode(xMPMetaImpl2, addChildNode, item2, item2.getNodeValue(), false);
                            }
                        }
                    }
                    return;
                }
                z6 = false;
                while (i2 < node.getAttributes().getLength()) {
                }
                return;
            }
        }
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
