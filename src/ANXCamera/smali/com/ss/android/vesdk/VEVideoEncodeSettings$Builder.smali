.class public Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
.super Ljava/lang/Object;
.source "VEVideoEncodeSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


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
.method public constructor <init>()V
    .locals 4

    .line 945
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 952
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 960
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->rotate:I

    .line 967
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeMode:I

    .line 974
    const/4 v1, 0x0

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeX:F

    .line 981
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeY:F

    .line 988
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->speed:F

    .line 995
    new-instance v1, Lcom/ss/android/vesdk/VESize;

    const/16 v2, 0x240

    const/16 v3, 0x400

    invoke-direct {v1, v2, v3}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->outputSize:Lcom/ss/android/vesdk/VESize;

    .line 1002
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 1010
    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bps:I

    .line 1019
    const/16 v1, 0xf

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swCRF:I

    .line 1028
    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swQP:I

    .line 1035
    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->fps:I

    .line 1042
    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->gopSize:I

    .line 1049
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeLevel:I

    .line 1056
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeStand:I

    .line 1063
    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeProfile:I

    .line 1070
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->useHWEncoder:Z

    .line 1077
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->hasBFrame:Z

    .line 1087
    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->usage:I

    .line 1094
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsUseCloudConfig:Z

    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    .line 945
    iget-object p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->outputSize:Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z
    .locals 0

    .line 945
    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->useHWEncoder:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->rotate:I

    return p0
.end method

.method static synthetic access$1100(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeProfile:I

    return p0
.end method

.method static synthetic access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeStand:I

    return p0
.end method

.method static synthetic access$1300(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeMode:I

    return p0
.end method

.method static synthetic access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeX:F

    return p0
.end method

.method static synthetic access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeY:F

    return p0
.end method

.method static synthetic access$1600(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)F
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->speed:F

    return p0
.end method

.method static synthetic access$1700(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->usage:I

    return p0
.end method

.method static synthetic access$1800(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z
    .locals 0

    .line 945
    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsUseCloudConfig:Z

    return p0
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 0

    .line 945
    iget-object p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->fps:I

    return p0
.end method

.method static synthetic access$400(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swQP:I

    return p0
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swCRF:I

    return p0
.end method

.method static synthetic access$600(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->gopSize:I

    return p0
.end method

.method static synthetic access$700(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bps:I

    return p0
.end method

.method static synthetic access$800(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)I
    .locals 0

    .line 945
    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeLevel:I

    return p0
.end method

.method static synthetic access$900(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;)Z
    .locals 0

    .line 945
    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->hasBFrame:Z

    return p0
.end method


# virtual methods
.method public build()Lcom/ss/android/vesdk/VEVideoEncodeSettings;
    .locals 2

    .line 1325
    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;)V

    return-object v0
.end method

.method public isUseCloudConfig(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1314
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsUseCloudConfig:Z

    .line 1315
    return-object p0
.end method

.method public setBps(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1137
    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 1138
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bps:I

    .line 1139
    return-object p0
.end method

.method public setCompileType(Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 1280
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 1281
    return-object p0
.end method

.method public setEncodeLevel(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 1258
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_LEVEL;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeLevel:I

    .line 1259
    return-object p0
.end method

.method public setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 1269
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->encodeProfile:I

    .line 1270
    return-object p0
.end method

.method public setFps(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1103
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->fps:I

    .line 1104
    return-object p0
.end method

.method public setGopSize(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1247
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->gopSize:I

    .line 1248
    return-object p0
.end method

.method public setHwEnc(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1236
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->useHWEncoder:Z

    .line 1237
    return-object p0
.end method

.method public setResizeMode(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1200
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeMode:I

    .line 1201
    return-object p0
.end method

.method public setResizeX(F)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1212
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeX:F

    .line 1213
    return-object p0
.end method

.method public setResizeY(F)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1224
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->resizeY:F

    .line 1225
    return-object p0
.end method

.method public setRotate(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1189
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->rotate:I

    .line 1190
    return-object p0
.end method

.method public setUsage(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 0

    .line 1293
    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->usage:I

    .line 1294
    return-object p0
.end method

.method public setVideoBitrate(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    .line 1116
    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 1117
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_0

    .line 1118
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bps:I

    goto :goto_0

    .line 1119
    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_1

    .line 1120
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swCRF:I

    goto :goto_0

    .line 1121
    :cond_1
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_QP:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    if-ne p1, v0, :cond_2

    .line 1122
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->swQP:I

    .line 1124
    :cond_2
    :goto_0
    return-object p0
.end method

.method public setVideoRes(II)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    .line 1177
    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p1, v0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 1178
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p2, p1, Lcom/ss/android/vesdk/VESize;->height:I

    .line 1179
    return-object p0
.end method
