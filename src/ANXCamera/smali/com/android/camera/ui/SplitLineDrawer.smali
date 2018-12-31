.class public Lcom/android/camera/ui/SplitLineDrawer;
.super Landroid/view/View;
.source "SplitLineDrawer.java"


# static fields
.field private static final BORDER:I = 0x1


# instance fields
.field private mBottomVisible:Z

.field private mColumnCount:I

.field private mLineColor:I

.field private mRowCount:I

.field private mTopVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 13
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    .line 14
    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    .line 15
    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    .line 14
    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    .line 15
    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    .line 14
    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    .line 15
    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    .line 23
    return-void
.end method


# virtual methods
.method public initialize(II)V
    .locals 0

    .line 42
    iput p2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    .line 43
    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    .line 44
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 48
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 49
    iget v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 50
    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->getWidth()I

    move-result v0

    const/4 v7, 0x1

    add-int/lit8 v8, v0, -0x1

    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->getHeight()I

    move-result v0

    add-int/lit8 v9, v0, -0x1

    .line 51
    move v10, v7

    :goto_0
    iget v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    if-ge v10, v0, :cond_0

    .line 52
    mul-int v0, v10, v8

    iget v1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    div-int v1, v0, v1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    iget v3, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    div-int/2addr v0, v3

    int-to-float v3, v0

    add-int/lit8 v0, v9, -0x1

    int-to-float v4, v0

    move-object v0, p1

    move-object v5, v6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 51
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 55
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    .line 56
    xor-int/2addr v7, v0

    const/4 v0, 0x0

    move v10, v0

    :goto_1
    iget v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-gt v10, v0, :cond_5

    .line 57
    if-eqz v10, :cond_1

    iget v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-ne v10, v0, :cond_3

    :cond_1
    if-nez v10, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    if-nez v0, :cond_3

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-ne v10, v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    if-eqz v0, :cond_4

    .line 58
    :cond_3
    int-to-float v1, v7

    mul-int v0, v10, v9

    iget v2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    div-int v2, v0, v2

    int-to-float v2, v2

    sub-int v3, v8, v7

    int-to-float v3, v3

    iget v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    div-int/2addr v0, v4

    int-to-float v4, v0

    move-object v0, p1

    move-object v5, v6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 56
    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 61
    :cond_5
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 62
    return-void
.end method

.method public setBorderVisible(ZZ)V
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    if-eq v0, p2, :cond_1

    .line 31
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    .line 32
    iput-boolean p2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    .line 33
    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->invalidate()V

    .line 35
    :cond_1
    return-void
.end method

.method public setLineColor(I)V
    .locals 0

    .line 38
    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    .line 39
    return-void
.end method
