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

.field private collectionEffect:Ljava/util/List;
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

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
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

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 32
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 33
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V
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
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 41
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 42
    iput-object p7, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

    .line 43
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

    .line 105
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->addedEffects:Ljava/util/List;

    return-object v0
.end method

.method public getCollectionEffect()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

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

    .line 113
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    return-object v0
.end method

.method public getFrontEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getIcon_normal_url()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon_selected_url()Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRearEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 141
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

    .line 54
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    return-object v0
.end method

.method public getTagsUpdateTime()Ljava/lang/String;
    .locals 1

    .line 58
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

    .line 97
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

    .line 109
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->addedEffects:Ljava/util/List;

    .line 110
    return-void
.end method

.method public setCollectionEffect(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 149
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

    .line 150
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

    .line 117
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    .line 118
    return-void
.end method

.method public setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 129
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 130
    return-void
.end method

.method public setIcon_normal_url(Ljava/lang/String;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setIcon_selected_url(Ljava/lang/String;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 134
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

    .line 121
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    .line 122
    return-void
.end method

.method public setTagsUpdateTime(Ljava/lang/String;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tagsUpdateTime:Ljava/lang/String;

    .line 126
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

    .line 101
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 102
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EffectCategoryResponse{id=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", name=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", key=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", collection=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
