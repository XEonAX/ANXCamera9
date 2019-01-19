package com.ss.android.vesdk.keyvaluepair;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class VEKeyValue {
    private boolean mIsFirst = true;
    private Map<String, String> mKVPair = new HashMap();
    private StringBuilder mKVSB = new StringBuilder();

    public VEKeyValue add(String str, int i) {
        Map map = this.mKVPair;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(i);
        stringBuilder.append("");
        map.put(str, stringBuilder.toString());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(i);
        stringBuilder2.append("");
        addSB(str, stringBuilder2.toString());
        return this;
    }

    public VEKeyValue add(String str, float f) {
        Map map = this.mKVPair;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(f);
        stringBuilder.append("");
        map.put(str, stringBuilder.toString());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(f);
        stringBuilder2.append("");
        addSB(str, stringBuilder2.toString());
        return this;
    }

    public VEKeyValue add(String str, String str2) {
        this.mKVPair.put(str, str2);
        addSB(str, str2);
        return this;
    }

    private void addSB(String str, String str2) {
        if (!this.mIsFirst) {
            this.mKVSB.append(",");
        }
        this.mKVSB.append("\"");
        this.mKVSB.append(str);
        this.mKVSB.append("\"");
        this.mKVSB.append(":");
        this.mKVSB.append("\"");
        this.mKVSB.append(str2);
        this.mKVSB.append("\"");
        if (this.mIsFirst) {
            this.mIsFirst = false;
        }
    }

    @Nullable
    public JSONObject parseJsonObj() {
        try {
            JSONObject jSONObject = new JSONObject();
            for (String str : this.mKVPair.keySet()) {
                jSONObject.put(str, (String) this.mKVPair.get(str));
            }
            return jSONObject;
        } catch (JSONException e) {
            return null;
        }
    }

    @NonNull
    public String parseJsonStr() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("{");
        stringBuilder.append(this.mKVSB);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
