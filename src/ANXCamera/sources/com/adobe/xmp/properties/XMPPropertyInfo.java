package com.adobe.xmp.properties;

import com.adobe.xmp.options.PropertyOptions;

public interface XMPPropertyInfo extends XMPProperty {
    String getNamespace();

    PropertyOptions getOptions();

    String getPath();

    Object getValue();
}
