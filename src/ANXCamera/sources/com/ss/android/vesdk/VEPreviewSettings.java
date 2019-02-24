package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VEPreviewSettings {
    private CAMERA_FACING_ID facingID;
    private int rotation;
    private VESize size;

    public enum CAMERA_FACING_ID implements Parcelable {
        FACING_BACK,
        FACING_FRONT,
        FACING_3RD;
        
        public static final Creator<CAMERA_FACING_ID> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_FACING_ID>() {
                public CAMERA_FACING_ID createFromParcel(Parcel parcel) {
                    return CAMERA_FACING_ID.values()[parcel.readInt()];
                }

                public CAMERA_FACING_ID[] newArray(int i) {
                    return new CAMERA_FACING_ID[i];
                }
            };
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }

        public int describeContents() {
            return 0;
        }
    }

    public VEPreviewSettings(CAMERA_FACING_ID camera_facing_id, int i, VESize vESize) {
        this.facingID = camera_facing_id;
        this.rotation = i;
        this.size = vESize;
    }

    public CAMERA_FACING_ID getFacingID() {
        return this.facingID;
    }

    public int getRotation() {
        return this.rotation;
    }

    public VESize getSize() {
        return this.size;
    }
}
