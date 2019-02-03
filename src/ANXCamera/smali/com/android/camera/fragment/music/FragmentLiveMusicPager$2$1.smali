.class Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;
.super Ljava/lang/Object;
.source "FragmentLiveMusicPager.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->onFailed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;)V
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 189
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$100(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$500(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$500(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 192
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-static {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->access$500(Lcom/android/camera/fragment/music/FragmentLiveMusicPager;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2$1;->this$1:Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;

    iget-object v0, v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager$2;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f09026c

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 195
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 196
    return-void
.end method
