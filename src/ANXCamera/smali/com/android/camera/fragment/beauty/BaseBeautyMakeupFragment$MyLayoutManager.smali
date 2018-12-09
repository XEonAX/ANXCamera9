.class public Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;
.super Landroid/support/v7/widget/LinearLayoutManager;
.source "BaseBeautyMakeupFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyLayoutManager"
.end annotation


# instance fields
.field private isScrollEnabled:Z

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;Landroid/content/Context;)V
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;

    .line 182
    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 179
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->isScrollEnabled:Z

    .line 183
    return-void
.end method


# virtual methods
.method public canScrollHorizontally()Z
    .locals 1

    .line 203
    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->isScrollEnabled:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/support/v7/widget/LinearLayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onMeasure(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V
    .locals 0

    .line 188
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object p1

    .line 189
    if-eqz p1, :cond_0

    .line 190
    invoke-virtual {p0, p1, p3, p4}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->measureChild(Landroid/view/View;II)V

    .line 191
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 192
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    .line 193
    invoke-virtual {p0, p2, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->setMeasuredDimension(II)V

    .line 195
    :cond_0
    return-void
.end method

.method public setScrollEnabled(Z)V
    .locals 0

    .line 198
    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->isScrollEnabled:Z

    .line 199
    return-void
.end method
