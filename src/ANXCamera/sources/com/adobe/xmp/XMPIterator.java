package com.adobe.xmp;

import java.util.Iterator;

public interface XMPIterator extends Iterator {
    void skipSiblings();

    void skipSubtree();
}
