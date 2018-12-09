package com.xiaomi.engine;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Objects;

public final class BufferFormat implements Parcelable {
    public static final Creator<BufferFormat> CREATOR = new Creator<BufferFormat>() {
        public BufferFormat createFromParcel(Parcel parcel) {
            return new BufferFormat(parcel);
        }

        public BufferFormat[] newArray(int i) {
            return new BufferFormat[i];
        }
    };
    private int mBufferFormat;
    private int mBufferHeight;
    private int mBufferWidth;
    private GraphDescriptorBean mGraphDescriptor;

    public BufferFormat(int i, int i2, int i3) {
        this(i, i2, i3, null);
    }

    public BufferFormat(int i, int i2, int i3, GraphDescriptorBean graphDescriptorBean) {
        this.mBufferWidth = i;
        this.mBufferHeight = i2;
        this.mBufferFormat = i3;
        this.mGraphDescriptor = graphDescriptorBean;
    }

    public int getBufferWidth() {
        return this.mBufferWidth;
    }

    public int getBufferHeight() {
        return this.mBufferHeight;
    }

    public int getBufferFormat() {
        return this.mBufferFormat;
    }

    public void setBufferWidth(int i) {
        this.mBufferWidth = i;
    }

    public void setBufferHeight(int i) {
        this.mBufferHeight = i;
    }

    public void setBufferFormat(int i) {
        this.mBufferFormat = i;
    }

    public GraphDescriptorBean getGraphDescriptor() {
        return this.mGraphDescriptor;
    }

    public void setGraphDescriptor(GraphDescriptorBean graphDescriptorBean) {
        this.mGraphDescriptor = graphDescriptorBean;
    }

    public boolean isFrontCamera() {
        return this.mGraphDescriptor != null && this.mGraphDescriptor.isFrontCamera();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("BufferFormat{ bufferWidth=");
        stringBuilder.append(getBufferWidth());
        stringBuilder.append(", bufferHeight=");
        stringBuilder.append(getBufferHeight());
        stringBuilder.append(", bufferFormat=");
        stringBuilder.append(getBufferFormat());
        stringBuilder.append(", graphDescriptor=");
        stringBuilder.append(getGraphDescriptor());
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mBufferWidth);
        parcel.writeInt(this.mBufferHeight);
        parcel.writeInt(this.mBufferFormat);
        parcel.writeParcelable(this.mGraphDescriptor, i);
    }

    protected BufferFormat(Parcel parcel) {
        this.mBufferWidth = parcel.readInt();
        this.mBufferHeight = parcel.readInt();
        this.mBufferFormat = parcel.readInt();
        this.mGraphDescriptor = (GraphDescriptorBean) parcel.readParcelable(GraphDescriptorBean.class.getClassLoader());
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof BufferFormat)) {
            return super.equals(obj);
        }
        BufferFormat bufferFormat = (BufferFormat) obj;
        boolean z = getBufferWidth() == bufferFormat.getBufferWidth() && getBufferHeight() == bufferFormat.getBufferHeight() && getBufferFormat() == bufferFormat.getBufferFormat() && Objects.equals(getGraphDescriptor(), bufferFormat.getGraphDescriptor());
        return z;
    }
}
