.class public Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;
.super Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;
.source "EffectNetListResponse.java"


# instance fields
.field private data:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->data:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->data:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->checkValued()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getData()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->data:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    return-object v0
.end method

.method public setData(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)V
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->data:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    .line 20
    return-void
.end method
