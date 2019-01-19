.class public Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "LiveBeautyFilterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EffectItemPadding"
.end annotation


# instance fields
.field protected mEffectListLeft:I

.field protected mHorizontalPadding:I

.field protected mVerticalPadding:I

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)V
    .locals 2

    .line 213
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 214
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0027

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mHorizontalPadding:I

    .line 216
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0029

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mVerticalPadding:I

    .line 218
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0028

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mEffectListLeft:I

    .line 220
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 1

    .line 225
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result p2

    .line 227
    if-nez p2, :cond_0

    iget p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mEffectListLeft:I

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iget p3, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mVerticalPadding:I

    iget p4, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mHorizontalPadding:I

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;->mVerticalPadding:I

    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 229
    return-void
.end method
