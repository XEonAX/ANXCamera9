.class public Lcom/arcsoft/camera/wideselfie/AwsInitParameter;
.super Ljava/lang/Object;
.source "AwsInitParameter.java"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field public cameraViewAngleForHeight:F

.field public cameraViewAngleForWidth:F

.field public changeDirectionThumbThreshold:I

.field public convertNV21:Z

.field private d:I

.field private e:I

.field private f:I

.field public guideStableBarThumbHeight:I

.field public guideStopBarThumbHeight:I

.field public maxResultWidth:I

.field public mode:I

.field public progressBarThumbHeight:I

.field public progressBarThumbHeightCropRatio:F

.field public resultAngleForHeight:F

.field public resultAngleForWidth:F

.field public thumbnailHeight:I

.field public thumbnailWidth:I


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultInitParams(IIII)Lcom/arcsoft/camera/wideselfie/AwsInitParameter;
    .locals 3

    new-instance v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-direct {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;-><init>()V

    const/4 v1, 0x0

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->a:I

    const/16 v2, 0x40

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->mode:I

    const v2, 0x422bee7d

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForHeight:F

    const v2, 0x425d34a2

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForWidth:F

    const/high16 v2, 0x43340000    # 180.0f

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->resultAngleForWidth:F

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->resultAngleForHeight:F

    const/16 v2, 0x78

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->changeDirectionThumbThreshold:I

    iput p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->b:I

    iput p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->c:I

    iput p1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->d:I

    iget p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->b:I

    iput p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->e:I

    iget p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->c:I

    iput p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailWidth:I

    iget p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->d:I

    iput p2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailHeight:I

    iput p3, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->f:I

    const/16 p2, 0x5a

    if-eq p3, p2, :cond_0

    const/16 p2, 0x10e

    if-eq p3, p2, :cond_0

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->maxResultWidth:I

    div-int/lit8 p1, p1, 0x8

    iput p1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    iget p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    div-int/lit8 p0, p0, 0x2

    iput p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStopBarThumbHeight:I

    goto :goto_0

    :cond_0
    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->maxResultWidth:I

    div-int/lit8 p1, p0, 0xa

    iput p1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    int-to-double p0, p0

    const-wide p2, 0x3fd3645a1cac0831L    # 0.303

    mul-double/2addr p0, p2

    double-to-int p0, p0

    iput p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStopBarThumbHeight:I

    :goto_0
    const/4 p0, 0x5

    iput p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStableBarThumbHeight:I

    const/4 p0, 0x0

    iput p0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeightCropRatio:F

    iput-boolean v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->convertNV21:Z

    return-object v0
.end method


# virtual methods
.method public getBufferSize()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->a:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->f:I

    return v0
.end method

.method public getFullImageHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->d:I

    return v0
.end method

.method public getFullImageWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->c:I

    return v0
.end method

.method public getSrcFormat()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->b:I

    return v0
.end method

.method public getThumbForamt()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->e:I

    return v0
.end method

.method public getThumbnailHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailHeight:I

    return v0
.end method

.method public getThumbnailWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailWidth:I

    return v0
.end method
