.class Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
.super Lcom/android/camera/fragment/CommonRecyclerViewHolder;
.source "FragmentLiveSticker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StickerItemHolder"
.end annotation


# instance fields
.field mWaitingDownloadSuccess:Z

.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;Landroid/view/View;)V
    .locals 0

    .line 565
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    .line 566
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    .line 567
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 568
    const p1, 0x7f0d0078

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/live/LiveDownloadView;

    .line 569
    invoke-virtual {p1, p0}, Lcom/android/camera/fragment/live/LiveDownloadView;->setOnDownloadSuccessListener(Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;)V

    .line 570
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 574
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getAdapterPosition()I

    move-result v3

    .line 575
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-ne v3, v0, :cond_0

    .line 576
    return-void

    .line 578
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getItemId()J

    move-result-wide v4

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 579
    return-void
.end method

.method public onDownloadSuccess(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 1

    .line 583
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getLayoutPosition()I

    move-result p1

    .line 584
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->mWaitingDownloadSuccess:Z

    .line 585
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 586
    return-void
.end method
