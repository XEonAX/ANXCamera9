.class public Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawYuvAttribute.java"


# instance fields
.field public mApplyWaterMark:Z

.field public mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

.field public mDate:J

.field public mEffectIndex:I

.field public mHeight:I

.field public mIsGradienterOn:Z

.field public mJpegRotation:I

.field public mMirror:Z

.field public mOrientation:I

.field public mOriginalHeight:I

.field public mOriginalWidth:I

.field public mPreviewHeight:I

.field public mPreviewWidth:I

.field public mShootRotation:F

.field public mTiltShiftMode:Ljava/lang/String;

.field public mTimeWatermark:Ljava/lang/String;

.field public mUVBuffer:Ljava/nio/ByteBuffer;

.field private mWaterInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field public mWidth:I

.field public mYBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIIIFJZZZLjava/lang/String;Ljava/lang/String;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/nio/ByteBuffer;",
            "IIIIIIIFJZZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/android/camera/effect/EffectController$EffectRectAttribute;",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    move-object v0, p0

    .line 54
    invoke-direct {v0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 55
    move-object v1, p1

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mYBuffer:Ljava/nio/ByteBuffer;

    .line 56
    move-object v1, p2

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mUVBuffer:Ljava/nio/ByteBuffer;

    .line 57
    move v1, p3

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewWidth:I

    .line 58
    move v1, p4

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewHeight:I

    .line 59
    move v1, p5

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWidth:I

    .line 60
    move v1, p6

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mHeight:I

    .line 61
    move v1, p7

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    .line 62
    move v1, p8

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOrientation:I

    .line 63
    move v1, p9

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    .line 64
    move v1, p10

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mShootRotation:F

    .line 65
    move-wide v1, p11

    iput-wide v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDate:J

    .line 66
    move/from16 v1, p13

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mMirror:Z

    .line 67
    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    .line 68
    move/from16 v1, p15

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mIsGradienterOn:Z

    .line 69
    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    .line 70
    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    .line 71
    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .line 72
    const/16 v1, 0xb

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTarget:I

    .line 73
    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    .line 74
    return-void
.end method


# virtual methods
.method public getWaterInfos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    return-object v0
.end method

.method public setWaterInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    .line 82
    return-void
.end method
