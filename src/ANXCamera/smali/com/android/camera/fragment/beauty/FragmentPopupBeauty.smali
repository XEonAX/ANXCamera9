.class public Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPopupBeauty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xf9


# instance fields
.field private mIconBeauty:Landroid/view/View;

.field private mIconSticker:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private disappear()V
    .locals 5

    .line 158
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 159
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    const-string v3, "alpha"

    new-array v4, v2, [F

    fill-array-data v4, :array_1

    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 160
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 161
    new-array v2, v2, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v0, v2, v4

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-virtual {v3, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 162
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 163
    const-wide/16 v0, 0x190

    invoke-virtual {v3, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 164
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 165
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 62
    const/16 v0, 0xf9

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 57
    const v0, 0x7f04002b

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 43
    nop

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 45
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 47
    const v0, 0x7f0d0093

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    .line 48
    const v0, 0x7f0d0094

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    .line 49
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->provideAnimateElement(ILjava/util/List;I)V

    .line 53
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 145
    return-void
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 149
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 150
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 154
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 155
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 114
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    return-void

    .line 117
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/16 v0, 0xa0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 130
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 131
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 132
    if-nez p1, :cond_1

    .line 133
    return-void

    .line 135
    :cond_1
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 120
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 121
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 122
    if-nez p1, :cond_2

    .line 123
    return-void

    .line 125
    :cond_2
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 127
    nop

    .line 139
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 140
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d0093
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    .line 68
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 70
    nop

    .line 71
    const/16 p3, 0xa3

    const/4 v0, 0x1

    if-eq p1, p3, :cond_0

    const/16 p3, 0xa5

    if-eq p1, p3, :cond_0

    .line 77
    const/4 p1, -0x1

    goto :goto_0

    .line 74
    :cond_0
    nop

    .line 75
    nop

    .line 81
    move p1, v0

    :goto_0
    iget-object p3, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 82
    iget-object p3, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    if-ne p3, p1, :cond_1

    .line 83
    return-void

    .line 87
    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 89
    if-nez p2, :cond_3

    .line 90
    if-ne p1, v0, :cond_2

    .line 91
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 92
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 94
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 95
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 98
    :cond_3
    const/4 p3, 0x5

    const/4 v1, 0x3

    if-ne p1, v0, :cond_4

    .line 99
    new-instance p1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-direct {p1, v0, v1}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 100
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 99
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance p1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 102
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 101
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 104
    :cond_4
    new-instance p1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-direct {p1, v0, v1}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 105
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 104
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance p1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 107
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 106
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    :goto_1
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 170
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 174
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 177
    return-object p1

    .line 172
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
