.class public Lcom/xiaomi/camera/core/ParallelTaskDataParameter;
.super Ljava/lang/Object;
.source "ParallelTaskDataParameter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    }
.end annotation


# instance fields
.field private mAgeGenderAndMagicMirrorWater:Z

.field private mAlgorithmName:Ljava/lang/String;

.field private mBokehFrontCamera:Z

.field private mDualWatermarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

.field private mFaceWaterMarkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterId:I

.field private mHasDualWaterMark:Z

.field private mIsFrontCamera:Z

.field private mIsGradienterOn:Z

.field private mJpegQuality:I

.field private mJpegRotation:I

.field private mLightingPattern:I

.field private mLocation:Landroid/location/Location;

.field private mMirror:Z

.field private mOrientation:I

.field private mOutputSize:Landroid/util/Size;

.field private mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

.field private mPictureSize:Landroid/util/Size;

.field private mPreviewSize:Landroid/util/Size;

.field private mSaveGroupshotPrimitive:Z

.field private mShootOrientation:I

.field private mShootRotation:F

.field private mSuffix:Ljava/lang/String;

.field private mTiltShiftMode:Ljava/lang/String;

.field private mTimeWaterMarkString:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    .line 57
    iput-object p2, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    .line 58
    iput-object p3, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    .line 59
    return-void
.end method

.method synthetic constructor <init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    return-void
.end method

.method private constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V
    .locals 3

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mHasDualWaterMark:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mHasDualWaterMark:Z

    .line 71
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mMirror:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mMirror:Z

    .line 72
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLightingPattern:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLightingPattern:I

    .line 73
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    if-eqz v0, :cond_0

    .line 74
    new-instance v0, Landroid/util/Size;

    iget-object v1, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    .line 76
    :cond_0
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    if-eqz v0, :cond_1

    .line 77
    new-instance v0, Landroid/util/Size;

    iget-object v1, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    .line 79
    :cond_1
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFilterId:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFilterId:I

    .line 80
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOrientation:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOrientation:I

    .line 81
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegRotation:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegRotation:I

    .line 82
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootRotation:F

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootRotation:F

    .line 83
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootOrientation:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootOrientation:I

    .line 84
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLocation:Landroid/location/Location;

    if-eqz v0, :cond_2

    .line 85
    new-instance v0, Landroid/location/Location;

    iget-object v1, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLocation:Landroid/location/Location;

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLocation:Landroid/location/Location;

    .line 87
    :cond_2
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTimeWaterMarkString:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTimeWaterMarkString:Ljava/lang/String;

    .line 88
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFaceWaterMarkList:Ljava/util/List;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFaceWaterMarkList:Ljava/util/List;

    .line 89
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAgeGenderAndMagicMirrorWater:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAgeGenderAndMagicMirrorWater:Z

    .line 90
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsFrontCamera:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsFrontCamera:Z

    .line 91
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    if-eqz v0, :cond_3

    .line 92
    new-instance v0, Landroid/util/Size;

    iget-object v1, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    .line 94
    :cond_3
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mBokehFrontCamera:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mBokehFrontCamera:Z

    .line 95
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAlgorithmName:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAlgorithmName:Ljava/lang/String;

    .line 96
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    .line 97
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSuffix:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSuffix:Ljava/lang/String;

    .line 98
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsGradienterOn:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsGradienterOn:Z

    .line 99
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTiltShiftMode:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTiltShiftMode:Ljava/lang/String;

    .line 100
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mDualWatermarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mDualWatermarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 101
    iget p1, p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegQuality:I

    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegQuality:I

    .line 102
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    return-void
.end method

.method static synthetic access$1002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Landroid/location/Location;)Landroid/location/Location;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLocation:Landroid/location/Location;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTimeWaterMarkString:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFaceWaterMarkList:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAgeGenderAndMagicMirrorWater:Z

    return p1
.end method

.method static synthetic access$1402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsFrontCamera:Z

    return p1
.end method

.method static synthetic access$1502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mBokehFrontCamera:Z

    return p1
.end method

.method static synthetic access$1602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAlgorithmName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    return-object p1
.end method

.method static synthetic access$1802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSuffix:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsGradienterOn:Z

    return p1
.end method

.method static synthetic access$2002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTiltShiftMode:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mHasDualWaterMark:Z

    return p1
.end method

.method static synthetic access$2102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSaveGroupshotPrimitive:Z

    return p1
.end method

.method static synthetic access$2202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mDualWatermarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegQuality:I

    return p1
.end method

.method static synthetic access$302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mMirror:Z

    return p1
.end method

.method static synthetic access$402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLightingPattern:I

    return p1
.end method

.method static synthetic access$502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFilterId:I

    return p1
.end method

.method static synthetic access$602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOrientation:I

    return p1
.end method

.method static synthetic access$702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegRotation:I

    return p1
.end method

.method static synthetic access$802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;F)F
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootRotation:F

    return p1
.end method

.method static synthetic access$902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootOrientation:I

    return p1
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAlgorithmName:Ljava/lang/String;

    return-object v0
.end method

.method public getDualWatermarkParam()Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mDualWatermarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    return-object v0
.end method

.method public getFaceWaterMarkList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFaceWaterMarkList:Ljava/util/List;

    return-object v0
.end method

.method public getFilterId()I
    .locals 1

    .line 133
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mFilterId:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 201
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 129
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mJpegRotation:I

    return v0
.end method

.method public getLightingPattern()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLightingPattern:I

    return v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    .line 153
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOrientation:I

    return v0
.end method

.method public getOutputSize()Landroid/util/Size;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mOutputSize:Landroid/util/Size;

    return-object v0
.end method

.method public getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    return-object v0
.end method

.method public getPictureSize()Landroid/util/Size;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPictureSize:Landroid/util/Size;

    return-object v0
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mPreviewSize:Landroid/util/Size;

    return-object v0
.end method

.method public getShootOrientation()I
    .locals 1

    .line 149
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootOrientation:I

    return v0
.end method

.method public getShootRotation()F
    .locals 1

    .line 145
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mShootRotation:F

    return v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSuffix:Ljava/lang/String;

    return-object v0
.end method

.method public getTiltShiftMode()Ljava/lang/String;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTiltShiftMode:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeWaterMarkString()Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mTimeWaterMarkString:Ljava/lang/String;

    return-object v0
.end method

.method public isAgeGenderAndMagicMirrorWater()Z
    .locals 1

    .line 157
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mAgeGenderAndMagicMirrorWater:Z

    return v0
.end method

.method public isBokehFrontCamera()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mBokehFrontCamera:Z

    return v0
.end method

.method public isFrontCamera()Z
    .locals 1

    .line 165
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsFrontCamera:Z

    return v0
.end method

.method public isGradienterOn()Z
    .locals 1

    .line 185
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mIsGradienterOn:Z

    return v0
.end method

.method public isHasDualWaterMark()Z
    .locals 1

    .line 105
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mHasDualWaterMark:Z

    return v0
.end method

.method public isMirror()Z
    .locals 1

    .line 137
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mMirror:Z

    return v0
.end method

.method public isSaveGroupshotPrimitive()Z
    .locals 1

    .line 193
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->mSaveGroupshotPrimitive:Z

    return v0
.end method
