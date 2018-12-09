.class public Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "HostListStatusUpdateTaskResult.java"


# instance fields
.field private mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    .line 31
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 32
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 33
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 34
    return-void
.end method


# virtual methods
.method public getExceptionResult()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getHosts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation

    .line 15
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    return-object v0
.end method

.method public setExceptionResult(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 28
    return-void
.end method

.method public setHosts(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;)V"
        }
    .end annotation

    .line 19
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 38
    const-string v0, "HostListStatusUpdateTaskResult{ Hosts{"

    .line 39
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mHosts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " }, mExceptionResult="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v0, 0x7d

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    return-object v0
.end method
