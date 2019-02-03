.class Landroid/support/v4/view/ViewCompatJB;
.super Ljava/lang/Object;
.source "ViewCompatJB.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAccessibilityNodeProvider(Landroid/view/View;)Ljava/lang/Object;
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v0

    return-object v0
.end method

.method public static getFitsSystemWindows(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v0

    return v0
.end method

.method public static getImportantForAccessibility(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v0

    return v0
.end method

.method public static getMinimumHeight(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public static getMinimumWidth(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public static getParentForAccessibility(Landroid/view/View;)Landroid/view/ViewParent;
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object v0

    return-object v0
.end method

.method public static hasOverlappingRendering(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 90
    invoke-virtual {p0}, Landroid/view/View;->hasOverlappingRendering()Z

    move-result v0

    return v0
.end method

.method public static hasTransientState(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->hasTransientState()Z

    move-result v0

    return v0
.end method

.method public static performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "action"    # I
    .param p2, "arguments"    # Landroid/os/Bundle;

    .line 62
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method public static postInvalidateOnAnimation(Landroid/view/View;)V
    .registers 1
    .param p0, "view"    # Landroid/view/View;

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 38
    return-void
.end method

.method public static postInvalidateOnAnimation(Landroid/view/View;IIII)V
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 42
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->postInvalidate(IIII)V

    .line 43
    return-void
.end method

.method public static postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "action"    # Ljava/lang/Runnable;

    .line 46
    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 47
    return-void
.end method

.method public static postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "action"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # J

    .line 50
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 51
    return-void
.end method

.method public static requestApplyInsets(Landroid/view/View;)V
    .registers 1
    .param p0, "view"    # Landroid/view/View;

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->requestFitSystemWindows()V

    .line 83
    return-void
.end method

.method public static setHasTransientState(Landroid/view/View;Z)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "hasTransientState"    # Z

    .line 33
    invoke-virtual {p0, p1}, Landroid/view/View;->setHasTransientState(Z)V

    .line 34
    return-void
.end method

.method public static setImportantForAccessibility(Landroid/view/View;I)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "mode"    # I

    .line 58
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 59
    return-void
.end method
