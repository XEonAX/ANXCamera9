.class Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$5;->onResponse([Ljava/lang/Object;)V
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

    .line 385
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;->val$list:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 388
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;->this$1:Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5$1;->val$list:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->access$100(Lcom/android/camera/fragment/live/FragmentLiveSticker;Ljava/util/List;)V

    .line 389
    return-void
.end method
