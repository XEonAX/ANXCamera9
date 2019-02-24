.class public Lcom/ss/android/ugc/effectmanager/common/TaskManager;
.super Ljava/lang/Object;
.source "TaskManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;
    }
.end annotation


# instance fields
.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mExecutor:Ljava/util/concurrent/ExecutorService;

.field private mInit:Z

.field private mInterceptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInit:Z

    return-void
.end method

.method private checkInit()V
    .locals 2

    .line 51
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInit:Z

    if-eqz v0, :cond_0

    .line 54
    return-void

    .line 52
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "EffectPlatformSDK: TaskManager is not init !!!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addInterception(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInterceptions:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

.method public commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V
    .locals 2

    .line 57
    nop

    .line 58
    if-nez p1, :cond_0

    .line 59
    return-void

    .line 62
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->checkInit()V

    .line 64
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInterceptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;

    .line 65
    invoke-virtual {v1, p1}, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;->intercept(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    const/4 v0, 0x1

    .line 67
    goto :goto_1

    .line 69
    :cond_1
    goto :goto_0

    .line 70
    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-nez v0, :cond_3

    .line 71
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;

    invoke-direct {v1, p0, p1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;-><init>(Lcom/ss/android/ugc/effectmanager/common/TaskManager;Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 78
    :cond_3
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 82
    return-void
.end method

.method public enableInterception(Ljava/lang/String;Z)V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInterceptions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;

    .line 91
    if-eqz p1, :cond_0

    .line 92
    invoke-virtual {p1, p2}, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;->enable(Z)V

    .line 94
    :cond_0
    return-void
.end method

.method public getInterceptions()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;",
            ">;"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInterceptions:Ljava/util/Map;

    return-object v0
.end method

.method public init(Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;)V
    .locals 1

    .line 44
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 45
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->access$000(Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;)Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 46
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInit:Z

    .line 47
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->mInterceptions:Ljava/util/Map;

    .line 48
    return-void
.end method
