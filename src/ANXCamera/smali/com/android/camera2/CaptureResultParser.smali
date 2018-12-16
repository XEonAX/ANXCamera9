.class public Lcom/android/camera2/CaptureResultParser;
.super Ljava/lang/Object;
.source "CaptureResultParser.java"


# static fields
.field private static final AEC_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Lcom/android/camera2/AECFrameControl;",
            ">;"
        }
    .end annotation
.end field

.field private static final AF_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Lcom/android/camera2/AFFrameControl;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;"
        }
    .end annotation
.end field

.field public static final FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEY_HDR_CHECKTER_EV_VALUES:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "[",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;

.field public static final ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VENDER_TAG_ASD_DETECTED_MODES:Ljava/lang/String; = "xiaomi.ai.asd.sceneDetected"

.field public static final VENDER_TAG_ASD_ENABLE:Ljava/lang/String; = "xiaomi.ai.asd.enabled"

.field public static final VENDER_TAG_HDR_DETECTED_MODES:Ljava/lang/String; = "xiaomi.hdr.hdrDetected"

.field public static final VENDER_TAG_LENS_DIRTY_DETECTED:Ljava/lang/String; = "xiaomi.ai.add.lensDirtyDetected"

.field public static final VENDER_TAG_ULTRA_WIDE_RECOMMENDED:Ljava/lang/String; = "xiaomi.ai.misd.ultraWideRecommended"

.field public static final VENDOR_TAG_AEC_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AECFrameControl"

.field public static final VENDOR_TAG_AF_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AFFrameControl"

.field public static final VENDOR_TAG_AWB_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AWBFrameControl"

.field public static final VENDOR_TAG_FAST_ZOOM_RESULT:Ljava/lang/String; = "xiaomi.smoothTransition.result"

.field public static final VENDOR_TAG_HDR_CHECKER:Ljava/lang/String; = "xiaomi.hdr.hdrChecker"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 11
    const-class v0, Lcom/android/camera2/CaptureResultParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    .line 28
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.asd.enabled"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 33
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.asd.sceneDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 39
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.hdr.hdrDetected"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 45
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.add.lensDirtyDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 51
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AWBFrameControl"

    const-class v2, Lcom/android/camera2/AWBFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 57
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AECFrameControl"

    const-class v2, Lcom/android/camera2/AECFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AEC_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 63
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AFFrameControl"

    const-class v2, Lcom/android/camera2/AFFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AF_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 69
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.smoothTransition.result"

    const-class v2, Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 73
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.hdr.hdrChecker"

    const-class v2, [Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->KEY_HDR_CHECKTER_EV_VALUES:Landroid/hardware/camera2/CaptureResult$Key;

    .line 79
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.misd.ultraWideRecommended"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 83
    new-instance v0, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 84
    invoke-static {}, Lcom/android/camera/Util;->isShowPreviewDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    new-instance v0, Lcom/android/camera2/AECFrameControl$MarshalQueryableAECFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AECFrameControl$MarshalQueryableAECFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 86
    new-instance v0, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 88
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAECFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AECFrameControl;
    .locals 1

    .line 138
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AEC_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AECFrameControl;

    return-object p0
.end method

.method public static getAFFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AFFrameControl;
    .locals 1

    .line 142
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AF_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AFFrameControl;

    return-object p0
.end method

.method public static getAWBFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AWBFrameControl;
    .locals 1

    .line 134
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AWBFrameControl;

    return-object p0
.end method

.method public static getAsdDetectedModes(Landroid/hardware/camera2/CaptureResult;)I
    .locals 1

    .line 105
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 106
    if-eqz p0, :cond_0

    .line 107
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 109
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getFastZoomResult(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 3

    .line 146
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FAST_ZOOM_RESULT = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 148
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static getHDRDetectedScene(Landroid/hardware/camera2/CaptureResult;)I
    .locals 1

    .line 118
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 119
    if-eqz p0, :cond_0

    .line 120
    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    return p0

    .line 122
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getHdrCheckerValues(Landroid/hardware/camera2/CaptureResult;)[Ljava/lang/Byte;
    .locals 1

    .line 152
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->KEY_HDR_CHECKTER_EV_VALUES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Byte;

    return-object p0
.end method

.method public static getUltraWideDetectedResult(Landroid/hardware/camera2/CaptureResult;)I
    .locals 2

    .line 156
    nop

    .line 158
    :try_start_0
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    goto :goto_0

    .line 159
    :catch_0
    move-exception p0

    .line 160
    sget-object p0, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find tag for key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/android/camera2/CaptureResultParser;->ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_0

    .line 163
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 165
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isASDEnable(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 4

    .line 91
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 92
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 93
    sget-object v1, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isASDEnable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    move v0, v1

    nop

    :cond_0
    return v0

    .line 96
    :cond_1
    return v0
.end method

.method public static isLensDirtyDetected(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 2

    .line 126
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 127
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 128
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    move v0, v1

    nop

    :cond_0
    return v0

    .line 130
    :cond_1
    return v0
.end method
