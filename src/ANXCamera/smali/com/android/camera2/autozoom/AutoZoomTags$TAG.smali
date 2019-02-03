.class public final enum Lcom/android/camera2/autozoom/AutoZoomTags$TAG;
.super Ljava/lang/Enum;
.source "AutoZoomTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/autozoom/AutoZoomTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TAG"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/camera2/autozoom/AutoZoomTags$TAG;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum ACTIVE_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum APPLY_IN_PREVIEW:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum BOUNDS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum CENTER_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum DELAYED_TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum DELAYED_TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum FORCE_LOCK:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum MINIMUM_SCALING:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum MODE:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum OBJECT_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum OBJECT_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum PAUSED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum SCALE_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum SELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum SELECTED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum START:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum STATUS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum STOP:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

.field public static final enum UNSELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;


# instance fields
.field private final mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 15
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "MODE"

    const-string v2, "com.vidhance.autozoom.mode"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MODE:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 16
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "APPLY_IN_PREVIEW"

    const-string v2, "com.vidhance.autozoom.applyinpreview"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->APPLY_IN_PREVIEW:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 17
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "MINIMUM_SCALING"

    const-string v2, "com.vidhance.autozoom.minimumscaling"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MINIMUM_SCALING:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 20
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "STOP"

    const-string v2, "com.vidhance.autozoom.stop"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STOP:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 21
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "START"

    const-string v2, "com.vidhance.autozoom.start_region"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->START:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 22
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "SELECT"

    const-string v2, "com.vidhance.autozoom.select"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 23
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "UNSELECT"

    const-string v2, "com.vidhance.autozoom.unselect"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->UNSELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 24
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "FORCE_LOCK"

    const-string v2, "com.vidhance.autozoom.force_lock"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->FORCE_LOCK:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 25
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "CENTER_OFFSET"

    const-string v2, "com.vidhance.autozoom.center_offset"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->CENTER_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 26
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "SCALE_OFFSET"

    const-string v2, "com.vidhance.autozoom.scale_offset"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SCALE_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 29
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "BOUNDS"

    const-string v2, "com.vidhance.autozoom.bounds"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->BOUNDS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 30
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "TARGET_BOUNDS_STABILIZED"

    const-string v2, "com.vidhance.autozoom.target_bounds_stabilized"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 31
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "TARGET_BOUNDS_ZOOMED"

    const-string v2, "com.vidhance.autozoom.target_bounds_zoomed"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 32
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "STATUS"

    const-string v2, "com.vidhance.autozoom.status"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STATUS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 33
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "ACTIVE_OBJECTS"

    const-string v2, "com.vidhance.autozoom.active_objects"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->ACTIVE_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 34
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "SELECTED_OBJECTS"

    const-string v2, "com.vidhance.autozoom.selected_objects"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECTED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 35
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "PAUSED_OBJECTS"

    const-string v2, "com.vidhance.autozoom.paused_objects"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->PAUSED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 36
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "OBJECT_BOUNDS_STABILIZED"

    const-string v2, "com.vidhance.autozoom.object_bounds_stabilized"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 37
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "OBJECT_BOUNDS_ZOOMED"

    const-string v2, "com.vidhance.autozoom.object_bounds_zoomed"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 38
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "DELAYED_TARGET_BOUNDS_STABILIZED"

    const-string v2, "com.vidhance.autozoom.delayed_target_bounds_stabilized"

    const/16 v15, 0x13

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 39
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-string v1, "DELAYED_TARGET_BOUNDS_ZOOMED"

    const-string v2, "com.vidhance.autozoom.delayed_target_bounds_zoomed"

    const/16 v15, 0x14

    invoke-direct {v0, v1, v15, v2}, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    .line 13
    const/16 v0, 0x15

    new-array v0, v0, [Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MODE:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->APPLY_IN_PREVIEW:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MINIMUM_SCALING:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STOP:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->START:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v7

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v8

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->UNSELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v9

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->FORCE_LOCK:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v10

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->CENTER_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v11

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SCALE_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v12

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->BOUNDS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v13

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    aput-object v1, v0, v14

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STATUS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->ACTIVE_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECTED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->PAUSED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->$VALUES:[Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 44
    iput-object p3, p0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->mName:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/camera2/autozoom/AutoZoomTags$TAG;
    .locals 1

    .line 13
    const-class v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    return-object p0
.end method

.method public static values()[Lcom/android/camera2/autozoom/AutoZoomTags$TAG;
    .locals 1

    .line 13
    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->$VALUES:[Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    invoke-virtual {v0}, [Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    return-object v0
.end method


# virtual methods
.method public toCaptureRequestKey()Landroid/hardware/camera2/CaptureRequest$Key;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->mName:Ljava/lang/String;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-static {v0, v1}, Lcom/android/camera2/autozoom/RequestKeyCreator;->requestKey(Ljava/lang/String;Ljava/lang/Class;)Landroid/hardware/camera2/CaptureRequest$Key;

    move-result-object v0

    return-object v0
.end method

.method public toCaptureResultKey()Landroid/hardware/camera2/CaptureResult$Key;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "TT;>;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->mName:Ljava/lang/String;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-static {v0, v1}, Lcom/android/camera2/autozoom/RequestKeyCreator;->resultKey(Ljava/lang/String;Ljava/lang/Class;)Landroid/hardware/camera2/CaptureResult$Key;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->mName:Ljava/lang/String;

    return-object v0
.end method
