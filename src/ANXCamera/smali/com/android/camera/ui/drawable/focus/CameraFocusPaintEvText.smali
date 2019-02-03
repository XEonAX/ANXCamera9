.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintEvText.java"


# instance fields
.field private final mDefaultPaintAlpha:I

.field private final mDefaultPaintColor:I

.field private final mDefaultTextSize:I

.field private mEvTextMargin:I

.field private mEvValue:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 29
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 26
    const/16 v0, 0xc0

    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintAlpha:I

    .line 30
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const v1, 0x7f0c0008

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 33
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintColor:I

    .line 34
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultTextSize:I

    .line 35
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a003f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvTextMargin:I

    .line 37
    return-void

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 59
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 60
    return-void

    .line 63
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    const-string v0, "-"

    goto :goto_0

    :cond_1
    const-string v0, "+"

    .line 64
    :goto_0
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%s %.1f"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 66
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    .line 68
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v2

    .line 69
    iget v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mMiddleX:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v2, v4

    sub-float/2addr v3, v2

    div-float/2addr v0, v4

    sub-float/2addr v3, v0

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mMiddleY:F

    sget v2, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    iget v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvTextMargin:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3, v0, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 71
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 45
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 47
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultTextSize:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 48
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 49
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    const/16 v0, 0xc0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 51
    return-void
.end method

.method public resetPaint()V
    .locals 1

    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->initPaint(Landroid/content/Context;)V

    .line 55
    return-void
.end method

.method public setEvValue(F)V
    .locals 0

    .line 40
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    .line 41
    return-void
.end method
