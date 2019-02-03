.class Lcom/android/camera/fragment/live/FragmentLiveSticker$7;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lcom/android/camera/network/resource/LiveDownloadHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/camera/network/resource/LiveDownloadHelper<",
        "Lcom/android/camera/sticker/LiveStickerInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V
    .locals 0

    .line 481
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$7;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createDownloadRequest(Lcom/android/camera/network/resource/LiveResource;)Lcom/android/camera/network/download/Request;
    .locals 0

    .line 481
    check-cast p1, Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$7;->createDownloadRequest(Lcom/android/camera/sticker/LiveStickerInfo;)Lcom/android/camera/network/download/Request;

    move-result-object p1

    return-object p1
.end method

.method public createDownloadRequest(Lcom/android/camera/sticker/LiveStickerInfo;)Lcom/android/camera/network/download/Request;
    .locals 4

    .line 490
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 491
    new-instance v1, Lcom/android/camera/network/download/Request;

    iget-object v2, p1, Lcom/android/camera/sticker/LiveStickerInfo;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/android/camera/sticker/LiveStickerInfo;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/android/camera/network/download/Request;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/io/File;)V

    .line 492
    new-instance v0, Lcom/android/camera/network/download/Verifier$Md5;

    iget-object p1, p1, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-direct {v0, p1}, Lcom/android/camera/network/download/Verifier$Md5;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/android/camera/network/download/Request;->setVerifier(Lcom/android/camera/network/download/Verifier;)V

    .line 493
    return-object v1
.end method

.method public bridge synthetic isDownloaded(Lcom/android/camera/network/resource/LiveResource;)Z
    .locals 0

    .line 481
    check-cast p1, Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$7;->isDownloaded(Lcom/android/camera/sticker/LiveStickerInfo;)Z

    move-result p1

    return p1
.end method

.method public isDownloaded(Lcom/android/camera/sticker/LiveStickerInfo;)Z
    .locals 0

    .line 485
    const/4 p1, 0x0

    return p1
.end method
