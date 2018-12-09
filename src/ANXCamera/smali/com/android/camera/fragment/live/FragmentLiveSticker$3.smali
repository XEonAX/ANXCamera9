.class Lcom/android/camera/fragment/live/FragmentLiveSticker$3;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V
    .locals 0

    .line 198
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 5

    .line 201
    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    .line 202
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/sticker/LiveStickerInfo;

    .line 203
    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object v3

    iget-object v4, v2, Lcom/android/camera/sticker/LiveStickerInfo;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getDownloadState(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 204
    goto :goto_0

    .line 205
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-virtual {v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$1;

    invoke-direct {v2, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$3;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 211
    const-string v1, "FragmentLiveSticker"

    const-string v2, "getStickerList %d "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    if-nez p1, :cond_1

    const/4 p1, -0x1

    goto :goto_1

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 216
    iget-object p3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-virtual {p3}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p3

    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$3;)V

    invoke-virtual {p3, v0}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 222
    const-string p3, "FragmentLiveSticker"

    const-string v0, "errorCode %d msg: %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget p1, p1, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    return-void
.end method
