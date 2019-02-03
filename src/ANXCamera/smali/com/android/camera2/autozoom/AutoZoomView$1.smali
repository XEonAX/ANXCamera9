.class Lcom/android/camera2/autozoom/AutoZoomView$1;
.super Ljava/lang/Object;
.source "AutoZoomView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/autozoom/AutoZoomView;->setViewVisibility(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/autozoom/AutoZoomView;

.field final synthetic val$visibility:I


# direct methods
.method constructor <init>(Lcom/android/camera2/autozoom/AutoZoomView;I)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView$1;->this$0:Lcom/android/camera2/autozoom/AutoZoomView;

    iput p2, p0, Lcom/android/camera2/autozoom/AutoZoomView$1;->val$visibility:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView$1;->this$0:Lcom/android/camera2/autozoom/AutoZoomView;

    iget v1, p0, Lcom/android/camera2/autozoom/AutoZoomView$1;->val$visibility:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/autozoom/AutoZoomView;->setVisibility(I)V

    .line 91
    return-void
.end method
