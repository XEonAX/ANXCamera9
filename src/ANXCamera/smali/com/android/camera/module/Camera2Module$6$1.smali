.class Lcom/android/camera/module/Camera2Module$6$1;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/Camera2Module$6;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module$6;)V
    .locals 0

    .line 1311
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$6$1;->this$1:Lcom/android/camera/module/Camera2Module$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1315
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$6$1;->this$1:Lcom/android/camera/module/Camera2Module$6;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module$6;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/functions/Consumer;

    move-result-object v0

    const/16 v1, 0x7d0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1318
    goto :goto_0

    .line 1316
    :catch_0
    move-exception v0

    .line 1319
    :goto_0
    return-void
.end method
