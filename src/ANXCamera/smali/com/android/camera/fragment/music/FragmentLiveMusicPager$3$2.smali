.class Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3$2;
.super Ljava/lang/Object;
.source "FragmentLiveMusicPager.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;)V
    .locals 0

    .line 244
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3$2;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 247
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3$2;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$700(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3$2;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$3;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$700(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 250
    :cond_0
    return-void
.end method
