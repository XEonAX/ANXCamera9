.class Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
.super Lcom/android/camera/fragment/CommonRecyclerViewHolder;
.source "FragmentLiveSticker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StickerItemHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;Landroid/view/View;)V
    .locals 0

    .line 336
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    .line 337
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    .line 338
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 343
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getAdapterPosition()I

    move-result v6

    .line 344
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-ne v6, v0, :cond_0

    .line 345
    return-void

    .line 347
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v7, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    .line 348
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iput v6, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    .line 349
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getItemId()J

    move-result-wide v4

    move-object v2, p1

    move v3, v6

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 350
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 351
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1, v6}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    .line 352
    return-void
.end method
