.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
.super Ljava/lang/Object;
.source "EffectChannelResponse.java"


# instance fields
.field private allCategoryEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private categoryResponseList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;"
        }
    .end annotation
.end field

.field private frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private panel:Ljava/lang/String;

.field private panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

.field private rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    .line 33
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    .line 34
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    .line 35
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
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    .line 23
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    .line 24
    return-void
.end method


# virtual methods
.method public getAllCategoryEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    return-object v0
.end method

.method public getCategoryResponseList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-object v0
.end method

.method public getFrontEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getPanel()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    return-object v0
.end method

.method public getPanelModel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->setId(Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-object v0
.end method

.method public getRearEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    return-object v0
.end method

.method public setAllCategoryEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    .line 75
    return-void
.end method

.method public setCategoryResponseList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;)V"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    .line 98
    return-void
.end method

.method public setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 51
    return-void
.end method

.method public setPanel(Ljava/lang/String;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setPanelModel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V
    .locals 0

    .line 78
    if-nez p1, :cond_0

    .line 79
    new-instance p1, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    .line 81
    :cond_0
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    .line 82
    return-void
.end method

.method public setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 55
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    .line 67
    return-void
.end method
