.class public Lcom/android/camera/fragment/beauty/BeautyLevelFragment$MyLayoutManager;
.super Landroid/support/v7/widget/LinearLayoutManager;
.source "BeautyLevelFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/BeautyLevelFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyLayoutManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BeautyLevelFragment;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/BeautyLevelFragment;Landroid/content/Context;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyLevelFragment$MyLayoutManager;->this$0:Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    .line 110
    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 111
    return-void
.end method


# virtual methods
.method public onMeasure(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V
    .locals 0

    .line 116
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object p1

    .line 117
    if-eqz p1, :cond_0

    .line 118
    invoke-virtual {p0, p1, p3, p4}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment$MyLayoutManager;->measureChild(Landroid/view/View;II)V

    .line 119
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 120
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    .line 121
    invoke-virtual {p0, p2, p1}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment$MyLayoutManager;->setMeasuredDimension(II)V

    .line 123
    :cond_0
    return-void
.end method
