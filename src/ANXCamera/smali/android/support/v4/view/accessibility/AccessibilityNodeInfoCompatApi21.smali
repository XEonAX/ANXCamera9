.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi21;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompatApi21.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi21$CollectionItemInfo;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method static addAction(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "action"    # Ljava/lang/Object;

    .line 35
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    move-object v1, p1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 36
    return-void
.end method

.method static getAccessibilityActionId(Ljava/lang/Object;)I
    .registers 2
    .param p0, "action"    # Ljava/lang/Object;

    .line 93
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    move-result v0

    return v0
.end method

.method static getAccessibilityActionLabel(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "action"    # Ljava/lang/Object;

    .line 97
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static getActionList(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 30
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    move-result-object v0

    .line 31
    .local v0, "result":Ljava/lang/Object;
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method public static getError(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 55
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getError()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getMaxTextLength(Ljava/lang/Object;)I
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 67
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getMaxTextLength()I

    move-result v0

    return v0
.end method

.method public static getWindow(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 71
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getWindow()Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    return-object v0
.end method

.method static newAccessibilityAction(ILjava/lang/CharSequence;)Ljava/lang/Object;
    .registers 3
    .param p0, "actionId"    # I
    .param p1, "label"    # Ljava/lang/CharSequence;

    .line 89
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-direct {v0, p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    return-object v0
.end method

.method public static obtainCollectionInfo(IIZI)Ljava/lang/Object;
    .registers 5
    .param p0, "rowCount"    # I
    .param p1, "columnCount"    # I
    .param p2, "hierarchical"    # Z
    .param p3, "selectionMode"    # I

    .line 44
    invoke-static {p0, p1, p2, p3}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object v0

    return-object v0
.end method

.method public static obtainCollectionItemInfo(IIIIZZ)Ljava/lang/Object;
    .registers 7
    .param p0, "rowIndex"    # I
    .param p1, "rowSpan"    # I
    .param p2, "columnIndex"    # I
    .param p3, "columnSpan"    # I
    .param p4, "heading"    # Z
    .param p5, "selected"    # Z

    .line 50
    invoke-static/range {p0 .. p5}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    move-result-object v0

    return-object v0
.end method

.method public static removeAction(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "action"    # Ljava/lang/Object;

    .line 39
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    move-object v1, p1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)Z

    move-result v0

    return v0
.end method

.method public static removeChild(Ljava/lang/Object;Landroid/view/View;)Z
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "child"    # Landroid/view/View;

    .line 75
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeChild(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public static removeChild(Ljava/lang/Object;Landroid/view/View;I)Z
    .registers 4
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .line 79
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeChild(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public static setError(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "error"    # Ljava/lang/CharSequence;

    .line 59
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setError(Ljava/lang/CharSequence;)V

    .line 60
    return-void
.end method

.method public static setMaxTextLength(Ljava/lang/Object;I)V
    .registers 3
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "max"    # I

    .line 63
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setMaxTextLength(I)V

    .line 64
    return-void
.end method
