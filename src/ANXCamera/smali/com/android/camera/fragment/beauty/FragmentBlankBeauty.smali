.class public Lcom/android/camera/fragment/beauty/FragmentBlankBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBlankBeauty.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xffa


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 28
    const/16 v0, 0xffa

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 23
    const v0, 0x7f04000a

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0

    .line 18
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 0

    .line 33
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .line 38
    const/4 v0, 0x0

    return-object v0
.end method
