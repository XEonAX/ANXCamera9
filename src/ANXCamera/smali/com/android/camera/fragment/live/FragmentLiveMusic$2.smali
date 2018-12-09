.class Lcom/android/camera/fragment/live/FragmentLiveMusic$2;
.super Ljava/lang/Object;
.source "FragmentLiveMusic.java"

# interfaces
.implements Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveMusic;
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

    .line 120
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->access$100(Lcom/android/camera/fragment/live/FragmentLiveMusic;)V

    .line 124
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$2;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-virtual {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 125
    return-void
.end method

.method public onFailed()V
    .locals 0

    .line 129
    return-void
.end method
