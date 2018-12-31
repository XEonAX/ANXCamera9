package com.google.android.apps.gsa.publicsearch;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.aidl.BaseProxy;
import com.google.android.aidl.BaseStub;
import com.google.android.aidl.Codecs;

public interface IPublicSearchService extends IInterface {

    public static abstract class Stub extends BaseStub implements IPublicSearchService {
        private static final String DESCRIPTOR = "com.google.android.apps.gsa.publicsearch.IPublicSearchService";
        static final int TRANSACTION_beginSession = 1;

        public static class Proxy extends BaseProxy implements IPublicSearchService {
            Proxy(IBinder iBinder) {
                super(iBinder, Stub.DESCRIPTOR);
            }

            public IPublicSearchServiceSession beginSession(String str, IPublicSearchServiceSessionCallback iPublicSearchServiceSessionCallback, byte[] bArr) throws RemoteException {
                Parcel obtainAndWriteInterfaceToken = obtainAndWriteInterfaceToken();
                obtainAndWriteInterfaceToken.writeString(str);
                Codecs.writeStrongBinder(obtainAndWriteInterfaceToken, iPublicSearchServiceSessionCallback);
                obtainAndWriteInterfaceToken.writeByteArray(bArr);
                Parcel transactAndReadException = transactAndReadException(1, obtainAndWriteInterfaceToken);
                IPublicSearchServiceSession asInterface = com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSession.Stub.asInterface(transactAndReadException.readStrongBinder());
                transactAndReadException.recycle();
                return asInterface;
            }
        }

        public Stub() {
            super(DESCRIPTOR);
        }

        public static IPublicSearchService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (queryLocalInterface instanceof IPublicSearchService) {
                return (IPublicSearchService) queryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        protected boolean dispatchTransaction(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1) {
                return false;
            }
            IInterface beginSession = beginSession(parcel.readString(), com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.createByteArray());
            parcel2.writeNoException();
            Codecs.writeStrongBinder(parcel2, beginSession);
            return true;
        }
    }

    IPublicSearchServiceSession beginSession(String str, IPublicSearchServiceSessionCallback iPublicSearchServiceSessionCallback, byte[] bArr) throws RemoteException;
}
