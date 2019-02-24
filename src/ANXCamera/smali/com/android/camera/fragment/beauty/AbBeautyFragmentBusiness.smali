.class public abstract Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;
.super Ljava/lang/Object;
.source "AbBeautyFragmentBusiness.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;


# instance fields
.field private mCurrentBeautyType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    const/4 p1, 0x0

    return-object p1
.end method

.method public removeFragmentBeauty(I)Z
    .locals 4

    .line 19
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isCurrentModeSupportVideoBeauty()Z

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-nez v0, :cond_0

    if-ne v1, p1, :cond_0

    .line 21
    return v2

    .line 24
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 25
    if-nez p1, :cond_1

    .line 26
    return v2

    .line 28
    :cond_1
    const v0, 0x7f0d0018

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v3, 0xfb

    if-eq v0, v3, :cond_2

    .line 29
    return v2

    .line 31
    :cond_2
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 33
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v3, 0xc5

    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 34
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchCameraActionMenu(I)V

    .line 36
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportSeekBarAdjustBeautyType:Ljava/util/List;

    iget v2, p0, Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;->mCurrentBeautyType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 38
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xb4

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 39
    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->isShow()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 40
    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 43
    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public setCurrentBeautyType(I)V
    .locals 0

    .line 47
    iput p1, p0, Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;->mCurrentBeautyType:I

    .line 48
    return-void
.end method
