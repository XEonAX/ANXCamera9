.class public Lcom/xiaomi/camera/liveshot/gles/RenderThread$RenderHandler;
.super Landroid/os/Handler;
.source "RenderThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/gles/RenderThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderHandler"
.end annotation


# instance fields
.field private final mRenderThread:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/xiaomi/camera/liveshot/gles/RenderThread;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/xiaomi/camera/liveshot/gles/RenderThread;


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/liveshot/gles/RenderThread;Lcom/xiaomi/camera/liveshot/gles/RenderThread;)V
    .locals 0

    .line 199
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/gles/RenderThread$RenderHandler;->this$0:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 200
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/gles/RenderThread$RenderHandler;->mRenderThread:Ljava/lang/ref/WeakReference;

    .line 201
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/RenderThread$RenderHandler;->mRenderThread:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    .line 206
    if-nez v0, :cond_0

    .line 207
    return-void

    .line 209
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    .line 210
    const/16 v2, 0x10

    if-eq v1, v2, :cond_3

    const/16 v2, 0x20

    if-eq v1, v2, :cond_2

    const/16 p1, 0x30

    if-eq v1, p1, :cond_1

    goto :goto_0

    .line 221
    :cond_1
    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->access$200(Lcom/xiaomi/camera/liveshot/gles/RenderThread;)V

    goto :goto_0

    .line 216
    :cond_2
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 217
    invoke-static {v0, p1}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->access$100(Lcom/xiaomi/camera/liveshot/gles/RenderThread;I)V

    .line 218
    goto :goto_0

    .line 212
    :cond_3
    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->access$000(Lcom/xiaomi/camera/liveshot/gles/RenderThread;)V

    .line 213
    nop

    .line 224
    :goto_0
    return-void
.end method
