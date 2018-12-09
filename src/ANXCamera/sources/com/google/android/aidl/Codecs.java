package com.google.android.aidl;

import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Codecs {
    private static final ClassLoader CLASS_LOADER = Codecs.class.getClassLoader();
    private static final int PARCELABLE_NO_FLAGS = 0;

    private Codecs() {
    }

    public static boolean createBoolean(Parcel parcel) {
        return parcel.readInt() != 0;
    }

    public static void writeBoolean(Parcel parcel, boolean z) {
        parcel.writeInt(z);
    }

    public static CharSequence createCharSequence(Parcel parcel) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
    }

    public static void writeCharSequence(Parcel parcel, CharSequence charSequence) {
        if (charSequence != null) {
            parcel.writeInt(1);
            TextUtils.writeToParcel(charSequence, parcel, 0);
            return;
        }
        parcel.writeInt(0);
    }

    public static void writeCharSequenceAsReturnValue(Parcel parcel, CharSequence charSequence) {
        if (charSequence != null) {
            parcel.writeInt(1);
            TextUtils.writeToParcel(charSequence, parcel, 1);
            return;
        }
        parcel.writeInt(0);
    }

    public static <T extends Parcelable> T createParcelable(Parcel parcel, Creator<T> creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (Parcelable) creator.createFromParcel(parcel);
    }

    public static void writeParcelable(Parcel parcel, Parcelable parcelable) {
        if (parcelable == null) {
            parcel.writeInt(0);
            return;
        }
        parcel.writeInt(1);
        parcelable.writeToParcel(parcel, 0);
    }

    public static void writeParcelableAsReturnValue(Parcel parcel, Parcelable parcelable) {
        if (parcelable == null) {
            parcel.writeInt(0);
            return;
        }
        parcel.writeInt(1);
        parcelable.writeToParcel(parcel, 1);
    }

    public static void writeStrongBinder(Parcel parcel, IInterface iInterface) {
        if (iInterface == null) {
            parcel.writeStrongBinder(null);
        } else {
            parcel.writeStrongBinder(iInterface.asBinder());
        }
    }

    public static ArrayList createList(Parcel parcel) {
        return parcel.readArrayList(CLASS_LOADER);
    }

    public static void readList(Parcel parcel, List<?> list) {
        parcel.readList(list, CLASS_LOADER);
    }

    public static HashMap createMap(Parcel parcel) {
        return parcel.readHashMap(CLASS_LOADER);
    }

    public static void readMap(Parcel parcel, Map<?, ?> map) {
        parcel.readMap(map, CLASS_LOADER);
    }
}
