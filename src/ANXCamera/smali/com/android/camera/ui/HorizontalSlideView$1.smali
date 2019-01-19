.class Lcom/android/camera/ui/HorizontalSlideView$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "HorizontalSlideView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/HorizontalSlideView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/HorizontalSlideView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/HorizontalSlideView;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 42
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object p1, p1, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 43
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/android/camera/ui/HorizontalSlideView;->access$002(Lcom/android/camera/ui/HorizontalSlideView;Z)Z

    .line 44
    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 68
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    float-to-int p2, p3

    neg-int p2, p2

    invoke-static {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->access$600(Lcom/android/camera/ui/HorizontalSlideView;I)V

    .line 69
    const/4 p1, 0x1

    return p1
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    .line 55
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->access$202(Lcom/android/camera/ui/HorizontalSlideView;Z)Z

    .line 56
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget p1, p1, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-static {p4}, Lcom/android/camera/ui/HorizontalSlideView;->access$300(Lcom/android/camera/ui/HorizontalSlideView;)I

    move-result p4

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-ne p1, p4, :cond_0

    cmpg-float p1, p3, v1

    if-gez p1, :cond_0

    .line 57
    return v0

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget p1, p1, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-static {p4}, Lcom/android/camera/ui/HorizontalSlideView;->access$400(Lcom/android/camera/ui/HorizontalSlideView;)I

    move-result p4

    if-ne p1, p4, :cond_1

    cmpl-float p1, p3, v1

    if-lez p1, :cond_1

    .line 59
    return v0

    .line 61
    :cond_1
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget p4, p4, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    int-to-float p4, p4

    add-float/2addr p4, p3

    float-to-int p3, p4

    invoke-static {p1, p3}, Lcom/android/camera/ui/HorizontalSlideView;->access$500(Lcom/android/camera/ui/HorizontalSlideView;I)V

    .line 62
    return p2
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView$1;->this$0:Lcom/android/camera/ui/HorizontalSlideView;

    iget v1, v1, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    sub-float/2addr p1, v1

    float-to-int p1, p1

    invoke-static {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->access$100(Lcom/android/camera/ui/HorizontalSlideView;I)V

    .line 50
    const/4 p1, 0x1

    return p1
.end method
