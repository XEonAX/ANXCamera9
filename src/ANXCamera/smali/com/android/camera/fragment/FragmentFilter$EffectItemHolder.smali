.class public abstract Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "FragmentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "EffectItemHolder"
.end annotation


# instance fields
.field protected mEffectIndex:I

.field protected mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFilter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/view/View;)V
    .locals 0

    .line 353
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    .line 354
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 355
    const p1, 0x7f0d0012

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->mTextView:Landroid/widget/TextView;

    .line 356
    return-void
.end method


# virtual methods
.method public bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V
    .locals 0

    .line 359
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->getRenderId(ILcom/android/camera/data/data/ComponentDataItem;)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->mEffectIndex:I

    .line 360
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->mTextView:Landroid/widget/TextView;

    iget p2, p2, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 361
    return-void
.end method

.method protected getRenderId(ILcom/android/camera/data/data/ComponentDataItem;)I
    .locals 0

    .line 364
    iget-object p1, p2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
