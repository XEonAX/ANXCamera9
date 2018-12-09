.class public Lcom/android/camera/sticker/LiveStickerInfo;
.super Lcom/android/camera/network/resource/LiveResource;
.source "LiveStickerInfo.java"


# instance fields
.field public downloadState:I

.field public hash:Ljava/lang/String;

.field public icon:Ljava/lang/String;

.field public iconId:I

.field public name:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 20
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    .line 22
    iput-object p1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    .line 23
    iput p2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    .line 24
    return-void
.end method


# virtual methods
.method public getDownloadState()I
    .locals 2

    .line 36
    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/sticker/LiveStickerInfo;->isDownloaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    const/4 v0, 0x1

    return v0

    .line 39
    :cond_0
    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    return v0
.end method

.method public isDownloaded()Z
    .locals 3

    .line 30
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method
