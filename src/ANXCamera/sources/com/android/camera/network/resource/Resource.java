package com.android.camera.network.resource;

import android.text.TextUtils;

public class Resource {
    public int category;
    public String content;
    public String extra;
    public String icon;
    public long id;
    public String label;
    public long parent;
    public String type;

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Resource)) {
            return false;
        }
        Resource resource = (Resource) obj;
        if (!(this.id == resource.id && this.parent == resource.parent && this.category == resource.category && TextUtils.equals(this.type, resource.type) && TextUtils.equals(this.label, resource.label) && TextUtils.equals(this.icon, resource.icon) && TextUtils.equals(this.extra, resource.extra) && TextUtils.equals(this.content, resource.content))) {
            z = false;
        }
        return z;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Resource{id=");
        stringBuilder.append(this.id);
        stringBuilder.append(", parent=");
        stringBuilder.append(this.parent);
        stringBuilder.append(", category=");
        stringBuilder.append(this.category);
        stringBuilder.append(", type='");
        stringBuilder.append(this.type);
        stringBuilder.append('\'');
        stringBuilder.append(", label='");
        stringBuilder.append(this.label);
        stringBuilder.append('\'');
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
