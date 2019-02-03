.class Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$5;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

.field final synthetic val$list:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$5;Ljava/util/List;)V
    .locals 0

    .line 406
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;->val$list:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 409
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$3;->val$list:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$100(Lcom/android/camera/fragment/live/FragmentLiveSticker;Ljava/util/List;)V

    .line 410
    return-void
.end method
