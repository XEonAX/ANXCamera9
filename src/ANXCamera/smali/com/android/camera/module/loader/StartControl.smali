.class public Lcom/android/camera/module/loader/StartControl;
.super Ljava/lang/Object;
.source "StartControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/StartControl$ViewConfigType;,
        Lcom/android/camera/module/loader/StartControl$StartDelay;,
        Lcom/android/camera/module/loader/StartControl$ResetType;
    }
.end annotation


# static fields
.field public static final RESET_TYPE_RETAIN:I = 0x2

.field public static final RESET_TYPE_SWITCH_CAMERA:I = 0x5

.field public static final RESET_TYPE_SWITCH_INTENT_CHANGED:I = 0x6

.field public static final RESET_TYPE_SWITCH_MODE:I = 0x4

.field public static final RESET_TYPE_TIME_OUT:I = 0x3

.field public static final START_IMMEDIATELY:I = 0x0

.field public static final START_WAIT_FOR_TOUCH:I = 0x12c
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIEW_CONFIG_JUST_CLEAR_NECESSARY:I = 0x3

.field public static final VIEW_CONFIG_SILENT:I = 0x1

.field public static final VIEW_CONFIG_WITH_ANIMATION:I = 0x2


# instance fields
.field public mFromScreenSlide:Z

.field public mNeedBlurAnimation:Z

.field public mNeedReConfigureCamera:Z

.field public mNeedReConfigureData:Z

.field public mResetType:I

.field public mStartDelay:I

.field public mTargetMode:I

.field public mViewConfigType:I


# direct methods
.method private constructor <init>(I)V
    .locals 2

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/loader/StartControl;->mStartDelay:I

    .line 81
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    .line 82
    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/module/loader/StartControl;->mViewConfigType:I

    .line 85
    iput-boolean v1, p0, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    .line 86
    iput-boolean v1, p0, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    .line 87
    iput-boolean v0, p0, Lcom/android/camera/module/loader/StartControl;->mFromScreenSlide:Z

    .line 91
    iput p1, p0, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 92
    return-void
.end method

.method public static final create(I)Lcom/android/camera/module/loader/StartControl;
    .locals 1

    .line 104
    new-instance v0, Lcom/android/camera/module/loader/StartControl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/StartControl;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public needNotifyUI()Z
    .locals 2

    .line 144
    iget v0, p0, Lcom/android/camera/module/loader/StartControl;->mViewConfigType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public saveWith(Lcom/android/camera/module/loader/StartControl;)Z
    .locals 2

    .line 155
    iget v0, p0, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    iget-boolean p1, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setFromScreenSlide(Z)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 138
    iput-boolean p1, p0, Lcom/android/camera/module/loader/StartControl;->mFromScreenSlide:Z

    .line 139
    return-object p0
.end method

.method public setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 118
    iput-boolean p1, p0, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    .line 119
    return-object p0
.end method

.method public setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 123
    iput-boolean p1, p0, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    .line 124
    return-object p0
.end method

.method public setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 128
    iput-boolean p1, p0, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    .line 129
    return-object p0
.end method

.method public setResetType(I)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 113
    iput p1, p0, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    .line 114
    return-object p0
.end method

.method public setStartDelay(I)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 108
    iput p1, p0, Lcom/android/camera/module/loader/StartControl;->mStartDelay:I

    .line 109
    return-object p0
.end method

.method public setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;
    .locals 0

    .line 133
    iput p1, p0, Lcom/android/camera/module/loader/StartControl;->mViewConfigType:I

    .line 134
    return-object p0
.end method
