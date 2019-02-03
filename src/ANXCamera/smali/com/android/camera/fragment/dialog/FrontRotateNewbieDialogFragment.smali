.class public Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;
.super Lcom/android/camera/fragment/dialog/BaseDialogFragment;
.source "FrontRotateNewbieDialogFragment.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "RotateHint"


# instance fields
.field private mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public animateOut(I)V
    .locals 0

    .line 114
    iget-object p1, p0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    if-eqz p1, :cond_0

    .line 115
    iget-object p1, p0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->dismissAllowingStateLoss()V

    .line 118
    return-void
.end method

.method public final canProvide()Z
    .locals 1

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->isAdded()Z

    move-result v0

    return v0
.end method

.method public onBackEvent(I)Z
    .locals 0

    .line 99
    const/16 p1, 0x190

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    .line 100
    const/4 p1, 0x1

    return p1
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 93
    invoke-super {p0, p1}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 94
    const/16 p1, 0x190

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    .line 95
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 53
    invoke-super {p0, p1}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p1

    .line 54
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 55
    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 56
    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 35
    const p3, 0x7f040037

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->initViewOnTouchListener(Landroid/view/View;)V

    .line 37
    const p2, 0x7f0d00c2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 38
    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/AnimationDrawable;

    iput-object p2, p0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    .line 39
    iget-object p2, p0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    if-eqz p2, :cond_0

    .line 40
    iget-object p2, p0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 43
    :cond_0
    const/4 p2, 0x0

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 44
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const/high16 p3, 0x3f800000    # 1.0f

    .line 45
    invoke-virtual {p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance p3, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {p3}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    .line 46
    invoke-virtual {p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    .line 47
    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 48
    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 84
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 85
    if-eqz v0, :cond_0

    .line 86
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 88
    :cond_0
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onDestroyView()V

    .line 89
    return-void
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 105
    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 106
    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->onBackEvent(I)Z

    .line 107
    return p2

    .line 109
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onResume()V
    .locals 1

    .line 67
    invoke-super {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onResume()V

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 69
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 73
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 75
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xab

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 76
    if-eqz p1, :cond_0

    .line 77
    invoke-interface {p1, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->addInBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 79
    :cond_0
    return-void
.end method
