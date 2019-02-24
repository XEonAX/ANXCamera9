.class public Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "ExtraSlideZoomAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;


# static fields
.field private static final ENTRY_COUNT_1X_TO_2X:I = 0xb

.field private static final ENTRY_COUNT_2X_TO_MAX:I = 0x26

.field private static final ENTRY_COUNT_TOTAL:I = 0x30

.field private static final ENTRY_INDEX_1X:I = 0x0

.field private static final ENTRY_INDEX_2X:I = 0xa

.field private static final ENTRY_INDEX_MAX:I = 0x2f

.field private static final sTextActivatedColorState:[I

.field private static final sTextDefaultColorState:[I

.field private static sX:[F

.field private static sY:[F


# instance fields
.field private ENTRY_INDEX_TELE_REAL:I

.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDotColorActivated:I

.field private mDotRadius:I

.field private mEnable:Z

.field private mEntries:[Ljava/lang/CharSequence;

.field private mEntryLayouts:[Landroid/text/StaticLayout;

.field private mEntryToZoomRatioSpline:Landroid/util/Spline;

.field private mLineColorDefault:I

.field private mLineDotYGap:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineTextGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mTextPaint:Landroid/text/TextPaint;

.field private mTextSize:I

.field private mXTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mZoomRatioMax:F

.field private mZoomRatioTele:I

.field private mZoomRatioToEntrySpline:Landroid/util/Spline;

.field private mZoomRatioWide:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 58
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x10102fe

    aput v3, v1, v2

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    .line 59
    new-array v0, v0, [I

    aput v2, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextDefaultColorState:[I

    .line 148
    const/16 v0, 0xa

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sX:[F

    .line 149
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sY:[F

    return-void

    :array_0
    .array-data 4
        0x0
        0x41200000    # 10.0f
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41c80000    # 25.0f
        0x41d80000    # 27.0f
        0x41e80000    # 29.0f
        0x41f00000    # 30.0f
        0x42000000    # 32.0f
        0x420c0000    # 35.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x400ccccd    # 2.2f
        0x406ccccd    # 3.7f
        0x40a33333    # 5.1f
        0x40b9999a    # 5.8f
        0x40d33333    # 6.6f
        0x40e00000    # 7.0f
        0x41000000    # 8.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 10

    .line 77
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    .line 40
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    .line 78
    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    .line 79
    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    .line 80
    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    .line 82
    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    .line 84
    move-object p2, p1

    check-cast p2, Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p2

    check-cast p2, Lcom/android/camera/module/BaseModule;

    .line 85
    const/4 p3, 0x1

    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    .line 86
    const/4 p4, 0x2

    iput p4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    .line 87
    invoke-virtual {p2}, Lcom/android/camera/module/BaseModule;->getZoomMaxRatio()F

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    .line 89
    sget-object p2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sX:[F

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->convertSplineXToEntryX([F)[F

    move-result-object p2

    .line 90
    sget-object v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sY:[F

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->convertSplineYToZoomRatioY([F)[F

    move-result-object v1

    .line 91
    invoke-static {p2, v1}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryToZoomRatioSpline:Landroid/util/Spline;

    .line 92
    invoke-static {v1, p2}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioToEntrySpline:Landroid/util/Spline;

    .line 94
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->initStyle(Landroid/content/Context;)V

    .line 97
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/CharSequence;

    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    int-to-float p2, p2

    .line 98
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 v1, 0x0

    aput-object p2, p1, v1

    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float p2, p2

    .line 99
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object p2

    aput-object p2, p1, p3

    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    .line 100
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object p2

    aput-object p2, p1, p4

    .line 102
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    .line 103
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    array-length p1, p1

    new-array p1, p1, [Landroid/text/StaticLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    .line 104
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    array-length p1, p1

    if-ge v1, p1, :cond_0

    .line 105
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    new-instance p2, Landroid/text/StaticLayout;

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    aget-object v3, p3, v1

    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    sget v5, Lcom/android/camera/Util;->sWindowWidth:I

    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, p2

    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    aput-object p2, p1, v1

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object p1

    .line 110
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getZoomRatioTeleReal()I

    move-result p1

    .line 111
    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    mul-int/2addr p2, v0

    if-eq p1, p2, :cond_1

    .line 112
    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    mul-int/2addr p2, v0

    if-le p1, p2, :cond_1

    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    mul-int/2addr p2, v0

    if-ge p1, p2, :cond_1

    .line 113
    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    mul-int/2addr p2, v0

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    .line 117
    :cond_1
    return-void
.end method

.method private convertSplineXToEntryX([F)[F
    .locals 6

    .line 120
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget v0, p1, v0

    const/high16 v1, 0x41200000    # 10.0f

    sub-float/2addr v0, v1

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v0, v2

    float-to-int v0, v0

    .line 122
    array-length v2, p1

    new-array v2, v2, [F

    .line 123
    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    .line 124
    aget v4, p1, v3

    cmpg-float v4, v4, v1

    if-gtz v4, :cond_0

    .line 125
    aget v4, p1, v3

    aput v4, v2, v3

    goto :goto_1

    .line 127
    :cond_0
    aget v4, p1, v3

    sub-float/2addr v4, v1

    add-int/lit8 v5, v0, -0x1

    int-to-float v5, v5

    div-float/2addr v4, v5

    const/high16 v5, 0x42140000    # 37.0f

    mul-float/2addr v4, v5

    add-float/2addr v4, v1

    aput v4, v2, v3

    .line 123
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 131
    :cond_1
    return-object v2
.end method

.method private convertSplineYToZoomRatioY([F)[F
    .locals 6

    .line 135
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget v0, p1, v0

    float-to-int v0, v0

    .line 136
    array-length v1, p1

    new-array v1, v1, [F

    .line 137
    const/4 v2, 0x0

    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 138
    aget v3, p1, v2

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_0

    .line 139
    aget v3, p1, v2

    aput v3, v1, v2

    goto :goto_1

    .line 141
    :cond_0
    aget v3, p1, v2

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    sub-int v4, v0, v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    iget v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    aput v3, v1, v2

    .line 137
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 145
    :cond_1
    return-object v1
.end method

.method private drawText(ILandroid/graphics/Canvas;)V
    .locals 3

    .line 204
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout;->getLineAscent(I)I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v2, v2, p1

    .line 205
    invoke-virtual {v2, v1}, Landroid/text/StaticLayout;->getLineDescent(I)I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 207
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 208
    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 209
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object p1, v0, p1

    invoke-virtual {p1, p2}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 210
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 211
    return-void
.end method

.method private getDisplayedZoomRatio(F)Ljava/lang/CharSequence;
    .locals 3

    .line 183
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 185
    float-to-int p1, p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    const/16 v2, 0x21

    invoke-static {v0, p1, v1, v2}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 187
    const-string p1, "X"

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, p1, v1, v2}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 189
    return-object v0
.end method

.method private indexToSection(I)I
    .locals 1

    .line 193
    if-nez p1, :cond_0

    .line 194
    const/4 p1, 0x0

    return p1

    .line 195
    :cond_0
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 196
    const/4 p1, 0x1

    return p1

    .line 197
    :cond_1
    const/16 v0, 0x2f

    if-ne p1, v0, :cond_2

    .line 198
    const/4 p1, 0x2

    return p1

    .line 200
    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 4

    .line 154
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 155
    const v1, 0x7f0c000f

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 156
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    .line 157
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    .line 158
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 160
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 161
    const v2, 0x7f0a0015

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    .line 162
    const v2, 0x7f0a0016

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    .line 163
    const v2, 0x7f0a0019

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    .line 164
    const v2, 0x7f0a0017

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineLineGap:I

    .line 165
    const v2, 0x7f0a0018

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineTextGap:I

    .line 166
    const v2, 0x7f0a001a

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineDotYGap:I

    .line 167
    const v2, 0x7f0b004e

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    .line 168
    const v2, 0x7f0b004f

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotColorActivated:I

    .line 170
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    .line 171
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 172
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 173
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 174
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 176
    new-instance v0, Landroid/text/TextPaint;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    .line 178
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x7f0c0016

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 179
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x7f0c0017

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 180
    return-void

    nop

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method

.method private mapPositionToZoomRatio(F)F
    .locals 1

    .line 290
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 8

    .line 215
    if-eqz p1, :cond_3

    const/16 v0, 0xa

    if-eq p1, v0, :cond_3

    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    goto :goto_2

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_1

    .line 223
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_0

    .line 224
    :cond_1
    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    .line 222
    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 225
    const/4 v3, 0x0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    neg-float v4, v0

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    iget-object v7, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v2, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 227
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    if-ne p1, v0, :cond_5

    .line 228
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_2

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotColorActivated:I

    goto :goto_1

    :cond_2
    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    :goto_1
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 229
    const/4 p1, 0x0

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    neg-float p3, p3

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineDotYGap:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, p1, p3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_4

    .line 216
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    if-eqz p3, :cond_4

    .line 217
    sget-object p3, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    goto :goto_3

    .line 218
    :cond_4
    sget-object p3, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextDefaultColorState:[I

    :goto_3
    iput-object p3, v0, Landroid/text/TextPaint;->drawableState:[I

    .line 220
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->indexToSection(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->drawText(ILandroid/graphics/Canvas;)V

    .line 232
    :cond_5
    :goto_4
    return-void
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 1

    .line 254
    if-eqz p1, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 257
    :cond_0
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    return-object p1

    .line 255
    :cond_1
    :goto_0
    sget-object p1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    return-object p1
.end method

.method public getCount()I
    .locals 1

    .line 263
    const/16 v0, 0x30

    return v0
.end method

.method public mapZoomRatioToPosition(F)F
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1
.end method

.method public measureGap(I)F
    .locals 1

    .line 245
    if-eqz p1, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 248
    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineLineGap:I

    int-to-float p1, p1

    return p1

    .line 246
    :cond_1
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineTextGap:I

    int-to-float p1, p1

    return p1
.end method

.method public measureWidth(I)F
    .locals 1

    .line 236
    if-eqz p1, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 239
    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    int-to-float p1, p1

    return p1

    .line 237
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->indexToSection(I)I

    move-result p1

    aget-object p1, v0, p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/text/StaticLayout;->getLineWidth(I)F

    move-result p1

    return p1
.end method

.method public onPositionSelect(Lcom/android/camera/ui/HorizontalSlideView;F)V
    .locals 3

    .line 268
    iget-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEnable:Z

    if-nez p1, :cond_0

    .line 269
    return-void

    .line 271
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    int-to-float p1, p1

    mul-float/2addr p2, p1

    .line 272
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mapPositionToZoomRatio(F)F

    move-result p1

    .line 273
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    .line 274
    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 275
    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    invoke-virtual {p2, v0, p1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 276
    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz p2, :cond_1

    .line 277
    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {p2, v0, v1, p1, v2}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 280
    :cond_1
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    .line 283
    :cond_2
    return-void
.end method

.method public setEnable(Z)V
    .locals 0

    .line 294
    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEnable:Z

    .line 295
    return-void
.end method
