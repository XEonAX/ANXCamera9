.class Lmiui/hardware/display/DisplayFeatureServiceProxy;
.super Ljava/lang/Object;
.source "DisplayFeatureServiceProxy.java"


# static fields
.field private static final HIDL_TRANSACTION_interfaceDescriptor:I = 0xf445343

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
    .locals 1

    .line 16
    const-string v0, "DisplayFeatureServiceProxy"

    sput-object v0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "service"    # Ljava/lang/Object;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    :try_start_0
    instance-of v0, p1, Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 40
    move-object v0, p1

    check-cast v0, Landroid/os/IBinder;

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    .line 41
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    invoke-interface {v0}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 42
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    const-string v0, "miui.hardware.display.IDisplayFeatureService"

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    goto :goto_0

    .line 45
    :cond_0
    instance-of v0, p1, Landroid/os/IHwBinder;

    if-eqz v0, :cond_1

    .line 46
    move-object v0, p1

    check-cast v0, Landroid/os/IHwBinder;

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    .line 47
    invoke-virtual {p0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 49
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :cond_1
    :goto_0
    goto :goto_1

    .line 52
    :catch_0
    move-exception v0

    .line 54
    :goto_1
    return-void
.end method

.method private varargs callBinderTransact(I[I)I
    .locals 7
    .param p1, "transactId"    # I
    .param p2, "params"    # [I

    .line 85
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 86
    .local v0, "data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 87
    .local v1, "reply":Landroid/os/Parcel;
    const/4 v2, -0x1

    .line 89
    .local v2, "result":I
    :try_start_0
    iget-object v3, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 90
    array-length v3, p2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_0

    aget v6, p2, v5

    .line 91
    .local v6, "param":I
    invoke-virtual {v0, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 90
    .end local v6    # "param":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 93
    :cond_0
    iget-object v3, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    invoke-interface {v3, p1, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 94
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 95
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v2, v3

    .line 100
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 102
    goto :goto_2

    .line 100
    :catchall_0
    move-exception v3

    goto :goto_3

    .line 97
    :catch_0
    move-exception v3

    .line 98
    .local v3, "e":Landroid/os/RemoteException;
    :try_start_1
    sget-object v4, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "callBinderTransact transact fail. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v3    # "e":Landroid/os/RemoteException;
    goto :goto_1

    .line 103
    :goto_2
    return v2

    .line 100
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v3
.end method

.method private varargs callHwBinderTransact(I[I)V
    .locals 6
    .param p1, "_hidl_code"    # I
    .param p2, "params"    # [I

    .line 107
    new-instance v0, Landroid/os/HwParcel;

    invoke-direct {v0}, Landroid/os/HwParcel;-><init>()V

    .line 109
    .local v0, "hidl_reply":Landroid/os/HwParcel;
    :try_start_0
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 110
    .local v1, "hidl_request":Landroid/os/HwParcel;
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 111
    array-length v2, p2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    aget v5, p2, v4

    .line 112
    .local v5, "param":I
    invoke-virtual {v1, v5}, Landroid/os/HwParcel;->writeInt32(I)V

    .line 111
    .end local v5    # "param":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 114
    :cond_0
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    invoke-interface {v2, p1, v1, v0, v3}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 115
    invoke-virtual {v0}, Landroid/os/HwParcel;->verifySuccess()V

    .line 116
    invoke-virtual {v1}, Landroid/os/HwParcel;->releaseTemporaryStorage()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "hidl_request":Landroid/os/HwParcel;
    goto :goto_1

    .line 120
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 117
    :catch_0
    move-exception v1

    .line 118
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_1
    sget-object v2, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "callHwBinderTransact transact fail. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_1
    invoke-virtual {v0}, Landroid/os/HwParcel;->release()V

    .line 121
    nop

    .line 122
    return-void

    .line 120
    :goto_2
    invoke-virtual {v0}, Landroid/os/HwParcel;->release()V

    throw v1
.end method


# virtual methods
.method public interfaceDescriptor()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 67
    new-instance v0, Landroid/os/HwParcel;

    invoke-direct {v0}, Landroid/os/HwParcel;-><init>()V

    .line 68
    .local v0, "_hidl_request":Landroid/os/HwParcel;
    const-string v1, "android.hidl.base@1.0::IBase"

    invoke-virtual {v0, v1}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 70
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 72
    .local v1, "_hidl_reply":Landroid/os/HwParcel;
    :try_start_0
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    const v3, 0xf445343

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 74
    invoke-virtual {v1}, Landroid/os/HwParcel;->verifySuccess()V

    .line 75
    invoke-virtual {v0}, Landroid/os/HwParcel;->releaseTemporaryStorage()V

    .line 77
    invoke-virtual {v1}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .local v2, "_hidl_out_descriptor":Ljava/lang/String;
    nop

    .line 80
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 78
    return-object v2

    .line 80
    .end local v2    # "_hidl_out_descriptor":Ljava/lang/String;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    throw v2
.end method

.method setFeature(IIII)V
    .locals 6
    .param p1, "displayId"    # I
    .param p2, "mode"    # I
    .param p3, "value"    # I
    .param p4, "cookie"    # I

    .line 58
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x1

    if-eqz v0, :cond_0

    .line 59
    new-array v0, v4, [I

    aput p1, v0, v3

    aput p2, v0, v5

    aput p3, v0, v2

    aput p4, v0, v1

    invoke-direct {p0, v5, v0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callHwBinderTransact(I[I)V

    goto :goto_0

    .line 61
    :cond_0
    const/16 v0, 0x64

    new-array v4, v4, [I

    aput p1, v4, v3

    aput p2, v4, v5

    aput p3, v4, v2

    aput p4, v4, v1

    invoke-direct {p0, v0, v4}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callBinderTransact(I[I)I

    .line 63
    :goto_0
    return-void
.end method
