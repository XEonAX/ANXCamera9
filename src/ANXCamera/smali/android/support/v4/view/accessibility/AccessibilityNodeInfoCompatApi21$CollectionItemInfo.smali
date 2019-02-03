.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi21$CollectionItemInfo;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompatApi21.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CollectionItemInfo"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isSelected(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .line 84
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->isSelected()Z

    move-result v0

    return v0
.end method
