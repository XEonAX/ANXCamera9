package android.os.statistics;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONException;
import org.json.JSONObject;

public final class E2EScenarioPayload implements Parcelable, Cloneable, Serializable {
    public static final Creator<E2EScenarioPayload> CREATOR = new Creator<E2EScenarioPayload>() {
        public E2EScenarioPayload createFromParcel(Parcel source) {
            return new E2EScenarioPayload(source);
        }

        public E2EScenarioPayload[] newArray(int size) {
            return new E2EScenarioPayload[size];
        }
    };
    private static final long serialVersionUID = 1;
    private final HashMap<String, String> values = new HashMap();

    public E2EScenarioPayload(Parcel source) {
        HashMap<String, String> valuesFromParcel = source.readHashMap(null);
        if (valuesFromParcel != null) {
            for (Entry<String, String> entry : valuesFromParcel.entrySet()) {
                String key = (String) entry.getKey();
                String value = (String) entry.getValue();
                if (!TextUtils.isEmpty(key)) {
                    this.values.put(key, value == null ? "" : value);
                }
            }
        }
    }

    public E2EScenarioPayload(Bundle bundle) {
        if (bundle != null) {
            for (String key : bundle.keySet()) {
                if (!TextUtils.isEmpty(key)) {
                    String value = bundle.getString(key);
                    this.values.put(key, value == null ? "" : value);
                }
            }
        }
    }

    public void mergeFrom(E2EScenarioPayload source) {
        this.values.putAll(source.values);
    }

    public Object clone() {
        E2EScenarioPayload result = new E2EScenarioPayload();
        result.values.putAll(this.values);
        return result;
    }

    public boolean isEmpty() {
        return this.values.isEmpty();
    }

    public void putValues(Object... keyandvalues) {
        if (keyandvalues != null) {
            if (keyandvalues.length % 2 != 1) {
                for (int i = 0; i < keyandvalues.length / 2; i++) {
                    put(keyandvalues[i * 2], keyandvalues[(i * 2) + 1]);
                }
                return;
            }
            throw new IllegalArgumentException("length of keyandvalues should be even");
        }
    }

    public void putAll(Map map) {
        if (map != null) {
            for (Object entry : map.entrySet()) {
                put(((Entry) entry).getKey(), ((Entry) entry).getValue());
            }
        }
    }

    public void put(Object key, Object value) {
        String valueStr = null;
        String keyStr = key == null ? null : key.toString();
        if (value != null) {
            valueStr = value.toString();
        }
        if (!TextUtils.isEmpty(keyStr)) {
            this.values.put(keyStr, valueStr == null ? "" : valueStr);
        }
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeMap(this.values);
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        try {
            for (Entry<String, String> entry : this.values.entrySet()) {
                json.put((String) entry.getKey(), entry.getValue());
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return json;
    }

    public void writeToBundle(Bundle bundle) {
        for (Entry<String, String> entry : this.values.entrySet()) {
            bundle.putString((String) entry.getKey(), (String) entry.getValue());
        }
    }
}
