.class Lcom/ss/android/ugc/effectmanager/EffectManager$7;
.super Ljava/lang/Object;
.source "EffectManager.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/util/List;ILcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

.field final synthetic val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 0

    .line 434
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 442
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 443
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 437
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;->val$iFetchEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onSuccess(Ljava/util/List;)V

    .line 438
    return-void
.end method
