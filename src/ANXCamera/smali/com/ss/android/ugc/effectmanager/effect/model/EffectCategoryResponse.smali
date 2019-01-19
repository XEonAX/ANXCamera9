.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;
.super Ljava/lang/Object;
.source "EffectCategoryResponse.java"


# instance fields
.field private addedEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private deletedEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private icon_normal_url:Ljava/lang/String;

.field private icon_selected_url:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private key:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tagsUpdateTime:Ljava/lang/String;

.field private totalEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 31
    return-void
.end method


# virtual methods
.method public getAddedEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->addedEffects:Ljava/util/List;

    return-object v0
.end method

.method public getDeletedEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    return-object v0
.end method

.method public getFrontEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getIcon_normal_url()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon_selected_url()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRearEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

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

    .line 42
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    return-object v0
.end method

.method public getTagsUpdateTime()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tagsUpdateTime:Ljava/lang/String;

    return-object v0
.end method

.method public getTotalEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    return-object v0
.end method

.method public setAddedEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->addedEffects:Ljava/util/List;

    .line 98
    return-void
.end method

.method public setDeletedEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 105
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    .line 106
    return-void
.end method

.method public setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 118
    return-void
.end method

.method public setIcon_normal_url(Ljava/lang/String;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setIcon_selected_url(Ljava/lang/String;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 122
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

    .line 109
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    .line 110
    return-void
.end method

.method public setTagsUpdateTime(Ljava/lang/String;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tagsUpdateTime:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setTotalEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 89
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 90
    return-void
.end method
