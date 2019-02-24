.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "EffectChannelTaskResult.java"


# instance fields
.field private effectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->effectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    .line 35
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 36
    return-void
.end method


# virtual methods
.method public getEffectChannels()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->effectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    return-object v0
.end method

.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public setEffectChannels(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->effectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    .line 22
    return-void
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 30
    return-void
.end method
