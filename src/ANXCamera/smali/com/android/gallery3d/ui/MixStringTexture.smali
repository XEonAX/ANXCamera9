.class public Lcom/android/gallery3d/ui/MixStringTexture;
.super Lcom/android/gallery3d/ui/CanvasTexture;
.source "MixStringTexture.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final TYPE_CN:I = 0x1

.field public static final TYPE_EN:I = 0x2

.field public static final WATER_MARK_SHADOW_Y:F = 3.0f

.field public static final WATER_MARK_SHADOW_Y_COLOR:I = 0x2e000000


# instance fields
.field private final mCNPaint:Landroid/text/TextPaint;

.field private final mENPaint:Landroid/text/TextPaint;

.field private final mMetrics:Landroid/graphics/Paint$FontMetricsInt;

.field private final mText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const-class v0, Lcom/android/gallery3d/ui/MixStringTexture;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/gallery3d/ui/MixStringTexture;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/graphics/Paint$FontMetricsInt;II)V
    .locals 0

    .line 34
    invoke-direct {p0, p5, p6}, Lcom/android/gallery3d/ui/CanvasTexture;-><init>(II)V

    .line 35
    iput-object p1, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mText:Ljava/lang/String;

    .line 36
    iput-object p2, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mCNPaint:Landroid/text/TextPaint;

    .line 37
    iput-object p3, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mENPaint:Landroid/text/TextPaint;

    .line 38
    iput-object p4, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mMetrics:Landroid/graphics/Paint$FontMetricsInt;

    .line 39
    return-void
.end method

.method public static getDefaultPaint(FII)Landroid/text/TextPaint;
    .locals 2

    .line 42
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 43
    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 44
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 45
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 46
    if-ne p2, v1, :cond_0

    .line 47
    nop

    .line 48
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    .line 47
    invoke-static {p0}, Lcom/android/camera/Util;->getLanTineGBTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x2

    if-ne p2, p0, :cond_1

    .line 51
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 52
    nop

    .line 53
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    .line 52
    invoke-static {p0}, Lcom/android/camera/Util;->getMFYueYuanTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 55
    :cond_1
    :goto_0
    const/high16 p0, 0x2e000000

    const/high16 p1, 0x40400000    # 3.0f

    const p2, 0x3dcccccd    # 0.1f

    invoke-virtual {v0, p2, p1, p1, p0}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 56
    invoke-static {v0, p2}, Lcom/android/gallery3d/ui/MixStringTexture;->setLongshotMode(Landroid/text/TextPaint;F)V

    .line 57
    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;FI)Lcom/android/gallery3d/ui/MixStringTexture;
    .locals 2

    .line 68
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/android/gallery3d/ui/MixStringTexture;->getDefaultPaint(FII)Landroid/text/TextPaint;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p1, p2, v1}, Lcom/android/gallery3d/ui/MixStringTexture;->getDefaultPaint(FII)Landroid/text/TextPaint;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/android/gallery3d/ui/MixStringTexture;->newInstance(Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;)Lcom/android/gallery3d/ui/MixStringTexture;

    move-result-object p0

    return-object p0
.end method

.method private static newInstance(Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;)Lcom/android/gallery3d/ui/MixStringTexture;
    .locals 8

    .line 73
    invoke-virtual {p2}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v4

    .line 74
    invoke-virtual {p2, p0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v0, v2

    double-to-int v0, v0

    .line 75
    iget v1, v4, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v2, v4, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v1, v2

    .line 77
    nop

    .line 78
    nop

    .line 79
    const/4 v2, 0x1

    if-gtz v0, :cond_0

    .line 80
    move v5, v2

    goto :goto_0

    :cond_0
    move v5, v0

    :goto_0
    if-gtz v1, :cond_1

    .line 81
    move v6, v2

    goto :goto_1

    :cond_1
    move v6, v1

    :goto_1
    new-instance v7, Lcom/android/gallery3d/ui/MixStringTexture;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/gallery3d/ui/MixStringTexture;-><init>(Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/graphics/Paint$FontMetricsInt;II)V

    return-object v7
.end method

.method private static setLongshotMode(Landroid/text/TextPaint;F)V
    .locals 2

    .line 61
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 62
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V

    .line 64
    :cond_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;)V
    .locals 6

    .line 86
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 87
    iget-object p2, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mMetrics:Landroid/graphics/Paint$FontMetricsInt;

    iget p2, p2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int p2, p2

    int-to-float p2, p2

    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 88
    const-string p2, "([\\sa-zA-Z0-9]+)|([^\\sa-zA-Z0-9]+)"

    invoke-static {p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p2

    iget-object v3, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mText:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    .line 89
    nop

    .line 90
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 91
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    .line 92
    const-string v5, "[\\sa-zA-Z0-9]+"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 93
    int-to-float v3, v3

    iget-object v5, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mENPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v4, v3, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 94
    iget-object v5, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mENPaint:Landroid/text/TextPaint;

    invoke-virtual {v5, v4}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v4

    add-float/2addr v3, v4

    float-to-int v3, v3

    goto :goto_1

    .line 96
    :cond_0
    int-to-float v3, v3

    iget-object v5, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mCNPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v4, v3, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 97
    iget-object v5, p0, Lcom/android/gallery3d/ui/MixStringTexture;->mCNPaint:Landroid/text/TextPaint;

    invoke-virtual {v5, v4}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v4

    add-float/2addr v3, v4

    float-to-int v3, v3

    .line 99
    :goto_1
    goto :goto_0

    .line 100
    :cond_1
    sget-object p1, Lcom/android/gallery3d/ui/MixStringTexture;->TAG:Ljava/lang/String;

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

    .line 102
    return-void
.end method
