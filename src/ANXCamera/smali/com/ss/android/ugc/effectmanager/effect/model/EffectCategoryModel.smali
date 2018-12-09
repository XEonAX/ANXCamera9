.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;
.super Ljava/lang/Object;
.source "EffectCategoryModel.java"


# instance fields
.field private effects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

.field private icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

.field private id:Ljava/lang/String;

.field private key:Ljava/lang/String;

.field private name:Ljava/lang/String;

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


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->effects:Ljava/util/List;

    .line 32
    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    if-nez v0, :cond_1

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->effects:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->effects:Ljava/util/List;

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->tags:Ljava/util/List;

    if-nez v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->tags:Ljava/util/List;

    .line 91
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->id:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->checkValued()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->checkValued()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->effects:Ljava/util/List;

    return-object v0
.end method

.method public getIcon()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    return-object v0
.end method

.method public getIcon_selected()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->name:Ljava/lang/String;

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

    .line 75
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->tags:Ljava/util/List;

    return-object v0
.end method

.method public getTagsUpdated()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->tags_updated_at:Ljava/lang/String;

    return-object v0
.end method

.method public setEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->effects:Ljava/util/List;

    .line 64
    return-void
.end method

.method public setIcon(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    .line 48
    return-void
.end method

.method public setIcon_selected(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->icon_selected:Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    .line 56
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->id:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->key:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->name:Ljava/lang/String;

    .line 40
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

    .line 67
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->tags:Ljava/util/List;

    .line 68
    return-void
.end method
