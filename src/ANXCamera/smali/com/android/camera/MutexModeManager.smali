.class public Lcom/android/camera/MutexModeManager;
.super Ljava/lang/Object;
.source "MutexModeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/MutexModeManager$MutexCallBack;,
        Lcom/android/camera/MutexModeManager$MutexMode;
    }
.end annotation


# static fields
.field public static final MUTEX_AOHDR:I = 0x2

.field public static final MUTEX_BURST_SHOOT:I = 0x7

.field public static final MUTEX_GROUP:I = 0x9

.field public static final MUTEX_HAND_NIGHT:I = 0x3

.field public static final MUTEX_MORPHO_HDR:I = 0x1

.field public static final MUTEX_NONE:I = 0x0

.field public static final MUTEX_RAW:I = 0x4

.field public static final MUTEX_SCENE_HDR:I = 0x5

.field public static final MUTEX_STEREO:I = 0x8

.field public static final MUTEX_SUPER_RESOLUTION:I = 0xa

.field public static final MUTEX_UBI_FOCUS:I = 0x6


# instance fields
.field private mCurrentMutexMode:I

.field private mIsMandatory:Z

.field private mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;


# direct methods
.method public constructor <init>(Lcom/android/camera/MutexModeManager$MutexCallBack;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 46
    iput-object p1, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    .line 47
    return-void
.end method

.method private enter(I)V
    .locals 1

    .line 200
    if-nez p1, :cond_0

    .line 201
    return-void

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    if-nez v0, :cond_1

    .line 205
    return-void

    .line 208
    :cond_1
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-ne v0, p1, :cond_2

    .line 209
    return-void

    .line 212
    :cond_2
    iput p1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 214
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    invoke-interface {v0, p1}, Lcom/android/camera/MutexModeManager$MutexCallBack;->enterMutexMode(I)V

    .line 215
    return-void
.end method

.method private exit(I)V
    .locals 1

    .line 186
    if-nez p1, :cond_0

    .line 187
    return-void

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    if-nez v0, :cond_1

    .line 191
    return-void

    .line 194
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 196
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    invoke-interface {v0, p1}, Lcom/android/camera/MutexModeManager$MutexCallBack;->exitMutexMode(I)V

    .line 197
    return-void
.end method

.method private switchMutexMode(II)V
    .locals 0

    .line 218
    if-eq p1, p2, :cond_0

    .line 219
    invoke-direct {p0, p1}, Lcom/android/camera/MutexModeManager;->exit(I)V

    .line 220
    invoke-direct {p0, p2}, Lcom/android/camera/MutexModeManager;->enter(I)V

    .line 222
    :cond_0
    return-void
.end method


# virtual methods
.method public clearMandatoryFlag()V
    .locals 1

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 56
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 150
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 159
    const-string v0, ""

    return-object v0

    .line 157
    :pswitch_0
    const-string v0, "HHT"

    return-object v0

    .line 152
    :pswitch_1
    const-string v0, "AO_HDR"

    return-object v0

    .line 155
    :cond_0
    :pswitch_2
    const-string v0, "HDR"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getMutexMode()I
    .locals 1

    .line 78
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    return v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 2

    .line 164
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 165
    const-string v0, "_RAW"

    return-object v0

    .line 167
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hC()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isForceNameSuffix()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 180
    :cond_1
    const-string v0, ""

    return-object v0

    .line 168
    :cond_2
    :goto_0
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3

    packed-switch v0, :pswitch_data_0

    .line 177
    const-string v0, ""

    return-object v0

    .line 175
    :pswitch_0
    const-string v0, "_HHT"

    return-object v0

    .line 170
    :pswitch_1
    const-string v0, "_AO_HDR"

    return-object v0

    .line 173
    :cond_3
    :pswitch_2
    const-string v0, "_HDR"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public inMandatoryMode()Z
    .locals 1

    .line 59
    iget-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    return v0
.end method

.method public isAoHdr()Z
    .locals 2

    .line 102
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBurstShoot()Z
    .locals 2

    .line 128
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGroupShot()Z
    .locals 2

    .line 142
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isHandNight()Z
    .locals 2

    .line 138
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isHdr()Z
    .locals 3

    .line 114
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v2, 0x5

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    :cond_1
    :goto_0
    return v1
.end method

.method public isMorphoHdr()Z
    .locals 2

    .line 106
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isNeedComposed()Z
    .locals 2

    .line 132
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNormal()Z
    .locals 1

    .line 98
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRAW()Z
    .locals 2

    .line 124
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSceneHdr()Z
    .locals 2

    .line 120
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSuperResolution()Z
    .locals 2

    .line 146
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSupportedFlashOn()Z
    .locals 2

    .line 83
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSupportedTorch()Z
    .locals 2

    .line 89
    invoke-static {}, Lcom/mi/config/b;->gv()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUbiFocus()Z
    .locals 2

    .line 110
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public resetMutexMode()V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 73
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 74
    return-void
.end method

.method public setMutexMode(I)V
    .locals 1
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 66
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 67
    return-void
.end method

.method public setMutexModeMandatory(I)V
    .locals 1

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 51
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 52
    return-void
.end method
