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

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
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

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 35
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 36
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

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 41
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 43
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 44
    iput-object p7, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

    .line 45
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

    .line 107
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

    .line 147
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

    .line 115
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    return-object v0
.end method

.method public getFrontEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getIcon_normal_url()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon_selected_url()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRearEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 143
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

    .line 56
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    return-object v0
.end method

.method public getTagsUpdateTime()Ljava/lang/String;
    .locals 1

    .line 60
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

    .line 99
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

    .line 111
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->addedEffects:Ljava/util/List;

    .line 112
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

    .line 151
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->collectionEffect:Ljava/util/List;

    .line 152
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

    .line 119
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->deletedEffects:Ljava/util/List;

    .line 120
    return-void
.end method

.method public setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 132
    return-void
.end method

.method public setIcon_normal_url(Ljava/lang/String;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_normal_url:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public setIcon_selected_url(Ljava/lang/String;)V
    .locals 0

    .line 95
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->icon_selected_url:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->id:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->key:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->name:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 136
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

    .line 123
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tags:Ljava/util/List;

    .line 124
    return-void
.end method

.method public setTagsUpdateTime(Ljava/lang/String;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->tagsUpdateTime:Ljava/lang/String;

    .line 128
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

    .line 103
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->totalEffects:Ljava/util/List;

    .line 104
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 156
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
