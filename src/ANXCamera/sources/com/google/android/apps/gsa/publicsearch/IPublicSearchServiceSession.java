package com.google.android.apps.gsa.publicsearch;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.aidl.BaseProxy;
import com.google.android.aidl.BaseStub;
import com.google.android.aidl.Codecs;

public interface IPublicSearchServiceSession extends IInterface {

    public static abstract class Stub extends BaseStub implements IPublicSearchServiceSession {
        private static final String DESCRIPTOR = "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSession";
        static final int TRANSACTION_onGenericClientEvent = 1;
        static final int TRANSACTION_onGenericClientEventWithSystemParcelable = 2;

        public static class Proxy extends BaseProxy implements IPublicSearchServiceSession {
            Proxy(IBinder iBinder) {
                super(iBinder, Stub.DESCRIPTOR);
            }

            public void onGenericClientEvent(byte[] bArr) throws RemoteException {
                Parcel obtainAndWriteInterfaceToken = obtainAndWriteInterfaceToken();
                obtainAndWriteInterfaceToken.writeByteArray(bArr);
                transactOneway(1, obtainAndWriteInterfaceToken);
            }

            public void onGenericClientEventWithSystemParcelable(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException {
                Parcel obtainAndWriteInterfaceToken = obtainAndWriteInterfaceToken();
                obtainAndWriteInterfaceToken.writeByteArray(bArr);
                Codecs.writeParcelable(obtainAndWriteInterfaceToken, systemParcelableWrapper);
                transactOneway(2, obtainAndWriteInterfaceToken);
            }
        }

        public Stub() {
            super(DESCRIPTOR);
        }

        public static IPublicSearchServiceSession asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (queryLocalInterface instanceof IPublicSearchServiceSession) {
                return (IPublicSearchServiceSession) queryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        protected boolean dispatchTransaction(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    onGenericClientEvent(parcel.createByteArray());
                    break;
                case 2:
                    onGenericClientEventWithSystemParcelable(parcel.createByteArray(), (SystemParcelableWrapper) Codecs.createParcelable(parcel, SystemParcelableWrapper.CREATOR));
                    break;
                default:
                    return false;
            }
            return true;
        }
    }

    void onGenericClientEvent(byte[] bArr) throws RemoteException;

    void onGenericClientEventWithSystemParcelable(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException;
}
