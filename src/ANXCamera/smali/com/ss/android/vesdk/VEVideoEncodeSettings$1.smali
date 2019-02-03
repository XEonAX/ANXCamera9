.class final Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;
.super Ljava/lang/Object;
.source "VEVideoEncodeSettings.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/ss/android/vesdk/VEVideoEncodeSettings;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEVideoEncodeSettings;
    .locals 1

    .line 531
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 528
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;->createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/ss/android/vesdk/VEVideoEncodeSettings;
    .locals 0

    .line 536
    new-array p1, p1, [Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 528
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;->newArray(I)[Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    move-result-object p1

    return-object p1
.end method
