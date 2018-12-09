.class public Lcom/android/camera/ui/EdgeHorizonScrollView;
.super Landroid/widget/HorizontalScrollView;
.source "EdgeHorizonScrollView.java"


# instance fields
.field private mDownX:F

.field private mEdgePaint:Landroid/graphics/Paint;

.field private mEdgeWidth:I

.field private mIsRTL:Z

.field private mScrolled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 34
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    .line 35
    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 39
    invoke-virtual {p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->initView()V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    .line 35
    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 44
    invoke-virtual {p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->initView()V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    .line 35
    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 49
    invoke-virtual {p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->initView()V

    .line 50
    return-void
.end method


# virtual methods
.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    .line 70
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->getWidth()I

    move-result v9

    .line 71
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->getHeight()I

    move-result v10

    .line 73
    nop

    .line 74
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

    .line 75
    invoke-super/range {p0 .. p4}, Landroid/widget/HorizontalScrollView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v12

    .line 76
    iget-boolean v1, v0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mIsRTL:Z

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

    .line 78
    int-to-float v1, v9

    const/high16 v2, 0x40000000    # 2.0f

    div-float v14, v1, v2

    .line 79
    div-float/2addr v11, v2

    .line 80
    sub-int/2addr v10, v9

    int-to-float v3, v10

    div-float v9, v3, v2

    .line 83
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v10

    .line 85
    const/high16 v2, 0x42b40000    # 90.0f

    invoke-virtual {v8, v2, v14, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 86
    invoke-virtual {v8, v13, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 87
    sub-float v15, v13, v9

    const/4 v3, 0x0

    add-float v16, v1, v9

    iget v1, v0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgeWidth:I

    int-to-float v5, v1

    iget-object v6, v0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    move-object v1, v8

    move v2, v15

    move/from16 v4, v16

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 88
    invoke-virtual {v8, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 91
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v6

    .line 93
    const/high16 v1, -0x3d4c0000    # -90.0f

    invoke-virtual {v8, v1, v14, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 94
    invoke-virtual {v8, v13, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 95
    const/4 v2, 0x0

    iget v1, v0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgeWidth:I

    int-to-float v4, v1

    iget-object v5, v0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    move-object v0, v8

    move v1, v15

    move/from16 v3, v16

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 96
    invoke-virtual {v8, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 98
    invoke-virtual {v8, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 100
    return v12
.end method

.method public initView()V
    .locals 10

    .line 53
    invoke-virtual {p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mIsRTL:Z

    .line 56
    invoke-virtual {p0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090088

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgeWidth:I

    .line 58
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    .line 59
    iget-object v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 60
    iget-object v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    iget-object v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 62
    iget-object v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgePaint:Landroid/graphics/Paint;

    new-instance v9, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mEdgeWidth:I

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

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setFocusable(Z)V

    .line 66
    return-void

    :array_0
    .array-data 4
        -0x1000000
        -0x1000000
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3e4ccccd    # 0.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 105
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 112
    :pswitch_0
    iget v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 113
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 115
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v0, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    sub-float/2addr p1, v0

    .line 117
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb3

    .line 118
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;

    .line 119
    iget-boolean v1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    if-nez v1, :cond_2

    .line 120
    const/high16 v1, 0x41880000    # 17.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_1

    .line 121
    const/4 p1, 0x3

    invoke-interface {v0, p1, v3}, Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;->selectMode(II)V

    .line 122
    iput-boolean v2, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    goto :goto_0

    .line 123
    :cond_1
    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    cmpg-float p1, p1, v1

    if-gez p1, :cond_2

    .line 124
    const/4 p1, 0x5

    invoke-interface {v0, p1, v3}, Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;->selectMode(II)V

    .line 125
    iput-boolean v2, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    .line 128
    :cond_2
    :goto_0
    return v2

    .line 131
    :pswitch_1
    iput v1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 132
    iput-boolean v3, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    goto :goto_1

    .line 107
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mDownX:F

    .line 108
    iput-boolean v3, p0, Lcom/android/camera/ui/EdgeHorizonScrollView;->mScrolled:Z

    .line 109
    return v2

    .line 135
    :goto_1
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
