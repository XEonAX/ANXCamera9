.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;
.super Ljava/lang/Object;
.source "EffectCategoryIconsModel.java"


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
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    .line 33
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    .line 34
    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    .line 43
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl_list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 15
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    return-object v0
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setUrl_list(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 19
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    .line 20
    return-void
.end method
