.class Landroid/support/v4/view/ViewPager$PagerObserver;
.super Landroid/database/DataSetObserver;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerObserver"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/view/ViewPager;


# direct methods
.method private constructor <init>(Landroid/support/v4/view/ViewPager;)V
    .registers 2

    .line 2904
    iput-object p1, p0, Landroid/support/v4/view/ViewPager$PagerObserver;->this$0:Landroid/support/v4/view/ViewPager;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/view/ViewPager;Landroid/support/v4/view/ViewPager$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/view/ViewPager;
    .param p2, "x1"    # Landroid/support/v4/view/ViewPager$1;

    .line 2904
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager$PagerObserver;-><init>(Landroid/support/v4/view/ViewPager;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .line 2907
    iget-object v0, p0, Landroid/support/v4/view/ViewPager$PagerObserver;->this$0:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->dataSetChanged()V

    .line 2908
    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .line 2911
    iget-object v0, p0, Landroid/support/v4/view/ViewPager$PagerObserver;->this$0:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->dataSetChanged()V

    .line 2912
    return-void
.end method
