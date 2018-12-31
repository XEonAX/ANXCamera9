.class Lcom/android/camera/ui/HorizontalListView$4;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/HorizontalListView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    .line 523
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method private isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z
    .locals 5

    .line 594
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 595
    const/4 v1, 0x2

    new-array v1, v1, [I

    .line 596
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 597
    const/4 v2, 0x0

    aget v2, v1, v2

    .line 598
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v3, v2

    .line 599
    const/4 v4, 0x1

    aget v1, v1, v4

    .line 600
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    add-int/2addr p2, v1

    .line 601
    invoke-virtual {v0, v2, v1, v3, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 602
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v0, p2, p1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 527
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalListView;->onDown(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    .line 532
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/ui/HorizontalListView;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p1

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 9

    .line 578
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    .line 579
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 580
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 581
    invoke-direct {p0, p1, v5}, Lcom/android/camera/ui/HorizontalListView$4;->isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 582
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {p1}, Lcom/android/camera/ui/HorizontalListView;->access$900(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 583
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {p1}, Lcom/android/camera/ui/HorizontalListView;->access$500(Lcom/android/camera/ui/HorizontalListView;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    add-int/2addr p1, v1

    .line 584
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, p1}, Lcom/android/camera/ui/HorizontalListView;->access$600(Lcom/android/camera/ui/HorizontalListView;I)I

    move-result v6

    .line 585
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {p1}, Lcom/android/camera/ui/HorizontalListView;->access$900(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object p1, p1, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 586
    invoke-interface {p1, v6}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v7

    .line 585
    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    .line 587
    goto :goto_1

    .line 579
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 591
    :cond_1
    :goto_1
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 537
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalListView;->isTouchMoveEnable()Z

    move-result p1

    if-nez p1, :cond_0

    .line 538
    const/4 p1, 0x0

    return p1

    .line 541
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    monitor-enter p1

    .line 542
    :try_start_0
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget p4, p2, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    float-to-int p3, p3

    add-int/2addr p4, p3

    iput p4, p2, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 543
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 544
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/ui/HorizontalListView;->access$302(Lcom/android/camera/ui/HorizontalListView;Z)Z

    .line 545
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    .line 547
    return p2

    .line 543
    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 552
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/ui/HorizontalListView;->access$402(Lcom/android/camera/ui/HorizontalListView;Z)Z

    .line 553
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v2}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 554
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 555
    invoke-direct {p0, p1, v2}, Lcom/android/camera/ui/HorizontalListView$4;->isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 556
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {p1}, Lcom/android/camera/ui/HorizontalListView;->access$500(Lcom/android/camera/ui/HorizontalListView;)I

    move-result p1

    add-int/2addr p1, v1

    add-int/2addr p1, v0

    .line 557
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, p1}, Lcom/android/camera/ui/HorizontalListView;->access$600(Lcom/android/camera/ui/HorizontalListView;I)I

    move-result p1

    .line 562
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->access$700(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 563
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->access$700(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v0, v0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 564
    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v7

    .line 563
    move-object v5, v2

    move v6, p1

    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 566
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->access$800(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 567
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->access$800(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$4;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v0, v0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 568
    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v7

    .line 567
    move-object v5, v2

    move v6, p1

    invoke-interface/range {v3 .. v8}, Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;->onSingleTapDown(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    goto :goto_1

    .line 553
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 573
    :cond_2
    :goto_1
    return v1
.end method
