package android.support.test.internal.util;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ParcelableIBinder implements Parcelable {
    public static final Creator<ParcelableIBinder> CREATOR = new Creator<ParcelableIBinder>() {
        public ParcelableIBinder createFromParcel(Parcel parcel) {
            return new ParcelableIBinder(parcel);
        }

        public ParcelableIBinder[] newArray(int i) {
            return new ParcelableIBinder[i];
        }
    };
    private final IBinder mIBinder;

    public ParcelableIBinder(IBinder iBinder) {
        this.mIBinder = (IBinder) Checks.checkNotNull(iBinder);
    }

    public IBinder getIBinder() {
        return this.mIBinder;
    }

    protected ParcelableIBinder(Parcel parcel) {
        this.mIBinder = parcel.readStrongBinder();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeStrongBinder(this.mIBinder);
    }
}
