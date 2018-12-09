.class Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentBeauty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewPagerListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method private constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0

    .line 111
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V
    .locals 0

    .line 111
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 140
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 115
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 119
    nop

    .line 120
    const/4 v0, 0x3

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 125
    :pswitch_0
    nop

    .line 126
    nop

    .line 131
    move p1, v0

    goto :goto_1

    .line 122
    :pswitch_1
    nop

    .line 131
    :goto_0
    const/4 p1, 0x5

    :goto_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb9

    .line 132
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;

    .line 133
    if-eqz v1, :cond_1

    .line 134
    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_2

    :cond_0
    const/4 p1, 0x0

    :goto_2
    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;->onFaceBeautySwitched(Z)V

    .line 136
    :cond_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
