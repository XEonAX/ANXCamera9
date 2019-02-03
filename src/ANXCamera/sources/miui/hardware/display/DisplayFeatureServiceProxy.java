package miui.hardware.display;

import android.os.HwParcel;
import android.os.IBinder;
import android.os.IHwBinder;
import android.os.IHwInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Slog;
import miui.os.DeviceFeature;

class DisplayFeatureServiceProxy {
    private static final int HIDL_TRANSACTION_interfaceDescriptor = 256136003;
    private static final int HIDL_TRANSACTION_registerCallback = 2;
    private static final int HIDL_TRANSACTION_setFeature = 1;
    private static final String HWBINDER_BASE_INTERFACE_DESCRIPTOR = "android.hidl.base@1.0::IBase";
    private static final String HWBINDER_INTERFACE_DESCRIPTOR = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature";
    private static final String INTERFACE_DESCRIPTOR = "miui.hardware.display.IDisplayFeatureService";
    private static String TAG = "DisplayFeatureServiceProxy";
    private static final int TRANSACTION_setFeature = 100;
    private String mDescriptor;
    private IHwBinder mHwService;
    private IBinder mService;

    DisplayFeatureServiceProxy(Object service) {
        try {
            if (service instanceof IBinder) {
                this.mService = (IBinder) service;
                this.mDescriptor = this.mService.getInterfaceDescriptor();
                if (TextUtils.isEmpty(this.mDescriptor)) {
                    this.mDescriptor = INTERFACE_DESCRIPTOR;
                }
            } else if (service instanceof IHwBinder) {
                this.mHwService = (IHwBinder) service;
                this.mDescriptor = interfaceDescriptor();
                if (TextUtils.isEmpty(this.mDescriptor)) {
                    this.mDescriptor = HWBINDER_INTERFACE_DESCRIPTOR;
                }
            }
        } catch (RemoteException e) {
        }
    }

    void setFeature(int displayId, int mode, int value, int cookie) {
        if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
            callHwBinderTransact(1, 0, Integer.valueOf(displayId), Integer.valueOf(mode), Integer.valueOf(value), Integer.valueOf(cookie));
            return;
        }
        callBinderTransact(100, 0, Integer.valueOf(displayId), Integer.valueOf(mode), Integer.valueOf(value), Integer.valueOf(cookie));
    }

    void registerCallback(int displayId, Object callback) {
        if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
            callHwBinderTransact(2, 0, Integer.valueOf(displayId), callback);
        }
    }

    public String interfaceDescriptor() throws RemoteException {
        HwParcel _hidl_request = new HwParcel();
        _hidl_request.writeInterfaceToken(HWBINDER_BASE_INTERFACE_DESCRIPTOR);
        HwParcel _hidl_reply = new HwParcel();
        try {
            this.mHwService.transact(HIDL_TRANSACTION_interfaceDescriptor, _hidl_request, _hidl_reply, 0);
            _hidl_reply.verifySuccess();
            _hidl_request.releaseTemporaryStorage();
            String _hidl_out_descriptor = _hidl_reply.readString();
            return _hidl_out_descriptor;
        } finally {
            _hidl_reply.release();
        }
    }

    private int callBinderTransact(int transactId, int flag, Object... params) {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        int result = -1;
        try {
            data.writeInterfaceToken(this.mDescriptor);
            for (Object param : params) {
                if (param instanceof Integer) {
                    data.writeInt(((Integer) param).intValue());
                }
            }
            if (this.mService.transact(transactId, data, reply, flag)) {
                reply.readException();
                result = reply.readInt();
            }
        } catch (RemoteException e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("callBinderTransact transact fail. ");
            stringBuilder.append(e);
            Slog.e(str, stringBuilder.toString());
        } catch (Throwable th) {
            reply.recycle();
            data.recycle();
        }
        reply.recycle();
        data.recycle();
        return result;
    }

    private void callHwBinderTransact(int _hidl_code, int flag, Object... params) {
        HwParcel hidl_reply = new HwParcel();
        try {
            HwParcel hidl_request = new HwParcel();
            hidl_request.writeInterfaceToken(this.mDescriptor);
            for (Object param : params) {
                if (param instanceof Integer) {
                    hidl_request.writeInt32(((Integer) param).intValue());
                } else if (param instanceof IHwInterface) {
                    hidl_request.writeStrongBinder(((IHwInterface) param).asBinder());
                }
            }
            this.mHwService.transact(_hidl_code, hidl_request, hidl_reply, flag);
            hidl_reply.verifySuccess();
            hidl_request.releaseTemporaryStorage();
        } catch (RemoteException e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("callHwBinderTransact transact fail. ");
            stringBuilder.append(e);
            Slog.e(str, stringBuilder.toString());
        } catch (Throwable th) {
            hidl_reply.release();
        }
        hidl_reply.release();
    }
}
