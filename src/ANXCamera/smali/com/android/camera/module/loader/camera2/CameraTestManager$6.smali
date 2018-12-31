.class Lcom/android/camera/module/loader/camera2/CameraTestManager$6;
.super Ljava/lang/Object;
.source "CameraTestManager.java"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;->openCamera(IILio/reactivex/Observer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableOnSubscribe<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$6;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableEmitter<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 304
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$6;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$402(Lcom/android/camera/module/loader/camera2/CameraTestManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;

    .line 305
    return-void
.end method
