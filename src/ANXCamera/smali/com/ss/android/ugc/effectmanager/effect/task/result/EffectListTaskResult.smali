.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "EffectListTaskResult.java"


# instance fields
.field private effectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->effectList:Ljava/util/List;

    .line 36
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 37
    return-void
.end method


# virtual methods
.method public getEffectList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->effectList:Ljava/util/List;

    return-object v0
.end method

.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public setEffectList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 22
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->effectList:Ljava/util/List;

    .line 23
    return-void
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 31
    return-void
.end method
