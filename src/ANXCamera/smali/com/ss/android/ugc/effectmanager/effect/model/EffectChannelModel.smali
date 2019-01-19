.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;
.super Ljava/lang/Object;
.source "EffectChannelModel.java"


# instance fields
.field private category:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;"
        }
    .end annotation
.end field

.field private effects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private front_effect_id:Ljava/lang/String;

.field private panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

.field private rear_effect_id:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    .line 25
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    .line 26
    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    if-nez v0, :cond_2

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->checkValued()Z

    .line 87
    const/4 v0, 0x1

    return v0
.end method

.method public getCategory()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    return-object v0
.end method

.method public getEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 43
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    return-object v0
.end method

.method public getFront_effect_id()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->front_effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getPanel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-object v0
.end method

.method public getRear_effect_id()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->rear_effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    return-object v0
.end method

.method public setCategory(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;)V"
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    .line 56
    return-void
.end method

.method public setEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 47
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    .line 48
    return-void
.end method

.method public setFront_effect_id(Ljava/lang/String;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->front_effect_id:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setPanel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    .line 76
    return-void
.end method

.method public setRear_effect_id(Ljava/lang/String;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->rear_effect_id:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    .line 40
    return-void
.end method
