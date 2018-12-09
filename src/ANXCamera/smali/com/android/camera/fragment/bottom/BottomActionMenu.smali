.class public Lcom/android/camera/fragment/bottom/BottomActionMenu;
.super Ljava/lang/Object;
.source "BottomActionMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/bottom/BottomActionMenu$BottomActionMode;,
        Lcom/android/camera/fragment/bottom/BottomActionMenu$BottomActionMenuAnimType;
    }
.end annotation


# static fields
.field public static final ANIM_EXPAND:I = 0xa0

.field public static final ANIM_SHRINK:I = 0xa1

.field public static final BEAUTY_BOTTOM_MENU:I = 0x1

.field public static final CAMERA_OPERATE_BOTTOM_MENU:I = 0x0

.field public static final LIVE_BOTTOM_MENU:I = 0x2

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

.field private mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

.field private mCameraOperateSelectView:Lcom/android/camera/ui/ModeSelectView;

.field private mContainerView:Landroid/widget/FrameLayout;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CAM_APP_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v1, Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContext:Landroid/content/Context;

    .line 62
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initView(Landroid/widget/FrameLayout;)V

    .line 63
    return-void
.end method

.method private beautyOperateMenuHandle(IZ)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->setCurrentBeautyMenuType(I)V

    .line 131
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->switchMenu()V

    .line 133
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setVisibility(I)V

    .line 134
    if-eqz p2, :cond_1

    .line 135
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->exitAnim(Landroid/view/View;)V

    .line 137
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    if-eqz p1, :cond_2

    .line 138
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->setVisibility(I)V

    .line 139
    if-eqz p2, :cond_2

    .line 140
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->getView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->enterAnim(Landroid/view/View;)V

    .line 143
    :cond_2
    return-void
.end method

.method private cameraOperateMenuHandle(Z)V
    .locals 2

    .line 146
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setVisibility(I)V

    .line 147
    if-eqz p1, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->enterAnim(Landroid/view/View;)V

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    if-eqz v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->setVisibility(I)V

    .line 152
    if-eqz p1, :cond_1

    .line 153
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->getView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->exitAnim(Landroid/view/View;)V

    .line 156
    :cond_1
    return-void
.end method

.method private enterAnim(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 159
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 160
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 161
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x8c

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 162
    return-void
.end method

.method private exitAnim(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 165
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 166
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x8c

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 167
    return-void
.end method

.method private initView(Landroid/widget/FrameLayout;)V
    .locals 1

    .line 66
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContainerView:Landroid/widget/FrameLayout;

    .line 67
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContainerView:Landroid/widget/FrameLayout;

    const v0, 0x7f0d001d

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/EdgeHorizonScrollView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 68
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContainerView:Landroid/widget/FrameLayout;

    const v0, 0x7f0d001e

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/ModeSelectView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateSelectView:Lcom/android/camera/ui/ModeSelectView;

    .line 69
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    .line 70
    return-void
.end method


# virtual methods
.method public bottomMenuAnimate(II)V
    .locals 1

    .line 170
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 172
    :cond_0
    const/16 p1, 0xa0

    if-ne p1, p2, :cond_1

    .line 173
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->animateExpanding(Z)V

    goto :goto_0

    .line 174
    :cond_1
    const/16 p1, 0xa1

    if-ne p1, p2, :cond_2

    .line 175
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->animateExpanding(Z)V

    .line 179
    :cond_2
    :goto_0
    return-void
.end method

.method public getCameraOperateMenuView()Lcom/android/camera/ui/EdgeHorizonScrollView;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateMenuView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    return-object v0
.end method

.method public getCameraOperateSelectView()Lcom/android/camera/ui/ModeSelectView;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mCameraOperateSelectView:Lcom/android/camera/ui/ModeSelectView;

    return-object v0
.end method

.method public getMenuData()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    .line 186
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->getBottomMenu()Lcom/android/camera/fragment/bottom/AbBottomMenu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContainerView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public initBeautyMenuView()V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    if-nez v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContainerView:Landroid/widget/FrameLayout;

    const v1, 0x7f0d001c

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 79
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 80
    new-instance v1, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    iput-object v1, p0, Lcom/android/camera/fragment/bottom/BottomActionMenu;->mBeautyOperateMenuView:Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;

    .line 82
    :cond_0
    return-void
.end method

.method public switchMenuMode(IIZ)V
    .locals 1

    .line 99
    packed-switch p1, :pswitch_data_0

    .line 113
    sget-object p1, Lcom/android/camera/fragment/bottom/BottomActionMenu;->TAG:Ljava/lang/String;

    const-string p2, "default switch menu mode:camera_operate"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->cameraOperateMenuHandle(Z)V

    goto :goto_0

    .line 109
    :pswitch_0
    sget-object p1, Lcom/android/camera/fragment/bottom/BottomActionMenu;->TAG:Ljava/lang/String;

    const-string v0, "switch menu mode:live_operate"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-direct {p0, p2, p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->beautyOperateMenuHandle(IZ)V

    .line 111
    goto :goto_0

    .line 105
    :pswitch_1
    sget-object p1, Lcom/android/camera/fragment/bottom/BottomActionMenu;->TAG:Ljava/lang/String;

    const-string v0, "switch menu mode:beauty_operate"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    invoke-direct {p0, p2, p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->beautyOperateMenuHandle(IZ)V

    .line 107
    goto :goto_0

    .line 101
    :pswitch_2
    sget-object p1, Lcom/android/camera/fragment/bottom/BottomActionMenu;->TAG:Ljava/lang/String;

    const-string p2, "switch menu mode:camera_operate"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->cameraOperateMenuHandle(Z)V

    .line 103
    nop

    .line 117
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public switchMenuMode(IZ)V
    .locals 1

    .line 125
    const/16 v0, 0xa1

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 126
    return-void
.end method
