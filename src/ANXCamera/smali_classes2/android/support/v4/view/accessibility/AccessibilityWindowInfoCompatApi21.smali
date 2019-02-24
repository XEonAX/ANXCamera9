.class Landroid/support/v4/view/accessibility/AccessibilityWindowInfoCompatApi21;
.super Ljava/lang/Object;
.source "AccessibilityWindowInfoCompatApi21.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoundsInScreen(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "outBounds"    # Landroid/graphics/Rect;

    .line 57
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 58
    return-void
.end method

.method public static getChild(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "index"    # I

    .line 77
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getChild(I)Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getChildCount(Ljava/lang/Object;)I
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 73
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getChildCount()I

    move-result v0

    return v0
.end method

.method public static getId(Ljava/lang/Object;)I
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 53
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getId()I

    move-result v0

    return v0
.end method

.method public static getLayer(Ljava/lang/Object;)I
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 41
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getLayer()I

    move-result v0

    return v0
.end method

.method public static getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 49
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getParent()Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getRoot(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 45
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getType(Ljava/lang/Object;)I
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 37
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    move-result v0

    return v0
.end method

.method public static isAccessibilityFocused(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 69
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->isAccessibilityFocused()Z

    move-result v0

    return v0
.end method

.method public static isActive(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 61
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->isActive()Z

    move-result v0

    return v0
.end method

.method public static isFocused(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 65
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->isFocused()Z

    move-result v0

    return v0
.end method

.method public static obtain()Ljava/lang/Object;
    .registers 1

    .line 28
    invoke-static {}, Landroid/view/accessibility/AccessibilityWindowInfo;->obtain()Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    return-object v0
.end method

.method public static obtain(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 32
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-static {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->obtain(Landroid/view/accessibility/AccessibilityWindowInfo;)Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    return-object v0
.end method

.method public static recycle(Ljava/lang/Object;)V
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 81
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->recycle()V

    .line 82
    return-void
.end method
