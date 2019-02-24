.class Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggleHoneycomb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SetIndicatorInfo"
.end annotation


# instance fields
.field public setHomeActionContentDescription:Ljava/lang/reflect/Method;

.field public setHomeAsUpIndicator:Ljava/lang/reflect/Method;

.field public upIndicatorView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 9
    .param p1, "activity"    # Landroid/app/Activity;

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_5
    const-class v2, Landroid/app/ActionBar;

    const-string v3, "setHomeAsUpIndicator"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/graphics/drawable/Drawable;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    .line 108
    const-class v2, Landroid/app/ActionBar;

    const-string v3, "setHomeActionContentDescription"

    new-array v4, v1, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;
    :try_end_25
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_25} :catch_26

    .line 112
    return-void

    .line 113
    :catch_26
    move-exception v2

    .line 117
    const v2, 0x102002c

    invoke-virtual {p1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 118
    .local v3, "home":Landroid/view/View;
    if-nez v3, :cond_31

    .line 120
    return-void

    .line 123
    :cond_31
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 124
    .local v4, "parent":Landroid/view/ViewGroup;
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    .line 125
    .local v5, "childCount":I
    const/4 v6, 0x2

    if-eq v5, v6, :cond_3f

    .line 127
    return-void

    .line 130
    :cond_3f
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 131
    .local v0, "first":Landroid/view/View;
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 132
    .local v1, "second":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v6, v2, :cond_4f

    move-object v2, v1

    goto :goto_50

    :cond_4f
    move-object v2, v0

    .line 134
    .local v2, "up":Landroid/view/View;
    :goto_50
    instance-of v6, v2, Landroid/widget/ImageView;

    if-eqz v6, :cond_59

    .line 136
    move-object v6, v2

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    .line 138
    :cond_59
    return-void
.end method
