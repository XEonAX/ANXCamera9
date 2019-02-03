package com.ss.android.ugc.effectmanager.effect.model;

import java.util.List;

public class ComposerNode {
    public static final int NODE_TYPE_FOLDER_0 = 4;
    public static final int NODE_TYPE_FOLDER_1 = 1;
    public static final int NODE_TYPE_ITEM_0 = -1;
    public static final int NODE_TYPE_ITEM_1 = 0;
    public static final int NODE_TYPE_ITEM_BAR_0 = 2;
    public static final int NODE_TYPE_ITEM_BAR_1 = 3;
    public static final String TYPE_LOCAL = "ComposerNode";
    public String UI_name;
    public List<ComposerNode> children;
    public float default_value;
    public Effect effect = null;
    public String file;
    public String icon;
    public float max_value;
    public float min_value;
    public ComposerNode parent;
    public int switch_mode;
    public String tag_name;
    public int type = 0;

    public boolean isLeaf() {
        if (this.type == 4 || this.type == 1) {
            return false;
        }
        return true;
    }
}
