package android.support.v4.app;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;

/* compiled from: Fragment */
final class FragmentState implements Parcelable {
    public static final Creator<FragmentState> CREATOR = new Creator<FragmentState>() {
        public FragmentState createFromParcel(Parcel in) {
            return new FragmentState(in);
        }

        public FragmentState[] newArray(int size) {
            return new FragmentState[size];
        }
    };
    final Bundle mArguments;
    final String mClassName;
    final int mContainerId;
    final boolean mDetached;
    final int mFragmentId;
    final boolean mFromLayout;
    final int mIndex;
    Fragment mInstance;
    final boolean mRetainInstance;
    Bundle mSavedFragmentState;
    final String mTag;

    public FragmentState(Fragment frag) {
        this.mClassName = frag.getClass().getName();
        this.mIndex = frag.mIndex;
        this.mFromLayout = frag.mFromLayout;
        this.mFragmentId = frag.mFragmentId;
        this.mContainerId = frag.mContainerId;
        this.mTag = frag.mTag;
        this.mRetainInstance = frag.mRetainInstance;
        this.mDetached = frag.mDetached;
        this.mArguments = frag.mArguments;
    }

    public FragmentState(Parcel in) {
        this.mClassName = in.readString();
        this.mIndex = in.readInt();
        boolean z = false;
        this.mFromLayout = in.readInt() != 0;
        this.mFragmentId = in.readInt();
        this.mContainerId = in.readInt();
        this.mTag = in.readString();
        this.mRetainInstance = in.readInt() != 0;
        if (in.readInt() != 0) {
            z = true;
        }
        this.mDetached = z;
        this.mArguments = in.readBundle();
        this.mSavedFragmentState = in.readBundle();
    }

    public Fragment instantiate(FragmentHostCallback host, Fragment parent) {
        if (this.mInstance != null) {
            return this.mInstance;
        }
        Context context = host.getContext();
        if (this.mArguments != null) {
            this.mArguments.setClassLoader(context.getClassLoader());
        }
        this.mInstance = Fragment.instantiate(context, this.mClassName, this.mArguments);
        if (this.mSavedFragmentState != null) {
            this.mSavedFragmentState.setClassLoader(context.getClassLoader());
            this.mInstance.mSavedFragmentState = this.mSavedFragmentState;
        }
        this.mInstance.setIndex(this.mIndex, parent);
        this.mInstance.mFromLayout = this.mFromLayout;
        this.mInstance.mRestored = true;
        this.mInstance.mFragmentId = this.mFragmentId;
        this.mInstance.mContainerId = this.mContainerId;
        this.mInstance.mTag = this.mTag;
        this.mInstance.mRetainInstance = this.mRetainInstance;
        this.mInstance.mDetached = this.mDetached;
        this.mInstance.mFragmentManager = host.mFragmentManager;
        if (FragmentManagerImpl.DEBUG) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Instantiated fragment ");
            stringBuilder.append(this.mInstance);
            Log.v("FragmentManager", stringBuilder.toString());
        }
        return this.mInstance;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mClassName);
        dest.writeInt(this.mIndex);
        dest.writeInt(this.mFromLayout);
        dest.writeInt(this.mFragmentId);
        dest.writeInt(this.mContainerId);
        dest.writeString(this.mTag);
        dest.writeInt(this.mRetainInstance);
        dest.writeInt(this.mDetached);
        dest.writeBundle(this.mArguments);
        dest.writeBundle(this.mSavedFragmentState);
    }
}
