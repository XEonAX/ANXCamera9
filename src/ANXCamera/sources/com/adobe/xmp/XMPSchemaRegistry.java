package com.adobe.xmp;

import com.adobe.xmp.properties.XMPAliasInfo;
import java.util.Map;

public interface XMPSchemaRegistry {
    void deleteNamespace(String str);

    XMPAliasInfo findAlias(String str);

    XMPAliasInfo[] findAliases(String str);

    Map getAliases();

    String getNamespacePrefix(String str);

    String getNamespaceURI(String str);

    Map getNamespaces();

    Map getPrefixes();

    String registerNamespace(String str, String str2) throws XMPException;

    XMPAliasInfo resolveAlias(String str, String str2);
}
