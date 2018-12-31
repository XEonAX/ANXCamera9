.class public Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "HostStatusUpdateResult.java"


# instance fields
.field private mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mHostStatus:Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mHostStatus:Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;

    .line 29
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 30
    return-void
.end method


# virtual methods
.method public getExceptionResult()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getHostStatus()Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mHostStatus:Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;

    return-object v0
.end method

.method public setExceptionResult(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 25
    return-void
.end method

.method public setHostStatus(Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;)V
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mHostStatus:Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;

    .line 17
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HostStatusUpdateResult{mHostStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mHostStatus:Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mExceptionResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostStatusUpdateResult;->mExceptionResult:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
