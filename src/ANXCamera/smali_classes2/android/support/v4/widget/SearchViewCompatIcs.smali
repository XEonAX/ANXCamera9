.class Landroid/support/v4/widget/SearchViewCompatIcs;
.super Ljava/lang/Object;
.source "SearchViewCompatIcs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static newSearchView(Landroid/content/Context;)Landroid/view/View;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .line 43
    new-instance v0, Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static setImeOptions(Landroid/view/View;I)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "imeOptions"    # I

    .line 47
    move-object v0, p0

    check-cast v0, Landroid/widget/SearchView;

    invoke-virtual {v0, p1}, Landroid/widget/SearchView;->setImeOptions(I)V

    .line 48
    return-void
.end method

.method public static setInputType(Landroid/view/View;I)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "inputType"    # I

    .line 51
    move-object v0, p0

    check-cast v0, Landroid/widget/SearchView;

    invoke-virtual {v0, p1}, Landroid/widget/SearchView;->setInputType(I)V

    .line 52
    return-void
.end method
