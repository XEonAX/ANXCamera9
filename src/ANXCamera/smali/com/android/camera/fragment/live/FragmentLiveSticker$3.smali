.class Lcom/android/camera/fragment/live/FragmentLiveSticker$3;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

.field final synthetic val$position:I

.field final synthetic val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Lcom/android/camera/sticker/LiveStickerInfo;ILandroid/view/View;)V
    .locals 0

    .line 273
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    iput p3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$position:I

    iput-object p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .line 280
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    const/4 v1, 0x5

    iput v1, v0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 281
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$position:I

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$view:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V

    .line 282
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 286
    const-string v0, "FragmentLiveSticker"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "verify "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v2, v2, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".zip failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 287
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    const/4 v0, 0x0

    iput v0, p1, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 288
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-static {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$position:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 289
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$position:I

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->val$view:Landroid/view/View;

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V

    .line 290
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0

    .line 276
    return-void
.end method
