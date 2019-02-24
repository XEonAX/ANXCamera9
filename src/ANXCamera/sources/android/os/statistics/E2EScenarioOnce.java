package android.os.statistics;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.statistics.PerfEvent.DetailFields;
import org.json.JSONException;
import org.json.JSONObject;

public class E2EScenarioOnce extends MacroscopicEvent<E2EScenarioOnceDetails> {
    public static final Creator<E2EScenarioOnce> CREATOR = new Creator<E2EScenarioOnce>() {
        public E2EScenarioOnce createFromParcel(Parcel source) {
            E2EScenarioOnce object = new E2EScenarioOnce();
            object.readFromParcel(source);
            return object;
        }

        public E2EScenarioOnce[] newArray(int size) {
            return new E2EScenarioOnce[size];
        }
    };
    public int beginPid;
    public int beginTid;
    public long beginUptimeMillis;
    public int endPid;
    public int endTid;
    public long endUptimeMillis;
    public long scenarioOnceId;

    public static class E2EScenarioOnceDetails extends DetailFields {
        public String beginPackageName;
        public String beginProcessName;
        public long beginWalltimeMillis;
        public String endPackageName;
        public String endProcessName;
        public long endWalltimeMillis;
        public E2EScenarioPayload payload;
        public E2EScenario scenario;
        public E2EScenarioSettings settings;
        public String tag;
    }

    public E2EScenarioOnce() {
        super(65541, new E2EScenarioOnceDetails());
    }

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeLong(this.scenarioOnceId);
        E2EScenarioOnceDetails details = (E2EScenarioOnceDetails) getDetailsFields();
        dest.writeParcelable(details.scenario, flags);
        dest.writeParcelable(details.settings, flags);
        dest.writeString(details.tag);
        dest.writeParcelable(details.payload, flags);
        dest.writeLong(this.beginUptimeMillis);
        dest.writeLong(details.beginWalltimeMillis);
        dest.writeInt(this.beginPid);
        dest.writeInt(this.beginTid);
        dest.writeString(details.beginProcessName);
        dest.writeString(details.beginPackageName);
        dest.writeLong(this.endUptimeMillis);
        dest.writeLong(details.endWalltimeMillis);
        dest.writeInt(this.endPid);
        dest.writeInt(this.endTid);
        dest.writeString(details.endProcessName);
        dest.writeString(details.endPackageName);
    }

    public void readFromParcel(Parcel source) {
        super.readFromParcel(source);
        this.scenarioOnceId = source.readLong();
        E2EScenarioOnceDetails details = (E2EScenarioOnceDetails) getDetailsFields();
        details.scenario = (E2EScenario) source.readParcelable(null);
        details.settings = (E2EScenarioSettings) source.readParcelable(null);
        details.tag = source.readString();
        details.payload = (E2EScenarioPayload) source.readParcelable(null);
        this.beginUptimeMillis = source.readLong();
        details.beginWalltimeMillis = source.readLong();
        this.beginPid = source.readInt();
        this.beginTid = source.readInt();
        details.beginProcessName = source.readString();
        details.beginPackageName = source.readString();
        this.endUptimeMillis = source.readLong();
        details.endWalltimeMillis = source.readLong();
        this.endPid = source.readInt();
        this.endTid = source.readInt();
        details.endProcessName = source.readString();
        details.endPackageName = source.readString();
    }

    public void writeToJson(JSONObject json) {
        super.writeToJson(json);
        try {
            json.put("scenarioOnceId", this.scenarioOnceId);
            E2EScenarioOnceDetails details = (E2EScenarioOnceDetails) getDetailsFields();
            json.put("scenario", details.scenario.toJson());
            if (!(details.payload == null || details.payload.isEmpty())) {
                json.put("payload", details.payload.toJson());
            }
            json.put("beginUptime", this.beginUptimeMillis);
            json.put("beginWalltime", details.beginWalltimeMillis);
            json.put("beginPid", this.beginPid);
            json.put("beginTid", this.beginTid);
            json.put("beginProcessName", details.beginProcessName);
            json.put("beginPackageName", details.beginPackageName);
            json.put("endUptime", this.endUptimeMillis);
            json.put("endWalltime", details.endWalltimeMillis);
            json.put("endPid", this.endPid);
            json.put("endTid", this.endTid);
            json.put("endProcessName", details.endProcessName);
            json.put("endPackageName", details.endPackageName);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    boolean occursInCurrentProcess() {
        return false;
    }

    void fillIn(JniParcel dataParcel, Object javaBackTrace, NativeBackTrace nativeBackTrace) {
    }

    public boolean isUserPerceptible() {
        return true;
    }
}
