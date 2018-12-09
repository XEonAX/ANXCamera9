package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.XMPSchemaRegistry;
import com.adobe.xmp.options.SerializeOptions;
import com.android.camera.constant.DurationConstant;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class XMPSerializerRDF {
    private static final int DEFAULT_PAD = 2048;
    private static final String PACKET_HEADER = "<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>";
    private static final String PACKET_TRAILER = "<?xpacket end=\"";
    private static final String PACKET_TRAILER2 = "\"?>";
    static final Set RDF_ATTR_QUALIFIER = new HashSet(Arrays.asList(new String[]{XMPConst.XML_LANG, "rdf:resource", "rdf:ID", "rdf:bagID", "rdf:nodeID"}));
    private static final String RDF_RDF_END = "</rdf:RDF>";
    private static final String RDF_RDF_START = "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">";
    private static final String RDF_SCHEMA_END = "</rdf:Description>";
    private static final String RDF_SCHEMA_START = "<rdf:Description rdf:about=";
    private static final String RDF_STRUCT_END = "</rdf:Description>";
    private static final String RDF_STRUCT_START = "<rdf:Description";
    private static final String RDF_XMPMETA_END = "</x:xmpmeta>";
    private static final String RDF_XMPMETA_START = "<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"";
    private SerializeOptions options;
    private CountOutputStream outputStream;
    private int padding;
    private int unicodeSize = 1;
    private OutputStreamWriter writer;
    private XMPMetaImpl xmp;

    public void serialize(XMPMeta xMPMeta, OutputStream outputStream, SerializeOptions serializeOptions) throws XMPException {
        try {
            this.outputStream = new CountOutputStream(outputStream);
            this.writer = new OutputStreamWriter(this.outputStream, serializeOptions.getEncoding());
            this.xmp = (XMPMetaImpl) xMPMeta;
            this.options = serializeOptions;
            this.padding = serializeOptions.getPadding();
            this.writer = new OutputStreamWriter(this.outputStream, serializeOptions.getEncoding());
            checkOptionsConsistence();
            String serializeAsRDF = serializeAsRDF();
            this.writer.flush();
            addPadding(serializeAsRDF.length());
            write(serializeAsRDF);
            this.writer.flush();
            this.outputStream.close();
        } catch (IOException e) {
            throw new XMPException("Error writing to the OutputStream", 0);
        }
    }

    private void addPadding(int i) throws XMPException, IOException {
        if (this.options.getExactPacketLength()) {
            int bytesWritten = this.outputStream.getBytesWritten() + (i * this.unicodeSize);
            if (bytesWritten <= this.padding) {
                this.padding -= bytesWritten;
            } else {
                throw new XMPException("Can't fit into specified packet size", 107);
            }
        }
        this.padding /= this.unicodeSize;
        i = this.options.getNewline().length();
        if (this.padding >= i) {
            this.padding -= i;
            while (true) {
                int i2 = 100 + i;
                if (this.padding >= i2) {
                    writeChars(100, ' ');
                    writeNewline();
                    this.padding -= i2;
                } else {
                    writeChars(this.padding, ' ');
                    writeNewline();
                    return;
                }
            }
        }
        writeChars(this.padding, ' ');
    }

    protected void checkOptionsConsistence() throws XMPException {
        if ((this.options.getEncodeUTF16BE() | this.options.getEncodeUTF16LE()) != 0) {
            this.unicodeSize = 2;
        }
        if (this.options.getExactPacketLength()) {
            if ((this.options.getOmitPacketWrapper() | this.options.getIncludeThumbnailPad()) != 0) {
                throw new XMPException("Inconsistent options for exact size serialize", 103);
            } else if ((this.options.getPadding() & (this.unicodeSize - 1)) != 0) {
                throw new XMPException("Exact size must be a multiple of the Unicode element", 103);
            }
        } else if (this.options.getReadOnlyPacket()) {
            if ((this.options.getOmitPacketWrapper() | this.options.getIncludeThumbnailPad()) == 0) {
                this.padding = 0;
                return;
            }
            throw new XMPException("Inconsistent options for read-only packet", 103);
        } else if (!this.options.getOmitPacketWrapper()) {
            if (this.padding == 0) {
                this.padding = 2048 * this.unicodeSize;
            }
            if (this.options.getIncludeThumbnailPad() && !this.xmp.doesPropertyExist(XMPConst.NS_XMP, "Thumbnails")) {
                this.padding += DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE * this.unicodeSize;
            }
        } else if (this.options.getIncludeThumbnailPad()) {
            throw new XMPException("Inconsistent options for non-packet serialize", 103);
        } else {
            this.padding = 0;
        }
    }

    private String serializeAsRDF() throws IOException, XMPException {
        if (!this.options.getOmitPacketWrapper()) {
            writeIndent(0);
            write(PACKET_HEADER);
            writeNewline();
        }
        writeIndent(0);
        write(RDF_XMPMETA_START);
        if (!this.options.getOmitVersionAttribute()) {
            write(XMPMetaFactory.getVersionInfo().getMessage());
        }
        write("\">");
        writeNewline();
        writeIndent(1);
        write(RDF_RDF_START);
        writeNewline();
        if (this.options.getUseCompactFormat()) {
            serializeCompactRDFSchemas();
        } else {
            serializePrettyRDFSchemas();
        }
        writeIndent(1);
        write(RDF_RDF_END);
        writeNewline();
        writeIndent(0);
        write(RDF_XMPMETA_END);
        writeNewline();
        String str = "";
        if (this.options.getOmitPacketWrapper()) {
            return str;
        }
        for (int baseIndent = this.options.getBaseIndent(); baseIndent > 0; baseIndent--) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(this.options.getIndent());
            str = stringBuilder.toString();
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(PACKET_TRAILER);
        str = stringBuilder2.toString();
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(this.options.getReadOnlyPacket() ? 'r' : 'w');
        str = stringBuilder2.toString();
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(PACKET_TRAILER2);
        return stringBuilder2.toString();
    }

    private void serializePrettyRDFSchemas() throws IOException, XMPException {
        if (this.xmp.getRoot().getChildrenLength() > 0) {
            Iterator iterateChildren = this.xmp.getRoot().iterateChildren();
            while (iterateChildren.hasNext()) {
                serializePrettyRDFSchema((XMPNode) iterateChildren.next());
            }
            return;
        }
        writeIndent(2);
        write(RDF_SCHEMA_START);
        writeTreeName();
        write("/>");
        writeNewline();
    }

    private void writeTreeName() throws IOException {
        write(34);
        String name = this.xmp.getRoot().getName();
        if (name != null) {
            appendNodeValue(name, true);
        }
        write(34);
    }

    private void serializeCompactRDFSchemas() throws IOException, XMPException {
        writeIndent(2);
        write(RDF_SCHEMA_START);
        writeTreeName();
        Set hashSet = new HashSet();
        hashSet.add("xml");
        hashSet.add("rdf");
        Iterator iterateChildren = this.xmp.getRoot().iterateChildren();
        while (iterateChildren.hasNext()) {
            declareUsedNamespaces((XMPNode) iterateChildren.next(), hashSet, 4);
        }
        int i = 1;
        iterateChildren = this.xmp.getRoot().iterateChildren();
        while (iterateChildren.hasNext()) {
            i &= serializeCompactRDFAttrProps((XMPNode) iterateChildren.next(), 3);
        }
        if (i == 0) {
            write(62);
            writeNewline();
            Iterator iterateChildren2 = this.xmp.getRoot().iterateChildren();
            while (iterateChildren2.hasNext()) {
                serializeCompactRDFElementProps((XMPNode) iterateChildren2.next(), 3);
            }
            writeIndent(2);
            write("</rdf:Description>");
            writeNewline();
            return;
        }
        write("/>");
        writeNewline();
    }

    private boolean serializeCompactRDFAttrProps(XMPNode xMPNode, int i) throws IOException {
        Iterator iterateChildren = xMPNode.iterateChildren();
        boolean z = true;
        while (iterateChildren.hasNext()) {
            XMPNode xMPNode2 = (XMPNode) iterateChildren.next();
            if (canBeRDFAttrProp(xMPNode2)) {
                writeNewline();
                writeIndent(i);
                write(xMPNode2.getName());
                write("=\"");
                appendNodeValue(xMPNode2.getValue(), true);
                write(34);
            } else {
                z = false;
            }
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x00bb  */
    private void serializeCompactRDFElementProps(com.adobe.xmp.impl.XMPNode r11, int r12) throws java.io.IOException, com.adobe.xmp.XMPException {
        /*
        r10 = this;
        r11 = r11.iterateChildren();
    L_0x0004:
        r0 = r11.hasNext();
        if (r0 == 0) goto L_0x00d2;
    L_0x000a:
        r0 = r11.next();
        r0 = (com.adobe.xmp.impl.XMPNode) r0;
        r1 = r10.canBeRDFAttrProp(r0);
        if (r1 == 0) goto L_0x0017;
    L_0x0016:
        goto L_0x0004;
        r1 = r0.getName();
        r2 = "[]";
        r2 = r2.equals(r1);
        if (r2 == 0) goto L_0x0027;
    L_0x0025:
        r1 = "rdf:li";
    L_0x0027:
        r10.writeIndent(r12);
        r2 = 60;
        r10.write(r2);
        r10.write(r1);
        r2 = r0.iterateQualifier();
        r3 = 0;
        r4 = r3;
        r5 = r4;
    L_0x003b:
        r6 = r2.hasNext();
        r7 = 1;
        if (r6 == 0) goto L_0x007f;
    L_0x0042:
        r6 = r2.next();
        r6 = (com.adobe.xmp.impl.XMPNode) r6;
        r8 = RDF_ATTR_QUALIFIER;
        r9 = r6.getName();
        r8 = r8.contains(r9);
        if (r8 != 0) goto L_0x0057;
        r4 = r7;
        goto L_0x007e;
    L_0x0057:
        r5 = "rdf:resource";
        r8 = r6.getName();
        r5 = r5.equals(r8);
        r8 = 32;
        r10.write(r8);
        r8 = r6.getName();
        r10.write(r8);
        r8 = "=\"";
        r10.write(r8);
        r6 = r6.getValue();
        r10.appendNodeValue(r6, r7);
        r6 = 34;
        r10.write(r6);
    L_0x007e:
        goto L_0x003b;
    L_0x007f:
        if (r4 == 0) goto L_0x0085;
    L_0x0081:
        r10.serializeCompactRDFGeneralQualifier(r12, r0);
        goto L_0x00b3;
    L_0x0085:
        r2 = r0.getOptions();
        r2 = r2.isCompositeProperty();
        if (r2 != 0) goto L_0x00a6;
    L_0x008f:
        r0 = r10.serializeCompactRDFSimpleProp(r0);
        r2 = r0[r3];
        r2 = (java.lang.Boolean) r2;
        r2 = r2.booleanValue();
        r0 = r0[r7];
        r0 = (java.lang.Boolean) r0;
        r7 = r0.booleanValue();
        r0 = r2;
        goto L_0x00b9;
    L_0x00a6:
        r2 = r0.getOptions();
        r2 = r2.isArray();
        if (r2 == 0) goto L_0x00b5;
    L_0x00b0:
        r10.serializeCompactRDFArrayProp(r0, r12);
    L_0x00b3:
        r0 = r7;
        goto L_0x00b9;
    L_0x00b5:
        r0 = r10.serializeCompactRDFStructProp(r0, r12, r5);
    L_0x00b9:
        if (r0 == 0) goto L_0x00d0;
    L_0x00bb:
        if (r7 == 0) goto L_0x00c0;
    L_0x00bd:
        r10.writeIndent(r12);
    L_0x00c0:
        r0 = "</";
        r10.write(r0);
        r10.write(r1);
        r0 = 62;
        r10.write(r0);
        r10.writeNewline();
    L_0x00d0:
        goto L_0x0004;
    L_0x00d2:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPSerializerRDF.serializeCompactRDFElementProps(com.adobe.xmp.impl.XMPNode, int):void");
    }

    private Object[] serializeCompactRDFSimpleProp(XMPNode xMPNode) throws IOException {
        Boolean bool = Boolean.TRUE;
        Boolean bool2 = Boolean.TRUE;
        if (xMPNode.getOptions().isURI()) {
            write(" rdf:resource=\"");
            appendNodeValue(xMPNode.getValue(), true);
            write("\"/>");
            writeNewline();
            bool = Boolean.FALSE;
        } else if (xMPNode.getValue() == null || xMPNode.getValue().length() == 0) {
            write("/>");
            writeNewline();
            bool = Boolean.FALSE;
        } else {
            write(62);
            appendNodeValue(xMPNode.getValue(), false);
            bool2 = Boolean.FALSE;
        }
        return new Object[]{bool, bool2};
    }

    private void serializeCompactRDFArrayProp(XMPNode xMPNode, int i) throws IOException, XMPException {
        write(62);
        writeNewline();
        int i2 = i + 1;
        emitRDFArrayTag(xMPNode, true, i2);
        if (xMPNode.getOptions().isArrayAltText()) {
            XMPNodeUtils.normalizeLangArray(xMPNode);
        }
        serializeCompactRDFElementProps(xMPNode, i + 2);
        emitRDFArrayTag(xMPNode, false, i2);
    }

    private boolean serializeCompactRDFStructProp(XMPNode xMPNode, int i, boolean z) throws XMPException, IOException {
        Iterator iterateChildren = xMPNode.iterateChildren();
        boolean z2 = false;
        boolean z3 = z2;
        while (iterateChildren.hasNext()) {
            if (canBeRDFAttrProp((XMPNode) iterateChildren.next())) {
                z2 = true;
            } else {
                z3 = true;
            }
            if (z2 && r3) {
                break;
            }
        }
        if (z && z3) {
            throw new XMPException("Can't mix rdf:resource qualifier and element fields", 202);
        } else if (!xMPNode.hasChildren()) {
            write(" rdf:parseType=\"Resource\"/>");
            writeNewline();
            return false;
        } else if (z3) {
            if (z2) {
                write(62);
                writeNewline();
                int i2 = i + 1;
                writeIndent(i2);
                write(RDF_STRUCT_START);
                serializeCompactRDFAttrProps(xMPNode, i + 2);
                write(">");
                writeNewline();
                serializeCompactRDFElementProps(xMPNode, i2);
                writeIndent(i2);
                write("</rdf:Description>");
                writeNewline();
            } else {
                write(" rdf:parseType=\"Resource\">");
                writeNewline();
                serializeCompactRDFElementProps(xMPNode, i + 1);
            }
            return true;
        } else {
            serializeCompactRDFAttrProps(xMPNode, i + 1);
            write("/>");
            writeNewline();
            return false;
        }
    }

    private void serializeCompactRDFGeneralQualifier(int i, XMPNode xMPNode) throws IOException, XMPException {
        write(" rdf:parseType=\"Resource\">");
        writeNewline();
        i++;
        serializePrettyRDFProperty(xMPNode, true, i);
        Iterator iterateQualifier = xMPNode.iterateQualifier();
        while (iterateQualifier.hasNext()) {
            serializePrettyRDFProperty((XMPNode) iterateQualifier.next(), false, i);
        }
    }

    private void serializePrettyRDFSchema(XMPNode xMPNode) throws IOException, XMPException {
        writeIndent(2);
        write(RDF_SCHEMA_START);
        writeTreeName();
        Set hashSet = new HashSet();
        hashSet.add("xml");
        hashSet.add("rdf");
        declareUsedNamespaces(xMPNode, hashSet, 4);
        write(62);
        writeNewline();
        Iterator iterateChildren = xMPNode.iterateChildren();
        while (iterateChildren.hasNext()) {
            serializePrettyRDFProperty((XMPNode) iterateChildren.next(), false, 3);
        }
        writeIndent(2);
        write("</rdf:Description>");
        writeNewline();
    }

    private void declareUsedNamespaces(XMPNode xMPNode, Set set, int i) throws IOException {
        Iterator iterateChildren;
        if (xMPNode.getOptions().isSchemaNode()) {
            declareNamespace(xMPNode.getValue().substring(0, xMPNode.getValue().length() - 1), xMPNode.getName(), set, i);
        } else if (xMPNode.getOptions().isStruct()) {
            iterateChildren = xMPNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                declareNamespace(((XMPNode) iterateChildren.next()).getName(), null, set, i);
            }
        }
        iterateChildren = xMPNode.iterateChildren();
        while (iterateChildren.hasNext()) {
            declareUsedNamespaces((XMPNode) iterateChildren.next(), set, i);
        }
        Iterator iterateQualifier = xMPNode.iterateQualifier();
        while (iterateQualifier.hasNext()) {
            XMPNode xMPNode2 = (XMPNode) iterateQualifier.next();
            declareNamespace(xMPNode2.getName(), null, set, i);
            declareUsedNamespaces(xMPNode2, set, i);
        }
    }

    private void declareNamespace(String str, String str2, Set set, int i) throws IOException {
        if (str2 == null) {
            QName qName = new QName(str);
            if (qName.hasPrefix()) {
                str = qName.getPrefix();
                XMPSchemaRegistry schemaRegistry = XMPMetaFactory.getSchemaRegistry();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(":");
                str2 = schemaRegistry.getNamespaceURI(stringBuilder.toString());
                declareNamespace(str, str2, set, i);
            } else {
                return;
            }
        }
        if (!set.contains(str)) {
            writeNewline();
            writeIndent(i);
            write("xmlns:");
            write(str);
            write("=\"");
            write(str2);
            write(34);
            set.add(str);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:84:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:69:0x01bd  */
    private void serializePrettyRDFProperty(com.adobe.xmp.impl.XMPNode r13, boolean r14, int r15) throws java.io.IOException, com.adobe.xmp.XMPException {
        /*
        r12 = this;
        r0 = r13.getName();
        if (r14 == 0) goto L_0x000b;
    L_0x0008:
        r0 = "rdf:value";
        goto L_0x0015;
    L_0x000b:
        r1 = "[]";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x0015;
    L_0x0013:
        r0 = "rdf:li";
    L_0x0015:
        r12.writeIndent(r15);
        r1 = 60;
        r12.write(r1);
        r12.write(r0);
        r1 = r13.iterateQualifier();
        r2 = 0;
        r3 = r2;
        r4 = r3;
    L_0x0029:
        r5 = r1.hasNext();
        r6 = 34;
        r7 = 32;
        r8 = 1;
        if (r5 == 0) goto L_0x006f;
    L_0x0034:
        r5 = r1.next();
        r5 = (com.adobe.xmp.impl.XMPNode) r5;
        r9 = RDF_ATTR_QUALIFIER;
        r10 = r5.getName();
        r9 = r9.contains(r10);
        if (r9 != 0) goto L_0x0049;
        r3 = r8;
        goto L_0x006e;
    L_0x0049:
        r4 = "rdf:resource";
        r9 = r5.getName();
        r4 = r4.equals(r9);
        if (r14 != 0) goto L_0x006e;
    L_0x0055:
        r12.write(r7);
        r7 = r5.getName();
        r12.write(r7);
        r7 = "=\"";
        r12.write(r7);
        r5 = r5.getValue();
        r12.appendNodeValue(r5, r8);
        r12.write(r6);
    L_0x006e:
        goto L_0x0029;
    L_0x006f:
        r1 = 202; // 0xca float:2.83E-43 double:1.0E-321;
        r5 = 62;
        if (r3 == 0) goto L_0x00ae;
    L_0x0075:
        if (r14 != 0) goto L_0x00ae;
    L_0x0077:
        if (r4 != 0) goto L_0x00a6;
    L_0x0079:
        r14 = " rdf:parseType=\"Resource\">";
        r12.write(r14);
        r12.writeNewline();
        r14 = r15 + 1;
        r12.serializePrettyRDFProperty(r13, r8, r14);
        r13 = r13.iterateQualifier();
    L_0x008a:
        r1 = r13.hasNext();
        if (r1 == 0) goto L_0x0170;
    L_0x0090:
        r1 = r13.next();
        r1 = (com.adobe.xmp.impl.XMPNode) r1;
        r3 = RDF_ATTR_QUALIFIER;
        r4 = r1.getName();
        r3 = r3.contains(r4);
        if (r3 != 0) goto L_0x00a5;
    L_0x00a2:
        r12.serializePrettyRDFProperty(r1, r2, r14);
    L_0x00a5:
        goto L_0x008a;
    L_0x00a6:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Can't mix rdf:resource and general qualifiers";
        r13.<init>(r14, r1);
        throw r13;
    L_0x00ae:
        r14 = r13.getOptions();
        r14 = r14.isCompositeProperty();
        if (r14 != 0) goto L_0x0105;
    L_0x00b8:
        r14 = r13.getOptions();
        r14 = r14.isURI();
        if (r14 == 0) goto L_0x00d8;
    L_0x00c2:
        r14 = " rdf:resource=\"";
        r12.write(r14);
        r13 = r13.getValue();
        r12.appendNodeValue(r13, r8);
        r13 = "\"/>";
        r12.write(r13);
        r12.writeNewline();
        goto L_0x01bb;
    L_0x00d8:
        r14 = r13.getValue();
        if (r14 == 0) goto L_0x00fb;
    L_0x00de:
        r14 = "";
        r1 = r13.getValue();
        r14 = r14.equals(r1);
        if (r14 == 0) goto L_0x00eb;
    L_0x00ea:
        goto L_0x00fb;
    L_0x00eb:
        r12.write(r5);
        r13 = r13.getValue();
        r12.appendNodeValue(r13, r2);
        r11 = r8;
        r8 = r2;
        r2 = r11;
        goto L_0x01bb;
    L_0x00fb:
        r13 = "/>";
        r12.write(r13);
        r12.writeNewline();
        goto L_0x01bb;
    L_0x0105:
        r14 = r13.getOptions();
        r14 = r14.isArray();
        if (r14 == 0) goto L_0x0141;
    L_0x010f:
        r12.write(r5);
        r12.writeNewline();
        r14 = r15 + 1;
        r12.emitRDFArrayTag(r13, r8, r14);
        r1 = r13.getOptions();
        r1 = r1.isArrayAltText();
        if (r1 == 0) goto L_0x0127;
    L_0x0124:
        com.adobe.xmp.impl.XMPNodeUtils.normalizeLangArray(r13);
    L_0x0127:
        r1 = r13.iterateChildren();
    L_0x012b:
        r3 = r1.hasNext();
        if (r3 == 0) goto L_0x013d;
    L_0x0131:
        r3 = r1.next();
        r3 = (com.adobe.xmp.impl.XMPNode) r3;
        r4 = r15 + 2;
        r12.serializePrettyRDFProperty(r3, r2, r4);
        goto L_0x012b;
    L_0x013d:
        r12.emitRDFArrayTag(r13, r2, r14);
        goto L_0x0170;
    L_0x0141:
        if (r4 != 0) goto L_0x0172;
    L_0x0143:
        r14 = r13.hasChildren();
        if (r14 != 0) goto L_0x0152;
    L_0x0149:
        r13 = " rdf:parseType=\"Resource\"/>";
        r12.write(r13);
        r12.writeNewline();
        goto L_0x01bb;
    L_0x0152:
        r14 = " rdf:parseType=\"Resource\">";
        r12.write(r14);
        r12.writeNewline();
        r13 = r13.iterateChildren();
    L_0x015e:
        r14 = r13.hasNext();
        if (r14 == 0) goto L_0x0170;
    L_0x0164:
        r14 = r13.next();
        r14 = (com.adobe.xmp.impl.XMPNode) r14;
        r1 = r15 + 1;
        r12.serializePrettyRDFProperty(r14, r2, r1);
        goto L_0x015e;
    L_0x0170:
        r2 = r8;
        goto L_0x01bb;
    L_0x0172:
        r13 = r13.iterateChildren();
    L_0x0176:
        r14 = r13.hasNext();
        if (r14 == 0) goto L_0x01b2;
    L_0x017c:
        r14 = r13.next();
        r14 = (com.adobe.xmp.impl.XMPNode) r14;
        r3 = r12.canBeRDFAttrProp(r14);
        if (r3 == 0) goto L_0x01aa;
    L_0x0188:
        r12.writeNewline();
        r3 = r15 + 1;
        r12.writeIndent(r3);
        r12.write(r7);
        r3 = r14.getName();
        r12.write(r3);
        r3 = "=\"";
        r12.write(r3);
        r14 = r14.getValue();
        r12.appendNodeValue(r14, r8);
        r12.write(r6);
        goto L_0x0176;
    L_0x01aa:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Can't mix rdf:resource and complex fields";
        r13.<init>(r14, r1);
        throw r13;
    L_0x01b2:
        r13 = "/>";
        r12.write(r13);
        r12.writeNewline();
    L_0x01bb:
        if (r2 == 0) goto L_0x01d0;
    L_0x01bd:
        if (r8 == 0) goto L_0x01c2;
    L_0x01bf:
        r12.writeIndent(r15);
    L_0x01c2:
        r13 = "</";
        r12.write(r13);
        r12.write(r0);
        r12.write(r5);
        r12.writeNewline();
    L_0x01d0:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPSerializerRDF.serializePrettyRDFProperty(com.adobe.xmp.impl.XMPNode, boolean, int):void");
    }

    private void emitRDFArrayTag(XMPNode xMPNode, boolean z, int i) throws IOException {
        if (z || xMPNode.hasChildren()) {
            writeIndent(i);
            write(z ? "<rdf:" : "</rdf:");
            if (xMPNode.getOptions().isArrayAlternate()) {
                write("Alt");
            } else if (xMPNode.getOptions().isArrayOrdered()) {
                write("Seq");
            } else {
                write("Bag");
            }
            if (!z || xMPNode.hasChildren()) {
                write(">");
            } else {
                write("/>");
            }
            writeNewline();
        }
    }

    private void appendNodeValue(String str, boolean z) throws IOException {
        write(Utils.escapeXML(str, z, true));
    }

    private boolean canBeRDFAttrProp(XMPNode xMPNode) {
        return (xMPNode.hasQualifier() || xMPNode.getOptions().isURI() || xMPNode.getOptions().isCompositeProperty() || XMPConst.ARRAY_ITEM_NAME.equals(xMPNode.getName())) ? false : true;
    }

    private void writeIndent(int i) throws IOException {
        for (int baseIndent = this.options.getBaseIndent() + i; baseIndent > 0; baseIndent--) {
            this.writer.write(this.options.getIndent());
        }
    }

    private void write(int i) throws IOException {
        this.writer.write(i);
    }

    private void write(String str) throws IOException {
        this.writer.write(str);
    }

    private void writeChars(int i, char c) throws IOException {
        while (i > 0) {
            this.writer.write(c);
            i--;
        }
    }

    private void writeNewline() throws IOException {
        this.writer.write(this.options.getNewline());
    }
}
