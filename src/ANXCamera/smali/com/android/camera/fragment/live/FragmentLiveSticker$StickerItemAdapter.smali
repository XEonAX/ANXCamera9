.class Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentLiveSticker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StickerItemAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;",
        ">;"
    }
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field mListener:Landroid/widget/AdapterView$OnItemClickListener;

.field mSelectIndex:I

.field mStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;ILandroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;I",
            "Landroid/widget/AdapterView$OnItemClickListener;",
            ")V"
        }
    .end annotation

    .line 290
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 291
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mContext:Landroid/content/Context;

    .line 292
    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    .line 293
    iput p3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    .line 294
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 295
    iput-object p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 296
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 332
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 282
    check-cast p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->onBindViewHolder(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;I)V
    .locals 5

    .line 306
    const v0, 0x7f0d0064

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/live/LiveDownloadView;

    .line 307
    const v1, 0x7f0d0062

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 308
    const v2, 0x7f0d0063

    invoke-virtual {p1, v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v2

    .line 310
    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/sticker/LiveStickerInfo;

    .line 311
    iget-object p1, p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 313
    iget-boolean p1, v3, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    if-eqz p1, :cond_0

    .line 314
    iget p1, v3, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 316
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/bumptech/glide/c;->f(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object p1

    iget-object v4, v3, Lcom/android/camera/sticker/LiveStickerInfo;->icon:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/bumptech/glide/i;->b(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 318
    :goto_0
    invoke-virtual {v3}, Lcom/android/camera/sticker/LiveStickerInfo;->getDownloadState()I

    move-result p1

    .line 319
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/live/LiveDownloadView;->setStateImage(I)V

    .line 320
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 321
    const/4 p1, 0x1

    iput p1, v3, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 323
    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-ne p2, p1, :cond_2

    .line 324
    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 326
    :cond_2
    const/16 p1, 0x8

    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 328
    :goto_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 282
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
    .locals 2

    .line 300
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f040020

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 301
    new-instance p2, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;Landroid/view/View;)V

    return-object p2
.end method
