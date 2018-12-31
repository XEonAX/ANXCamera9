package com.adobe.xmp.properties;

import com.adobe.xmp.options.PropertyOptions;

public interface XMPProperty {
    String getLanguage();

    PropertyOptions getOptions();

    Object getValue();
}
