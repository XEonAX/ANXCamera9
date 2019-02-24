.class final Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE$1;
.super Ljava/lang/Object;
.source "VECameraSettings.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
    .locals 1

    .line 149
    invoke-static {}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;->values()[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    aget-object p1, v0, p1

    return-object p1
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 146
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE$1;->createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;
    .locals 0

    .line 154
    new-array p1, p1, [Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 146
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE$1;->newArray(I)[Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;

    move-result-object p1

    return-object p1
.end method
