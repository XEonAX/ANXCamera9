.class public Lcom/android/camera/constant/MiCaptureRequest;
.super Ljava/lang/Object;
.source "MiCaptureRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/MiCaptureRequest$VideoRecordControl;
    }
.end annotation


# static fields
.field public static final VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_RECORD_CONTROL_START:I = 0x1

.field public static final VIDEO_RECORD_CONTROL_STOP:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string v1, "xiaomi.video.recordControl"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
