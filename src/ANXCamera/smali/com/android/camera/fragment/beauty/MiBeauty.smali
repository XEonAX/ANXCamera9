.class public Lcom/android/camera/fragment/beauty/MiBeauty;
.super Ljava/lang/Object;
.source "MiBeauty.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/MiBeauty$BeautyMenuType;
    }
.end annotation


# static fields
.field public static final BACK_BEAUTY_MENU_TYPE:I = 0xa2

.field public static final FRONT_BEAUTY_MENU_TYPE:I = 0xa1

.field public static final LIVE_BEAUTY_MENU_TYPE:I = 0xa3

.field public static final LIVE_SPEED_MENU_TYPE:I = 0xa5

.field public static final LIVE_STICKER_MENU_TYPE:I = 0xa4

.field public static final NONE_MENU_TYPE:I = 0xa0


# instance fields
.field public mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

.field private mBeautyFragmentManager:Lcom/android/camera/fragment/beauty/BeautyFragmentManager;

.field private mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 47
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 52
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FrontFragmentBusiness;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

    .line 53
    goto :goto_0

    .line 49
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/beauty/BackMainFragmentBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BackMainFragmentBusiness;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

    .line 50
    nop

    .line 60
    :goto_0
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyFragmentManager:Lcom/android/camera/fragment/beauty/BeautyFragmentManager;

    .line 61
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    .line 62
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static showBeautyActionFromMode(I)V
    .locals 2

    .line 136
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 137
    if-nez v0, :cond_0

    .line 138
    return-void

    .line 140
    :cond_0
    const/16 v1, 0xae

    if-eq p0, v1, :cond_2

    .line 142
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p0

    .line 143
    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 144
    const/16 p0, 0xa1

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchBeautyActionMenu(I)V

    goto :goto_0

    .line 145
    :cond_1
    if-nez p0, :cond_3

    .line 146
    const/16 p0, 0xa2

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchBeautyActionMenu(I)V

    goto :goto_0

    .line 150
    :cond_2
    const/16 p0, 0xa3

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchBeautyActionMenu(I)V

    .line 155
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p0

    const/16 v0, 0xa0

    .line 156
    invoke-virtual {p0, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p0

    check-cast p0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 157
    if-nez p0, :cond_4

    .line 158
    return-void

    .line 160
    :cond_4
    const/4 v0, 0x2

    invoke-interface {p0, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 162
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p0

    const/16 v0, 0xaf

    invoke-virtual {p0, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p0

    check-cast p0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 163
    if-eqz p0, :cond_5

    .line 164
    invoke-interface {p0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 166
    :cond_5
    return-void
.end method


# virtual methods
.method public getBeautyType()I
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getBeautyType()I

    move-result v0

    return v0
.end method

.method public getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentShowFragmentList(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyFragmentManager:Lcom/android/camera/fragment/beauty/BeautyFragmentManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/BeautyFragmentManager;->getBeautyFragmentBusiness(I)Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/fragment/beauty/IBeautyFragmentBusiness;->getCurrentShowFragmentList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getProgress()I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getProgress()I

    move-result v0

    return v0
.end method

.method public getTypeArray()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public operate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 87
    const/4 p1, 0x0

    return-object p1
.end method

.method public removeFragmentBeauty(I)Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;->removeFragmentBeauty(I)Z

    move-result p1

    return p1
.end method

.method public resetBeauty()V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->resetBeauty()V

    .line 103
    return-void
.end method

.method public setBeautyType(I)V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->setBeautyType(I)V

    .line 78
    return-void
.end method

.method public setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 118
    return-void
.end method

.method public setCurrentBeautyType(I)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;->setCurrentBeautyType(I)V

    .line 74
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setProgress(I)V

    .line 93
    return-void
.end method

.method public setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 113
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MiBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 108
    return-void
.end method
