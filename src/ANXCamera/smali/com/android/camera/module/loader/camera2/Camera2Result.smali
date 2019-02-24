.class public Lcom/android/camera/module/loader/camera2/Camera2Result;
.super Ljava/lang/Object;
.source "Camera2Result.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/Camera2Result$Camera2ResultType;
    }
.end annotation


# static fields
.field public static final RESULT_ERROR:I = 0x3

.field public static final RESULT_OPEN_NEW_OK:I = 0x2


# instance fields
.field private mCameraError:I

.field private mResult:I
    .annotation build Lcom/android/camera/module/loader/camera2/Camera2Result$Camera2ResultType;
    .end annotation
.end field


# direct methods
.method private constructor <init>(I)V
    .locals 0
    .param p1    # I
        .annotation build Lcom/android/camera/module/loader/camera2/Camera2Result$Camera2ResultType;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput p1, p0, Lcom/android/camera/module/loader/camera2/Camera2Result;->mResult:I

    .line 27
    return-void
.end method

.method public static create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;
    .locals 1
    .param p0    # I
        .annotation build Lcom/android/camera/module/loader/camera2/Camera2Result$Camera2ResultType;
        .end annotation
    .end param

    .line 30
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2Result;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public getCameraError()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2Result;->mCameraError:I

    return v0
.end method

.method public getResult()I
    .locals 1
    .annotation build Lcom/android/camera/module/loader/camera2/Camera2Result$Camera2ResultType;
    .end annotation

    .line 39
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2Result;->mResult:I

    return v0
.end method

.method public setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;
    .locals 0

    .line 34
    iput p1, p0, Lcom/android/camera/module/loader/camera2/Camera2Result;->mCameraError:I

    .line 35
    return-object p0
.end method
