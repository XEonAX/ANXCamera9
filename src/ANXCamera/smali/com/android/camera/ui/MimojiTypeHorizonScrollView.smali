.class public Lcom/android/camera/ui/MimojiTypeHorizonScrollView;
.super Landroid/widget/HorizontalScrollView;
.source "MimojiTypeHorizonScrollView.java"


# instance fields
.field private mIsRTL:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->initView()V

    return-void
.end method


# virtual methods
.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->getWidth()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->getHeight()I

    move-result v10

    nop

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v4, v1

    int-to-float v11, v10

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x1f

    move-object v1, v8

    move v5, v11

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    move-result v7

    invoke-super/range {p0 .. p4}, Landroid/widget/HorizontalScrollView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v12

    iget-boolean v1, v0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mIsRTL:Z

    const/4 v13, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v2, v9

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    goto :goto_0

    :cond_0
    move v1, v13

    :goto_0
    invoke-virtual {v8, v1, v13}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v1, v9

    const/high16 v2, 0x40000000    # 2.0f

    div-float v14, v1, v2

    div-float/2addr v11, v2

    sub-int/2addr v10, v9

    int-to-float v3, v10

    div-float v9, v3, v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v10

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-virtual {v8, v2, v14, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    invoke-virtual {v8, v13, v9}, Landroid/graphics/Canvas;->translate(FF)V

    sub-float v15, v13, v9

    const/4 v3, 0x0

    add-float v16, v1, v9

    iget v1, v0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mWidth:I

    int-to-float v5, v1

    iget-object v6, v0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    move-object v1, v8

    move v2, v15

    move/from16 v4, v16

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v8, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v6

    const/high16 v1, -0x3d4c0000    # -90.0f

    invoke-virtual {v8, v1, v14, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    invoke-virtual {v8, v13, v9}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v2, 0x0

    iget v1, v0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mWidth:I

    int-to-float v4, v1

    iget-object v5, v0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    move-object v0, v8

    move v1, v15

    move/from16 v3, v16

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v8, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    invoke-virtual {v8, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return v12
.end method

.method public initView()V
    .locals 10

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mIsRTL:Z

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0088

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mWidth:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object v0, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mPaint:Landroid/graphics/Paint;

    new-instance v9, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->mWidth:I

    int-to-float v5, v1

    const/4 v1, 0x3

    new-array v6, v1, [I

    fill-array-data v6, :array_0

    new-array v7, v1, [F

    fill-array-data v7, :array_1

    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, v9

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/MimojiTypeHorizonScrollView;->setFocusable(Z)V

    return-void

    :array_0
    .array-data 4
        -0x1000000
        -0x38000000    # -131072.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3e4ccccd    # 0.2f
        0x3f800000    # 1.0f
    .end array-data
.end method
