.class public Lcom/android/camera/sticker/StickerHelper;
.super Ljava/lang/Object;
.source "StickerHelper.java"


# static fields
.field private static final FACE_TRACK_MODEL_NAME:Ljava/lang/String; = "face_track_3.3.0.model"

.field private static final STICKER_MODEL_PATH:Ljava/lang/String; = "sticker_model"

.field private static final STICKER_RES_PATH:Ljava/lang/String; = "sticker_res"

.field private static mInstance:Lcom/android/camera/sticker/StickerHelper;

.field public static sStickLocal:[Ljava/lang/String;

.field private static sStickerEnable:Z


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 13
    const-string v0, "rabbiteating.zip"

    const-string v1, "bunny.zip"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/sticker/StickerHelper;->sStickLocal:[Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/sticker/StickerHelper;->sStickerEnable:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method private copyModelFiles()V
    .locals 4

    .line 68
    iget-object v0, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerHelper;->getModelPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "face_track_3.3.0.model"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "face_track_3.3.0.model"

    invoke-static {v0, v1, v2}, Lcom/android/camera/sticker/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z

    .line 69
    return-void
.end method

.method private copyStickerFiles()V
    .locals 7

    .line 72
    sget-object v0, Lcom/android/camera/sticker/StickerHelper;->sStickLocal:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 73
    iget-object v4, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4, v5, v3}, Lcom/android/camera/sticker/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z

    .line 72
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/android/camera/sticker/StickerHelper;
    .locals 2

    .line 23
    sget-object v0, Lcom/android/camera/sticker/StickerHelper;->mInstance:Lcom/android/camera/sticker/StickerHelper;

    if-nez v0, :cond_1

    .line 24
    const-class v0, Lcom/android/camera/sticker/StickerHelper;

    monitor-enter v0

    .line 25
    :try_start_0
    sget-object v1, Lcom/android/camera/sticker/StickerHelper;->mInstance:Lcom/android/camera/sticker/StickerHelper;

    if-nez v1, :cond_0

    .line 26
    new-instance v1, Lcom/android/camera/sticker/StickerHelper;

    invoke-direct {v1}, Lcom/android/camera/sticker/StickerHelper;-><init>()V

    sput-object v1, Lcom/android/camera/sticker/StickerHelper;->mInstance:Lcom/android/camera/sticker/StickerHelper;

    .line 28
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 30
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/sticker/StickerHelper;->mInstance:Lcom/android/camera/sticker/StickerHelper;

    return-object v0
.end method


# virtual methods
.method public getLocalStick()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/StickerInfo;",
            ">;"
        }
    .end annotation

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    new-instance v1, Lcom/android/camera/sticker/StickerInfo;

    const/4 v2, 0x0

    const v3, 0x7f020170

    invoke-direct {v1, v2, v3}, Lcom/android/camera/sticker/StickerInfo;-><init>(Ljava/lang/String;I)V

    .line 55
    new-instance v2, Lcom/android/camera/sticker/StickerInfo;

    sget-object v3, Lcom/android/camera/sticker/StickerHelper;->sStickLocal:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {p0, v3}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f02016b

    invoke-direct {v2, v3, v4}, Lcom/android/camera/sticker/StickerInfo;-><init>(Ljava/lang/String;I)V

    .line 56
    new-instance v3, Lcom/android/camera/sticker/StickerInfo;

    sget-object v4, Lcom/android/camera/sticker/StickerHelper;->sStickLocal:[Ljava/lang/String;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {p0, v4}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f02016c

    invoke-direct {v3, v4, v5}, Lcom/android/camera/sticker/StickerInfo;-><init>(Ljava/lang/String;I)V

    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    return-object v0
.end method

.method public getModelPath()Ljava/lang/String;
    .locals 2

    .line 86
    nop

    .line 87
    iget-object v0, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 88
    if-eqz v0, :cond_0

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "sticker_model"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 91
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getStickerPath()Ljava/lang/String;
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    const-string v1, "sticker_res"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStickerPath(J)Ljava/lang/String;
    .locals 2

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getStickerPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTrackModelPath()Ljava/lang/String;
    .locals 2

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerHelper;->getModelPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "face_track_3.3.0.model"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public initStickFiles(Landroid/content/Context;)V
    .locals 2

    .line 41
    sget-boolean v0, Lcom/android/camera/sticker/StickerHelper;->sStickerEnable:Z

    if-nez v0, :cond_0

    .line 42
    return-void

    .line 44
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    .line 45
    iget-object p1, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/camera/sticker/STLicenseUtils;->checkLicense(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 46
    iget-object p1, p0, Lcom/android/camera/sticker/StickerHelper;->mContext:Landroid/content/Context;

    const-string v0, "You should be authorized first!"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 48
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/sticker/StickerHelper;->copyStickerFiles()V

    .line 49
    invoke-direct {p0}, Lcom/android/camera/sticker/StickerHelper;->copyModelFiles()V

    .line 50
    return-void
.end method
