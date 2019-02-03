.class public Lcom/android/camera2/autozoom/AutoZoomCaptureResult;
.super Ljava/lang/Object;
.source "AutoZoomCaptureResult.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAutoZoomActiveObjects:[I

.field private mAutoZoomAvailable:Z

.field private mAutoZoomBounds:[F

.field private mAutoZoomObjectBoundsStabilized:[F

.field private mAutoZoomObjectBoundsZoomed:[F

.field private mAutoZoomPausedObjects:[I

.field private mAutoZoomSelectedObjects:[I

.field private mAutoZoomStatus:I

.field private mAutoZoomTargetBoundsStabilized:[F

.field private mAutoZoomTargetBoundsZoomed:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-class v0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/hardware/camera2/CaptureResult;)V
    .locals 5

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomAvailable:Z

    .line 24
    iget-boolean v1, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomAvailable:Z

    if-eqz v1, :cond_2

    .line 26
    const/4 v1, 0x0

    :try_start_0
    sget-object v2, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STATUS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v2, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 27
    if-nez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :goto_0
    iput v2, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomStatus:I

    .line 28
    sget-object v2, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "autozoom status is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomStatus:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    sget-object v2, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->BOUNDS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v2, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [F

    iput-object v2, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    .line 31
    sget-object v2, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "autoZoomBound is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    iget-object v2, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    if-eqz v2, :cond_1

    .line 33
    sget-object v2, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bounds left "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " top "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    aget v0, v4, v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " right "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    const/4 v4, 0x2

    aget v0, v0, v4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " bottom "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    const/4 v4, 0x3

    aget v0, v0, v4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_1
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomTargetBoundsStabilized:[F

    .line 37
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomTargetBoundsZoomed:[F

    .line 39
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->ACTIVE_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomActiveObjects:[I

    .line 40
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECTED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomSelectedObjects:[I

    .line 41
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->PAUSED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomPausedObjects:[I

    .line 43
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomObjectBoundsStabilized:[F

    .line 44
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomObjectBoundsZoomed:[F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    goto :goto_1

    .line 45
    :catch_0
    move-exception p1

    .line 46
    iput-boolean v1, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomAvailable:Z

    .line 47
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->TAG:Ljava/lang/String;

    const-string v1, "Could not read AutoZoom tags from CaptureResult. This instance of Device will not try to read AutoZoom tags from subsequent results"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    :cond_2
    :goto_1
    return-void
.end method

.method private getAutoZoomResult(Lcom/android/camera2/autozoom/AutoZoomTags$TAG;Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Object;
    .locals 2

    .line 89
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Class;

    invoke-static {v0, p1}, Lcom/android/camera2/autozoom/RequestKeyCreator;->resultKey(Ljava/lang/String;Ljava/lang/Class;)Landroid/hardware/camera2/CaptureResult$Key;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getAutoZoomActiveObjects()[I
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomActiveObjects:[I

    return-object v0
.end method

.method public getAutoZoomBounds()[F
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomBounds:[F

    return-object v0
.end method

.method public getAutoZoomObjectBoundsStabilized()[F
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomObjectBoundsStabilized:[F

    return-object v0
.end method

.method public getAutoZoomObjectBoundsZoomed()[F
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomObjectBoundsZoomed:[F

    return-object v0
.end method

.method public getAutoZoomPausedObjects()[I
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomPausedObjects:[I

    return-object v0
.end method

.method public getAutoZoomSelectedObjects()[I
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomSelectedObjects:[I

    return-object v0
.end method

.method public getAutoZoomStatus()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomStatus:I

    return v0
.end method

.method public getAutoZoomTargetBoundsStabilized()[F
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomTargetBoundsStabilized:[F

    return-object v0
.end method

.method public getAutoZoomTargetBoundsZoomed()[F
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->mAutoZoomTargetBoundsZoomed:[F

    return-object v0
.end method
