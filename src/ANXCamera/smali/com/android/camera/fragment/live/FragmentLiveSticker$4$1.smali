.class Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$4;->onFinish(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$4;I)V
    .locals 0

    .line 249
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    iput p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 252
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$200(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 253
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->val$position:I

    if-ne v0, v1, :cond_0

    .line 254
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4$1;->val$position:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V

    .line 256
    :cond_0
    return-void
.end method
