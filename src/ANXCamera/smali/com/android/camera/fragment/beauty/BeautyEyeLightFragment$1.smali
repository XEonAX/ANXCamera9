.class Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "BeautyEyeLightFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final mLeftMargin:I

.field final mRightMargin:I

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

.field final synthetic val$isRTL:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;Z)V
    .locals 0

    .line 109
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iput-boolean p2, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->val$isRTL:Z

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 110
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a00de

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mLeftMargin:I

    .line 111
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a00df

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mRightMargin:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 0

    .line 115
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    .line 116
    iget-boolean p3, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->val$isRTL:Z

    const/4 p4, 0x0

    if-eqz p3, :cond_1

    .line 117
    if-nez p2, :cond_0

    .line 118
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mRightMargin:I

    iget p3, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mLeftMargin:I

    invoke-virtual {p1, p2, p4, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 120
    :cond_0
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mRightMargin:I

    invoke-virtual {p1, p2, p4, p4, p4}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 123
    :cond_1
    if-nez p2, :cond_2

    .line 124
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mLeftMargin:I

    iget p3, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mRightMargin:I

    invoke-virtual {p1, p2, p4, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 126
    :cond_2
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;->mRightMargin:I

    invoke-virtual {p1, p4, p4, p2, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 129
    :goto_0
    return-void
.end method
