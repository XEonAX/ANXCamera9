package com.google.android.apps.gsa.publicsearch;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.aidl.BaseProxy;
import com.google.android.aidl.BaseStub;
import com.google.android.aidl.Codecs;

public interface IPublicSearchServiceSessionCallback extends IInterface {

    public static abstract class Stub extends BaseStub implements IPublicSearchServiceSessionCallback {
        private static final String DESCRIPTOR = "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback";
        static final int TRANSACTION_onServiceEvent = 1;

        public static class Proxy extends BaseProxy implements IPublicSearchServiceSessionCallback {
            Proxy(IBinder iBinder) {
                super(iBinder, Stub.DESCRIPTOR);
            }

            public void onServiceEvent(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException {
                Parcel obtainAndWriteInterfaceToken = obtainAndWriteInterfaceToken();
                obtainAndWriteInterfaceToken.writeByteArray(bArr);
                Codecs.writeParcelable(obtainAndWriteInterfaceToken, systemParcelableWrapper);
                transactOneway(1, obtainAndWriteInterfaceToken);
            }
        }

        public Stub() {
            super(DESCRIPTOR);
        }

        public static IPublicSearchServiceSessionCallback asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (queryLocalInterface instanceof IPublicSearchServiceSessionCallback) {
                return (IPublicSearchServiceSessionCallback) queryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        protected boolean dispatchTransaction(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1) {
                return false;
            }
            onServiceEvent(parcel.createByteArray(), (SystemParcelableWrapper) Codecs.createParcelable(parcel, SystemParcelableWrapper.CREATOR));
            return true;
        }
    }

    void onServiceEvent(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException;
}
