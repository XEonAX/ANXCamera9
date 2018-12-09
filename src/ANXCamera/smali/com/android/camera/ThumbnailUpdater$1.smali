.class Lcom/android/camera/ThumbnailUpdater$1;
.super Ljava/lang/Object;
.source "ThumbnailUpdater.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ThumbnailUpdater;->updateThumbnailView(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ThumbnailUpdater;

.field final synthetic val$needAnimation:Z


# direct methods
.method constructor <init>(Lcom/android/camera/ThumbnailUpdater;Z)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/android/camera/ThumbnailUpdater$1;->this$0:Lcom/android/camera/ThumbnailUpdater;

    iput-boolean p2, p0, Lcom/android/camera/ThumbnailUpdater$1;->val$needAnimation:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 51
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getStartFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ThumbnailUpdater$1;->this$0:Lcom/android/camera/ThumbnailUpdater;

    .line 52
    invoke-static {v0}, Lcom/android/camera/ThumbnailUpdater;->access$000(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v0

    if-nez v0, :cond_0

    .line 53
    return-void

    .line 56
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 58
    if-nez v0, :cond_1

    .line 59
    const-string v0, "ThumbnailUpdater"

    const-string v1, "won\'t update thumbnail"

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    return-void

    .line 62
    :cond_1
    iget-object v1, p0, Lcom/android/camera/ThumbnailUpdater$1;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v1}, Lcom/android/camera/ThumbnailUpdater;->access$100(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/ThumbnailUpdater$1;->val$needAnimation:Z

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    .line 63
    return-void
.end method
