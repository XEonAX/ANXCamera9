.class public Lcom/android/camera/sticker/LiveStickerInfo;
.super Lcom/android/camera/network/resource/LiveResource;
.source "LiveStickerInfo.java"


# instance fields
.field public downloadState:I

.field public hash:Ljava/lang/String;

.field public hint:Ljava/lang/String;

.field public hintIcon:Ljava/lang/String;

.field public icon:Ljava/lang/String;

.field public iconId:I

.field public name:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    .line 25
    iput-object p1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    .line 26
    iput p3, p0, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    .line 27
    iput-object p2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    .line 32
    iput-object p1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "file:///android_asset/live/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->icon:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    iput-object p4, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    .line 40
    return-void
.end method

.method private isLocalExists()Z
    .locals 3

    .line 68
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getDownloadState()I
    .locals 3

    .line 74
    iget-boolean v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    if-nez v0, :cond_0

    .line 75
    invoke-direct {p0}, Lcom/android/camera/sticker/LiveStickerInfo;->isLocalExists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 76
    iput v1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    goto :goto_0

    .line 78
    :cond_0
    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    .line 80
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/sticker/LiveStickerInfo;->isDownloaded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 81
    iput v1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 83
    :cond_2
    :goto_0
    iget v0, p0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    return v0
.end method

.method public isDownloaded()Z
    .locals 8

    .line 46
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 48
    return v2

    .line 50
    :cond_0
    const-string v1, "MD5"

    const v3, 0x8000

    invoke-static {v0, v1, v3}, Lcom/android/camera/network/download/Verifier;->hash(Ljava/io/File;Ljava/lang/String;I)[B

    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    array-length v3, v0

    mul-int/lit8 v3, v3, 0x2

    if-eq v1, v3, :cond_1

    .line 52
    return v2

    .line 54
    :cond_1
    move v1, v2

    :goto_0
    array-length v3, v0

    const/4 v4, 0x1

    if-ge v1, v3, :cond_3

    .line 55
    iget-object v3, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    mul-int/lit8 v5, v1, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v6, 0x10

    invoke-static {v3, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    .line 56
    iget-object v7, p0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    add-int/2addr v5, v4

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    .line 57
    shl-int/lit8 v3, v3, 0x4

    or-int/2addr v3, v4

    int-to-byte v3, v3

    .line 58
    aget-byte v4, v0, v1

    if-eq v4, v3, :cond_2

    .line 59
    return v2

    .line 54
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 62
    :cond_3
    return v4
.end method
