.class public Lcom/android/camera/ui/SeekBarCompat;
.super Landroid/widget/SeekBar;
.source "SeekBarCompat.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;,
        Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;,
        Lcom/android/camera/ui/SeekBarCompat$SeekBarMode;
    }
.end annotation


# static fields
.field public static final CENTER_SEEKBAR:I = 0x2

.field public static final NORMAL_SEEKBAR:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCenterMode:Z

.field private mCenterPointPain:Landroid/graphics/Paint;

.field private mCenterProgressBgDrawable:Landroid/graphics/drawable/Drawable;

.field private mCenterProgressColor:I

.field private mCenterProgressPaint:Landroid/graphics/Paint;

.field private mCenterProgressRectF:Landroid/graphics/RectF;

.field private mCenterProgressStrokeWidth:I

.field private mOnSeekBarCompatTouchListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;

.field private mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

.field private mX:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/SeekBarCompat;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/SeekBarCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressStrokeWidth:I

    .line 33
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressColor:I

    .line 53
    invoke-virtual {p0, p0}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 54
    invoke-virtual {p0, p0}, Lcom/android/camera/ui/SeekBarCompat;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 55
    return-void
.end method

.method private clamp(F)F
    .locals 2

    .line 88
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getProgress()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getMax()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    if-le v0, v1, :cond_0

    .line 89
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    .line 95
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getProgress()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getMax()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    if-ge v0, v1, :cond_1

    .line 96
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    .line 98
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    .line 102
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    .line 103
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getLeft()I

    move-result p1

    int-to-float p1, p1

    return p1

    .line 106
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_3

    .line 107
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getPaddingRight()I

    move-result v0

    sub-int/2addr p1, v0

    int-to-float p1, p1

    return p1

    .line 110
    :cond_3
    return p1
.end method


# virtual methods
.method public isCenterSeekBarMode()Z
    .locals 1

    .line 199
    iget-boolean v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    return v0
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    monitor-enter p0

    .line 59
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    if-eqz v0, :cond_3

    .line 60
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressBgDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 61
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 64
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    .line 65
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v1

    .line 66
    iget-object v2, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    int-to-float v1, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    iput v1, v2, Landroid/graphics/RectF;->left:F

    .line 67
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getProgress()I

    move-result v2

    .line 68
    sget-object v4, Lcom/android/camera/ui/SeekBarCompat;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "current progress:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getMax()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    const/4 v5, 0x0

    if-ne v2, v4, :cond_1

    .line 70
    iget-object v2, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    iput v1, v2, Landroid/graphics/RectF;->right:F

    goto :goto_0

    .line 72
    :cond_1
    iget v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mX:F

    cmpl-float v1, v1, v5

    if-nez v1, :cond_2

    .line 73
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mX:F

    .line 75
    :cond_2
    iget-object v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    iget v2, p0, Lcom/android/camera/ui/SeekBarCompat;->mX:F

    invoke-direct {p0, v2}, Lcom/android/camera/ui/SeekBarCompat;->clamp(F)F

    move-result v2

    iput v2, v1, Landroid/graphics/RectF;->right:F

    .line 77
    :goto_0
    iget-object v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    int-to-float v0, v0

    iget v2, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressStrokeWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v3

    sub-float v2, v0, v2

    iput v2, v1, Landroid/graphics/RectF;->top:F

    .line 78
    iget-object v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    iget v2, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressStrokeWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v3

    add-float/2addr v0, v2

    iput v0, v1, Landroid/graphics/RectF;->bottom:F

    .line 79
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v5, v5, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 80
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00d6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 81
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    int-to-float v0, v0

    iget-object v3, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterPointPain:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 82
    iput v5, p0, Lcom/android/camera/ui/SeekBarCompat;->mX:F

    .line 84
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    monitor-exit p0

    return-void

    .line 58
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    if-eqz v0, :cond_1

    .line 177
    iget-boolean v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    if-eqz v0, :cond_0

    .line 178
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 182
    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    invoke-interface {v0, p1}, Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;->onStartTrackingTouch(Landroid/widget/SeekBar;)V

    .line 189
    :cond_0
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    invoke-interface {v0, p1}, Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;->onStopTrackingTouch(Landroid/widget/SeekBar;)V

    .line 196
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mX:F

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->invalidate()V

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mOnSeekBarCompatTouchListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;

    if-eqz v0, :cond_1

    .line 146
    iget-object v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mOnSeekBarCompatTouchListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 148
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setCenterSeekbarMode(Z)V
    .locals 2

    .line 119
    iput-boolean p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    .line 120
    iget-boolean p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    if-eqz p1, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f020024

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressBgDrawable:Landroid/graphics/drawable/Drawable;

    .line 122
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressPaint:Landroid/graphics/Paint;

    .line 123
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressStrokeWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 124
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterProgressPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 127
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterPointPain:Landroid/graphics/Paint;

    .line 128
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterPointPain:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 129
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterPointPain:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    iget-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterPointPain:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 131
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->invalidate()V

    .line 133
    :cond_0
    return-void
.end method

.method public setOnSeekBarChangeListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;)V
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mSeekBarCompatChangeListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;

    .line 137
    return-void
.end method

.method public setOnSeekBarCompatTouchListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;)V
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/android/camera/ui/SeekBarCompat;->mOnSeekBarCompatTouchListener:Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;

    .line 164
    return-void
.end method

.method public declared-synchronized setProgress(I)V
    .locals 1

    monitor-enter p0

    .line 204
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/ui/SeekBarCompat;->mCenterMode:Z

    if-eqz v0, :cond_0

    .line 205
    invoke-virtual {p0}, Lcom/android/camera/ui/SeekBarCompat;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p1, v0

    .line 206
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_0

    .line 208
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    :goto_0
    monitor-exit p0

    return-void

    .line 203
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
