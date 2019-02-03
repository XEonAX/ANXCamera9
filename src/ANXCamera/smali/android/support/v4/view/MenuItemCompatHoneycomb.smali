.class Landroid/support/v4/view/MenuItemCompatHoneycomb;
.super Ljava/lang/Object;
.source "MenuItemCompatHoneycomb.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActionView(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 2
    .param p0, "item"    # Landroid/view/MenuItem;

    .line 39
    invoke-interface {p0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static setActionView(Landroid/view/MenuItem;I)Landroid/view/MenuItem;
    .registers 3
    .param p0, "item"    # Landroid/view/MenuItem;
    .param p1, "resId"    # I

    .line 35
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public static setActionView(Landroid/view/MenuItem;Landroid/view/View;)Landroid/view/MenuItem;
    .registers 3
    .param p0, "item"    # Landroid/view/MenuItem;
    .param p1, "view"    # Landroid/view/View;

    .line 31
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public static setShowAsAction(Landroid/view/MenuItem;I)V
    .registers 2
    .param p0, "item"    # Landroid/view/MenuItem;
    .param p1, "actionEnum"    # I

    .line 27
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 28
    return-void
.end method
