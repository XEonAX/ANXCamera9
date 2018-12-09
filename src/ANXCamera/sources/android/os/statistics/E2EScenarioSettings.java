package android.os.statistics;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public final class E2EScenarioSettings implements Parcelable, Cloneable, Serializable {
    public static final Creator<E2EScenarioSettings> CREATOR = new Creator<E2EScenarioSettings>() {
        public E2EScenarioSettings createFromParcel(Parcel source) {
            return new E2EScenarioSettings(source);
        }

        public E2EScenarioSettings[] newArray(int size) {
            return new E2EScenarioSettings[size];
        }
    };
    public static final int STATISTICS_MODE_ALL = 7;
    public static final int STATISTICS_MODE_AVERAGE = 1;
    public static final int STATISTICS_MODE_DISTRIBUTION = 4;
    public static final int STATISTICS_MODE_HISTORY = 2;
    public static final int STATISTICS_MODE_NONE = 0;
    private static final long serialVersionUID = 1;
    public int historyLimitPerDay;
    public boolean isAutoAnalysisEnabled;
    public int slownessFloorThresholdMillis;
    public int statisticsMode;
    public int timeoutMillisOfAutoAnalysis;

    public E2EScenarioSettings(Parcel source) {
        this.statisticsMode = source.readInt();
        this.historyLimitPerDay = source.readInt();
        this.isAutoAnalysisEnabled = source.readInt() != 0;
        this.slownessFloorThresholdMillis = source.readInt();
        this.timeoutMillisOfAutoAnalysis = source.readInt();
    }

    public boolean isValid() {
        if (!this.isAutoAnalysisEnabled || this.slownessFloorThresholdMillis > 0) {
            return true;
        }
        return false;
    }

    public Object clone() {
        E2EScenarioSettings result = new E2EScenarioSettings();
        result.statisticsMode = this.statisticsMode;
        result.historyLimitPerDay = this.historyLimitPerDay;
        result.isAutoAnalysisEnabled = this.isAutoAnalysisEnabled;
        result.slownessFloorThresholdMillis = this.slownessFloorThresholdMillis;
        result.timeoutMillisOfAutoAnalysis = this.timeoutMillisOfAutoAnalysis;
        return result;
    }

    public void setStatisticsMode(int mode) {
        this.statisticsMode = mode;
    }

    public void setHistoryLimitPerDay(int historyLimitPerDay) {
        this.historyLimitPerDay = historyLimitPerDay;
    }

    public void enableAutoAnalysis(int slownessFloorThresholdMillis, int timeoutMillisOfAutoAnalysis) {
        this.isAutoAnalysisEnabled = true;
        this.slownessFloorThresholdMillis = slownessFloorThresholdMillis;
        this.timeoutMillisOfAutoAnalysis = timeoutMillisOfAutoAnalysis;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.statisticsMode);
        dest.writeInt(this.historyLimitPerDay);
        dest.writeInt(this.isAutoAnalysisEnabled);
        dest.writeInt(this.slownessFloorThresholdMillis);
        dest.writeInt(this.timeoutMillisOfAutoAnalysis);
    }
}
