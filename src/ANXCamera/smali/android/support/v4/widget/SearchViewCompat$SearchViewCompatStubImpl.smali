.class Landroid/support/v4/widget/SearchViewCompat$SearchViewCompatStubImpl;
.super Ljava/lang/Object;
.source "SearchViewCompat.java"

# interfaces
.implements Landroid/support/v4/widget/SearchViewCompat$SearchViewCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/SearchViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SearchViewCompatStubImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getQuery(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;

    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public isIconified(Landroid/view/View;)Z
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;

    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method public isQueryRefinementEnabled(Landroid/view/View;)Z
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;

    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public isSubmitButtonEnabled(Landroid/view/View;)Z
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;

    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public newOnCloseListener(Landroid/support/v4/widget/SearchViewCompat$OnCloseListenerCompat;)Ljava/lang/Object;
    .registers 3
    .param p1, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnCloseListenerCompat;

    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public newOnQueryTextListener(Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListenerCompat;)Ljava/lang/Object;
    .registers 3
    .param p1, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListenerCompat;

    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public newSearchView(Landroid/content/Context;)Landroid/view/View;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public setIconified(Landroid/view/View;Z)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "iconify"    # Z

    .line 105
    return-void
.end method

.method public setImeOptions(Landroid/view/View;I)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "imeOptions"    # I

    .line 66
    return-void
.end method

.method public setInputType(Landroid/view/View;I)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "inputType"    # I

    .line 70
    return-void
.end method

.method public setMaxWidth(Landroid/view/View;I)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "maxpixels"    # I

    .line 132
    return-void
.end method

.method public setOnCloseListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "searchView"    # Ljava/lang/Object;
    .param p2, "listener"    # Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public setOnQueryTextListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "searchView"    # Ljava/lang/Object;
    .param p2, "listener"    # Ljava/lang/Object;

    .line 79
    return-void
.end method

.method public setQuery(Landroid/view/View;Ljava/lang/CharSequence;Z)V
    .registers 4
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "query"    # Ljava/lang/CharSequence;
    .param p3, "submit"    # Z

    .line 97
    return-void
.end method

.method public setQueryHint(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "hint"    # Ljava/lang/CharSequence;

    .line 101
    return-void
.end method

.method public setQueryRefinementEnabled(Landroid/view/View;Z)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "enable"    # Z

    .line 123
    return-void
.end method

.method public setSearchableInfo(Landroid/view/View;Landroid/content/ComponentName;)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "searchableComponent"    # Landroid/content/ComponentName;

    .line 62
    return-void
.end method

.method public setSubmitButtonEnabled(Landroid/view/View;Z)V
    .registers 3
    .param p1, "searchView"    # Landroid/view/View;
    .param p2, "enabled"    # Z

    .line 114
    return-void
.end method
