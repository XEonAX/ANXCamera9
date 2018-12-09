.class Lcom/android/camera/fragment/live/FragmentLiveMusic$1;
.super Ljava/lang/Object;
.source "FragmentLiveMusic.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveMusic;->initMusicAdapter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 2

    .line 97
    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    .line 98
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-virtual {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveMusic$1$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic$1$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveMusic$1;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 104
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 109
    return-void
.end method
