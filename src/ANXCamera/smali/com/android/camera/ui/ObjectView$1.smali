.class Lcom/android/camera/ui/ObjectView$1;
.super Landroid/os/Handler;
.source "ObjectView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/ObjectView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/ObjectView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/ObjectView;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 2

    .line 107
    iget p1, p1, Landroid/os/Message;->what:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 117
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-static {p1}, Lcom/android/camera/ui/ObjectView;->access$300(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 118
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-static {p1}, Lcom/android/camera/ui/ObjectView;->access$300(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    goto :goto_0

    .line 109
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {p1}, Lcom/android/camera/ui/ObjectView;->showStart()V

    .line 110
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-static {p1}, Lcom/android/camera/ui/ObjectView;->access$300(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {p1}, Lcom/android/camera/ui/ObjectView;->getFocusRect()Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 111
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-static {p1}, Lcom/android/camera/ui/ObjectView;->access$300(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->startObjectTracking()V

    .line 112
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView$1;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-static {p1}, Lcom/android/camera/ui/ObjectView;->access$400(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$Filter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ObjectView$Filter;->resetState()V

    .line 114
    :cond_0
    const/4 p1, 0x2

    const-wide/16 v0, 0x3e8

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/ui/ObjectView$1;->sendEmptyMessageDelayed(IJ)Z

    .line 115
    nop

    .line 124
    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
