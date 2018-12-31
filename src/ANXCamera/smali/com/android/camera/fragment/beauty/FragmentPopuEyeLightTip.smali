.class public Lcom/android/camera/fragment/beauty/FragmentPopuEyeLightTip;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPopuEyeLightTip.java"


# static fields
.field public static final FRAGMENT_INFO:I = 0xff9


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 32
    const/16 v0, 0xff9

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 27
    const v0, 0x7f040006

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 20
    nop

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 22
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopuEyeLightTip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopuEyeLightTip;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0900d5

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 23
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 37
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 38
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 42
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 43
    return-void
.end method
