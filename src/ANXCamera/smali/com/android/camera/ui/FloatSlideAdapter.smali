.class public Lcom/android/camera/ui/FloatSlideAdapter;
.super Ljava/lang/Object;
.source "FloatSlideAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/RollAdapter;


# static fields
.field public static final DEFAULT_GAP_VALUE:F = 1.0f

.field public static final DEFAULT_MAX_VALUE:I = 0x9

.field private static final DEFAULT_MIN_VALUE:I


# instance fields
.field private mCenterItem:I

.field private mGapValue:F

.field private mItemCount:I

.field private mMaxValue:I

.field private mMinValue:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 16
    const/4 v0, 0x0

    const/16 v1, 0x9

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/ui/FloatSlideAdapter;-><init>(IIF)V

    .line 17
    return-void
.end method

.method public constructor <init>(IIF)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    .line 20
    iput p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    .line 21
    iput p2, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    .line 22
    iput p3, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    .line 23
    iget p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    iget p2, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    sub-int/2addr p1, p2

    int-to-float p1, p1

    iget p2, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    div-float/2addr p1, p2

    add-float/2addr p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mItemCount:I

    .line 24
    iget p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mItemCount:I

    add-int/lit8 p1, p1, -0x1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mCenterItem:I

    .line 25
    return-void
.end method

.method private round(F)I
    .locals 4

    .line 54
    float-to-double v0, p1

    const/4 v2, 0x0

    cmpg-float p1, p1, v2

    if-gez p1, :cond_0

    const-wide/high16 v2, -0x4020000000000000L    # -0.5

    goto :goto_0

    :cond_0
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    :goto_0
    add-double/2addr v0, v2

    double-to-int p1, v0

    return p1
.end method


# virtual methods
.method public getCenterIndex()I
    .locals 1

    .line 64
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mCenterItem:I

    return v0
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 2

    .line 39
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/FloatSlideAdapter;->getItemsCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 40
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    int-to-float v0, v0

    int-to-float p1, p1

    iget v1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    mul-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FloatSlideAdapter;->round(F)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 42
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemIndexByValue(Ljava/lang/Object;)I
    .locals 1

    .line 74
    nop

    .line 75
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 76
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    .line 78
    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    if-le p1, v0, :cond_2

    .line 79
    :cond_1
    iget p1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    add-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    .line 80
    :cond_2
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method public getItemValue(I)I
    .locals 2

    .line 47
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/FloatSlideAdapter;->getItemsCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 48
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    int-to-float v0, v0

    int-to-float p1, p1

    iget v1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mGapValue:F

    mul-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FloatSlideAdapter;->round(F)I

    move-result p1

    return p1

    .line 50
    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public getItemsCount()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mItemCount:I

    return v0
.end method

.method public getMaxItem()I
    .locals 1

    .line 69
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mItemCount:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getMaxValue()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    return v0
.end method

.method public getMaximumLength()I
    .locals 2

    .line 85
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMaxValue:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 87
    iget v1, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    if-gez v1, :cond_0

    .line 88
    add-int/lit8 v0, v0, 0x1

    .line 90
    :cond_0
    return v0
.end method

.method public getMinValue()I
    .locals 1

    .line 34
    iget v0, p0, Lcom/android/camera/ui/FloatSlideAdapter;->mMinValue:I

    return v0
.end method
