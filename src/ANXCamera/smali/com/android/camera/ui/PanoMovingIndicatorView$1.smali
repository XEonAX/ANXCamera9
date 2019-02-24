.class Lcom/android/camera/ui/PanoMovingIndicatorView$1;
.super Landroid/os/Handler;
.source "PanoMovingIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/PanoMovingIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/PanoMovingIndicatorView;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 73
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    iget-object v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-static {v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$000(Lcom/android/camera/ui/PanoMovingIndicatorView;)I

    move-result v1

    invoke-static {p1, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$100(Lcom/android/camera/ui/PanoMovingIndicatorView;I)I

    move-result p1

    int-to-float p1, p1

    iget-object v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-static {v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$200(Lcom/android/camera/ui/PanoMovingIndicatorView;)F

    move-result v1

    cmpl-float p1, p1, v1

    if-eqz p1, :cond_1

    .line 76
    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    iget-object v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-static {v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$000(Lcom/android/camera/ui/PanoMovingIndicatorView;)I

    move-result v1

    invoke-static {p1, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$300(Lcom/android/camera/ui/PanoMovingIndicatorView;I)V

    .line 77
    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-static {p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->access$400(Lcom/android/camera/ui/PanoMovingIndicatorView;)V

    .line 78
    const-wide/16 v1, 0xa

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/ui/PanoMovingIndicatorView$1;->sendEmptyMessageDelayed(IJ)Z

    .line 82
    :cond_1
    :goto_0
    return-void
.end method
