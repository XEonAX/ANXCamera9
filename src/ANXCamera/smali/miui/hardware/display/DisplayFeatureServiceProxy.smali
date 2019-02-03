.class Lmiui/hardware/display/DisplayFeatureServiceProxy;
.super Ljava/lang/Object;
.source "DisplayFeatureServiceProxy.java"


# static fields
.field private static final HIDL_TRANSACTION_interfaceDescriptor:I = 0xf445343

.field private static final HIDL_TRANSACTION_registerCallback:I = 0x2

.field private static final HIDL_TRANSACTION_setFeature:I = 0x1

.field private static final HWBINDER_BASE_INTERFACE_DESCRIPTOR:Ljava/lang/String; = "android.hidl.base@1.0::IBase"

.field private static final HWBINDER_INTERFACE_DESCRIPTOR:Ljava/lang/String; = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

.field private static final INTERFACE_DESCRIPTOR:Ljava/lang/String; = "miui.hardware.display.IDisplayFeatureService"

.field private static TAG:Ljava/lang/String; = null

.field private static final TRANSACTION_setFeature:I = 0x64


# instance fields
.field private mDescriptor:Ljava/lang/String;

.field private mHwService:Landroid/os/IHwBinder;

.field private mService:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    const-string v0, "DisplayFeatureServiceProxy"

    sput-object v0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "service"    # Ljava/lang/Object;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    :try_start_3
    instance-of v0, p1, Landroid/os/IBinder;

    if-eqz v0, :cond_21

    .line 43
    move-object v0, p1

    check-cast v0, Landroid/os/IBinder;

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    .line 44
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    invoke-interface {v0}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 45
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 46
    const-string v0, "miui.hardware.display.IDisplayFeatureService"

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    goto :goto_3c

    .line 48
    :cond_21
    instance-of v0, p1, Landroid/os/IHwBinder;

    if-eqz v0, :cond_3c

    .line 49
    move-object v0, p1

    check-cast v0, Landroid/os/IHwBinder;

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    .line 50
    invoke-virtual {p0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 51
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 52
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;
    :try_end_3c
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3c} :catch_3d

    .line 56
    :cond_3c
    :goto_3c
    goto :goto_3e

    .line 55
    :catch_3d
    move-exception v0

    .line 57
    :goto_3e
    return-void
.end method

.method private varargs callBinderTransact(II[Ljava/lang/Object;)I
    .registers 11
    .param p1, "transactId"    # I
    .param p2, "flag"    # I
    .param p3, "params"    # [Ljava/lang/Object;

    .line 94
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 95
    .local v0, "data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 96
    .local v1, "reply":Landroid/os/Parcel;
    const/4 v2, -0x1

    .line 98
    .local v2, "result":I
    :try_start_9
    iget-object v3, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 99
    array-length v3, p3

    const/4 v4, 0x0

    :goto_10
    if-ge v4, v3, :cond_25

    aget-object v5, p3, v4

    .line 100
    .local v5, "param":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/Integer;

    if-eqz v6, :cond_22

    .line 101
    move-object v6, v5

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 99
    .end local v5    # "param":Ljava/lang/Object;
    :cond_22
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 104
    :cond_25
    iget-object v3, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    invoke-interface {v3, p1, v0, v1, p2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 105
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 106
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3
    :try_end_34
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_34} :catch_3e
    .catchall {:try_start_9 .. :try_end_34} :catchall_3c

    move v2, v3

    .line 111
    :cond_35
    :goto_35
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 112
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 113
    goto :goto_56

    .line 111
    :catchall_3c
    move-exception v3

    goto :goto_57

    .line 108
    :catch_3e
    move-exception v3

    .line 109
    .local v3, "e":Landroid/os/RemoteException;
    :try_start_3f
    sget-object v4, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "callBinderTransact transact fail. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catchall {:try_start_3f .. :try_end_55} :catchall_3c

    .end local v3    # "e":Landroid/os/RemoteException;
    goto :goto_35

    .line 114
    :goto_56
    return v2

    .line 111
    :goto_57
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 112
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v3
.end method

.method private varargs callHwBinderTransact(II[Ljava/lang/Object;)V
    .registers 10
    .param p1, "_hidl_code"    # I
    .param p2, "flag"    # I
    .param p3, "params"    # [Ljava/lang/Object;

    .line 118
    new-instance v0, Landroid/os/HwParcel;

    invoke-direct {v0}, Landroid/os/HwParcel;-><init>()V

    .line 120
    .local v0, "hidl_reply":Landroid/os/HwParcel;
    :try_start_5
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 121
    .local v1, "hidl_request":Landroid/os/HwParcel;
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 122
    array-length v2, p3

    const/4 v3, 0x0

    :goto_11
    if-ge v3, v2, :cond_35

    aget-object v4, p3, v3

    .line 123
    .local v4, "param":Ljava/lang/Object;
    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_24

    .line 124
    move-object v5, v4

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/os/HwParcel;->writeInt32(I)V

    goto :goto_32

    .line 125
    :cond_24
    instance-of v5, v4, Landroid/os/IHwInterface;

    if-eqz v5, :cond_32

    .line 126
    move-object v5, v4

    check-cast v5, Landroid/os/IHwInterface;

    invoke-interface {v5}, Landroid/os/IHwInterface;->asBinder()Landroid/os/IHwBinder;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/os/HwParcel;->writeStrongBinder(Landroid/os/IHwBinder;)V

    .line 122
    .end local v4    # "param":Ljava/lang/Object;
    :cond_32
    :goto_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 129
    :cond_35
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    invoke-interface {v2, p1, v1, v0, p2}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 130
    invoke-virtual {v0}, Landroid/os/HwParcel;->verifySuccess()V

    .line 131
    invoke-virtual {v1}, Landroid/os/HwParcel;->releaseTemporaryStorage()V
    :try_end_40
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_40} :catch_43
    .catchall {:try_start_5 .. :try_end_40} :catchall_41

    .end local v1    # "hidl_request":Landroid/os/HwParcel;
    goto :goto_5a

    .line 135
    :catchall_41
    move-exception v1

    goto :goto_5f

    .line 132
    :catch_43
    move-exception v1

    .line 133
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_44
    sget-object v2, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "callHwBinderTransact transact fail. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5a
    .catchall {:try_start_44 .. :try_end_5a} :catchall_41

    .line 135
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_5a
    invoke-virtual {v0}, Landroid/os/HwParcel;->release()V

    .line 136
    nop

    .line 137
    return-void

    .line 135
    :goto_5f
    invoke-virtual {v0}, Landroid/os/HwParcel;->release()V

    throw v1
.end method


# virtual methods
.method public interfaceDescriptor()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 76
    new-instance v0, Landroid/os/HwParcel;

    invoke-direct {v0}, Landroid/os/HwParcel;-><init>()V

    .line 77
    .local v0, "_hidl_request":Landroid/os/HwParcel;
    const-string v1, "android.hidl.base@1.0::IBase"

    invoke-virtual {v0, v1}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 79
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 81
    .local v1, "_hidl_reply":Landroid/os/HwParcel;
    :try_start_f
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    const v3, 0xf445343

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 83
    invoke-virtual {v1}, Landroid/os/HwParcel;->verifySuccess()V

    .line 84
    invoke-virtual {v0}, Landroid/os/HwParcel;->releaseTemporaryStorage()V

    .line 86
    invoke-virtual {v1}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_22
    .catchall {:try_start_f .. :try_end_22} :catchall_27

    .line 87
    .local v2, "_hidl_out_descriptor":Ljava/lang/String;
    nop

    .line 89
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 87
    return-object v2

    .line 89
    .end local v2    # "_hidl_out_descriptor":Ljava/lang/String;
    :catchall_27
    move-exception v2

    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    throw v2
.end method

.method registerCallback(ILjava/lang/Object;)V
    .registers 7
    .param p1, "displayId"    # I
    .param p2, "callback"    # Ljava/lang/Object;

    .line 69
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    if-eqz v0, :cond_14

    .line 70
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {p0, v0, v3, v1}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callHwBinderTransact(II[Ljava/lang/Object;)V

    .line 72
    :cond_14
    return-void
.end method

.method setFeature(IIII)V
    .registers 12
    .param p1, "displayId"    # I
    .param p2, "mode"    # I
    .param p3, "value"    # I
    .param p4, "cookie"    # I

    .line 61
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v0, :cond_27

    .line 62
    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-direct {p0, v4, v5, v0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callHwBinderTransact(II[Ljava/lang/Object;)V

    goto :goto_46

    .line 64
    :cond_27
    const/16 v0, 0x64

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-direct {p0, v0, v5, v3}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callBinderTransact(II[Ljava/lang/Object;)I

    .line 66
    :goto_46
    return-void
.end method
