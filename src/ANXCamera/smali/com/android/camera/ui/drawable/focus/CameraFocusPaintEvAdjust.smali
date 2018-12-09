.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintEvAdjust.java"


# static fields
.field private static final MARGIN:I

.field private static final TRIANGLE_BASE_DIS:I

.field private static final TRIANGLE_BASE_HEIGHT:I

.field private static final TRIANGLE_BASE_LEN:I

.field private static final TRIANGLE_MIN_MARGIN:I


# instance fields
.field private mCurrentDistanceY:F

.field private mCurrentOffsetY:F

.field private mDisplayRect:Landroid/graphics/Rect;

.field private mEvValue:F

.field private mLineHeight:I

.field private mLineMargin:I

.field private mLinePaint:Landroid/graphics/Paint;

.field private mLineWidth:I

.field private mRotation:I

.field private mRtl:Z

.field private mShowLine:Z

.field private mStartOffsetY:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const/high16 v0, 0x41c80000    # 25.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_MIN_MARGIN:I

    .line 23
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    .line 24
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_DIS:I

    .line 26
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 28
    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mEvValue:F

    .line 37
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mShowLine:Z

    .line 39
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRtl:Z

    .line 53
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineWidth:I

    .line 54
    sget p1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineHeight:I

    .line 55
    const/high16 p1, 0x40000000    # 2.0f

    invoke-static {p1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineMargin:I

    .line 56
    return-void
.end method

.method private isNearlyOutOfEdge()Z
    .locals 6

    .line 163
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    .line 164
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    .line 166
    iget v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRotation:I

    const/16 v3, 0x5a

    div-int/2addr v2, v3

    rem-int/lit8 v2, v2, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v2, :cond_3

    .line 167
    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRtl:Z

    if-eqz v1, :cond_1

    .line 168
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleX:F

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_MIN_MARGIN:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    return v4

    .line 170
    :cond_1
    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleX:F

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_MIN_MARGIN:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    goto :goto_1

    :cond_2
    move v4, v5

    :goto_1
    return v4

    .line 172
    :cond_3
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRotation:I

    if-ne v0, v3, :cond_5

    .line 173
    int-to-float v0, v1

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_MIN_MARGIN:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_4

    goto :goto_2

    :cond_4
    move v4, v5

    :goto_2
    return v4

    .line 174
    :cond_5
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_7

    .line 175
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_MIN_MARGIN:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_6

    goto :goto_3

    :cond_6
    move v4, v5

    :goto_3
    return v4

    .line 178
    :cond_7
    return v5
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 100
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 101
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->isNearlyOutOfEdge()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleX:F

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    goto :goto_0

    .line 104
    :cond_0
    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleX:F

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->MARGIN:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    .line 108
    :goto_0
    iget v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    iget v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentOffsetY:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentDistanceY:F

    add-float/2addr v2, v3

    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_DIS:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 112
    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    int-to-float v3, v3

    add-float/2addr v3, v1

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 114
    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v3, v1

    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v4, v4

    sub-float v4, v2, v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 116
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 121
    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v3, v1

    .line 122
    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float v10, v1, v4

    .line 123
    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    iget v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineHeight:I

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    sub-float v6, v4, v5

    .line 125
    iget-boolean v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mShowLine:Z

    const/16 v11, 0xcc

    if-eqz v4, :cond_1

    .line 126
    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v4, v4

    sub-float v4, v2, v4

    sub-float/2addr v4, v6

    iget v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineMargin:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    .line 127
    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v4, v4

    sub-float/2addr v2, v4

    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineMargin:I

    int-to-float v4, v4

    sub-float v8, v2, v4

    .line 128
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentColor:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 130
    iget-object v9, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v5, v3

    move v7, v10

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 136
    :cond_1
    iget v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentOffsetY:F

    add-float/2addr v2, v4

    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentDistanceY:F

    add-float/2addr v2, v4

    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_DIS:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v2, v4

    .line 138
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 140
    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    int-to-float v4, v4

    add-float/2addr v4, v1

    invoke-virtual {v0, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 142
    sget v4, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_LEN:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v4, v1

    sget v5, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v5, v5

    add-float/2addr v5, v2

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 144
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 146
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 150
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mShowLine:Z

    if-eqz v0, :cond_2

    .line 151
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mMiddleY:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineHeight:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float v8, v0, v1

    .line 152
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineMargin:I

    int-to-float v0, v0

    sub-float v0, v8, v0

    sget v1, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v1, v1

    add-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    .line 153
    sget v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->TRIANGLE_BASE_HEIGHT:I

    int-to-float v0, v0

    add-float/2addr v2, v0

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineMargin:I

    int-to-float v0, v0

    add-float v6, v2, v0

    .line 154
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 156
    iget-object v9, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v5, v3

    move v7, v10

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 160
    :cond_2
    return-void
.end method

.method public getEvValue()F
    .locals 1

    .line 47
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mEvValue:F

    return v0
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 2

    .line 60
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 63
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    .line 64
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLineWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 67
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mLinePaint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    const/16 v1, 0x66

    invoke-static {v1, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    return-void
.end method

.method public setDistanceY(F)V
    .locals 0

    .line 90
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentDistanceY:F

    .line 91
    return-void
.end method

.method public setEvValue(F)V
    .locals 0

    .line 43
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mEvValue:F

    .line 44
    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    .line 82
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRotation:I

    .line 83
    return-void
.end method

.method public setRtlAndDisplayRect(ZLandroid/graphics/Rect;)V
    .locals 0

    .line 77
    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mRtl:Z

    .line 78
    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mDisplayRect:Landroid/graphics/Rect;

    .line 79
    return-void
.end method

.method public setShowLine(Z)V
    .locals 0

    .line 94
    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mShowLine:Z

    .line 95
    return-void
.end method

.method public setStartOffsetY(F)V
    .locals 0

    .line 86
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mStartOffsetY:F

    .line 87
    return-void
.end method

.method public updateValue(F)V
    .locals 2

    .line 72
    invoke-super {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->updateValue(F)V

    .line 73
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mStartOffsetY:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mStartOffsetY:F

    mul-float/2addr v1, p1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->mCurrentOffsetY:F

    .line 74
    return-void
.end method
