.class public abstract Lcom/xiaomi/protocol/ICameraBackStageService$Stub;
.super Landroid/os/Binder;
.source "ICameraBackStageService.java"

# interfaces
.implements Lcom/xiaomi/protocol/ICameraBackStageService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/protocol/ICameraBackStageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/protocol/ICameraBackStageService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.xiaomi.protocol.ICameraBackStageService"

.field static final TRANSACTION_addCapturePath:I = 0x3

.field static final TRANSACTION_configCaptureOutputBuffer:I = 0x1

.field static final TRANSACTION_configCaptureSession:I = 0x2

.field static final TRANSACTION_needWaitProcess:I = 0x6

.field static final TRANSACTION_onCaptureCompleted:I = 0x4

.field static final TRANSACTION_onCaptureFailed:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p0, p0, v0}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/xiaomi/protocol/ICameraBackStageService;
    .locals 2

    .line 23
    if-nez p0, :cond_0

    .line 24
    const/4 p0, 0x0

    return-object p0

    .line 26
    :cond_0
    const-string v0, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/xiaomi/protocol/ICameraBackStageService;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/xiaomi/protocol/ICameraBackStageService;

    return-object v0

    .line 30
    :cond_1
    new-instance v0, Lcom/xiaomi/protocol/ICameraBackStageService$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 34
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 38
    const v0, 0x5f4e5446

    const/4 v1, 0x1

    if-eq p1, v0, :cond_1

    packed-switch p1, :pswitch_data_0

    .line 109
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 102
    :pswitch_0
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p0}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->needWaitProcess()Z

    move-result p1

    .line 104
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 105
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 106
    return v1

    .line 91
    :pswitch_1
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 93
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 95
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    .line 96
    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->onCaptureFailed(Ljava/lang/String;I)V

    .line 97
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 98
    return v1

    .line 80
    :pswitch_2
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 82
    sget-object p1, Lcom/xiaomi/protocol/ICustomCaptureResult;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p1

    .line 84
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    .line 85
    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->onCaptureCompleted(Ljava/util/List;Ljava/lang/String;)V

    .line 86
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 87
    return v1

    .line 71
    :pswitch_3
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->addCapturePath(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 76
    return v1

    .line 57
    :pswitch_4
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_0

    .line 60
    sget-object p1, Lcom/xiaomi/engine/BufferFormat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/engine/BufferFormat;

    goto :goto_0

    .line 63
    :cond_0
    const/4 p1, 0x0

    .line 65
    :goto_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V

    .line 66
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 67
    return v1

    .line 47
    :pswitch_5
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    sget-object p1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lcom/xiaomi/protocol/ICameraBackStageService$Stub;->configCaptureOutputBuffer(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 51
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 52
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 53
    return v1

    .line 42
    :cond_1
    const-string p1, "com.xiaomi.protocol.ICameraBackStageService"

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 43
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
