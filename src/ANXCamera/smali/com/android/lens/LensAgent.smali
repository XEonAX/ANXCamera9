.class public Lcom/android/lens/LensAgent;
.super Ljava/lang/Object;
.source "LensAgent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/lens/LensAgent$SingletonHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LensAgent"


# instance fields
.field private mChipsLocation:F

.field private volatile mIsResumed:Z

.field private mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/lens/LensAgent$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/lens/LensAgent;-><init>()V

    return-void
.end method

.method private applyCustomStyle(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 12

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object v3

    const v4, 0x7f0a0150

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, v4

    sget v4, Lcom/android/camera/Util;->sPixelDensity:F

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/lens/LensAgent;->mChipsLocation:F

    new-instance v3, Landroid/graphics/PointF;

    iget v4, p0, Lcom/android/lens/LensAgent;->mChipsLocation:F

    const/4 v5, 0x0

    invoke-direct {v3, v5, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setChipLocation(Landroid/graphics/PointF;)V

    const v3, 0x7f020027

    invoke-virtual {v0, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setChipDrawable(I)V

    sget v3, Lcom/android/camera/Util;->sNavigationBarHeight:I

    int-to-float v3, v3

    sget v4, Lcom/android/camera/Util;->sPixelDensity:F

    div-float/2addr v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0, v4, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setOobeLocation(IF)V

    const v3, 0x7f0d0008

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const/4 v5, -0x1

    const/16 v6, 0x11

    const/4 v7, -0x2

    if-eqz v3, :cond_0

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v6, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v7, v8, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v7, v8, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const v9, 0x7f0a0152

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    invoke-virtual {v8, v2, v2, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const v8, 0x7f0a0151

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v8

    invoke-virtual {v3, v2, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_0
    const v3, 0x7f0d0009

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_1

    const v8, 0x7f02002a

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    const v5, 0x7f0a0157

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/widget/ImageView;->setPadding(IIII)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const v8, 0x7f0a0158

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    const v9, 0x7f0a0159

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    invoke-virtual {v5, v8, v2, v9, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    const v3, 0x7f0d000a

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_2

    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    :cond_2
    const v3, 0x7f0d000b

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    const/16 v5, 0x10

    const/16 v8, 0x8

    if-eqz v3, :cond_3

    invoke-virtual {v3, v8}, Landroid/widget/FrameLayout;->setVisibility(I)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v5, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v10, 0x7f0a015a

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v11

    iput v11, v9, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    iput v10, v9, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const v10, 0x7f0a015b

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    invoke-virtual {v9, v10, v2, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v9}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    const v3, 0x7f0d0007

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_4

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    invoke-direct {v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const v7, 0x7f0a0155

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    const v9, 0x7f0a0156

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-virtual {v3, v7, v2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    const p2, 0x7f02002c

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v2, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    nop

    const p2, 0x7f02002d

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x2

    const v2, 0x7f020028

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x3

    const v2, 0x7f02002f

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x4

    const v2, 0x7f02002b

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x5

    const v2, 0x7f020030

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x6

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x7

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    nop

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x9

    const v3, 0x7f020031

    invoke-virtual {p1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xa

    invoke-virtual {p1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xb

    invoke-virtual {p1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xc

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xd

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 p2, 0xe

    const v1, 0x7f020029

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 p2, 0xf

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    nop

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v5, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    nop

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v6, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 p2, 0x12

    const v1, 0x7f02002e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static getInstance()Lcom/android/lens/LensAgent;
    .locals 1

    invoke-static {}, Lcom/android/lens/LensAgent$SingletonHandler;->access$100()Lcom/android/lens/LensAgent;

    move-result-object v0

    return-object v0
.end method

.method public static isConflictAiScene(I)Z
    .locals 1

    const/4 v0, -0x1

    if-eq p0, v0, :cond_1

    const/16 v0, 0x13

    if-eq p0, v0, :cond_1

    const/16 v0, 0x19

    if-eq p0, v0, :cond_1

    const/16 v0, 0x1f

    if-eq p0, v0, :cond_0

    const/16 v0, 0x22

    if-eq p0, v0, :cond_1

    const/16 v0, 0x25

    if-eq p0, v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fQ()Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public init(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 5

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->create(Landroid/content/Context;Landroid/app/Activity;)Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    move-result-object v0

    iput-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    new-instance v3, Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;

    invoke-direct {v3, p2, p3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;-><init>(Landroid/view/View;Landroid/view/ViewGroup;)V

    const/4 p2, 0x3

    invoke-virtual {v2, v3, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onStart(Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;I)V

    const-string p2, "LensAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LensliteApi init cost "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p3}, Lcom/android/lens/LensAgent;->applyCustomStyle(Landroid/content/Context;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public isResumed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    return v0
.end method

.method public onFocusChange(ZFF)V
    .locals 3

    const-string v0, "LensAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFocusChange: LensliteApi down = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->onFocusChange(ILandroid/graphics/PointF;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "LensAgent"

    const-string p3, "onFocusChange: "

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method public onNewImage(Landroid/media/Image;I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onNewImage(Landroid/media/Image;I)V

    goto :goto_0

    :cond_0
    const-string p1, "LensAgent"

    const-string p2, "onNewImage: lens api not resume..."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onPause()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    :cond_0
    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi onPause cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResume()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onResume()V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    :cond_0
    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi onResume cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public release()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onStop()V

    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi release cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setLensliteLayoutVisibility(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setLensliteLayoutVisibility(Z)V

    return-void
.end method

.method public showOrHideChip(Z)V
    .locals 3

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    new-instance v1, Landroid/graphics/PointF;

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/lens/LensAgent;->mChipsLocation:F

    goto :goto_0

    :cond_0
    const/high16 p1, -0x3d380000    # -100.0f

    :goto_0
    const/4 v2, 0x0

    invoke-direct {v1, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setChipLocation(Landroid/graphics/PointF;)V

    return-void
.end method
