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

.field private static final MULTIFRAME_INPUTNUM:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key<",
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

.field public static final VENDER_TAG_MULTIFRAME_INPUTNUM:Ljava/lang/String; = "xiaomi.multiframe.inputNum"

.field public static final VENDER_TAG_ULTRA_WIDE_RECOMMENDED:Ljava/lang/String; = "xiaomi.ai.misd.ultraWideRecommended"

.field public static final VENDOR_TAG_AEC_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AECFrameControl"

.field public static final VENDOR_TAG_AF_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AFFrameControl"

.field public static final VENDOR_TAG_AWB_FRAME_CONTROL:Ljava/lang/String; = "org.quic.camera2.statsconfigs.AWBFrameControl"

.field public static final VENDOR_TAG_FAST_ZOOM_RESULT:Ljava/lang/String; = "xiaomi.smoothTransition.result"

.field public static final VENDOR_TAG_HDR_CHECKER:Ljava/lang/String; = "xiaomi.hdr.hdrChecker"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 12
    const-class v0, Lcom/android/camera2/CaptureResultParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    .line 31
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.asd.enabled"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 36
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.asd.sceneDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 42
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.hdr.hdrDetected"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 48
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.add.lensDirtyDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 54
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AWBFrameControl"

    const-class v2, Lcom/android/camera2/AWBFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 60
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AECFrameControl"

    const-class v2, Lcom/android/camera2/AECFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AEC_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 66
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "org.quic.camera2.statsconfigs.AFFrameControl"

    const-class v2, Lcom/android/camera2/AFFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AF_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 72
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.smoothTransition.result"

    const-class v2, Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 76
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.hdr.hdrChecker"

    const-class v2, [Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->KEY_HDR_CHECKTER_EV_VALUES:Landroid/hardware/camera2/CaptureResult$Key;

    .line 82
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.ai.misd.ultraWideRecommended"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 85
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string v1, "xiaomi.multiframe.inputNum"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->MULTIFRAME_INPUTNUM:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 90
    new-instance v0, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistry;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 91
    invoke-static {}, Lcom/android/camera/Util;->isShowPreviewDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    new-instance v0, Lcom/android/camera2/AECFrameControl$MarshalQueryableAECFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AECFrameControl$MarshalQueryableAECFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistry;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 93
    new-instance v0, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistry;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

    .line 95
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAECFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AECFrameControl;
    .locals 1

    .line 145
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AEC_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AECFrameControl;

    return-object p0
.end method

.method public static getAFFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AFFrameControl;
    .locals 1

    .line 149
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AF_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AFFrameControl;

    return-object p0
.end method

.method public static getAWBFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AWBFrameControl;
    .locals 1

    .line 141
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera2/AWBFrameControl;

    return-object p0
.end method

.method public static getAsdDetectedModes(Landroid/hardware/camera2/CaptureResult;)I
    .locals 1

    .line 112
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 113
    if-eqz p0, :cond_0

    .line 114
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 116
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getFastZoomResult(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 3

    .line 153
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

    .line 154
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 155
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

    .line 125
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 126
    if-eqz p0, :cond_0

    .line 127
    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    return p0

    .line 129
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getHdrCheckerValues(Landroid/hardware/camera2/CaptureResult;)[Ljava/lang/Byte;
    .locals 1

    .line 159
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->KEY_HDR_CHECKTER_EV_VALUES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Byte;

    return-object p0
.end method

.method public static getRequestMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest;)I
    .locals 1

    .line 176
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->MULTIFRAME_INPUTNUM:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 177
    if-nez p0, :cond_0

    .line 178
    const/4 p0, 0x0

    return p0

    .line 181
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static getUltraWideDetectedResult(Landroid/hardware/camera2/CaptureResult;)I
    .locals 2

    .line 163
    nop

    .line 165
    :try_start_0
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->ULTR_WIDE_RECOMMENDED_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    goto :goto_0

    .line 166
    :catch_0
    move-exception p0

    .line 167
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

    .line 169
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_0

    .line 170
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 172
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isASDEnable(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 4

    .line 98
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Byte;

    .line 99
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 100
    sget-object v1, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isASDEnable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    move v0, v1

    nop

    :cond_0
    return v0

    .line 103
    :cond_1
    return v0
.end method

.method public static isLensDirtyDetected(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 2

    .line 133
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 134
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 135
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    move v0, v1

    nop

    :cond_0
    return v0

    .line 137
    :cond_1
    return v0
.end method
