.class public Lcom/android/camera/data/data/config/ComponentConfigFlash;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigFlash.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field public static final FLASH_VALUE_AUTO:Ljava/lang/String; = "3"

.field public static final FLASH_VALUE_OFF:Ljava/lang/String; = "0"

.field public static final FLASH_VALUE_ON:Ljava/lang/String; = "1"

.field public static final FLASH_VALUE_SCREEN_LIGHT_AUTO:Ljava/lang/String; = "103"

.field public static final FLASH_VALUE_SCREEN_LIGHT_ON:Ljava/lang/String; = "101"

.field public static final FLASH_VALUE_TORCH:Ljava/lang/String; = "2"


# instance fields
.field private mFlashValuesForSceneMode:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsClosed:Z

.field private mIsHardwareSupported:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 5

    .line 55
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 44
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mFlashValuesForSceneMode:Landroid/util/SparseArray;

    .line 56
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    .line 57
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v0, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result v1

    .line 58
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result v2

    const-string v3, "0"

    const v4, 0x7f090062

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 57
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    return-void
.end method

.method private getComponentValueInternal(I)Ljava/lang/String;
    .locals 2

    .line 121
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 122
    const-string v1, "pref_camera_scenemode_setting_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    .line 123
    if-eqz v1, :cond_0

    .line 124
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningSceneValue()Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 125
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 127
    return-object v0

    .line 130
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getFlashAutoRes()I
    .locals 1

    .line 285
    const v0, 0x7f02012d

    return v0
.end method

.method private getFlashOffRes()I
    .locals 1

    .line 281
    const v0, 0x7f02012e

    return v0
.end method

.method private getFlashOnRes()I
    .locals 1

    .line 277
    const v0, 0x7f02012f

    return v0
.end method

.method private getFlashTorchRes()I
    .locals 1

    .line 289
    const v0, 0x7f020130

    return v0
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .line 294
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    .line 295
    return-void
.end method

.method public disableUpdate()Z
    .locals 1

    .line 108
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->thermalConstrained()Z

    move-result v0

    return v0
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 1

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    const-string p1, "0"

    return-object p1

    .line 100
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 101
    const-string p1, "0"

    return-object p1

    .line 103
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValueInternal(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 92
    const-string p1, "0"

    return-object p1
.end method

.method public getDisableReasonString()I
    .locals 1

    .line 113
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    const v0, 0x7f090226

    return v0

    .line 116
    :cond_0
    const v0, 0x7f090227

    return v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 65
    const v0, 0x7f09005f

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 154
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    .line 70
    const/16 v0, 0xac

    if-eq p1, v0, :cond_0

    const/16 v0, 0xae

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 73
    const-string p1, "pref_camera_flashmode_key"

    return-object p1

    .line 85
    :pswitch_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "unspecified flash"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 82
    :cond_0
    :pswitch_1
    const-string p1, "pref_camera_video_flashmode_key"

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 0

    .line 143
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getValueSelectedDrawableIgnoreClose(I)I
    .locals 1

    .line 257
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 258
    const-string v0, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p1

    return p1

    .line 260
    :cond_0
    const-string v0, "3"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 261
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result p1

    return p1

    .line 262
    :cond_1
    const-string v0, "0"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 263
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result p1

    return p1

    .line 264
    :cond_2
    const-string v0, "2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 265
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p1

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashTorchRes()I

    move-result p1

    :goto_0
    return p1

    .line 266
    :cond_4
    const-string v0, "103"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 267
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result p1

    return p1

    .line 268
    :cond_5
    const-string v0, "101"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 269
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p1

    return p1

    .line 272
    :cond_6
    const/4 p1, -0x1

    return p1
.end method

.method public getValueSelectedStringIdIgnoreClose(I)I
    .locals 3

    .line 303
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 304
    const-string v0, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const v1, 0x7f0900dd

    if-eqz v0, :cond_0

    .line 305
    return v1

    .line 306
    :cond_0
    const-string v0, "3"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const v2, 0x7f0900de

    if-eqz v0, :cond_1

    .line 307
    return v2

    .line 308
    :cond_1
    const-string v0, "0"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 309
    const p1, 0x7f0900df

    return p1

    .line 310
    :cond_2
    const-string v0, "2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 311
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const v1, 0x7f0900e0

    :goto_0
    return v1

    .line 312
    :cond_4
    const-string v0, "103"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 313
    return v2

    .line 314
    :cond_5
    const-string v0, "101"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 315
    return v1

    .line 317
    :cond_6
    const/4 p1, -0x1

    return p1
.end method

.method public isClosed()Z
    .locals 1

    .line 47
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    return v0
.end method

.method public isHardwareSupported()Z
    .locals 1

    .line 330
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsHardwareSupported:Z

    return v0
.end method

.method public isValidFlashValue(Ljava/lang/String;)Z
    .locals 1

    .line 326
    const-string v0, "^[0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/config/ComponentConfigUltraWide;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/config/ComponentConfigUltraWide;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 159
    iget-object p4, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    if-nez p4, :cond_0

    .line 160
    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    iput-object p4, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    goto :goto_0

    .line 162
    :cond_0
    iget-object p4, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    invoke-interface {p4}, Ljava/util/List;->clear()V

    .line 167
    :goto_0
    const/16 p4, 0xa6

    const/16 v0, 0xab

    if-eq p1, p4, :cond_1

    if-eq p1, v0, :cond_1

    const/16 p4, 0xad

    if-eq p1, p4, :cond_1

    goto :goto_1

    .line 171
    :cond_1
    if-nez p2, :cond_2

    .line 172
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object p1

    .line 177
    :cond_2
    :goto_1
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isFlashSupported()Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsHardwareSupported:Z

    .line 178
    iget-boolean p3, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsHardwareSupported:Z

    const p4, 0x7f090060

    const v1, 0x7f090062

    const v2, 0x7f090061

    if-nez p3, :cond_5

    .line 179
    const/4 p3, 0x1

    if-ne p2, p3, :cond_4

    .line 180
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 181
    const/16 p2, 0xa3

    if-eq p1, p2, :cond_3

    const/16 p2, 0xa5

    if-eq p1, p2, :cond_3

    if-ne p1, v0, :cond_4

    .line 184
    :cond_3
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result p3

    .line 185
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result v0

    const-string v3, "0"

    invoke-direct {p2, p3, v0, v1, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 184
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result p3

    .line 189
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result v0

    const-string v1, "103"

    invoke-direct {p2, p3, v0, p4, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 188
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p3

    .line 193
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p4

    const-string v0, "101"

    invoke-direct {p2, p3, p4, v2, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 192
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    :cond_4
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object p1

    .line 201
    :cond_5
    iget-object p2, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p3, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result v0

    .line 202
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOffRes()I

    move-result v3

    const-string v4, "0"

    invoke-direct {p3, v0, v3, v1, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 201
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    const/16 p2, 0xac

    const p3, 0x7f090063

    if-eq p1, p2, :cond_8

    const/16 p2, 0xae

    if-eq p1, p2, :cond_8

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 210
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result v0

    .line 211
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashAutoRes()I

    move-result v1

    const-string v3, "3"

    invoke-direct {p2, v0, v1, p4, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 210
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 215
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p4

    .line 216
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result v0

    const-string v1, "1"

    invoke-direct {p2, p4, v0, v2, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 215
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-static {}, Lcom/mi/config/b;->hF()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 221
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p3

    .line 222
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashOnRes()I

    move-result p4

    const-string v0, "2"

    invoke-direct {p2, p3, p4, v2, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 221
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 225
    :cond_7
    invoke-static {}, Lcom/mi/config/b;->gN()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 226
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashTorchRes()I

    move-result p4

    .line 227
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashTorchRes()I

    move-result v0

    const-string v1, "2"

    invoke-direct {p2, p4, v0, p3, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 226
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 240
    :cond_8
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashTorchRes()I

    move-result p4

    .line 241
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getFlashTorchRes()I

    move-result v0

    const-string v1, "2"

    invoke-direct {p2, p4, v0, p3, v1}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    .line 240
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_9
    :goto_2
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setClosed(Z)V
    .locals 0

    .line 51
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    .line 52
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1

    .line 148
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setClosed(Z)V

    .line 149
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 150
    return-void
.end method

.method public setSceneModeFlashValue(ILjava/lang/String;)V
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mFlashValuesForSceneMode:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 135
    return-void
.end method
