.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "ReadUpdateTagTask.java"


# instance fields
.field private mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mId:Ljava/lang/String;

.field private mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private mUpdateTime:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p3}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 30
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 31
    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mId:Ljava/lang/String;

    .line 32
    iput-object p5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mUpdateTime:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 8

    .line 37
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    const-string v1, "updatetime"

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->queryToStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 38
    const/4 v1, 0x0

    const/16 v2, 0x34

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mId:Ljava/lang/String;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mUpdateTime:Ljava/lang/String;

    new-instance v5, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v6, 0x2719

    invoke-direct {v5, v6}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v3, v4, v1, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_1

    .line 42
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    const-class v4, Ljava/util/HashMap;

    invoke-interface {v3, v0, v4}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertJsonToObj(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 43
    if-eqz v0, :cond_1

    .line 44
    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mId:Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mUpdateTime:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_0

    .line 46
    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mId:Ljava/lang/String;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mUpdateTime:Ljava/lang/String;

    new-instance v5, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "local file destroy"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v0, v3, v4, v1, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :goto_0
    goto :goto_1

    .line 48
    :catch_0
    move-exception v0

    .line 49
    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mId:Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->mUpdateTime:Ljava/lang/String;

    new-instance v6, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v6, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v3, v4, v5, v1, v6}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 52
    :goto_1
    return-void
.end method
