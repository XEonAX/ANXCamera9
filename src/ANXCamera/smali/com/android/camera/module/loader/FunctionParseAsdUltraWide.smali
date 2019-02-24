.class public Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;
.super Ljava/lang/Object;
.source "FunctionParseAsdUltraWide.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Landroid/hardware/camera2/CaptureResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final ULTRA_WIDE_RECOM:[I

.field public static final ULTRA_WIDE_SIDEFACE_TYPE:I = 0x2

.field public static final ULTRA_WIDE_TOWER_BUILDING_TYPE:I = 0x1


# instance fields
.field private mIsOpenUltraWide:Z

.field private mIsSupportUltraWide:Z

.field private mUltraWideStatus:Z

.field private mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    .line 30
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsSupportUltraWide:Z

    .line 31
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p1

    .line 32
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltraWideStatus:Z

    .line 33
    return-void
.end method

.method private isOpenUltraWide(I)Z
    .locals 4

    .line 63
    nop

    .line 64
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    sget-object v3, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 65
    sget-object v2, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    aget v2, v2, v1

    if-ne v2, p1, :cond_0

    .line 66
    const/4 v2, 0x1

    goto :goto_1

    .line 65
    :cond_0
    nop

    .line 66
    move v2, v0

    :goto_1
    if-eqz v2, :cond_1

    .line 67
    return v2

    .line 64
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_2
    return v2
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 37
    iget-boolean v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsSupportUltraWide:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltraWideStatus:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;

    .line 42
    if-nez v0, :cond_1

    .line 43
    return-object p1

    .line 46
    :cond_1
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->isUltraWideDetectStarted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 47
    return-object p1

    .line 50
    :cond_2
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getUltraWideDetectedResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v1

    .line 51
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->isOpenUltraWide(I)Z

    move-result v2

    .line 52
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    if-ne v3, v2, :cond_3

    .line 54
    return-object p1

    .line 56
    :cond_3
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    .line 57
    invoke-interface {v0, v2, v1}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->onUltraWideChanged(ZI)V

    .line 59
    return-object p1

    .line 39
    :cond_4
    :goto_0
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
