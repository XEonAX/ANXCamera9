.class Lcom/android/camera/fragment/beauty/BeautyValues$1;
.super Ljava/lang/Object;
.source "BeautyValues.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/BeautyValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/android/camera/fragment/beauty/BeautyValues;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    .line 198
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {v0, p1}, Lcom/android/camera/fragment/beauty/BeautyValues;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 195
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyValues$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 0

    .line 203
    new-array p1, p1, [Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 195
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyValues$1;->newArray(I)[Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object p1

    return-object p1
.end method
