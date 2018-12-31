.class Lcom/android/camera/network/download/DownloadTask;
.super Ljava/lang/Object;
.source "DownloadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;,
        Lcom/android/camera/network/download/DownloadTask$OnProgressListener;,
        Lcom/android/camera/network/download/DownloadTask$CoreTask;,
        Lcom/android/camera/network/download/DownloadTask$TaskInfo;,
        Lcom/android/camera/network/download/DownloadTask$InternalConstants;,
        Lcom/android/camera/network/download/DownloadTask$OpenConstants;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final CONNECTION_TIMEOUT:I = 0x2710

.field private static final READ_TIMEOUT:I = 0x3a98

.field private static final RETRY_INTERVAL_MILLI:J

.field private static final TAG:Ljava/lang/String; = "DownloadTask"


# instance fields
.field private mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

.field private mOnCompleteListener:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

.field private mOnProgressListener:Lcom/android/camera/network/download/DownloadTask$OnProgressListener;

.field private mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/android/camera/network/download/DownloadTask;->RETRY_INTERVAL_MILLI:J

    return-void
.end method

.method constructor <init>(Lcom/android/camera/network/download/Request;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;-><init>(Lcom/android/camera/network/download/DownloadTask;Lcom/android/camera/network/download/Request;)V

    iput-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    .line 62
    return-void
.end method

.method constructor <init>(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;)V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;-><init>(Lcom/android/camera/network/download/DownloadTask;Lcom/android/camera/network/download/Request;)V

    iput-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    .line 57
    iput-object p2, p0, Lcom/android/camera/network/download/DownloadTask;->mOnCompleteListener:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

    .line 58
    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/network/download/DownloadTask;Lcom/android/camera/network/download/Request;)I
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/android/camera/network/download/DownloadTask;->performRequest(Lcom/android/camera/network/download/Request;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/network/download/DownloadTask;)Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/android/camera/network/download/DownloadTask;->mOnCompleteListener:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/network/download/DownloadTask;)Lcom/android/camera/network/download/DownloadTask$OnProgressListener;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/android/camera/network/download/DownloadTask;->mOnProgressListener:Lcom/android/camera/network/download/DownloadTask$OnProgressListener;

    return-object p0
.end method

.method private configure(Ljava/net/HttpURLConnection;)V
    .locals 2

    .line 193
    const/16 v0, 0x2710

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 194
    const/16 v0, 0x3a98

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 199
    const-string v0, "Accept-Encoding"

    const-string v1, "identity"

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method private static getTempFile(Ljava/io/File;)Ljava/io/File;
    .locals 3

    .line 257
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".download"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static isRetryState(I)Z
    .locals 1

    .line 289
    const/16 v0, 0xc

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static openOutputStream(Ljava/io/File;)Ljava/io/OutputStream;
    .locals 5

    .line 308
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 309
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 310
    const-string p0, "DownloadTask"

    const-string v0, "create folder failed"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    return-object v2

    .line 314
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 315
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 316
    const-string p0, "DownloadTask"

    const-string v0, "output file is a directory"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    return-object v2

    .line 319
    :cond_1
    const-string v0, "DownloadTask"

    const-string v1, "output file will be overwritten"

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    :cond_2
    invoke-static {p0}, Lcom/android/camera/network/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    .line 324
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 325
    const-string v0, "DownloadTask"

    const-string v1, "temp file exists, try delete"

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_3

    .line 327
    const-string v0, "DownloadTask"

    const-string v1, "temp file delete failed, will overwrite"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    :cond_3
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 333
    :catch_0
    move-exception p0

    .line 334
    const-string v0, "DownloadTask"

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 335
    return-object v2
.end method

.method private performProgressUpdate([BI)V
    .locals 7

    .line 208
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide v0, v0, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDownloadSize:J

    .line 209
    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide v3, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDownloadSize:J

    int-to-long v5, p2

    add-long/2addr v3, v5

    iput-wide v3, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDownloadSize:J

    .line 210
    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-object v2, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    if-eqz v2, :cond_0

    .line 211
    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-object v2, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, p2}, Ljava/security/MessageDigest;->update([BII)V

    .line 214
    :cond_0
    iget-object p1, p0, Lcom/android/camera/network/download/DownloadTask;->mOnProgressListener:Lcom/android/camera/network/download/DownloadTask$OnProgressListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide p1, p1, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mContentLength:J

    const-wide/16 v2, 0x0

    cmp-long p1, p1, v2

    if-lez p1, :cond_1

    .line 215
    iget-object p1, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide p1, p1, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDownloadSize:J

    long-to-double p1, p1

    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide v2, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mContentLength:J

    long-to-double v2, v2

    div-double/2addr p1, v2

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr p1, v2

    double-to-int p1, p1

    .line 216
    long-to-double v0, v0

    iget-object p2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide v4, p2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mContentLength:J

    long-to-double v4, v4

    div-double/2addr v0, v4

    mul-double/2addr v0, v2

    double-to-int p2, v0

    .line 217
    if-eq p2, p1, :cond_1

    .line 218
    iget-object p2, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-virtual {p2, p1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->publishProgress(I)V

    .line 221
    :cond_1
    return-void
.end method

.method private performRequest(Lcom/android/camera/network/download/Request;)I
    .locals 9

    .line 85
    const-string v0, "DownloadTask"

    const-string v1, "start to download request[%s, %s, %s]"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getUri()Landroid/net/Uri;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getDestination()Ljava/io/File;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-direct {p0}, Lcom/android/camera/network/download/DownloadTask;->preRequest()V

    .line 87
    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getMaxRetryTimes()I

    move-result v0

    .line 88
    nop

    .line 91
    move v1, v4

    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/network/download/DownloadTask;->process(Lcom/android/camera/network/download/Request;)I

    move-result v2

    .line 92
    invoke-static {v2}, Lcom/android/camera/network/download/DownloadTask;->isRetryState(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 93
    const-string v3, "DownloadTask"

    const-string v6, "retry for %d"

    new-array v7, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :try_start_0
    sget-wide v6, Lcom/android/camera/network/download/DownloadTask;->RETRY_INTERVAL_MILLI:J

    invoke-static {v6, v7, v4}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    nop

    .line 104
    add-int/2addr v1, v5

    .line 105
    if-le v1, v0, :cond_0

    goto :goto_0

    .line 96
    :catch_0
    move-exception p1

    .line 97
    const/4 v2, 0x5

    .line 98
    nop

    .line 107
    :cond_1
    :goto_0
    invoke-direct {p0, v2}, Lcom/android/camera/network/download/DownloadTask;->postRequest(I)I

    move-result p1

    return p1
.end method

.method private postDownload()I
    .locals 4

    .line 224
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-static {v0}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->access$100(Lcom/android/camera/network/download/DownloadTask$CoreTask;)Lcom/android/camera/network/download/Request;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/network/download/Request;->getVerifier()Lcom/android/camera/network/download/Verifier;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-static {v0}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->access$100(Lcom/android/camera/network/download/DownloadTask$CoreTask;)Lcom/android/camera/network/download/Request;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/network/download/Request;->getVerifier()Lcom/android/camera/network/download/Verifier;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-object v2, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/camera/network/download/Verifier;->verify([B)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 228
    :cond_0
    const-string v0, "DownloadTask"

    const-string v2, "verify fail"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    const/4 v0, 0x6

    return v0

    .line 225
    :cond_1
    :goto_0
    const-string v0, "DownloadTask"

    const-string v2, "verify success"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return v1
.end method

.method private postRequest(I)I
    .locals 5

    .line 234
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 235
    iget-object v1, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-static {v1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->access$100(Lcom/android/camera/network/download/DownloadTask$CoreTask;)Lcom/android/camera/network/download/Request;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/network/download/Request;->getDestination()Ljava/io/File;

    move-result-object v1

    .line 236
    invoke-static {v1}, Lcom/android/camera/network/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 237
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_0

    .line 238
    const-string v2, "DownloadTask"

    const-string v3, "delete tmp file failed %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v0

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :cond_0
    goto :goto_0

    .line 241
    :cond_1
    iget-object v1, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-static {v1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->access$100(Lcom/android/camera/network/download/DownloadTask$CoreTask;)Lcom/android/camera/network/download/Request;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/network/download/Request;->getDestination()Ljava/io/File;

    move-result-object v1

    .line 242
    invoke-static {v1}, Lcom/android/camera/network/download/DownloadTask;->getTempFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 243
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/16 v4, 0x9

    if-nez v3, :cond_2

    .line 244
    const-string p1, "DownloadTask"

    const-string v1, "downloaded file missing"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    return v4

    .line 246
    :cond_2
    invoke-virtual {v2, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 247
    const-string p1, "DownloadTask"

    const-string v1, "downloaded file rename failed"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    return v4

    .line 250
    :cond_3
    const-string v1, "DownloadTask"

    const-string v2, "rename tmp file success"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    :goto_0
    return p1
.end method

.method private preDownload(Lcom/android/camera/network/download/Request;)V
    .locals 3

    .line 185
    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getVerifier()Lcom/android/camera/network/download/Verifier;

    move-result-object p1

    .line 186
    if-eqz p1, :cond_0

    .line 187
    const-string v0, "DownloadTask"

    const-string v1, "need verify, try to get MessageDigest"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Verifier;->getInstance()Ljava/security/MessageDigest;

    move-result-object p1

    iput-object p1, v0, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mDigest:Ljava/security/MessageDigest;

    .line 190
    :cond_0
    return-void
.end method

.method private preRequest()V
    .locals 2

    .line 181
    new-instance v0, Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/camera/network/download/DownloadTask$TaskInfo;-><init>(Lcom/android/camera/network/download/DownloadTask$1;)V

    iput-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    .line 182
    return-void
.end method

.method private process(Lcom/android/camera/network/download/Request;)I
    .locals 7

    .line 111
    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getNetworkType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/network/download/ConnectionHelper;->open(Landroid/net/Uri;I)Lcom/android/camera/network/download/ConnectionHelper$Holder;

    move-result-object v0

    .line 112
    iget-object v1, v0, Lcom/android/camera/network/download/ConnectionHelper$Holder;->value:Ljava/lang/Object;

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 113
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 114
    const-string p1, "DownloadTask"

    const-string v1, "open connection failed"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget p1, v0, Lcom/android/camera/network/download/ConnectionHelper$Holder;->reason:I

    invoke-static {p1}, Lcom/android/camera/network/download/DownloadTask;->translateErrorCode(I)I

    move-result p1

    return p1

    .line 118
    :cond_0
    nop

    .line 119
    nop

    .line 121
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v1}, Lcom/android/camera/network/download/DownloadTask;->configure(Ljava/net/HttpURLConnection;)V

    .line 122
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 124
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/network/download/DownloadTask;->translateResponseCode(I)I

    move-result v3

    .line 125
    if-eqz v3, :cond_1

    .line 126
    const-string p1, "DownloadTask"

    const-string v4, "response code not valid"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 127
    nop

    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    nop

    .line 170
    nop

    .line 127
    return v3

    .line 130
    :cond_1
    :try_start_1
    invoke-direct {p0, v1}, Lcom/android/camera/network/download/DownloadTask;->processHeader(Ljava/net/HttpURLConnection;)V

    .line 132
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 133
    :try_start_2
    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getDestination()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/android/camera/network/download/DownloadTask;->openOutputStream(Ljava/io/File;)Ljava/io/OutputStream;

    move-result-object v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 135
    if-nez v4, :cond_4

    .line 136
    :try_start_3
    const-string p1, "DownloadTask"

    const-string v0, "open output stream failed"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 137
    const/4 p1, 0x4

    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    if-eqz v3, :cond_2

    .line 164
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 167
    goto :goto_0

    .line 165
    :catch_0
    move-exception v0

    .line 166
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    :cond_2
    :goto_0
    if-eqz v4, :cond_3

    .line 172
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 175
    goto :goto_1

    .line 173
    :catch_1
    move-exception v0

    .line 174
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 137
    :cond_3
    :goto_1
    return p1

    .line 161
    :catchall_0
    move-exception p1

    goto/16 :goto_b

    .line 157
    :catch_2
    move-exception p1

    goto/16 :goto_7

    .line 140
    :cond_4
    :try_start_6
    invoke-direct {p0, p1}, Lcom/android/camera/network/download/DownloadTask;->preDownload(Lcom/android/camera/network/download/Request;)V

    .line 141
    const-string p1, "DownloadTask"

    const-string v0, "start to transfer data"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    nop

    .line 144
    const/16 p1, 0x2000

    new-array p1, p1, [B

    .line 145
    move v0, v2

    :goto_2
    iget-object v5, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-virtual {v5}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->isCancelled()Z

    move-result v5

    const/4 v6, -0x1

    if-nez v5, :cond_5

    invoke-virtual {v3, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    if-eq v0, v6, :cond_5

    .line 146
    invoke-virtual {v4, p1, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 147
    invoke-direct {p0, p1, v0}, Lcom/android/camera/network/download/DownloadTask;->performProgressUpdate([BI)V

    goto :goto_2

    .line 150
    :cond_5
    if-ne v0, v6, :cond_8

    .line 151
    const-string p1, "DownloadTask"

    const-string v0, "download success"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    invoke-direct {p0}, Lcom/android/camera/network/download/DownloadTask;->postDownload()I

    move-result p1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    if-eqz v3, :cond_6

    .line 164
    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 167
    goto :goto_3

    .line 165
    :catch_3
    move-exception v0

    .line 166
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    :cond_6
    :goto_3
    if-eqz v4, :cond_7

    .line 172
    :try_start_8
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 175
    goto :goto_4

    .line 173
    :catch_4
    move-exception v0

    .line 174
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    :cond_7
    :goto_4
    return p1

    .line 154
    :cond_8
    :try_start_9
    const-string p1, "DownloadTask"

    const-string v0, "cancelled, during download"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 155
    const/4 p1, 0x5

    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    if-eqz v3, :cond_9

    .line 164
    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    .line 167
    goto :goto_5

    .line 165
    :catch_5
    move-exception v0

    .line 166
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    :cond_9
    :goto_5
    if-eqz v4, :cond_a

    .line 172
    :try_start_b
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 175
    goto :goto_6

    .line 173
    :catch_6
    move-exception v0

    .line 174
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 155
    :cond_a
    :goto_6
    return p1

    .line 161
    :catchall_1
    move-exception p1

    move-object v4, v0

    goto :goto_b

    .line 157
    :catch_7
    move-exception p1

    move-object v4, v0

    :goto_7
    move-object v0, v3

    goto :goto_8

    .line 161
    :catchall_2
    move-exception p1

    move-object v3, v0

    move-object v4, v3

    goto :goto_b

    .line 157
    :catch_8
    move-exception p1

    move-object v4, v0

    .line 158
    :goto_8
    :try_start_c
    const-string v2, "DownloadTask"

    invoke-static {v2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 159
    const/16 p1, 0xb

    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    if-eqz v0, :cond_b

    .line 164
    :try_start_d
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9

    .line 167
    goto :goto_9

    .line 165
    :catch_9
    move-exception v0

    .line 166
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    :cond_b
    :goto_9
    if-eqz v4, :cond_c

    .line 172
    :try_start_e
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_a

    .line 175
    goto :goto_a

    .line 173
    :catch_a
    move-exception v0

    .line 174
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 159
    :cond_c
    :goto_a
    return p1

    .line 161
    :catchall_3
    move-exception p1

    move-object v3, v0

    :goto_b
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    if-eqz v3, :cond_d

    .line 164
    :try_start_f
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_b

    .line 167
    goto :goto_c

    .line 165
    :catch_b
    move-exception v0

    .line 166
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    :cond_d
    :goto_c
    if-eqz v4, :cond_e

    .line 172
    :try_start_10
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_c

    .line 175
    goto :goto_d

    .line 173
    :catch_c
    move-exception v0

    .line 174
    const-string v1, "DownloadTask"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 175
    :cond_e
    :goto_d
    throw p1
.end method

.method private processHeader(Ljava/net/HttpURLConnection;)V
    .locals 4

    .line 203
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result p1

    int-to-long v1, p1

    iput-wide v1, v0, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mContentLength:J

    .line 204
    const-string p1, "DownloadTask"

    const-string v0, "content length: %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/camera/network/download/DownloadTask;->mTaskInfo:Lcom/android/camera/network/download/DownloadTask$TaskInfo;

    iget-wide v2, v2, Lcom/android/camera/network/download/DownloadTask$TaskInfo;->mContentLength:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    return-void
.end method

.method private static translateErrorCode(I)I
    .locals 0

    .line 293
    packed-switch p0, :pswitch_data_0

    .line 303
    const/16 p0, 0xb

    return p0

    .line 301
    :pswitch_0
    const/4 p0, 0x3

    return p0

    .line 299
    :pswitch_1
    const/4 p0, 0x2

    return p0

    .line 297
    :pswitch_2
    const/4 p0, 0x1

    return p0

    .line 295
    :pswitch_3
    const/4 p0, 0x0

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static translateResponseCode(I)I
    .locals 5

    .line 262
    const/4 v0, 0x0

    const/16 v1, 0xc8

    if-eq p0, v1, :cond_6

    .line 263
    const-string v1, "DownloadTask"

    const-string v2, "processing http code %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    div-int/lit8 v0, p0, 0x64

    .line 265
    const/4 v1, 0x3

    const/4 v2, 0x7

    if-ne v0, v1, :cond_0

    .line 266
    return v2

    .line 267
    :cond_0
    const/4 v1, 0x4

    const/16 v3, 0xc

    if-ne v0, v1, :cond_2

    .line 268
    const/16 v0, 0x198

    if-ne p0, v0, :cond_1

    .line 269
    return v3

    .line 271
    :cond_1
    return v2

    .line 272
    :cond_2
    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 273
    const/16 v0, 0x1f8

    if-ne p0, v0, :cond_3

    .line 274
    return v3

    .line 276
    :cond_3
    const/16 p0, 0x8

    return p0

    .line 277
    :cond_4
    const/4 p0, 0x2

    if-ne v0, p0, :cond_5

    .line 278
    return v2

    .line 280
    :cond_5
    return v2

    .line 283
    :cond_6
    const-string p0, "DownloadTask"

    const-string v1, "http status is ok"

    new-array v2, v0, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    return v0
.end method


# virtual methods
.method cancel(Z)Z
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    invoke-virtual {v0, p1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->cancel(Z)Z

    move-result p1

    return p1
.end method

.method execute()I
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method execute(Ljava/util/concurrent/Executor;)V
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mCoreTask:Lcom/android/camera/network/download/DownloadTask$CoreTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/network/download/DownloadTask$CoreTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 70
    return-void
.end method

.method getOnProgressListener()Lcom/android/camera/network/download/DownloadTask$OnProgressListener;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/android/camera/network/download/DownloadTask;->mOnProgressListener:Lcom/android/camera/network/download/DownloadTask$OnProgressListener;

    return-object v0
.end method

.method setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/android/camera/network/download/DownloadTask;->mOnProgressListener:Lcom/android/camera/network/download/DownloadTask$OnProgressListener;

    .line 78
    return-void
.end method
