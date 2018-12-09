.class Lcom/android/camera/fragment/live/FragmentLiveSticker$3$2;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$3;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$3;)V
    .locals 0

    .line 216
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$2;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3$2;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$3;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;Ljava/util/List;)V

    .line 220
    return-void
.end method
