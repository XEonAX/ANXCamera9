.class Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;
.super Ljava/lang/Object;
.source "FragmentLiveMusicPager.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->startPlayMusic(Lcom/android/camera/fragment/music/LiveMusicInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V
    .locals 0

    .line 407
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 410
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$1100(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 411
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$1100(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 412
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$6;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$900(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/ImageView;

    move-result-object p1

    const v0, 0x7f02010b

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 413
    return-void
.end method
