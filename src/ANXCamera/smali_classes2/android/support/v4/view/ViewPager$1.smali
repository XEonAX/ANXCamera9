.class final Landroid/support/v4/view/ViewPager$1;
.super Ljava/lang/Object;
.source "ViewPager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/support/v4/view/ViewPager$ItemInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/support/v4/view/ViewPager$ItemInfo;Landroid/support/v4/view/ViewPager$ItemInfo;)I
    .registers 5
    .param p1, "lhs"    # Landroid/support/v4/view/ViewPager$ItemInfo;
    .param p2, "rhs"    # Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 126
    iget v0, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v1, p2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 123
    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    move-object v1, p2

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPager$1;->compare(Landroid/support/v4/view/ViewPager$ItemInfo;Landroid/support/v4/view/ViewPager$ItemInfo;)I

    move-result v0

    return v0
.end method
