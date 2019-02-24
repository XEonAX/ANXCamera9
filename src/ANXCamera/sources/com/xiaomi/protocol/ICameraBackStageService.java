package com.xiaomi.protocol;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.view.Surface;
import com.xiaomi.engine.BufferFormat;
import java.util.List;

public interface ICameraBackStageService extends IInterface {

    public static abstract class Stub extends Binder implements ICameraBackStageService {
        private static final String DESCRIPTOR = "com.xiaomi.protocol.ICameraBackStageService";
        static final int TRANSACTION_addCapturePath = 3;
        static final int TRANSACTION_configCaptureOutputBuffer = 1;
        static final int TRANSACTION_configCaptureSession = 2;
        static final int TRANSACTION_needWaitProcess = 6;
        static final int TRANSACTION_onCaptureCompleted = 4;
        static final int TRANSACTION_onCaptureFailed = 5;

        private static class Proxy implements ICameraBackStageService {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public List<Surface> configCaptureOutputBuffer(List<IImageReaderParameterSets> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    List<Surface> createTypedArrayList = obtain2.createTypedArrayList(Surface.CREATOR);
                    return createTypedArrayList;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void configCaptureSession(BufferFormat bufferFormat) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bufferFormat != null) {
                        obtain.writeInt(1);
                        bufferFormat.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void addCapturePath(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    this.mRemote.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void onCaptureCompleted(List<ICustomCaptureResult> list, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    obtain.writeString(str);
                    this.mRemote.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void onCaptureFailed(String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.mRemote.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean needWaitProcess() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    boolean z = false;
                    this.mRemote.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    obtain2.recycle();
                    obtain.recycle();
                    return z;
                } catch (Throwable th) {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICameraBackStageService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (queryLocalInterface == null || !(queryLocalInterface instanceof ICameraBackStageService)) {
                return new Proxy(iBinder);
            }
            return (ICameraBackStageService) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        parcel.enforceInterface(DESCRIPTOR);
                        List configCaptureOutputBuffer = configCaptureOutputBuffer(parcel.createTypedArrayList(IImageReaderParameterSets.CREATOR));
                        parcel2.writeNoException();
                        parcel2.writeTypedList(configCaptureOutputBuffer);
                        return true;
                    case 2:
                        BufferFormat bufferFormat;
                        parcel.enforceInterface(DESCRIPTOR);
                        if (parcel.readInt() != 0) {
                            bufferFormat = (BufferFormat) BufferFormat.CREATOR.createFromParcel(parcel);
                        } else {
                            bufferFormat = null;
                        }
                        configCaptureSession(bufferFormat);
                        parcel2.writeNoException();
                        return true;
                    case 3:
                        parcel.enforceInterface(DESCRIPTOR);
                        addCapturePath(parcel.readString());
                        parcel2.writeNoException();
                        return true;
                    case 4:
                        parcel.enforceInterface(DESCRIPTOR);
                        onCaptureCompleted(parcel.createTypedArrayList(ICustomCaptureResult.CREATOR), parcel.readString());
                        parcel2.writeNoException();
                        return true;
                    case 5:
                        parcel.enforceInterface(DESCRIPTOR);
                        onCaptureFailed(parcel.readString(), parcel.readInt());
                        parcel2.writeNoException();
                        return true;
                    case 6:
                        parcel.enforceInterface(DESCRIPTOR);
                        boolean needWaitProcess = needWaitProcess();
                        parcel2.writeNoException();
                        parcel2.writeInt(needWaitProcess);
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            }
            parcel2.writeString(DESCRIPTOR);
            return true;
        }
    }

    void addCapturePath(String str) throws RemoteException;

    List<Surface> configCaptureOutputBuffer(List<IImageReaderParameterSets> list) throws RemoteException;

    void configCaptureSession(BufferFormat bufferFormat) throws RemoteException;

    boolean needWaitProcess() throws RemoteException;

    void onCaptureCompleted(List<ICustomCaptureResult> list, String str) throws RemoteException;

    void onCaptureFailed(String str, int i) throws RemoteException;
}
