package com.android.camera.sensitive;

import java.io.Serializable;
import java.util.TreeSet;

public class SensitiveNode implements Serializable {
    private static final long serialVersionUID = 1;
    protected final int headTwoCharMix;
    protected SensitiveNode next;
    protected final TreeSet<StringPointer> words = new TreeSet();

    public SensitiveNode(int i) {
        this.headTwoCharMix = i;
    }

    public SensitiveNode(int i, SensitiveNode sensitiveNode) {
        this.headTwoCharMix = i;
        sensitiveNode.next = this;
    }
}
