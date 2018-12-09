.class public abstract Lcom/android/camera/watermark/BaseWaterMarkDrawable;
.super Ljava/lang/Object;
.source "BaseWaterMarkDrawable.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private mCorrection:I

.field private mFaceInfoNumberPaint:Landroid/graphics/Paint;

.field private mFaceInfoTextPaint:Landroid/graphics/Paint;

.field protected mFacePopupBottom:I

.field private mGap:I

.field private mHeight:I

.field private mOrientation:I

.field protected mPopBottomMargin:I

.field private mSplitFaceInfoPattern:Ljava/util/regex/Pattern;

.field protected mVerPadding:I

.field private mWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

.field protected mWaterMarkInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mContext:Landroid/content/Context;

    .line 45
    iput-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    .line 46
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    .line 47
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/watermark/WaterMarkData;

    invoke-virtual {p1}, Lcom/android/camera/watermark/WaterMarkData;->getFaceViewWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWidth:I

    .line 48
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/watermark/WaterMarkData;

    invoke-virtual {p1}, Lcom/android/camera/watermark/WaterMarkData;->getFaceViewHeight()I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mHeight:I

    .line 49
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/watermark/WaterMarkData;

    invoke-virtual {p1}, Lcom/android/camera/watermark/WaterMarkData;->getOrientation()I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mOrientation:I

    .line 51
    :cond_0
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    .line 52
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f090046

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    .line 55
    iget-object v1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 56
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 57
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 58
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f09004b

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mGap:I

    .line 59
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f09004c

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mCorrection:I

    .line 61
    new-instance p1, Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-direct {p1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoNumberPaint:Landroid/graphics/Paint;

    .line 62
    const-string p1, "(\\D+)|(\\d+\\.?\\d*)"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mSplitFaceInfoPattern:Ljava/util/regex/Pattern;

    .line 64
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x7f090049

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mVerPadding:I

    .line 65
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mGap:I

    .line 66
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mCorrection:I

    .line 67
    iget-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f09004a

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mPopBottomMargin:I

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->initBeforeDraw()V

    .line 69
    invoke-direct {p0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->draw()V

    .line 70
    return-void
.end method

.method private draw()V
    .locals 3

    .line 95
    iget-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lcom/android/camera/watermark/WaterMarkData;

    invoke-direct {v0}, Lcom/android/camera/watermark/WaterMarkData;-><init>()V

    iput-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    .line 97
    iget v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWidth:I

    iget v1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mHeight:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    .line 98
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 99
    invoke-virtual {p0, v0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->onDraw(Landroid/graphics/Canvas;)V

    .line 101
    :cond_0
    return-void
.end method

.method private drawFaceInfoText(Landroid/graphics/Canvas;Ljava/lang/String;II)V
    .locals 4

    .line 73
    iget-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mSplitFaceInfoPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    .line 75
    int-to-float p3, p3

    .line 76
    int-to-float p4, p4

    .line 77
    :goto_0
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 78
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    .line 79
    const-string v1, "\\d+\\.?\\d*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    if-eqz v1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoNumberPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 81
    div-float v2, v1, v2

    add-float/2addr v2, p3

    iget-object v3, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoNumberPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, p4, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 83
    :cond_0
    iget-object v1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 84
    div-float v2, v1, v2

    add-float/2addr v2, p3

    iget-object v3, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, p4, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 86
    :goto_1
    add-float/2addr p3, v1

    .line 87
    goto :goto_0

    .line 88
    :cond_1
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method protected abstract getFaceRectPaint(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/Paint;
.end method

.method protected abstract getHonPadding(Lcom/android/camera/watermark/WaterMarkData;)I
.end method

.method protected abstract getTopBackgroundDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;
.end method

.method protected abstract getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;
.end method

.method public getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    return-object v0
.end method

.method protected abstract initBeforeDraw()V
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    .line 105
    move-object/from16 v1, p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 106
    sget-object v4, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->TAG:Ljava/lang/String;

    const-string v5, "start make water mark."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 108
    iget v4, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mOrientation:I

    neg-int v4, v4

    int-to-float v4, v4

    invoke-virtual {v1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    .line 109
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 110
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/watermark/WaterMarkData;

    .line 111
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    const v8, 0x3c75c28f    # 0.015f

    mul-float/2addr v7, v8

    .line 112
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v9

    mul-float/2addr v9, v8

    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getFaceRectPaint(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/Paint;

    move-result-object v8

    .line 111
    invoke-virtual {v1, v6, v7, v9, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 113
    iget-object v6, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mSplitFaceInfoPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getInfo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 114
    nop

    .line 115
    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 116
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v9

    .line 117
    const-string v10, "\\d+\\.?\\d*"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 118
    iget-object v10, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoNumberPaint:Landroid/graphics/Paint;

    invoke-virtual {v10, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v9

    add-float/2addr v8, v9

    goto :goto_2

    .line 120
    :cond_0
    iget-object v10, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v10, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v9

    add-float/2addr v8, v9

    .line 122
    :goto_2
    goto :goto_1

    .line 124
    :cond_1
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getHonPadding(Lcom/android/camera/watermark/WaterMarkData;)I

    move-result v6

    .line 126
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    add-int/2addr v9, v6

    iget v10, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mGap:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    add-float/2addr v9, v8

    int-to-float v10, v6

    add-float/2addr v9, v10

    float-to-int v9, v9

    .line 127
    iget v10, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mVerPadding:I

    int-to-float v10, v10

    const v11, 0x40666666    # 3.6f

    mul-float/2addr v10, v11

    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    int-to-float v11, v11

    add-float/2addr v10, v11

    float-to-int v10, v10

    .line 128
    new-instance v11, Landroid/graphics/Rect;

    .line 129
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v12}, Landroid/graphics/RectF;->centerX()F

    move-result v12

    float-to-int v12, v12

    div-int/lit8 v9, v9, 0x2

    sub-int/2addr v12, v9

    .line 130
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v13

    iget v13, v13, Landroid/graphics/RectF;->top:F

    float-to-int v13, v13

    sub-int/2addr v13, v10

    iget v14, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mPopBottomMargin:I

    sub-int/2addr v13, v14

    iget v14, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFacePopupBottom:I

    sub-int/2addr v13, v14

    .line 131
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/RectF;->centerX()F

    move-result v14

    float-to-int v14, v14

    add-int/2addr v14, v9

    .line 132
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v15

    iget v15, v15, Landroid/graphics/RectF;->top:F

    float-to-int v15, v15

    iget v7, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mPopBottomMargin:I

    sub-int/2addr v15, v7

    invoke-direct {v11, v12, v13, v14, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 133
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopBackgroundDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 134
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopBackgroundDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7, v11}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 135
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopBackgroundDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 138
    :cond_2
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v11

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v11, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 139
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 141
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 143
    iget v13, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mVerPadding:I

    int-to-float v13, v13

    const v14, 0x3fe66666    # 1.8f

    mul-float/2addr v13, v14

    iget v15, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mCorrection:I

    int-to-float v15, v15

    sub-float/2addr v13, v15

    float-to-int v13, v13

    .line 146
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    invoke-virtual {v15}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v15

    add-int/2addr v15, v6

    move-object/from16 v16, v4

    iget v4, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mVerPadding:I

    int-to-float v4, v4

    mul-float/2addr v4, v14

    iget v14, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mCorrection:I

    int-to-float v14, v14

    sub-float/2addr v4, v14

    .line 147
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v4, v14

    float-to-int v4, v4

    .line 143
    invoke-virtual {v12, v6, v13, v15, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 149
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v12}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 150
    invoke-virtual {v0, v5}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 153
    const/4 v4, 0x0

    cmpl-float v4, v8, v4

    if-eqz v4, :cond_3

    .line 154
    iget-object v4, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFaceInfoTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v4

    .line 155
    iget v6, v12, Landroid/graphics/Rect;->right:I

    iget v8, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mGap:I

    add-int/2addr v6, v8

    .line 156
    iget v8, v12, Landroid/graphics/Rect;->bottom:I

    iget v12, v12, Landroid/graphics/Rect;->top:I

    add-int/2addr v8, v12

    iget v12, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    sub-int/2addr v8, v12

    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v8, v4

    div-int/lit8 v8, v8, 0x2

    .line 157
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getInfo()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v11, v4, v6, v8}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->drawFaceInfoText(Landroid/graphics/Canvas;Ljava/lang/String;II)V

    .line 159
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v4

    if-nez v4, :cond_4

    .line 160
    invoke-static {v7}, Lcom/android/camera/Util;->flipBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 162
    :cond_4
    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    float-to-int v4, v4

    sub-int/2addr v4, v9

    int-to-float v4, v4

    invoke-virtual {v5}, Lcom/android/camera/watermark/WaterMarkData;->getFaceRectF()Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    sub-int/2addr v5, v10

    iget v6, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mPopBottomMargin:I

    sub-int/2addr v5, v6

    iget v6, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mFacePopupBottom:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    const/4 v6, 0x0

    invoke-virtual {v1, v7, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 163
    nop

    .line 110
    move-object/from16 v4, v16

    goto/16 :goto_0

    .line 164
    :cond_5
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 165
    iget-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    iget v4, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mOrientation:I

    invoke-virtual {v1, v4}, Lcom/android/camera/watermark/WaterMarkData;->setOrientation(I)V

    .line 166
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v1

    if-nez v1, :cond_8

    .line 167
    iget v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mOrientation:I

    const/16 v4, 0x5a

    if-eq v1, v4, :cond_7

    iget v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mOrientation:I

    const/16 v4, 0x10e

    if-ne v1, v4, :cond_6

    goto :goto_3

    .line 170
    :cond_6
    iget-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/android/camera/Util;->flipBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    goto :goto_4

    .line 168
    :cond_7
    :goto_3
    iget-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/android/camera/Util;->flipYBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    .line 173
    :cond_8
    :goto_4
    iget-object v1, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    iget-object v0, v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/android/camera/watermark/WaterMarkData;->setImage(Landroid/graphics/Bitmap;)V

    .line 174
    sget-object v0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "end make water mark...time consuming\uff1a"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method

.method public setWaterMarkInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->mWaterMarkInfos:Ljava/util/List;

    .line 179
    return-void
.end method
