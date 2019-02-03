.class Lcom/android/camera/watermark/WaterMarkData$1;
.super Ljava/lang/Object;
.source "WaterMarkData.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/watermark/WaterMarkData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/android/camera/watermark/WaterMarkData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/watermark/WaterMarkData;
    .locals 1

    .line 43
    new-instance v0, Lcom/android/camera/watermark/WaterMarkData;

    invoke-direct {v0, p1}, Lcom/android/camera/watermark/WaterMarkData;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 40
    invoke-virtual {p0, p1}, Lcom/android/camera/watermark/WaterMarkData$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/watermark/WaterMarkData;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/android/camera/watermark/WaterMarkData;
    .locals 0

    .line 48
    new-array p1, p1, [Lcom/android/camera/watermark/WaterMarkData;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 40
    invoke-virtual {p0, p1}, Lcom/android/camera/watermark/WaterMarkData$1;->newArray(I)[Lcom/android/camera/watermark/WaterMarkData;

    move-result-object p1

    return-object p1
.end method
