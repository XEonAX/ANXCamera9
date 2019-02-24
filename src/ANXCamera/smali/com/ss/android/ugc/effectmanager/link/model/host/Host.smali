.class public Lcom/ss/android/ugc/effectmanager/link/model/host/Host;
.super Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;
.source "Host.java"


# instance fields
.field private host:Ljava/lang/String;

.field private port:I

.field private schema:Ljava/lang/String;

.field private sortTime:J

.field private weightTime:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;-><init>()V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 27
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    .line 29
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    .line 30
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;-><init>()V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 22
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 38
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;-><init>()V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 39
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    .line 41
    iput-wide p3, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->weightTime:J

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;-><init>()V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 34
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    .line 35
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public getHost()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getItemName()Ljava/lang/String;
    .locals 3

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    iget v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 97
    :cond_0
    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 45
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    return v0
.end method

.method public getSchema()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    return-object v0
.end method

.method public getSortTime()J
    .locals 4

    .line 84
    iget-wide v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->sortTime:J

    iget-wide v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->weightTime:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getWeightTime()J
    .locals 2

    .line 70
    iget-wide v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->weightTime:J

    return-wide v0
.end method

.method public hostEquals(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;)Z
    .locals 3

    .line 78
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 79
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 80
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSchema()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    nop

    .line 79
    :cond_1
    return v0
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 49
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->port:I

    .line 50
    return-void
.end method

.method public setSchema(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setSortTime(J)V
    .locals 0

    .line 88
    iput-wide p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->sortTime:J

    .line 89
    return-void
.end method

.method public setWeightTime(J)V
    .locals 0

    .line 74
    iput-wide p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->weightTime:J

    .line 75
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Host{weightTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->weightTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", schema=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->schema:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", host=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->host:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
