.class Landroid/support/v4/view/MenuItemCompat$IcsMenuVersionImpl;
.super Landroid/support/v4/view/MenuItemCompat$HoneycombMenuVersionImpl;
.source "MenuItemCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/MenuItemCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IcsMenuVersionImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 200
    invoke-direct {p0}, Landroid/support/v4/view/MenuItemCompat$HoneycombMenuVersionImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public collapseActionView(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 208
    invoke-static {p1}, Landroid/support/v4/view/MenuItemCompatIcs;->collapseActionView(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public expandActionView(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 203
    invoke-static {p1}, Landroid/support/v4/view/MenuItemCompatIcs;->expandActionView(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public isActionViewExpanded(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 213
    invoke-static {p1}, Landroid/support/v4/view/MenuItemCompatIcs;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;
    .param p2, "listener"    # Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    .line 219
    if-nez p2, :cond_8

    .line 220
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/MenuItemCompatIcs;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompatIcs$SupportActionExpandProxy;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0

    .line 227
    :cond_8
    new-instance v0, Landroid/support/v4/view/MenuItemCompat$IcsMenuVersionImpl$1;

    invoke-direct {v0, p0, p2}, Landroid/support/v4/view/MenuItemCompat$IcsMenuVersionImpl$1;-><init>(Landroid/support/v4/view/MenuItemCompat$IcsMenuVersionImpl;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)V

    invoke-static {p1, v0}, Landroid/support/v4/view/MenuItemCompatIcs;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompatIcs$SupportActionExpandProxy;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method
