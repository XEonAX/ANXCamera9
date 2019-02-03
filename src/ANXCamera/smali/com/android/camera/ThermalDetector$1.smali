.class Lcom/android/camera/ThermalDetector$1;
.super Landroid/content/BroadcastReceiver;
.source "ThermalDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ThermalDetector;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ThermalDetector;


# direct methods
.method constructor <init>(Lcom/android/camera/ThermalDetector;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/android/camera/ThermalDetector$1;->this$0:Lcom/android/camera/ThermalDetector;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 50
    if-nez p2, :cond_0

    .line 51
    return-void

    .line 53
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/camera/ThermalDetector;->ACTION_TEMP_CHANGED:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 54
    return-void

    .line 56
    :cond_1
    iget-object p1, p0, Lcom/android/camera/ThermalDetector$1;->this$0:Lcom/android/camera/ThermalDetector;

    sget-object v0, Lcom/android/camera/ThermalDetector;->EXTRA_TEMP_STAGE:Ljava/lang/String;

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera/ThermalDetector;->access$202(Lcom/android/camera/ThermalDetector;I)I

    .line 57
    invoke-static {}, Lcom/android/camera/ThermalDetector;->access$300()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onReceive stage = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/ThermalDetector$1;->this$0:Lcom/android/camera/ThermalDetector;

    invoke-static {v0}, Lcom/android/camera/ThermalDetector;->access$200(Lcom/android/camera/ThermalDetector;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object p1, p0, Lcom/android/camera/ThermalDetector$1;->this$0:Lcom/android/camera/ThermalDetector;

    iget-object p2, p0, Lcom/android/camera/ThermalDetector$1;->this$0:Lcom/android/camera/ThermalDetector;

    invoke-static {p2}, Lcom/android/camera/ThermalDetector;->access$200(Lcom/android/camera/ThermalDetector;)I

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera/ThermalDetector;->access$400(Lcom/android/camera/ThermalDetector;I)V

    .line 61
    return-void
.end method
