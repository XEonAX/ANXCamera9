.class public Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;
.super Ljava/lang/Object;
.source "HostStatus.java"


# instance fields
.field private duration:J

.field private exception:Ljava/lang/Exception;

.field private host:Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

.field private isSuccess:Z

.field private sendTime:J

.field private status:I

.field private traceCode:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;IJJLjava/lang/String;Ljava/lang/Exception;Z)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->url:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->host:Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 24
    iput p3, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->status:I

    .line 25
    iput-wide p4, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->duration:J

    .line 26
    iput-wide p6, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->sendTime:J

    .line 27
    iput-object p8, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->traceCode:Ljava/lang/String;

    .line 28
    iput-object p9, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->exception:Ljava/lang/Exception;

    .line 29
    iput-boolean p10, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->isSuccess:Z

    .line 30
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 65
    iget-wide v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->duration:J

    return-wide v0
.end method

.method public getException()Ljava/lang/Exception;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getHost()Lcom/ss/android/ugc/effectmanager/link/model/host/Host;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->host:Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    return-object v0
.end method

.method public getSendTime()J
    .locals 2

    .line 73
    iget-wide v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->sendTime:J

    return-wide v0
.end method

.method public getStatus()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->status:I

    return v0
.end method

.method public getTraceCode()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->traceCode:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->url:Ljava/lang/String;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    .line 57
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->isSuccess:Z

    return v0
.end method

.method public setDuration(J)V
    .locals 0

    .line 69
    iput-wide p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->duration:J

    .line 70
    return-void
.end method

.method public setException(Ljava/lang/Exception;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->exception:Ljava/lang/Exception;

    .line 94
    return-void
.end method

.method public setHost(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->host:Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 46
    return-void
.end method

.method public setSendTime(J)V
    .locals 0

    .line 77
    iput-wide p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->sendTime:J

    .line 78
    return-void
.end method

.method public setStatus(I)V
    .locals 0

    .line 53
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->status:I

    .line 54
    return-void
.end method

.method public setSuccess(Z)V
    .locals 0

    .line 61
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->isSuccess:Z

    .line 62
    return-void
.end method

.method public setTraceCode(Ljava/lang/String;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->traceCode:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->url:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HostStatus{url=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", host="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->host:Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 100
    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", status="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->status:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", duration="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->duration:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ", sendTime="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->sendTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ", traceCode=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->traceCode:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", exception="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->exception:Ljava/lang/Exception;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isSuccess="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/HostStatus;->isSuccess:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 98
    return-object v0
.end method
