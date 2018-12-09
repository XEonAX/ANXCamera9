package com.adobe.xmp.properties;

import com.adobe.xmp.options.AliasOptions;

public interface XMPAliasInfo {
    AliasOptions getAliasForm();

    String getNamespace();

    String getPrefix();

    String getPropName();
}
