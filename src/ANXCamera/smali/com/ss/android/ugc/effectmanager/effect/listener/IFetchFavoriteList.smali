.class public interface abstract Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;
.super Ljava/lang/Object;
.source "IFetchFavoriteList.java"


# virtual methods
.method public abstract onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
.end method

.method public abstract onSuccess(Ljava/util/List;Ljava/lang/String;)V
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
.end method
