.class public Lcom/android/camera2/MiHighSpeedVideoConfiguration;
.super Ljava/lang/Object;
.source "MiHighSpeedVideoConfiguration.java"


# static fields
.field private static final FIELD_COUNT:I = 0x5

.field private static final HIGH_SPEED_MAX_MINIMAL_FPS:I = 0x78


# instance fields
.field private final mBatchSizeMax:I

.field private final mFpsMax:I

.field private final mFpsMin:I

.field private final mFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mHeight:I

.field private final mSize:Landroid/util/Size;

.field private final mWidth:I


# direct methods
.method private constructor <init>(IIIII)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/16 v0, 0x78

    if-lt p4, v0, :cond_0

    .line 46
    iput p4, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMax:I

    .line 47
    const-string p4, "width must be positive"

    invoke-static {p1, p4}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mWidth:I

    .line 48
    const-string p1, "height must be positive"

    invoke-static {p2, p1}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mHeight:I

    .line 49
    const-string p1, "fpsMin must be positive"

    invoke-static {p3, p1}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMin:I

    .line 50
    new-instance p1, Landroid/util/Size;

    iget p2, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mWidth:I

    iget p3, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mHeight:I

    invoke-direct {p1, p2, p3}, Landroid/util/Size;-><init>(II)V

    iput-object p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mSize:Landroid/util/Size;

    .line 51
    const-string p1, "batchSizeMax must be positive"

    invoke-static {p5, p1}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mBatchSizeMax:I

    .line 52
    new-instance p1, Landroid/util/Range;

    iget p2, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMin:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget p3, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMax:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    iput-object p1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsRange:Landroid/util/Range;

    .line 53
    return-void

    .line 43
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "fpsMax must be at least 120"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static checkArgumentPositive(ILjava/lang/String;)I
    .locals 0

    .line 119
    if-lez p0, :cond_0

    .line 123
    return p0

    .line 120
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unmarshal([II)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([II)",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiHighSpeedVideoConfiguration;",
            ">;"
        }
    .end annotation

    .line 15
    if-eqz p0, :cond_2

    array-length v0, p0

    if-eqz v0, :cond_2

    .line 19
    array-length v0, p0

    const/4 v1, 0x5

    mul-int/2addr v1, p1

    if-lt v0, v1, :cond_1

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    nop

    .line 26
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, p1, :cond_0

    .line 27
    add-int/lit8 v3, v2, 0x1

    aget v5, p0, v2

    .line 28
    add-int/lit8 v2, v3, 0x1

    aget v6, p0, v3

    .line 29
    add-int/lit8 v3, v2, 0x1

    aget v7, p0, v2

    .line 30
    add-int/lit8 v2, v3, 0x1

    aget v8, p0, v3

    .line 31
    add-int/lit8 v3, v2, 0x1

    aget v9, p0, v2

    .line 32
    new-instance v2, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;-><init>(IIIII)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    add-int/lit8 v1, v1, 0x1

    move v2, v3

    goto :goto_0

    .line 36
    :cond_0
    return-object v0

    .line 20
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid buffer length "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p0, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 16
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "empty buffer"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public getBatchSizeMax()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mBatchSizeMax:I

    return v0
.end method

.method public getFpsMax()I
    .locals 1

    .line 88
    iget v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMax:I

    return v0
.end method

.method public getFpsMin()I
    .locals 1

    .line 79
    iget v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMin:I

    return v0
.end method

.method public getFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .line 70
    iget v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mHeight:I

    return v0
.end method

.method public getSize()Landroid/util/Size;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mSize:Landroid/util/Size;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 61
    iget v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mWidth:I

    return v0
.end method
