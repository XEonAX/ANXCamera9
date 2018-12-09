.class Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper$1;
.super Ljava/lang/Object;
.source "SystemParcelableWrapper.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
    .locals 2

    .line 36
    new-instance v0, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;-><init>(Landroid/os/Parcelable;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper$1;->createFromParcel(Landroid/os/Parcel;)Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
    .locals 0

    .line 41
    new-array p1, p1, [Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper$1;->newArray(I)[Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    move-result-object p1

    return-object p1
.end method
