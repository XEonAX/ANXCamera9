.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "EffectCheckUpdateResult.java"


# instance fields
.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private isUpdate:Z

.field private panel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    .line 37
    iput-boolean p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    .line 38
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 39
    return-void
.end method


# virtual methods
.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getPanel()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    return-object v0
.end method

.method public isUpdate()Z
    .locals 1

    .line 24
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    return v0
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 21
    return-void
.end method

.method public setUpdate(Z)V
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    .line 33
    return-void
.end method
