.class public Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPopupMakeup.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/fragment/BaseFragment;",
        "Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xfc

.field private static SEEKBAR_PROGRESS_MAX:I = 0x0

.field private static final SEEKBAR_PROGRESS_RATIO:I = 0x1


# instance fields
.field private mActiveProgress:I

.field private mDisposable:Lio/reactivex/disposables/Disposable;

.field private mFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsRTL:Z

.field private mIsShow:Z

.field private mRootView:Landroid/view/View;

.field private mSeekBar:Lcom/android/camera/ui/SeekBarCompat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/16 v0, 0x64

    sput v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$100()I
    .locals 1

    .line 38
    sget v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)I
    .locals 0

    .line 38
    iget p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I
    .locals 0

    .line 38
    iput p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Z
    .locals 0

    .line 38
    iget-boolean p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsRTL:Z

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->centerSeekbarValueMap(I)I

    move-result p0

    return p0
.end method

.method private centerSeekbarValueMap(I)I
    .locals 1

    .line 173
    sget v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p1, v0

    return p1
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 297
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setProgress(I)V

    .line 298
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->accept(Ljava/lang/Integer;)V

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 200
    const/16 v0, 0xfc

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 195
    const v0, 0x7f04002d

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    .line 60
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsRTL:Z

    .line 61
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    .line 63
    nop

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 65
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a00d5

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 67
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$1;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$3;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 81
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$2;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    .line 82
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->onBackpressureDrop(Lio/reactivex/functions/Consumer;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 89
    invoke-virtual {v0, p0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    .line 90
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    .line 92
    const v0, 0x7f0d0095

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/SeekBarCompat;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    .line 93
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    .line 94
    iget-object v2, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 95
    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isSupportTwoWayAdjustable(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 96
    :goto_0
    if-eqz v2, :cond_1

    .line 97
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    .line 101
    :goto_1
    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 102
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 104
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0201c9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 105
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$4;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarChangeListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;)V

    .line 126
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarCompatTouchListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;)V

    .line 170
    return-void
.end method

.method public isShow()Z
    .locals 1

    .line 302
    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    return v0
.end method

.method public onMakeupItemSelected()V
    .locals 2

    .line 260
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    .line 261
    iget-object v1, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 262
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isSupportTwoWayAdjustable(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result v1

    .line 263
    if-eqz v1, :cond_0

    .line 264
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    goto :goto_0

    .line 266
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    .line 268
    :goto_0
    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 269
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 271
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 273
    :goto_1
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    .line 206
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 209
    const/16 p3, 0xa3

    const/4 v0, 0x1

    const/4 v1, -0x1

    if-eq p1, p3, :cond_0

    const/16 p3, 0xa5

    if-eq p1, p3, :cond_0

    .line 215
    nop

    .line 219
    move p1, v1

    goto :goto_0

    .line 212
    :cond_0
    nop

    .line 213
    nop

    .line 219
    move p1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    if-ne p3, p1, :cond_1

    .line 220
    return-void

    .line 222
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p3, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 223
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p3

    const/16 v2, 0xc2

    invoke-virtual {p3, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p3

    check-cast p3, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 224
    if-eqz p3, :cond_2

    invoke-interface {p3}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result p3

    if-nez p3, :cond_3

    .line 225
    :cond_2
    nop

    .line 227
    move p1, v1

    :cond_3
    const/16 p3, 0x50

    if-ne p1, v0, :cond_6

    .line 228
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_4

    .line 229
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 232
    :cond_4
    if-nez p2, :cond_5

    .line 233
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1, p3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_1

    .line 235
    :cond_5
    new-instance p1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 236
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 235
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 239
    :cond_6
    if-nez p2, :cond_7

    .line 240
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1, p3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_1

    .line 242
    :cond_7
    new-instance p1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 243
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 242
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    :goto_1
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 250
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 255
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xa2

    aput v2, v0, v1

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 178
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 179
    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 180
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    .line 181
    return-void
.end method

.method public setSeekBarMode(I)V
    .locals 4

    .line 277
    nop

    .line 278
    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 285
    :pswitch_0
    const/16 p1, 0xc8

    sput p1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    .line 286
    nop

    .line 287
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020024

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 290
    move v1, v0

    goto :goto_0

    .line 280
    :pswitch_1
    const/16 p1, 0x64

    sput p1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    .line 281
    nop

    .line 282
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0201c9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 283
    nop

    .line 290
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    sget v2, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/SeekBarCompat;->setMax(I)V

    .line 291
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setCenterSeekbarMode(Z)V

    .line 292
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getProgress()I

    move-result v1

    mul-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    .line 293
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 185
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 186
    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 187
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result p1

    if-nez p1, :cond_0

    .line 188
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 190
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    .line 191
    return-void
.end method
