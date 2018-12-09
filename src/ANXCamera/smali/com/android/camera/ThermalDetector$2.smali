.class Lcom/android/camera/ThermalDetector$2;
.super Ljava/lang/Object;
.source "ThermalDetector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ThermalDetector;->onCreate(Landroid/content/Context;)V
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

    .line 69
    iput-object p1, p0, Lcom/android/camera/ThermalDetector$2;->this$0:Lcom/android/camera/ThermalDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 72
    iget-object v0, p0, Lcom/android/camera/ThermalDetector$2;->this$0:Lcom/android/camera/ThermalDetector;

    invoke-static {}, Lcom/android/camera/ThermalDetector;->access$500()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/ThermalDetector;->access$202(Lcom/android/camera/ThermalDetector;I)I

    .line 73
    return-void
.end method
