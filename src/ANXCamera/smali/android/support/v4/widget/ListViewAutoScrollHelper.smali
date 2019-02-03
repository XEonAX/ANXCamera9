.class public Landroid/support/v4/widget/ListViewAutoScrollHelper;
.super Landroid/support/v4/widget/AutoScrollHelper;
.source "ListViewAutoScrollHelper.java"


# instance fields
.field private final mTarget:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;)V
    .registers 2
    .param p1, "target"    # Landroid/widget/ListView;

    .line 30
    invoke-direct {p0, p1}, Landroid/support/v4/widget/AutoScrollHelper;-><init>(Landroid/view/View;)V

    .line 32
    iput-object p1, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    .line 33
    return-void
.end method


# virtual methods
.method public canTargetScrollHorizontally(I)Z
    .registers 3
    .param p1, "direction"    # I

    .line 55
    const/4 v0, 0x0

    return v0
.end method

.method public canTargetScrollVertically(I)Z
    .registers 11
    .param p1, "direction"    # I

    .line 60
    iget-object v0, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    .line 61
    .local v0, "target":Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->getCount()I

    move-result v1

    .line 62
    .local v1, "itemCount":I
    const/4 v2, 0x0

    if-nez v1, :cond_a

    .line 63
    return v2

    .line 66
    :cond_a
    invoke-virtual {v0}, Landroid/widget/ListView;->getChildCount()I

    move-result v3

    .line 67
    .local v3, "childCount":I
    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v4

    .line 68
    .local v4, "firstPosition":I
    add-int v5, v4, v3

    .line 70
    .local v5, "lastPosition":I
    if-lez p1, :cond_2a

    .line 72
    if-lt v5, v1, :cond_3a

    .line 73
    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v0, v6}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 74
    .local v6, "lastView":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v7

    invoke-virtual {v0}, Landroid/widget/ListView;->getHeight()I

    move-result v8

    if-gt v7, v8, :cond_29

    .line 75
    return v2

    .line 77
    .end local v6    # "lastView":Landroid/view/View;
    :cond_29
    goto :goto_3a

    .line 78
    :cond_2a
    if-gez p1, :cond_3c

    .line 80
    if-gtz v4, :cond_3a

    .line 81
    invoke-virtual {v0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 82
    .local v6, "firstView":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v7

    if-ltz v7, :cond_39

    .line 83
    return v2

    .line 85
    .end local v6    # "firstView":Landroid/view/View;
    :cond_39
    nop

    .line 92
    :cond_3a
    :goto_3a
    const/4 v2, 0x1

    return v2

    .line 89
    :cond_3c
    return v2
.end method

.method public scrollTargetBy(II)V
    .registers 7
    .param p1, "deltaX"    # I
    .param p2, "deltaY"    # I

    .line 37
    iget-object v0, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    .line 38
    .local v0, "target":Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 39
    .local v1, "firstPosition":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_a

    .line 40
    return-void

    .line 43
    :cond_a
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 44
    .local v2, "firstView":Landroid/view/View;
    if-nez v2, :cond_12

    .line 45
    return-void

    .line 48
    :cond_12
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int/2addr v3, p2

    .line 49
    .local v3, "newTop":I
    invoke-virtual {v0, v1, v3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 50
    return-void
.end method
