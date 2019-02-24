.class Lcom/ss/android/ugc/effectmanager/EffectManager$6;
.super Ljava/lang/Object;
.source "EffectManager.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/util/List;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

.field final synthetic val$downloadAfterFetch:Z

.field final synthetic val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 0

    .line 400
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iput-boolean p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$downloadAfterFetch:Z

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 412
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 413
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 403
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$downloadAfterFetch:Z

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-static {v0, p1, v1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->access$200(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    goto :goto_0

    .line 406
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onSuccess(Ljava/util/List;)V

    .line 408
    :goto_0
    return-void
.end method
