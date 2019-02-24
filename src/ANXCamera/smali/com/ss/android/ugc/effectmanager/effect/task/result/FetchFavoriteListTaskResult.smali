.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "FetchFavoriteListTaskResult.java"


# instance fields
.field private mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    .line 22
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    .line 16
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 17
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mType:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
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

    .line 26
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    return-object v0
.end method

.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mType:Ljava/lang/String;

    return-object v0
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

    .line 30
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mEffects:Ljava/util/List;

    .line 31
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->mType:Ljava/lang/String;

    .line 39
    return-void
.end method
