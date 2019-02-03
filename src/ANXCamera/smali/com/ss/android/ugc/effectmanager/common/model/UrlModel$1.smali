.class final Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;
.super Ljava/lang/Object;
.source "UrlModel.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 2

    .line 39
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>(Landroid/os/Parcel;Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 36
    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;->createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 0

    .line 44
    new-array p1, p1, [Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 36
    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;->newArray(I)[Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    move-result-object p1

    return-object p1
.end method
