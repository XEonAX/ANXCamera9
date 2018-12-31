.class Lcom/android/camera/fragment/live/FragmentLiveSticker$2;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "FragmentLiveSticker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final mLeftMargin:I

.field final mRightMargin:I

.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

.field final synthetic val$isRTL:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Z)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iput-boolean p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->val$isRTL:Z

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 106
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-virtual {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f090113

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mLeftMargin:I

    .line 107
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-virtual {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f090114

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mRightMargin:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 1

    .line 111
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    .line 112
    iget-boolean p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->val$isRTL:Z

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    .line 113
    if-nez p2, :cond_0

    .line 114
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mLeftMargin:I

    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 115
    :cond_0
    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    if-ne p2, p3, :cond_3

    .line 116
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mRightMargin:I

    invoke-virtual {p1, p2, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 119
    :cond_1
    if-nez p2, :cond_2

    .line 120
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mLeftMargin:I

    invoke-virtual {p1, p2, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 121
    :cond_2
    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    if-ne p2, p3, :cond_3

    .line 122
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;->mRightMargin:I

    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 125
    :cond_3
    :goto_0
    return-void
.end method
