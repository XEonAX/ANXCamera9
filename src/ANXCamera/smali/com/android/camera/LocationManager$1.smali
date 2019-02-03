.class Lcom/android/camera/LocationManager$1;
.super Ljava/util/TimerTask;
.source "LocationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/LocationManager;->startReceivingLocationUpdates()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/LocationManager;


# direct methods
.method constructor <init>(Lcom/android/camera/LocationManager;)V
    .locals 0

    .line 157
    iput-object p1, p0, Lcom/android/camera/LocationManager$1;->this$0:Lcom/android/camera/LocationManager;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/android/camera/LocationManager$1;->this$0:Lcom/android/camera/LocationManager;

    invoke-static {v0}, Lcom/android/camera/LocationManager;->access$000(Lcom/android/camera/LocationManager;)V

    .line 161
    iget-object v0, p0, Lcom/android/camera/LocationManager$1;->this$0:Lcom/android/camera/LocationManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/LocationManager;->access$102(Lcom/android/camera/LocationManager;Ljava/util/Timer;)Ljava/util/Timer;

    .line 162
    return-void
.end method
