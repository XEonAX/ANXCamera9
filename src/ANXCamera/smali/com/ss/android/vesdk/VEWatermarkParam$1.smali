.class final Lcom/ss/android/vesdk/VEWatermarkParam$1;
.super Ljava/lang/Object;
.source "VEWatermarkParam.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEWatermarkParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/ss/android/vesdk/VEWatermarkParam;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEWatermarkParam;
    .locals 3

    .line 93
    new-instance v0, Lcom/ss/android/vesdk/VEWatermarkParam;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEWatermarkParam;-><init>()V

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->needExtFile:Z

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->extFile:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->images:[Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->interval:I

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->xOffset:I

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->yOffset:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->width:I

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, v0, Lcom/ss/android/vesdk/VEWatermarkParam;->height:I

    .line 102
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 90
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEWatermarkParam$1;->createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEWatermarkParam;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/ss/android/vesdk/VEWatermarkParam;
    .locals 0

    .line 107
    new-array p1, p1, [Lcom/ss/android/vesdk/VEWatermarkParam;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 90
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEWatermarkParam$1;->newArray(I)[Lcom/ss/android/vesdk/VEWatermarkParam;

    move-result-object p1

    return-object p1
.end method
