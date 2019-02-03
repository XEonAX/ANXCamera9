.class public Lcom/ss/android/ttve/monitor/TEMonitorInvoker;
.super Ljava/lang/Object;
.source "TEMonitorInvoker.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 27
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native nativeGetMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public static native nativeInit()V
.end method

.method public static native nativeMonitorPerf(I)V
.end method

.method public static native nativePerfDouble(Ljava/lang/String;D)V
.end method

.method public static native nativePerfLong(Ljava/lang/String;J)V
.end method

.method public static native nativePerfRational(Ljava/lang/String;FF)V
.end method

.method public static native nativePerfString(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native nativeReset()V
.end method

.method public static onNativeCallback_onMonitorLogFloat(Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0

    .line 35
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 36
    return-void
.end method

.method public static onNativeCallback_onMonitorLogInt(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 31
    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;J)Z

    .line 32
    return-void
.end method

.method public static onNativeCallback_onMonitorLogMap(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    .line 39
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    .line 40
    return-void
.end method
