.class public Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
.super Ljava/lang/Object;
.source "UrlModel.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private uri:Ljava/lang/String;

.field private url_list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;-><init>()V

    sput-object v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->uri:Ljava/lang/String;

    .line 34
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/ss/android/ugc/effectmanager/common/model/UrlModel$1;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public getUrlList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 13
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    return-object v0
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->uri:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public setUrlList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 17
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    .line 18
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 55
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 56
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->uri:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 57
    return-void
.end method
