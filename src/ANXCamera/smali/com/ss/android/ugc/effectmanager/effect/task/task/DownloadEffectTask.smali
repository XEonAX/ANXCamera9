.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "DownloadEffectTask.java"


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mCurCnt:I

.field private mDownLoadUrl:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 1

    .line 40
    const-string v0, "NETWORK"

    invoke-direct {p0, p4, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 42
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 43
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 44
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRetryCount()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mCurCnt:I

    .line 45
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getFileUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    move-result-object p1

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->getUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mDownLoadUrl:Ljava/util/List;

    .line 46
    return-void
.end method

.method private download(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 85
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    const-string v1, "GET"

    invoke-direct {v0, v1, p1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;)Ljava/io/InputStream;

    move-result-object p1

    .line 87
    if-eqz p1, :cond_0

    .line 90
    invoke-static {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->convertStreamToFile(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/File;

    .line 91
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object p1

    .line 88
    :cond_0
    new-instance p1, Landroid/accounts/NetworkErrorException;

    const-string p2, "Download error"

    invoke-direct {p1, p2}, Landroid/accounts/NetworkErrorException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public execute()V
    .locals 7

    .line 50
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    const/16 v1, 0x2a

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 51
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    const/16 v1, 0xf

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mDownLoadUrl:Ljava/util/List;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mDownLoadUrl:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getFileUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isUrlModelEmpty(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 56
    :cond_0
    const/4 v0, 0x0

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mDownLoadUrl:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    :goto_0
    if-ge v0, v3, :cond_7

    .line 58
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->isCanceled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 59
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v4, 0x2711

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 60
    goto/16 :goto_3

    .line 63
    :cond_1
    :try_start_0
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getZipPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getUnzipPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 64
    :cond_2
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v6}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v6}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".zip"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setZipPath(Ljava/lang/String;)V

    .line 65
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v6}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v6}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setUnzipPath(Ljava/lang/String;)V

    .line 67
    :cond_3
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mDownLoadUrl:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getZipPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->download(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    move-result-object v4

    .line 68
    if-eqz v4, :cond_4

    .line 69
    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getZipPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getUnzipPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->unZip(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance v5, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    invoke-direct {v5, v4, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    goto :goto_3

    .line 80
    :cond_4
    goto :goto_1

    .line 73
    :catch_0
    move-exception v4

    .line 74
    add-int/lit8 v5, v3, -0x1

    if-eq v0, v5, :cond_6

    instance-of v5, v4, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    if-eqz v5, :cond_5

    goto :goto_2

    .line 56
    :cond_5
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 75
    :cond_6
    :goto_2
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 76
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getUnzipPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->removeDir(Ljava/lang/String;)V

    .line 77
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 78
    nop

    .line 82
    :cond_7
    :goto_3
    return-void

    .line 52
    :cond_8
    :goto_4
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->mEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v4, 0x2713

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 53
    return-void
.end method
