.class Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "FragmentLiveSpeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSpeed;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final mListMargin:I

.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

.field final synthetic val$isRTL:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSpeed;Z)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    iput-boolean p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->val$isRTL:Z

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 66
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    invoke-virtual {p1}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a0127

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 3

    .line 70
    iget-object p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    invoke-virtual {p4}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    const v0, 0x7f0a0128

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    .line 71
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    invoke-virtual {v0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    const/4 v2, 0x2

    mul-int/2addr v2, v1

    sub-int/2addr v0, v2

    .line 72
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    mul-int/2addr v1, p4

    sub-int/2addr v0, v1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p4

    invoke-virtual {p4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    div-int/2addr v0, p4

    .line 73
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    .line 74
    iget-boolean p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->val$isRTL:Z

    const/4 v1, 0x0

    if-eqz p4, :cond_2

    .line 75
    if-nez p2, :cond_0

    .line 76
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    invoke-virtual {p1, v1, v1, p2, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 77
    :cond_0
    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    if-ne p2, p3, :cond_1

    .line 78
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    invoke-virtual {p1, p2, v1, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p1, v1, v1, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 83
    :cond_2
    if-nez p2, :cond_3

    .line 84
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    invoke-virtual {p1, p2, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 85
    :cond_3
    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    if-ne p2, p3, :cond_4

    .line 86
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;->mListMargin:I

    invoke-virtual {p1, v0, v1, p2, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 91
    :goto_0
    return-void
.end method
