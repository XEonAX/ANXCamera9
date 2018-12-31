package com.ss.android.ugc.effectmanager.link.model.host;

import com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoomItem;
import java.net.URI;

public class Host extends BlackRoomItem {
    private String host;
    private int port = -1;
    private String schema;
    private long sortTime;
    private long weightTime;

    public Host(String str, String str2) {
        this.host = str;
        this.schema = str2;
    }

    public Host(String str) {
        URI create = URI.create(str);
        this.host = create.getHost();
        this.schema = create.getScheme();
        this.port = create.getPort();
    }

    public Host(URI uri) {
        this.host = uri.getHost();
        this.schema = uri.getScheme();
    }

    public Host(String str, String str2, long j) {
        this.host = str;
        this.schema = str2;
        this.weightTime = j;
    }

    public int getPort() {
        return this.port;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public String getHost() {
        return this.host;
    }

    public void setHost(String str) {
        this.host = str;
    }

    public String getSchema() {
        return this.schema;
    }

    public void setSchema(String str) {
        this.schema = str;
    }

    public long getWeightTime() {
        return this.weightTime;
    }

    public void setWeightTime(long j) {
        this.weightTime = j;
    }

    public boolean hostEquals(Host host) {
        boolean z = false;
        if (host == null) {
            return false;
        }
        if (host.getHost().equals(getHost()) && host.getSchema().equals(getSchema())) {
            z = true;
        }
        return z;
    }

    public long getSortTime() {
        return this.sortTime + this.weightTime;
    }

    public void setSortTime(long j) {
        this.sortTime = j;
    }

    public String getItemName() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getSchema());
        stringBuilder.append("://");
        stringBuilder.append(getHost());
        String stringBuilder2 = stringBuilder.toString();
        if (this.port == -1) {
            return stringBuilder2;
        }
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(stringBuilder2);
        stringBuilder3.append(":");
        stringBuilder3.append(this.port);
        return stringBuilder3.toString();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Host{weightTime=");
        stringBuilder.append(this.weightTime);
        stringBuilder.append(", schema='");
        stringBuilder.append(this.schema);
        stringBuilder.append('\'');
        stringBuilder.append(", host='");
        stringBuilder.append(this.host);
        stringBuilder.append('\'');
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
