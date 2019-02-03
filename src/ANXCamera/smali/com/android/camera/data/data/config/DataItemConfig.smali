.class public Lcom/android/camera/data/data/config/DataItemConfig;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemConfig.java"


# static fields
.field public static final DATA_COMMON_AI_SCENE:Ljava/lang/String; = "pref_camera_ai_scene_mode_key"

.field public static final DATA_CONFIG_BEAUTY:Ljava/lang/String; = "pref_camera_face_beauty_key"

.field public static final DATA_CONFIG_EYE_LIGHT_TYPE:Ljava/lang/String; = "pref_eye_light_type_key"

.field public static final DATA_CONFIG_FOCUS_MODE:Ljava/lang/String; = "pref_camera_focus_mode_key"

.field public static final DATA_CONFIG_FOCUS_SWITCHING:Ljava/lang/String; = "pref_qc_focus_mode_switching_key"

.field public static final DATA_CONFIG_RATIO:Ljava/lang/String; = "pref_camera_picturesize_key"

.field public static final DATA_CONFIG_STICKER_PATH:Ljava/lang/String; = "pref_sticker_path_key"

.field public static final DATA_CONFIG_VIDEO_BEAUTY:Ljava/lang/String; = "pref_video_face_beauty_key"

.field public static final DATA_CONFIG_VIDEO_BOKEH:Ljava/lang/String; = "pref_video_bokeh_key"

.field public static final KEY:Ljava/lang/String; = "camera_settings_simple_mode_local_"


# instance fields
.field private final mBeautyBody:Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

.field private mCameraId:I

.field private mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

.field private mComponentConfigUltraWide:Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

.field private mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

.field private mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

.field private mFrontUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

.field private mIntentType:I

.field private mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

.field private mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

.field private mRearUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

.field private mSlowMotion:Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 73
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    .line 74
    iput p1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    .line 75
    iput p2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mIntentType:I

    .line 77
    new-instance p2, Lcom/android/camera/data/data/config/ComponentConfigFlash;

    invoke-direct {p2, p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object p2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    .line 78
    new-instance p2, Lcom/android/camera/data/data/config/ComponentConfigHdr;

    invoke-direct {p2, p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object p2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    .line 79
    new-instance p2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;I)V

    iput-object p2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    .line 80
    new-instance p1, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    invoke-direct {p1, p0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object p1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mSlowMotion:Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    .line 81
    new-instance p1, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    invoke-direct {p1, p0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object p1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mBeautyBody:Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    .line 82
    return-void
.end method

.method public static provideLocalId(II)I
    .locals 0

    .line 85
    if-nez p1, :cond_0

    .line 86
    return p0

    .line 88
    :cond_0
    add-int/lit8 p0, p0, 0x64

    return p0
.end method


# virtual methods
.method public getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    return-object v0
.end method

.method public getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mBeautyBody:Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    return-object v0
.end method

.method public getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mSlowMotion:Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    return-object v0
.end method

.method public getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigUltraWide:Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    if-nez v0, :cond_0

    .line 277
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigUltraWide:Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigUltraWide:Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    return-object v0
.end method

.method public getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    return-object v0
.end method

.method public getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    return-object v0
.end method

.method public getFrontComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mFrontUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    if-nez v0, :cond_0

    .line 151
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mFrontUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mFrontUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    return-object v0
.end method

.method public getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    if-nez v0, :cond_0

    .line 137
    new-instance v0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    return-object v0
.end method

.method public getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    return-object v0
.end method

.method public getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mRearUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mRearUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mRearUltraPixel:Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    return-object v0
.end method

.method public isSwitchOn(Ljava/lang/String;)Z
    .locals 1

    .line 254
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public isTransient()Z
    .locals 1

    .line 99
    const/4 v0, 0x0

    return v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 3

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "camera_settings_simple_mode_local_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    iget v2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mIntentType:I

    invoke-static {v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public reConfigFlashIfHdrChanged(ILjava/lang/String;)Z
    .locals 5

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    .line 174
    nop

    .line 175
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x3df94319

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v1, v2, :cond_4

    const/16 v2, 0xddf

    if-eq v1, v2, :cond_3

    const v2, 0x1ad6f

    if-eq v1, v2, :cond_2

    const v2, 0x2dddaf

    if-eq v1, v2, :cond_1

    const v2, 0x32b0ec

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "live"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 p2, 0x3

    goto :goto_1

    :cond_1
    const-string v1, "auto"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    move p2, v4

    goto :goto_1

    :cond_2
    const-string v1, "off"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 p2, 0x4

    goto :goto_1

    :cond_3
    const-string v1, "on"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    move p2, v3

    goto :goto_1

    :cond_4
    const-string v1, "normal"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 p2, 0x2

    goto :goto_1

    :cond_5
    :goto_0
    const/4 p2, -0x1

    :goto_1
    packed-switch p2, :pswitch_data_0

    goto :goto_3

    .line 188
    :pswitch_0
    const-string p2, "0"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9

    .line 189
    const-string p2, "0"

    goto :goto_4

    .line 177
    :pswitch_1
    const-string p2, "1"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    const-string p2, "2"

    .line 178
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    goto :goto_2

    .line 181
    :cond_6
    const-string p2, "101"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 182
    const-string p2, "103"

    goto :goto_4

    .line 179
    :cond_7
    :goto_2
    invoke-static {}, Lcom/mi/config/b;->gB()Z

    move-result p2

    if-eqz p2, :cond_8

    .line 180
    const-string p2, "3"

    goto :goto_4

    :cond_8
    const-string p2, "0"

    goto :goto_4

    .line 197
    :cond_9
    :goto_3
    const/4 p2, 0x0

    :goto_4
    if-eqz p2, :cond_c

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_5

    .line 200
    :cond_a
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setComponentValue(ILjava/lang/String;)V

    .line 201
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 202
    return v4

    .line 204
    :cond_b
    return v3

    .line 198
    :cond_c
    :goto_5
    return v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public reConfigHhrIfFlashChanged(ILjava/lang/String;)Z
    .locals 2

    .line 211
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    .line 212
    nop

    .line 213
    const-string v1, "3"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "103"

    .line 214
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 220
    :cond_0
    const-string v1, "1"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "101"

    .line 221
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 225
    :cond_1
    const-string v1, "2"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 226
    const-string p2, "live"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "off"

    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    .line 228
    const-string p2, "off"

    goto :goto_3

    .line 222
    :cond_2
    :goto_0
    const-string p2, "off"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    .line 223
    const-string p2, "off"

    goto :goto_3

    .line 215
    :cond_3
    :goto_1
    const-string p2, "normal"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5

    const-string p2, "live"

    .line 216
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_2

    .line 232
    :cond_4
    const/4 p2, 0x0

    goto :goto_3

    .line 217
    :cond_5
    :goto_2
    invoke-static {}, Lcom/mi/config/b;->gD()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 218
    const-string p2, "auto"

    goto :goto_3

    :cond_6
    const-string p2, "off"

    .line 232
    :goto_3
    const/4 v1, 0x0

    if-eqz p2, :cond_9

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_4

    .line 235
    :cond_7
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setComponentValue(ILjava/lang/String;)V

    .line 237
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 238
    return v1

    .line 240
    :cond_8
    const/4 p1, 0x1

    return p1

    .line 233
    :cond_9
    :goto_4
    return v1
.end method

.method public reInitComponent(ILcom/android/camera2/CameraCapabilities;)V
    .locals 3

    .line 103
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;

    .line 104
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object v2

    invoke-virtual {v0, p1, v1, p2, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->reInit(IILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/config/ComponentConfigUltraWide;)Ljava/util/List;

    .line 105
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;

    .line 106
    return-void
.end method

.method public resetAll()V
    .locals 1

    .line 246
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 247
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->clearClosed()V

    .line 248
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->clearClosed()V

    .line 249
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->clearClosed()V

    .line 251
    return-void
.end method

.method public supportFlash()Z
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public supportHdr()Z
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public switchOff(Ljava/lang/String;)V
    .locals 1

    .line 272
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 273
    return-void
.end method

.method public switchOn(Ljava/lang/String;)V
    .locals 1

    .line 268
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 269
    return-void
.end method

.method public triggerSwitchAndGet(Ljava/lang/String;)Z
    .locals 1

    .line 258
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->switchOff(Ljava/lang/String;)V

    .line 260
    const/4 p1, 0x0

    return p1

    .line 262
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->switchOn(Ljava/lang/String;)V

    .line 263
    const/4 p1, 0x1

    return p1
.end method
