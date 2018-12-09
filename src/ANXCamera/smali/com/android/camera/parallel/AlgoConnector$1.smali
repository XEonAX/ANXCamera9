.class Lcom/android/camera/parallel/AlgoConnector$1;
.super Ljava/lang/Object;
.source "AlgoConnector.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/parallel/AlgoConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/parallel/AlgoConnector;


# direct methods
.method constructor <init>(Lcom/android/camera/parallel/AlgoConnector;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    .line 24
    const-string v0, "AlgoConnector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceConnected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    iget-object p1, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    check-cast p2, Lcom/android/camera/LocalParallelService$LocalBinder;

    iput-object p2, p1, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 26
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 30
    const-string p1, "AlgoConnector"

    const-string v0, "onServiceDisconnected: "

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget-object p1, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 32
    return-void
.end method
