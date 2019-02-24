package com.android.camera.network.resource;

public class LiveResource {
    public String id;
    public boolean isLocal;

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LiveResource{id=");
        stringBuilder.append(this.id);
        stringBuilder.append(", ");
        stringBuilder.append(this.isLocal ? "local" : "online");
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
