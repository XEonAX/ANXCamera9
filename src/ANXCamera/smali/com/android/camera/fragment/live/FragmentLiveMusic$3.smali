.class Lcom/android/camera/fragment/live/FragmentLiveMusic$3;
.super Ljava/lang/Object;
.source "FragmentLiveMusic.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveMusic;->startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
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

    .line 227
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3

    .line 230
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->access$200(Lcom/android/camera/fragment/live/FragmentLiveMusic;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 231
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->access$300(Lcom/android/camera/fragment/live/FragmentLiveMusic;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 232
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-static {v0}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->access$300(Lcom/android/camera/fragment/live/FragmentLiveMusic;)Landroid/widget/ImageView;

    move-result-object v0

    const v2, 0x7f020101

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 233
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 234
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveMusic$3;->this$0:Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->access$402(Lcom/android/camera/fragment/live/FragmentLiveMusic;Z)Z

    .line 235
    return-void
.end method
