.class Lcom/android/camera/fragment/music/FragmentLiveMusic$1;
.super Ljava/lang/Object;
.source "FragmentLiveMusic.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/FragmentLiveMusic;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$1;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 102
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 85
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 89
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 94
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$1;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-static {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->access$100(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V

    goto :goto_0

    .line 91
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic$1;->this$0:Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-static {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->access$000(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V

    .line 92
    nop

    .line 97
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
