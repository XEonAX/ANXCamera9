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

    .line 70
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 71
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapService$InnerHandler;->mService:Ljava/lang/ref/WeakReference;

    .line 72
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/android/camera/snap/SnapService$InnerHandler;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/snap/SnapService;

    .line 77
    if-eqz p1, :cond_3

    if-nez v0, :cond_0

    goto :goto_1

    .line 81
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x65

    if-eq p1, v1, :cond_1

    goto :goto_0

    .line 83
    :cond_1
    invoke-static {}, Lcom/android/camera/snap/SnapService;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v1, "stop service"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    invoke-static {}, Lcom/android/camera/snap/SnapService;->access$100()Landroid/app/job/JobScheduler;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 85
    invoke-static {}, Lcom/android/camera/snap/SnapService;->access$100()Landroid/app/job/JobScheduler;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobScheduler;->cancelAll()V

    .line 88
    :cond_2
    invoke-static {v0}, Lcom/android/camera/snap/SnapService;->access$200(Lcom/android/camera/snap/SnapService;)V

    .line 89
    invoke-virtual {v0}, Lcom/android/camera/snap/SnapService;->stopSelf()V

    .line 92
    :goto_0
    return-void

    .line 78
    :cond_3
    :goto_1
    return-void
.end method
