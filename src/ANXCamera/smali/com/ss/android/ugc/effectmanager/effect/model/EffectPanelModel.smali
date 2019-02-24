.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;
.super Ljava/lang/Object;
.source "EffectPanelModel.java"


# instance fields
.field private icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private id:Ljava/lang/String;

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tags_updated_at:Ljava/lang/String;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    .line 62
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->text:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 55
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    .line 56
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags_updated_at:Ljava/lang/String;

    .line 57
    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    .line 75
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public getIcon()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    return-object v0
.end method

.method public getTags_updated_at()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags_updated_at:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setIcon(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 34
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->id:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setTags(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 41
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags:Ljava/util/List;

    .line 42
    return-void
.end method

.method public setTags_updated_at(Ljava/lang/String;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->tags_updated_at:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->text:Ljava/lang/String;

    .line 26
    return-void
.end method
