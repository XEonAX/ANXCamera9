.class public Lcom/android/camera/watermark/WaterMarkBitmap;
.super Ljava/lang/Object;
.source "WaterMarkBitmap.java"


# static fields
.field private static final AGE_GENDER_WATER_MARK:I = 0x2

.field private static final MAGIC_MIRROR_WATER_MARK:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mWaterInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field private mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

.field private mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/watermark/WaterMarkBitmap;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterInfos:Ljava/util/List;

    .line 22
    invoke-virtual {p0}, Lcom/android/camera/watermark/WaterMarkBitmap;->generateWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    .line 23
    return-void
.end method


# virtual methods
.method public generateWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;
    .locals 4

    .line 35
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 39
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderWaterMarkOpen()Z

    move-result v0

    .line 40
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorWaterMarkOpen()Z

    move-result v2

    .line 42
    nop

    .line 43
    const/4 v3, 0x2

    if-eqz v0, :cond_1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    if-eqz v2, :cond_2

    .line 46
    const/4 v3, 0x1

    .line 48
    :cond_2
    :goto_0
    nop

    .line 49
    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 55
    :pswitch_0
    new-instance v0, Lcom/android/camera/watermark/AgeGenderWaterMarkDrawable;

    iget-object v1, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterInfos:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/android/camera/watermark/AgeGenderWaterMarkDrawable;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    .line 56
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    invoke-virtual {v0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object v1

    goto :goto_1

    .line 51
    :pswitch_1
    new-instance v0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;

    iget-object v1, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterInfos:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    .line 52
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    invoke-virtual {v0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object v1

    .line 53
    nop

    .line 59
    :goto_1
    return-object v1

    .line 36
    :cond_3
    :goto_2
    sget-object v0, Lcom/android/camera/watermark/WaterMarkBitmap;->TAG:Ljava/lang/String;

    const-string v2, "The watermark data is empty."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkData:Lcom/android/camera/watermark/WaterMarkData;

    return-object v0
.end method

.method public releaseBitmap()V
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkBitmap;->mWaterMarkDrawable:Lcom/android/camera/watermark/BaseWaterMarkDrawable;

    invoke-virtual {v0}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 72
    :cond_0
    return-void
.end method
