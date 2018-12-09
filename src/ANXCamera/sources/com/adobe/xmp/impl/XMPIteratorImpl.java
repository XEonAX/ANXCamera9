package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.IteratorOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPPropertyInfo;
import java.util.Collections;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class XMPIteratorImpl implements XMPIterator {
    private String baseNS = null;
    private Iterator nodeIterator = null;
    private IteratorOptions options;
    protected boolean skipSiblings = false;
    protected boolean skipSubtree = false;

    private class NodeIterator implements Iterator {
        protected static final int ITERATE_CHILDREN = 1;
        protected static final int ITERATE_NODE = 0;
        protected static final int ITERATE_QUALIFIER = 2;
        private Iterator childrenIterator = null;
        private int index = 0;
        private String path;
        private XMPPropertyInfo returnProperty = null;
        private int state = 0;
        private Iterator subIterator = Collections.EMPTY_LIST.iterator();
        private XMPNode visitedNode;

        public NodeIterator(XMPNode xMPNode, String str, int i) {
            this.visitedNode = xMPNode;
            this.state = 0;
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            }
            this.path = accumulatePath(xMPNode, str, i);
        }

        public boolean hasNext() {
            if (this.returnProperty != null) {
                return true;
            }
            if (this.state == 0) {
                return reportNode();
            }
            if (this.state == 1) {
                if (this.childrenIterator == null) {
                    this.childrenIterator = this.visitedNode.iterateChildren();
                }
                boolean iterateChildren = iterateChildren(this.childrenIterator);
                if (!(iterateChildren || !this.visitedNode.hasQualifier() || XMPIteratorImpl.this.getOptions().isOmitQualifiers())) {
                    this.state = 2;
                    this.childrenIterator = null;
                    iterateChildren = hasNext();
                }
                return iterateChildren;
            }
            if (this.childrenIterator == null) {
                this.childrenIterator = this.visitedNode.iterateQualifier();
            }
            return iterateChildren(this.childrenIterator);
        }

        protected boolean reportNode() {
            this.state = 1;
            if (this.visitedNode.getParent() == null || (XMPIteratorImpl.this.getOptions().isJustLeafnodes() && this.visitedNode.hasChildren())) {
                return hasNext();
            }
            this.returnProperty = createPropertyInfo(this.visitedNode, XMPIteratorImpl.this.getBaseNS(), this.path);
            return true;
        }

        private boolean iterateChildren(Iterator it) {
            if (XMPIteratorImpl.this.skipSiblings) {
                XMPIteratorImpl.this.skipSiblings = false;
                this.subIterator = Collections.EMPTY_LIST.iterator();
            }
            if (!this.subIterator.hasNext() && it.hasNext()) {
                XMPNode xMPNode = (XMPNode) it.next();
                this.index++;
                this.subIterator = new NodeIterator(xMPNode, this.path, this.index);
            }
            if (!this.subIterator.hasNext()) {
                return false;
            }
            this.returnProperty = (XMPPropertyInfo) this.subIterator.next();
            return true;
        }

        public Object next() {
            if (hasNext()) {
                XMPPropertyInfo xMPPropertyInfo = this.returnProperty;
                this.returnProperty = null;
                return xMPPropertyInfo;
            }
            throw new NoSuchElementException("There are no more nodes to return");
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }

        protected String accumulatePath(XMPNode xMPNode, String str, int i) {
            if (xMPNode.getParent() == null || xMPNode.getOptions().isSchemaNode()) {
                return null;
            }
            StringBuilder stringBuilder;
            String str2;
            String stringBuilder2;
            if (xMPNode.getParent().getOptions().isArray()) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("[");
                stringBuilder.append(String.valueOf(i));
                stringBuilder.append("]");
                str2 = "";
                stringBuilder2 = stringBuilder.toString();
            } else {
                str2 = "/";
                stringBuilder2 = xMPNode.getName();
            }
            if (str == null || str.length() == 0) {
                return stringBuilder2;
            }
            if (XMPIteratorImpl.this.getOptions().isJustLeafname()) {
                if (stringBuilder2.startsWith("?")) {
                    stringBuilder2 = stringBuilder2.substring(1);
                }
                return stringBuilder2;
            }
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(str2);
            stringBuilder.append(stringBuilder2);
            return stringBuilder.toString();
        }

        protected XMPPropertyInfo createPropertyInfo(XMPNode xMPNode, String str, String str2) {
            final String value = xMPNode.getOptions().isSchemaNode() ? null : xMPNode.getValue();
            final String str3 = str;
            final String str4 = str2;
            final XMPNode xMPNode2 = xMPNode;
            return new XMPPropertyInfo() {
                public String getNamespace() {
                    return str3;
                }

                public String getPath() {
                    return str4;
                }

                public Object getValue() {
                    return value;
                }

                public PropertyOptions getOptions() {
                    return xMPNode2.getOptions();
                }

                public String getLanguage() {
                    return null;
                }
            };
        }

        protected Iterator getChildrenIterator() {
            return this.childrenIterator;
        }

        protected void setChildrenIterator(Iterator it) {
            this.childrenIterator = it;
        }

        protected XMPPropertyInfo getReturnProperty() {
            return this.returnProperty;
        }

        protected void setReturnProperty(XMPPropertyInfo xMPPropertyInfo) {
            this.returnProperty = xMPPropertyInfo;
        }
    }

    private class NodeIteratorChildren extends NodeIterator {
        private Iterator childrenIterator;
        private int index = 0;
        private String parentPath;

        public NodeIteratorChildren(XMPNode xMPNode, String str) {
            super();
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            }
            this.parentPath = accumulatePath(xMPNode, str, 1);
            this.childrenIterator = xMPNode.iterateChildren();
        }

        public boolean hasNext() {
            if (getReturnProperty() != null) {
                return true;
            }
            if (XMPIteratorImpl.this.skipSiblings || !this.childrenIterator.hasNext()) {
                return false;
            }
            XMPNode xMPNode = (XMPNode) this.childrenIterator.next();
            this.index++;
            String str = null;
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            } else if (xMPNode.getParent() != null) {
                str = accumulatePath(xMPNode, this.parentPath, this.index);
            }
            if (XMPIteratorImpl.this.getOptions().isJustLeafnodes() && xMPNode.hasChildren()) {
                return hasNext();
            }
            setReturnProperty(createPropertyInfo(xMPNode, XMPIteratorImpl.this.getBaseNS(), str));
            return true;
        }
    }

    public XMPIteratorImpl(XMPMetaImpl xMPMetaImpl, String str, String str2, IteratorOptions iteratorOptions) throws XMPException {
        XMPNode root;
        String str3 = null;
        if (iteratorOptions == null) {
            iteratorOptions = new IteratorOptions();
        }
        this.options = iteratorOptions;
        int i = (str == null || str.length() <= 0) ? false : 1;
        int i2 = (str2 == null || str2.length() <= 0) ? false : 1;
        if (i == 0 && i2 == 0) {
            root = xMPMetaImpl.getRoot();
        } else if (i != 0 && i2 != 0) {
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPPath xMPPath = new XMPPath();
            for (i2 = 0; i2 < expandXPath.size() - 1; i2++) {
                xMPPath.add(expandXPath.getSegment(i2));
            }
            root = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), expandXPath, false, null);
            this.baseNS = str;
            str3 = xMPPath.toString();
        } else if (i == 0 || i2 != 0) {
            throw new XMPException("Schema namespace URI is required", 101);
        } else {
            root = XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), str, false);
        }
        if (root == null) {
            this.nodeIterator = Collections.EMPTY_LIST.iterator();
        } else if (this.options.isJustChildren()) {
            this.nodeIterator = new NodeIteratorChildren(root, str3);
        } else {
            this.nodeIterator = new NodeIterator(root, str3, 1);
        }
    }

    public void skipSubtree() {
        this.skipSubtree = true;
    }

    public void skipSiblings() {
        skipSubtree();
        this.skipSiblings = true;
    }

    public boolean hasNext() {
        return this.nodeIterator.hasNext();
    }

    public Object next() {
        return this.nodeIterator.next();
    }

    public void remove() {
        throw new UnsupportedOperationException("The XMPIterator does not support remove().");
    }

    protected IteratorOptions getOptions() {
        return this.options;
    }

    protected String getBaseNS() {
        return this.baseNS;
    }

    protected void setBaseNS(String str) {
        this.baseNS = str;
    }
}
