.class Landroid/support/test/internal/util/ParcelableIBinder$1;
.super Ljava/lang/Object;
.source "ParcelableIBinder.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/internal/util/ParcelableIBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Landroid/support/test/internal/util/ParcelableIBinder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/support/test/internal/util/ParcelableIBinder;
    .locals 1

    .line 52
    new-instance v0, Landroid/support/test/internal/util/ParcelableIBinder;

    invoke-direct {v0, p1}, Landroid/support/test/internal/util/ParcelableIBinder;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 49
    invoke-virtual {p0, p1}, Landroid/support/test/internal/util/ParcelableIBinder$1;->createFromParcel(Landroid/os/Parcel;)Landroid/support/test/internal/util/ParcelableIBinder;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Landroid/support/test/internal/util/ParcelableIBinder;
    .locals 0

    .line 57
    new-array p1, p1, [Landroid/support/test/internal/util/ParcelableIBinder;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 49
    invoke-virtual {p0, p1}, Landroid/support/test/internal/util/ParcelableIBinder$1;->newArray(I)[Landroid/support/test/internal/util/ParcelableIBinder;

    move-result-object p1

    return-object p1
.end method
