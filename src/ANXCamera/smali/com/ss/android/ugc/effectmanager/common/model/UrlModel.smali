.class public Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
.super Ljava/lang/Object;
.source "UrlModel.java"


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
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getUri()Ljava/lang/String;
    .locals 1

    .line 18
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

    .line 10
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    return-object v0
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->uri:Ljava/lang/String;

    .line 23
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

    .line 14
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->url_list:Ljava/util/List;

    .line 15
    return-void
.end method
