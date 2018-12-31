.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "WriteUpdateTagTask.java"


# instance fields
.field private mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private mTagsCachedMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Handler;",
            "Lcom/ss/android/ugc/effectmanager/context/EffectContext;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p3}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;)V

    .line 20
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mTagsCachedMap:Ljava/util/HashMap;

    .line 25
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 26
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 27
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-virtual {p1, p4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 28
    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mTaskId:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 3

    .line 33
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertObjToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    const-string v2, "updatetime"

    invoke-interface {v1, v2, v0}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->save(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->mTaskId:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;-><init>(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    const/16 v1, 0x33

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 36
    return-void
.end method
