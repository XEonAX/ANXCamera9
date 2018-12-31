.class public Lcom/android/camera/ui/V6RelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "V6RelativeLayout.java"

# interfaces
.implements Lcom/android/camera/ui/Rotatable;
.implements Lcom/android/camera/ui/V6Animation;
.implements Lcom/android/camera/ui/V6FunctionUI;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    return-void
.end method


# virtual methods
.method public animateIn(Ljava/lang/Runnable;)V
    .locals 0

    .line 101
    return-void
.end method

.method public animateIn(Ljava/lang/Runnable;I)V
    .locals 0

    .line 90
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->animateIn(Ljava/lang/Runnable;)V

    .line 91
    return-void
.end method

.method public animateIn(Ljava/lang/Runnable;IZ)V
    .locals 0

    .line 112
    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;)V
    .locals 0

    .line 106
    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;I)V
    .locals 0

    .line 95
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->animateOut(Ljava/lang/Runnable;)V

    .line 96
    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;IZ)V
    .locals 0

    .line 118
    return-void
.end method

.method public enableControls(Z)V
    .locals 4

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 69
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 70
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 71
    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    .line 72
    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2, p1}, Lcom/android/camera/ui/V6FunctionUI;->enableControls(Z)V

    .line 69
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 75
    :cond_1
    return-void
.end method

.method public findChildrenById(I)Landroid/view/View;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onCameraOpen()V
    .locals 4

    .line 57
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 58
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 59
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 60
    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    .line 61
    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onCameraOpen()V

    .line 58
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    :cond_1
    return-void
.end method

.method public onCreate()V
    .locals 4

    .line 24
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 25
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 26
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 27
    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    .line 28
    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onCreate()V

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 4

    .line 46
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 47
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 48
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 49
    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    .line 50
    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onPause()V

    .line 47
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 36
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 37
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 38
    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    .line 39
    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onResume()V

    .line 36
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 4

    .line 79
    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    .line 80
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 81
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 82
    instance-of v3, v2, Lcom/android/camera/ui/Rotatable;

    if-eqz v3, :cond_0

    .line 83
    check-cast v2, Lcom/android/camera/ui/Rotatable;

    invoke-interface {v2, p1, p2}, Lcom/android/camera/ui/Rotatable;->setOrientation(IZ)V

    .line 80
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 86
    :cond_1
    return-void
.end method
