.class Lcom/ss/android/ugc/effectmanager/EffectManager$3;
.super Ljava/lang/Object;
.source "EffectManager.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

.field final synthetic val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

.field final synthetic val$whileDownload:Z


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iput-boolean p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$whileDownload:Z

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 243
    :cond_0
    return-void
.end method

.method public onSuccess(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;)V
    .locals 4

    .line 210
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$whileDownload:Z

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iget-object v0, v0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->getPanel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->queryToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    iget-object v1, v1, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "effectchannel"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->getPanel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 214
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->getAllCategoryEffects()Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 215
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/EffectManager$3$1;

    invoke-direct {v3, p0, p1, v0}, Lcom/ss/android/ugc/effectmanager/EffectManager$3$1;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager$3;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/lang/String;)V

    invoke-static {v2, v1, v3}, Lcom/ss/android/ugc/effectmanager/EffectManager;->access$200(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 233
    goto :goto_0

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    if-eqz v0, :cond_1

    .line 235
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;->val$iFetchEffectChannelListener:Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onSuccess(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;)V

    .line 237
    :cond_1
    :goto_0
    return-void
.end method
