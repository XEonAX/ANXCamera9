.class public interface abstract Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;
.super Ljava/lang/Object;
.source "IFetchEffectListListener.java"


# virtual methods
.method public abstract onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
.end method

.method public abstract onSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation
.end method
