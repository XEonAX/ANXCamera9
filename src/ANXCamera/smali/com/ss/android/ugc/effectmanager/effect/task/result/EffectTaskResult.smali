.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "EffectTaskResult.java"


# instance fields
.field private effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 35
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 36
    return-void
.end method


# virtual methods
.method public getEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public setEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 22
    return-void
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 30
    return-void
.end method
