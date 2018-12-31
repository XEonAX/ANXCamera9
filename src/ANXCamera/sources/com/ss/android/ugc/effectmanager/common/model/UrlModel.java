package com.ss.android.ugc.effectmanager.common.model;

import java.util.List;

public class UrlModel {
    private String uri;
    private List<String> url_list;

    public List<String> getUrlList() {
        return this.url_list;
    }

    public void setUrlList(List<String> list) {
        this.url_list = list;
    }

    public String getUri() {
        return this.uri;
    }

    public void setUri(String str) {
        this.uri = str;
    }
}
