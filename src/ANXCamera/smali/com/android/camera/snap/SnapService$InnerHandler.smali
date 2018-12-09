.class Lcom/android/camera/snap/SnapService$InnerHandler;
.super Landroid/os/Handler;
.source "SnapService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InnerHandler"
.end annotation


# instance fields
.field private final mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/snap/SnapService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/snap/SnapService;)V
    .locals 1

    .line 64
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 65
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapService$InnerHandler;->mService:Ljava/lang/ref/WeakReference;

    .line 66
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/android/camera/snap/SnapService$InnerHandler;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/snap/SnapService;

    .line 71
    if-eqz p1, :cond_2

    if-nez v0, :cond_0

    goto :goto_1

    .line 75
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x65

    if-eq p1, v1, :cond_1

    goto :goto_0

    .line 77
    :cond_1
    invoke-static {}, Lcom/android/camera/snap/SnapService;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v1, "stop service"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-static {v0}, Lcom/android/camera/snap/SnapService;->access$100(Lcom/android/camera/snap/SnapService;)V

    .line 80
    invoke-static {v0}, Lcom/android/camera/snap/SnapService;->access$200(Lcom/android/camera/snap/SnapService;)V

    .line 81
    invoke-virtual {v0}, Lcom/android/camera/snap/SnapService;->stopSelf()V

    .line 84
    :goto_0
    return-void

    .line 72
    :cond_2
    :goto_1
    return-void
.end method
