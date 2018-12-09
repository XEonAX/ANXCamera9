package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

class XMPNode implements Comparable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private boolean alias;
    private List children;
    private boolean hasAliases;
    private boolean hasValueChild;
    private boolean implicit;
    private String name;
    private PropertyOptions options;
    private XMPNode parent;
    private List qualifier;
    private String value;

    public XMPNode(String str, String str2, PropertyOptions propertyOptions) {
        this.children = null;
        this.qualifier = null;
        this.options = null;
        this.name = str;
        this.value = str2;
        this.options = propertyOptions;
    }

    public XMPNode(String str, PropertyOptions propertyOptions) {
        this(str, null, propertyOptions);
    }

    public void clear() {
        this.options = null;
        this.name = null;
        this.value = null;
        this.children = null;
        this.qualifier = null;
    }

    public XMPNode getParent() {
        return this.parent;
    }

    public XMPNode getChild(int i) {
        return (XMPNode) getChildren().get(i - 1);
    }

    public void addChild(XMPNode xMPNode) throws XMPException {
        assertChildNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        getChildren().add(xMPNode);
    }

    public void addChild(int i, XMPNode xMPNode) throws XMPException {
        assertChildNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        getChildren().add(i - 1, xMPNode);
    }

    public void replaceChild(int i, XMPNode xMPNode) {
        xMPNode.setParent(this);
        getChildren().set(i - 1, xMPNode);
    }

    public void removeChild(int i) {
        getChildren().remove(i - 1);
        cleanupChildren();
    }

    public void removeChild(XMPNode xMPNode) {
        getChildren().remove(xMPNode);
        cleanupChildren();
    }

    protected void cleanupChildren() {
        if (this.children.isEmpty()) {
            this.children = null;
        }
    }

    public void removeChildren() {
        this.children = null;
    }

    public int getChildrenLength() {
        return this.children != null ? this.children.size() : 0;
    }

    public XMPNode findChildByName(String str) {
        return find(getChildren(), str);
    }

    public XMPNode getQualifier(int i) {
        return (XMPNode) getQualifier().get(i - 1);
    }

    public int getQualifierLength() {
        return this.qualifier != null ? this.qualifier.size() : 0;
    }

    public void addQualifier(XMPNode xMPNode) throws XMPException {
        assertQualifierNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        xMPNode.getOptions().setQualifier(true);
        getOptions().setHasQualifiers(true);
        if (xMPNode.isLanguageNode()) {
            this.options.setHasLanguage(true);
            getQualifier().add(0, xMPNode);
        } else if (xMPNode.isTypeNode()) {
            this.options.setHasType(true);
            getQualifier().add(this.options.getHasLanguage(), xMPNode);
        } else {
            getQualifier().add(xMPNode);
        }
    }

    public void removeQualifier(XMPNode xMPNode) {
        PropertyOptions options = getOptions();
        if (xMPNode.isLanguageNode()) {
            options.setHasLanguage(false);
        } else if (xMPNode.isTypeNode()) {
            options.setHasType(false);
        }
        getQualifier().remove(xMPNode);
        if (this.qualifier.isEmpty()) {
            options.setHasQualifiers(false);
            this.qualifier = null;
        }
    }

    public void removeQualifiers() {
        PropertyOptions options = getOptions();
        options.setHasQualifiers(false);
        options.setHasLanguage(false);
        options.setHasType(false);
        this.qualifier = null;
    }

    public XMPNode findQualifierByName(String str) {
        return find(this.qualifier, str);
    }

    public boolean hasChildren() {
        return this.children != null && this.children.size() > 0;
    }

    public Iterator iterateChildren() {
        if (this.children != null) {
            return getChildren().iterator();
        }
        return Collections.EMPTY_LIST.listIterator();
    }

    public boolean hasQualifier() {
        return this.qualifier != null && this.qualifier.size() > 0;
    }

    public Iterator iterateQualifier() {
        if (this.qualifier == null) {
            return Collections.EMPTY_LIST.iterator();
        }
        final Iterator it = getQualifier().iterator();
        return new Iterator() {
            public boolean hasNext() {
                return it.hasNext();
            }

            public Object next() {
                return it.next();
            }

            public void remove() {
                throw new UnsupportedOperationException("remove() is not allowed due to the internal contraints");
            }
        };
    }

    public Object clone() {
        PropertyOptions propertyOptions;
        try {
            propertyOptions = new PropertyOptions(getOptions().getOptions());
        } catch (XMPException e) {
            propertyOptions = new PropertyOptions();
        }
        XMPNode xMPNode = new XMPNode(this.name, this.value, propertyOptions);
        cloneSubtree(xMPNode);
        return xMPNode;
    }

    public void cloneSubtree(XMPNode xMPNode) {
        try {
            Iterator iterateChildren = iterateChildren();
            while (iterateChildren.hasNext()) {
                xMPNode.addChild((XMPNode) ((XMPNode) iterateChildren.next()).clone());
            }
            iterateChildren = iterateQualifier();
            while (iterateChildren.hasNext()) {
                xMPNode.addQualifier((XMPNode) ((XMPNode) iterateChildren.next()).clone());
            }
        } catch (XMPException e) {
        }
    }

    public String dumpNode(boolean z) {
        StringBuffer stringBuffer = new StringBuffer(512);
        dumpNode(stringBuffer, z, 0, 0);
        return stringBuffer.toString();
    }

    public int compareTo(Object obj) {
        if (getOptions().isSchemaNode()) {
            return this.value.compareTo(((XMPNode) obj).getValue());
        }
        return this.name.compareTo(((XMPNode) obj).getName());
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public PropertyOptions getOptions() {
        if (this.options == null) {
            this.options = new PropertyOptions();
        }
        return this.options;
    }

    public void setOptions(PropertyOptions propertyOptions) {
        this.options = propertyOptions;
    }

    public boolean isImplicit() {
        return this.implicit;
    }

    public void setImplicit(boolean z) {
        this.implicit = z;
    }

    public boolean getHasAliases() {
        return this.hasAliases;
    }

    public void setHasAliases(boolean z) {
        this.hasAliases = z;
    }

    public boolean isAlias() {
        return this.alias;
    }

    public void setAlias(boolean z) {
        this.alias = z;
    }

    public boolean getHasValueChild() {
        return this.hasValueChild;
    }

    public void setHasValueChild(boolean z) {
        this.hasValueChild = z;
    }

    public void sort() {
        if (hasQualifier()) {
            XMPNode[] xMPNodeArr = (XMPNode[]) getQualifier().toArray(new XMPNode[getQualifierLength()]);
            int i = 0;
            int i2 = 0;
            while (xMPNodeArr.length > i2 && (XMPConst.XML_LANG.equals(xMPNodeArr[i2].getName()) || XMPConst.RDF_TYPE.equals(xMPNodeArr[i2].getName()))) {
                xMPNodeArr[i2].sort();
                i2++;
            }
            Arrays.sort(xMPNodeArr, i2, xMPNodeArr.length);
            ListIterator listIterator = this.qualifier.listIterator();
            while (i < xMPNodeArr.length) {
                listIterator.next();
                listIterator.set(xMPNodeArr[i]);
                xMPNodeArr[i].sort();
                i++;
            }
        }
        if (hasChildren()) {
            if (!getOptions().isArray()) {
                Collections.sort(this.children);
            }
            Iterator iterateChildren = iterateChildren();
            while (iterateChildren.hasNext()) {
                ((XMPNode) iterateChildren.next()).sort();
            }
        }
    }

    private void dumpNode(StringBuffer stringBuffer, boolean z, int i, int i2) {
        int i3;
        XMPNode[] xMPNodeArr;
        int i4 = 0;
        for (i3 = 0; i3 < i; i3++) {
            stringBuffer.append(9);
        }
        if (this.parent == null) {
            stringBuffer.append("ROOT NODE");
            if (this.name != null && this.name.length() > 0) {
                stringBuffer.append(" (");
                stringBuffer.append(this.name);
                stringBuffer.append(')');
            }
        } else if (getOptions().isQualifier()) {
            stringBuffer.append('?');
            stringBuffer.append(this.name);
        } else if (getParent().getOptions().isArray()) {
            stringBuffer.append('[');
            stringBuffer.append(i2);
            stringBuffer.append(']');
        } else {
            stringBuffer.append(this.name);
        }
        if (this.value != null && this.value.length() > 0) {
            stringBuffer.append(" = \"");
            stringBuffer.append(this.value);
            stringBuffer.append('\"');
        }
        if (getOptions().containsOneOf(-1)) {
            stringBuffer.append("\t(");
            stringBuffer.append(getOptions().toString());
            stringBuffer.append(" : ");
            stringBuffer.append(getOptions().getOptionsString());
            stringBuffer.append(')');
        }
        stringBuffer.append(10);
        if (z && hasQualifier()) {
            xMPNodeArr = (XMPNode[]) getQualifier().toArray(new XMPNode[getQualifierLength()]);
            i3 = 0;
            while (xMPNodeArr.length > i3 && (XMPConst.XML_LANG.equals(xMPNodeArr[i3].getName()) || XMPConst.RDF_TYPE.equals(xMPNodeArr[i3].getName()))) {
                i3++;
            }
            Arrays.sort(xMPNodeArr, i3, xMPNodeArr.length);
            i3 = 0;
            while (i3 < xMPNodeArr.length) {
                i3++;
                xMPNodeArr[i3].dumpNode(stringBuffer, z, i + 2, i3);
            }
        }
        if (z && hasChildren()) {
            xMPNodeArr = (XMPNode[]) getChildren().toArray(new XMPNode[getChildrenLength()]);
            if (!getOptions().isArray()) {
                Arrays.sort(xMPNodeArr);
            }
            while (i4 < xMPNodeArr.length) {
                i4++;
                xMPNodeArr[i4].dumpNode(stringBuffer, z, i + 1, i4);
            }
        }
    }

    private boolean isLanguageNode() {
        return XMPConst.XML_LANG.equals(this.name);
    }

    private boolean isTypeNode() {
        return XMPConst.RDF_TYPE.equals(this.name);
    }

    private List getChildren() {
        if (this.children == null) {
            this.children = new ArrayList(0);
        }
        return this.children;
    }

    public List getUnmodifiableChildren() {
        return Collections.unmodifiableList(new ArrayList(getChildren()));
    }

    private List getQualifier() {
        if (this.qualifier == null) {
            this.qualifier = new ArrayList(0);
        }
        return this.qualifier;
    }

    protected void setParent(XMPNode xMPNode) {
        this.parent = xMPNode;
    }

    private XMPNode find(List list, String str) {
        if (list != null) {
            for (XMPNode xMPNode : list) {
                if (xMPNode.getName().equals(str)) {
                    return xMPNode;
                }
            }
        }
        return null;
    }

    private void assertChildNotExisting(String str) throws XMPException {
        if (!XMPConst.ARRAY_ITEM_NAME.equals(str) && findChildByName(str) != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Duplicate property or field node '");
            stringBuilder.append(str);
            stringBuilder.append("'");
            throw new XMPException(stringBuilder.toString(), 203);
        }
    }

    private void assertQualifierNotExisting(String str) throws XMPException {
        if (!XMPConst.ARRAY_ITEM_NAME.equals(str) && findQualifierByName(str) != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Duplicate '");
            stringBuilder.append(str);
            stringBuilder.append("' qualifier");
            throw new XMPException(stringBuilder.toString(), 203);
        }
    }
}
