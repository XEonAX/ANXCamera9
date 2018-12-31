.class public Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.super Ljava/lang/Object;
.source "VEVideoEncodeSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEVideoEncodeSettings;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

.field private bps:I

.field public compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

.field private encodeLevel:I

.field private encodeProfile:I

.field private encodeStand:I

.field private fps:I

.field private gopSize:I

.field private hasBFrame:Z

.field private mIsUseCloudConfig:Z

.field private outputSize:Lcom/ss/android/vesdk/VESize;

.field private resizeMode:I

.field private resizeX:F

.field private resizeY:F

.field private rotate:I

.field private speed:F

.field private swCRF:I

.field private swQP:I

.field private usage:I

.field private useHWEncoder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 524
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x400

    const/16 v4, 0x240

    invoke-direct {v2, v4, v3}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 441
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput v4, v0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 442
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput v3, v0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 443
    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 444
    const/high16 v0, 0x400000

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 445
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 446
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 447
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 5

    .line 472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 473
    const-class v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 474
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 475
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 476
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 477
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 478
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 479
    const-class v2, Lcom/ss/android/vesdk/VESize;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VESize;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 480
    const-class v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 481
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 482
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 483
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 484
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 485
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 486
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 487
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 488
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 489
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    iput-boolean v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 490
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_1
    iput-boolean v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 491
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 492
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_2

    move v0, v1

    nop

    :cond_2
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 493
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;Z)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 377
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 378
    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 379
    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 380
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;ZII)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 395
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 396
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 397
    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 398
    iput p3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 399
    iput p4, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 400
    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 401
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;ZIIIIZ)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 420
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 421
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 422
    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 423
    iput p3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 424
    iput p4, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 425
    iput p5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 426
    iput p6, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 427
    iput-boolean p7, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 428
    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 429
    return-void
.end method

.method private constructor <init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)V
    .locals 5

    .line 449
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 236
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 243
    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 250
    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 257
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 264
    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 271
    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 279
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 288
    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 297
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 304
    const/16 v1, 0x19

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 311
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 318
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 325
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 332
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 346
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 356
    const/4 v1, 0x1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 363
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 450
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$000(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Lcom/ss/android/vesdk/VESize;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 451
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$100(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 452
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$200(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 453
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 454
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$400(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 455
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 456
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$600(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 457
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$700(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 458
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$800(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 459
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$900(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    .line 460
    iget-object v0, p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 461
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1000(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 462
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1100(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 463
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    .line 464
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1300(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 465
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 466
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 467
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1600(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    .line 468
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1700(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    .line 469
    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->access$1800(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 470
    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 521
    const/4 v0, 0x0

    return v0
.end method

.method public getBitrateMode()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 1

    .line 561
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object v0
.end method

.method public getBitrateValue()I
    .locals 2

    .line 570
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$2;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$ENCODE_BITRATE_MODE:[I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 578
    const/4 v0, 0x0

    return v0

    .line 576
    :pswitch_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwQP()I

    move-result v0

    return v0

    .line 574
    :pswitch_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwCRF()I

    move-result v0

    return v0

    .line 572
    :pswitch_2
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBps()I

    move-result v0

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBps()I
    .locals 2

    .line 589
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_2

    .line 591
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 592
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHWEncodeBPS:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 595
    :cond_0
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 596
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeHWBPS:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 599
    :cond_1
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 600
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHWEncodeBPS:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 603
    :cond_2
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    return v0
.end method

.method public getCompileType()Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
    .locals 1

    .line 542
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-object v0
.end method

.method public getEncodeLevel()I
    .locals 1

    .line 721
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    return v0
.end method

.method public getEncodeProfile()I
    .locals 1

    .line 731
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    return v0
.end method

.method public getFps()I
    .locals 1

    .line 552
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    return v0
.end method

.method public getGopSize()I
    .locals 2

    .line 704
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_0

    .line 706
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 707
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeGOP:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 711
    :cond_0
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    return v0
.end method

.method public getResizeMode()I
    .locals 1

    .line 661
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    return v0
.end method

.method public getResizeX()F
    .locals 1

    .line 665
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    return v0
.end method

.method public getResizeY()F
    .locals 1

    .line 669
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    return v0
.end method

.method public getRotate()I
    .locals 1

    .line 657
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    return v0
.end method

.method public getSwCRF()I
    .locals 2

    .line 613
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_2

    .line 615
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 616
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWEncodeCRF:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 619
    :cond_0
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 620
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRF:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 623
    :cond_1
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 624
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWEncodeCRF:I

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 627
    :cond_2
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    return v0
.end method

.method public getSwQP()I
    .locals 1

    .line 637
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    return v0
.end method

.method public getUsage()I
    .locals 1

    .line 744
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    return v0
.end method

.method public getVideoRes()Lcom/ss/android/vesdk/VESize;
    .locals 1

    .line 647
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method

.method public isHwEnc()Z
    .locals 4

    .line 679
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_5

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_5

    .line 681
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 682
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordEncodeMode:I

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 685
    :cond_1
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    .line 686
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeMode:I

    if-ne v0, v2, :cond_2

    move v0, v2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 689
    :cond_3
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_5

    .line 690
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportEncodeMode:I

    if-ne v0, v2, :cond_4

    move v1, v2

    nop

    :cond_4
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 694
    :cond_5
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    return v0
.end method

.method public setBps(I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 767
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 768
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    .line 769
    return-void
.end method

.method public setCompileType(Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;)V
    .locals 0

    .line 873
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 874
    return-void
.end method

.method public setEncodeLevel(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;)V
    .locals 0

    .line 853
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    .line 854
    return-void
.end method

.method public setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)V
    .locals 0

    .line 863
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    .line 864
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 754
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    .line 755
    return-void
.end method

.method public setGopSize(I)V
    .locals 0

    .line 843
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    .line 844
    return-void
.end method

.method public setHwEnc(Z)V
    .locals 0

    .line 833
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    .line 834
    return-void
.end method

.method public setIsUseCloudConfig(Z)V
    .locals 0

    .line 937
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    .line 938
    return-void
.end method

.method public setQP(I)V
    .locals 1

    .line 917
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_QP:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 918
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 919
    return-void
.end method

.method public setResizeMode(I)V
    .locals 0

    .line 800
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    .line 801
    return-void
.end method

.method public setResizeX(F)V
    .locals 0

    .line 811
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    .line 812
    return-void
.end method

.method public setResizeY(F)V
    .locals 0

    .line 822
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    .line 823
    return-void
.end method

.method public setRotate(I)V
    .locals 0

    .line 790
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    .line 791
    return-void
.end method

.method public setSWCRF(I)V
    .locals 1

    .line 905
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 906
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    .line 907
    return-void
.end method

.method public setVideoBitrate(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;I)V
    .locals 1

    .line 885
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 886
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_0

    .line 887
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    goto :goto_0

    .line 888
    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_1

    .line 889
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    goto :goto_0

    .line 890
    :cond_1
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_QP:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_2

    .line 891
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    .line 893
    :cond_2
    :goto_0
    return-void
.end method

.method public setVideoRes(II)V
    .locals 1

    .line 779
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p1, v0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 780
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p2, p1, Lcom/ss/android/vesdk/VESize;->height:I

    .line 781
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 497
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 498
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 499
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 500
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 501
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 502
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 503
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 504
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 505
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 506
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 507
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 508
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 509
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 510
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeLevel:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 511
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStand:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 512
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 513
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 514
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 515
    iget p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->usage:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 516
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mIsUseCloudConfig:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 517
    return-void
.end method
