.class final Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;
.super Landroid/os/Handler;
.source "UserDefineWatermarkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/UserDefineWatermarkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UiHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/UserDefineWatermarkActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Looper;)V
    .locals 0

    .line 252
    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->this$0:Lcom/android/camera/UserDefineWatermarkActivity;

    .line 253
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 254
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->this$0:Lcom/android/camera/UserDefineWatermarkActivity;

    invoke-static {v0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->access$400(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Message;)V

    .line 259
    return-void
.end method
