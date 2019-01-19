.class public Lcom/android/camera/effect/renders/CustomTextWaterMark;
.super Ljava/lang/Object;
.source "CustomTextWaterMark.java"


# static fields
.field private static final SIZE_CN:I = 0x46

.field private static final SIZE_EN:I = 0x4d

.field private static final TAG:Ljava/lang/String;

.field private static final TEXT_COLOR:I = -0x1

.field private static final TYPE_CN:I = 0x1

.field private static final TYPE_EN:I = 0x2

.field private static final WATER_MARK_SHADOW_Y:F = 3.0f

.field private static final WATER_MARK_SHADOW_Y_COLOR:I = 0x2e000000


# instance fields
.field private final mCNPaint:Landroid/text/TextPaint;

.field private final mENPaint:Landroid/text/TextPaint;

.field private mInputBitmap:Landroid/graphics/Bitmap;

.field private final mMetrics:Landroid/graphics/Paint$FontMetricsInt;

.field private mStartX:F

.field private mStartY:F

.field private mText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Lcom/android/camera/effect/renders/CustomTextWaterMark;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;FFLjava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/graphics/Paint$FontMetricsInt;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mInputBitmap:Landroid/graphics/Bitmap;

    .line 39
    iput p2, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mStartX:F

    .line 40
    iput p3, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mStartY:F

    .line 41
    iput-object p4, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mText:Ljava/lang/String;

    .line 42
    iput-object p5, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mCNPaint:Landroid/text/TextPaint;

    .line 43
    iput-object p6, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mENPaint:Landroid/text/TextPaint;

    .line 44
    iput-object p7, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mMetrics:Landroid/graphics/Paint$FontMetricsInt;

    .line 45
    return-void
.end method

.method public static getDefaultPaint(FII)Landroid/text/TextPaint;
    .locals 2

    .line 48
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 49
    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 50
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 51
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 52
    if-ne p2, v1, :cond_0

    .line 53
    nop

    .line 54
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    .line 53
    invoke-static {p0}, Lcom/android/camera/Util;->getLanTineGBTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x2

    if-ne p2, p0, :cond_1

    .line 57
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 58
    nop

    .line 59
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    .line 58
    invoke-static {p0}, Lcom/android/camera/Util;->getMFYueYuanTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 61
    :cond_1
    :goto_0
    const p0, 0x3dcccccd    # 0.1f

    const/high16 p1, 0x2e000000

    const/high16 p2, 0x40400000    # 3.0f

    invoke-virtual {v0, p0, p2, p2, p1}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 62
    const p0, 0x3d4ccccd    # 0.05f

    invoke-static {v0, p0}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->setLongshotMode(Landroid/text/TextPaint;F)V

    .line 63
    return-object v0
.end method

.method public static newInstance(Landroid/graphics/Bitmap;FFLjava/lang/String;)Lcom/android/camera/effect/renders/CustomTextWaterMark;
    .locals 12

    .line 74
    const v0, 0x7f0a0130

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v0

    .line 75
    const/high16 v1, 0x428c0000    # 70.0f

    mul-float/2addr v1, v0

    float-to-int v1, v1

    int-to-float v1, v1

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->getDefaultPaint(FII)Landroid/text/TextPaint;

    move-result-object v9

    .line 76
    const/high16 v1, 0x429a0000    # 77.0f

    mul-float/2addr v1, v0

    float-to-int v0, v1

    int-to-float v0, v0

    const/4 v1, 0x2

    invoke-static {v0, v2, v1}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->getDefaultPaint(FII)Landroid/text/TextPaint;

    move-result-object v10

    .line 78
    invoke-virtual {v10}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v11

    .line 79
    new-instance v0, Lcom/android/camera/effect/renders/CustomTextWaterMark;

    move-object v4, v0

    move-object v5, p0

    move v6, p1

    move v7, p2

    move-object v8, p3

    invoke-direct/range {v4 .. v11}, Lcom/android/camera/effect/renders/CustomTextWaterMark;-><init>(Landroid/graphics/Bitmap;FFLjava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/graphics/Paint$FontMetricsInt;)V

    return-object v0
.end method

.method private static setLongshotMode(Landroid/text/TextPaint;F)V
    .locals 2

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 68
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V

    .line 70
    :cond_0
    return-void
.end method


# virtual methods
.method public drawToBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .line 83
    iget-object v0, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mInputBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mInputBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 85
    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->setPremultiplied(Z)V

    .line 86
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 87
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/effect/renders/CustomTextWaterMark;->onDraw(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;)V

    .line 88
    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;)V
    .locals 6

    .line 92
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 93
    iget p2, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mStartX:F

    iget v2, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mStartY:F

    iget-object v3, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mMetrics:Landroid/graphics/Paint$FontMetricsInt;

    iget v3, v3, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {p1, p2, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 94
    const-string p2, "([\\sa-zA-Z0-9]+)|([^\\sa-zA-Z0-9]+)"

    invoke-static {p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p2

    iget-object v2, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mText:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    .line 95
    nop

    .line 96
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 97
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    .line 98
    const-string v4, "[\\sa-zA-Z0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 99
    int-to-float v2, v2

    iget-object v4, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mENPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v3, v2, v5, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 100
    iget-object v4, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mENPaint:Landroid/text/TextPaint;

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v3

    add-float/2addr v2, v3

    float-to-int v2, v2

    goto :goto_1

    .line 102
    :cond_0
    int-to-float v2, v2

    iget-object v4, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mCNPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v3, v2, v5, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 103
    iget-object v4, p0, Lcom/android/camera/effect/renders/CustomTextWaterMark;->mCNPaint:Landroid/text/TextPaint;

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v3

    add-float/2addr v2, v3

    float-to-int v2, v2

    .line 105
    :goto_1
    goto :goto_0

    .line 106
    :cond_1
    sget-object p1, Lcom/android/camera/effect/renders/CustomTextWaterMark;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Custom watermark cost time = "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    return-void
.end method
