.class Lcom/android/camera/effect/renders/StickerRender$1;
.super Ljava/lang/Object;
.source "StickerRender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/effect/renders/StickerRender;->initHumanAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/effect/renders/StickerRender;


# direct methods
.method constructor <init>(Lcom/android/camera/effect/renders/StickerRender;)V
    .locals 0

    .line 222
    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 225
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/StickerRender;->access$000(Lcom/android/camera/effect/renders/StickerRender;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 226
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/StickerRender;->access$100(Lcom/android/camera/effect/renders/StickerRender;)Lcom/sensetime/stmobile/STMobileHumanActionNative;

    move-result-object v1

    .line 227
    invoke-static {}, Lcom/android/camera/sticker/StickerHelper;->getInstance()Lcom/android/camera/sticker/StickerHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/sticker/StickerHelper;->getTrackModelPath()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f0

    .line 226
    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->createInstance(Ljava/lang/String;I)I

    move-result v1

    .line 230
    if-nez v1, :cond_0

    .line 231
    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/StickerRender;->access$100(Lcom/android/camera/effect/renders/StickerRender;)Lcom/sensetime/stmobile/STMobileHumanActionNative;

    move-result-object v2

    const/4 v3, 0x2

    const v4, 0x3eb33333    # 0.35f

    invoke-virtual {v2, v3, v4}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->setParam(IF)I

    .line 235
    :cond_0
    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/android/camera/effect/renders/StickerRender;->access$202(Lcom/android/camera/effect/renders/StickerRender;Z)Z

    .line 236
    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender$1;->this$0:Lcom/android/camera/effect/renders/StickerRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/StickerRender;->access$000(Lcom/android/camera/effect/renders/StickerRender;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 237
    invoke-static {}, Lcom/android/camera/effect/renders/StickerRender;->access$300()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initHumanAction: result="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    monitor-exit v0

    .line 239
    return-void

    .line 238
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
