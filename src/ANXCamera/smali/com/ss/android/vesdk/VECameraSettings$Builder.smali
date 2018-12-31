.class public Lcom/ss/android/vesdk/VECameraSettings$Builder;
.super Ljava/lang/Object;
.source "VECameraSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VECameraSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

.field private mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

.field private mFps:I

.field private mFpsRange:[I

.field private mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field private mIsUseCloudConfig:Z

.field public mOptionFlags:B

.field private mPreviewSize:Lcom/ss/android/vesdk/VESize;

.field private mSceneMode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 519
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 525
    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFps:I

    .line 532
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/16 v1, 0x2d0

    const/16 v2, 0x500

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 539
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 546
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 553
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 560
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFpsRange:[I

    .line 567
    const-string v0, "auto"

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mSceneMode:Ljava/lang/String;

    .line 574
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mIsUseCloudConfig:Z

    .line 581
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mOptionFlags:B

    return-void

    nop

    :array_0
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/VECameraSettings$Builder;)I
    .locals 0

    .line 519
    iget p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFps:I

    return p0
.end method

.method static synthetic access$300(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object p0
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VECameraSettings$Builder;)[I
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFpsRange:[I

    return-object p0
.end method

.method static synthetic access$600(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Ljava/lang/String;
    .locals 0

    .line 519
    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mSceneMode:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Z
    .locals 0

    .line 519
    iget-boolean p0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mIsUseCloudConfig:Z

    return p0
.end method


# virtual methods
.method public build()Lcom/ss/android/vesdk/VECameraSettings;
    .locals 2

    .line 699
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/VECameraSettings;-><init>(Lcom/ss/android/vesdk/VECameraSettings$Builder;Lcom/ss/android/vesdk/VECameraSettings$1;)V

    return-object v0
.end method

.method public isUseCloudConfig(Z)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0

    .line 672
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mIsUseCloudConfig:Z

    .line 673
    return-object p0
.end method

.method public setCameraFacing(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 590
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 591
    return-object p0
.end method

.method public setCameraType(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 601
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 602
    return-object p0
.end method

.method public setFps(I)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0

    .line 624
    iput p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFps:I

    .line 625
    return-object p0
.end method

.method public setFpsRange([I)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 646
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mFpsRange:[I

    .line 647
    return-object p0
.end method

.method public setHwLevel(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 635
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 636
    return-object p0
.end method

.method public setOptionFlag(B)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0

    .line 690
    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mOptionFlags:B

    .line 691
    return-object p0
.end method

.method public setPreviewSize(II)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1

    .line 613
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v0, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 614
    return-object p0
.end method

.method public setSceneMode(Ljava/lang/String;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 657
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mSceneMode:Ljava/lang/String;

    .line 658
    return-object p0
.end method
