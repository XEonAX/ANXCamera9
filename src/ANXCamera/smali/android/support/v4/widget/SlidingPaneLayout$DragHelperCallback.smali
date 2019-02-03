.class Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;
.super Landroid/support/v4/widget/ViewDragHelper$Callback;
.source "SlidingPaneLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/SlidingPaneLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragHelperCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/widget/SlidingPaneLayout;


# direct methods
.method private constructor <init>(Landroid/support/v4/widget/SlidingPaneLayout;)V
    .registers 2

    .line 1299
    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/support/v4/widget/SlidingPaneLayout$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;
    .param p2, "x1"    # Landroid/support/v4/widget/SlidingPaneLayout$1;

    .line 1299
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;)V

    return-void
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "dx"    # I

    .line 1365
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 1368
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # invokes: Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$700(Landroid/support/v4/widget/SlidingPaneLayout;)Z

    move-result v1

    if-eqz v1, :cond_40

    .line 1369
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v2

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v2, v3

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v3}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    .line 1371
    .local v1, "startBound":I
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I
    invoke-static {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I

    move-result v2

    sub-int v2, v1, v2

    .line 1372
    .local v2, "endBound":I
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1373
    .end local v2    # "endBound":I
    .local v1, "newLeft":I
    goto :goto_58

    .line 1374
    .end local v1    # "newLeft":I
    :cond_40
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v1

    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    .line 1375
    .local v1, "startBound":I
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I
    invoke-static {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I

    move-result v2

    add-int/2addr v2, v1

    .line 1376
    .restart local v2    # "endBound":I
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1378
    .end local v2    # "endBound":I
    .local v1, "newLeft":I
    :goto_58
    return v1
.end method

.method public clampViewPositionVertical(Landroid/view/View;II)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "top"    # I
    .param p3, "dy"    # I

    .line 1385
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    return v0
.end method

.method public getViewHorizontalDragRange(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .line 1360
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I

    move-result v0

    return v0
.end method

.method public onEdgeDragStarted(II)V
    .registers 5
    .param p1, "edgeFlags"    # I
    .param p2, "pointerId"    # I

    .line 1390
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$200(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/widget/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    .line 1391
    return-void
.end method

.method public onViewCaptured(Landroid/view/View;I)V
    .registers 4
    .param p1, "capturedChild"    # Landroid/view/View;
    .param p2, "activePointerId"    # I

    .line 1327
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->setAllChildrenVisible()V

    .line 1328
    return-void
.end method

.method public onViewDragStateChanged(I)V
    .registers 4
    .param p1, "state"    # I

    .line 1312
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$200(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v0

    if-nez v0, :cond_45

    .line 1313
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$300(Landroid/support/v4/widget/SlidingPaneLayout;)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_34

    .line 1314
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->updateObscuredViewsVisibility(Landroid/view/View;)V

    .line 1315
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->dispatchOnPanelClosed(Landroid/view/View;)V

    .line 1316
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    const/4 v1, 0x0

    # setter for: Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z
    invoke-static {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$502(Landroid/support/v4/widget/SlidingPaneLayout;Z)Z

    goto :goto_45

    .line 1318
    :cond_34
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->dispatchOnPanelOpened(Landroid/view/View;)V

    .line 1319
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    const/4 v1, 0x1

    # setter for: Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z
    invoke-static {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$502(Landroid/support/v4/widget/SlidingPaneLayout;Z)Z

    .line 1322
    :cond_45
    :goto_45
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .registers 7
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "dx"    # I
    .param p5, "dy"    # I

    .line 1332
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # invokes: Landroid/support/v4/widget/SlidingPaneLayout;->onPanelDragged(I)V
    invoke-static {v0, p2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$600(Landroid/support/v4/widget/SlidingPaneLayout;I)V

    .line 1333
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidate()V

    .line 1334
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .registers 9
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "xvel"    # F
    .param p3, "yvel"    # F

    .line 1338
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 1341
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # invokes: Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$700(Landroid/support/v4/widget/SlidingPaneLayout;)Z

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    if-eqz v1, :cond_46

    .line 1342
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v1

    iget v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v1, v4

    .line 1343
    .local v1, "startToRight":I
    cmpg-float v4, p2, v3

    if-ltz v4, :cond_2c

    cmpl-float v3, p2, v3

    if-nez v3, :cond_33

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F
    invoke-static {v3}, Landroid/support/v4/widget/SlidingPaneLayout;->access$300(Landroid/support/v4/widget/SlidingPaneLayout;)F

    move-result v3

    cmpl-float v2, v3, v2

    if-lez v2, :cond_33

    .line 1344
    :cond_2c
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I
    invoke-static {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I

    move-result v2

    add-int/2addr v1, v2

    .line 1346
    :cond_33
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 1347
    .local v2, "childWidth":I
    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v3}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v3

    sub-int/2addr v3, v1

    sub-int/2addr v3, v2

    .line 1348
    .end local v1    # "startToRight":I
    .end local v2    # "childWidth":I
    .local v3, "left":I
    goto :goto_6c

    .line 1349
    .end local v3    # "left":I
    :cond_46
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v1

    iget v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v1, v4

    .line 1350
    .local v1, "left":I
    cmpl-float v4, p2, v3

    if-gtz v4, :cond_64

    cmpl-float v3, p2, v3

    if-nez v3, :cond_62

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F
    invoke-static {v3}, Landroid/support/v4/widget/SlidingPaneLayout;->access$300(Landroid/support/v4/widget/SlidingPaneLayout;)F

    move-result v3

    cmpl-float v2, v3, v2

    if-lez v2, :cond_62

    goto :goto_64

    .line 1354
    :cond_62
    move v3, v1

    goto :goto_6c

    .line 1351
    :cond_64
    :goto_64
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I
    invoke-static {v2}, Landroid/support/v4/widget/SlidingPaneLayout;->access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I

    move-result v2

    add-int v3, v1, v2

    .line 1354
    .end local v1    # "left":I
    .restart local v3    # "left":I
    :goto_6c
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->access$200(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/support/v4/widget/ViewDragHelper;->settleCapturedViewAt(II)Z

    .line 1355
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidate()V

    .line 1356
    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "pointerId"    # I

    .line 1303
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;->this$0:Landroid/support/v4/widget/SlidingPaneLayout;

    # getter for: Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z
    invoke-static {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->access$100(Landroid/support/v4/widget/SlidingPaneLayout;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1304
    const/4 v0, 0x0

    return v0

    .line 1307
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-boolean v0, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    return v0
.end method
