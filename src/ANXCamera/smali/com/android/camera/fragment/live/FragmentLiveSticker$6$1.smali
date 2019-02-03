.class Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$6;->onFinish(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

.field final synthetic val$item:I

.field final synthetic val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$6;ILcom/android/camera/sticker/LiveStickerInfo;)V
    .locals 0

    .line 457
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    iput p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$item:I

    iput-object p3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .line 464
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$item:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 465
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mFutureSelectIndex:I

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$item:I

    if-ne v0, v1, :cond_0

    .line 466
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$item:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V

    .line 468
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 472
    const-string v0, "FragmentLiveSticker"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unzip "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v2, v2, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".zip failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 473
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$sticker:Lcom/android/camera/sticker/LiveStickerInfo;

    const/4 v0, 0x4

    iput v0, p1, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 474
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    iget-object p1, p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-static {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$6$1;->val$item:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 475
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0

    .line 460
    return-void
.end method
