package com.google.android.apps.gsa.publicsearch;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class SystemParcelableWrapper implements Parcelable {
    public static final Creator<SystemParcelableWrapper> CREATOR = new Creator<SystemParcelableWrapper>() {
        public SystemParcelableWrapper createFromParcel(Parcel parcel) {
            return new SystemParcelableWrapper(parcel.readParcelable(null));
        }

        public SystemParcelableWrapper[] newArray(int i) {
            return new SystemParcelableWrapper[i];
        }
    };
    private final Parcelable parcelable;

    public SystemParcelableWrapper(Parcelable parcelable) {
        if (isSystemParcelable(parcelable)) {
            this.parcelable = parcelable;
            return;
        }
        throw new IllegalArgumentException("Only Android system classes can be passed in SystemParcelableWrapper.");
    }

    public Parcelable getParcelable() {
        return this.parcelable;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.parcelable, i);
    }

    static boolean isSystemParcelable(Parcelable parcelable) {
        return parcelable.getClass().getName().startsWith("android.os.");
    }
}
