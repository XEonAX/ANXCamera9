.class Lcom/android/camera/fragment/live/FragmentLiveBase$ExitAnimationListener;
.super Ljava/lang/Object;
.source "FragmentLiveBase.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExitAnimationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveBase;


# direct methods
.method private constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveBase;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveBase$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/live/FragmentLiveBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveBase;Lcom/android/camera/fragment/live/FragmentLiveBase$1;)V
    .locals 0

    .line 64
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveBase$ExitAnimationListener;-><init>(Lcom/android/camera/fragment/live/FragmentLiveBase;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    .line 72
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 73
    if-eqz p1, :cond_0

    const v0, 0x7f0d001a

    .line 74
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v1, 0xffa

    if-ne v0, v1, :cond_0

    .line 76
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 78
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveBase$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/live/FragmentLiveBase;

    iget-boolean p1, p1, Lcom/android/camera/fragment/live/FragmentLiveBase;->mRemoveFragment:Z

    if-eqz p1, :cond_2

    .line 79
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 81
    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result p1

    if-nez p1, :cond_1

    .line 83
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 84
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 86
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveBase$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/live/FragmentLiveBase;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/android/camera/fragment/live/FragmentLiveBase;->mRemoveFragment:Z

    .line 88
    :cond_2
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .line 93
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .line 67
    return-void
.end method
