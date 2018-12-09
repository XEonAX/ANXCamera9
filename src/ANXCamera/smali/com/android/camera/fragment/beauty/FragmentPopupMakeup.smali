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

    .line 43
    const/16 v0, 0x64

    sput v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$100()I
    .locals 1

    .line 36
    sget v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)I
    .locals 0

    .line 36
    iget p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I
    .locals 0

    .line 36
    iput p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Lcom/android/camera/ui/SeekBarCompat;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Z
    .locals 0

    .line 36
    iget-boolean p0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsRTL:Z

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;I)I
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->centerSeekbarValueMap(I)I

    move-result p0

    return p0
.end method

.method private centerSeekbarValueMap(I)I
    .locals 1

    .line 171
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

    .line 293
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setProgress(I)V

    .line 294
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

    .line 36
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->accept(Ljava/lang/Integer;)V

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 198
    const/16 v0, 0xfc

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 193
    const v0, 0x7f04002a

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    .line 58
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsRTL:Z

    .line 59
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    .line 61
    nop

    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 63
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0900d1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 65
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$1;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$3;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 79
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$2;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    .line 80
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->onBackpressureDrop(Lio/reactivex/functions/Consumer;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 87
    invoke-virtual {v0, p0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    .line 88
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mActiveProgress:I

    .line 90
    const v0, 0x7f0d007f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/SeekBarCompat;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    .line 91
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    .line 92
    iget-object v2, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 93
    invoke-static {v2}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isSupportTwoWayAdjustable(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result v2

    .line 94
    if-eqz v2, :cond_0

    .line 95
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    .line 99
    :goto_0
    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 100
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 102
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020198

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 103
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$4;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarChangeListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;)V

    .line 124
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;-><init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarCompatTouchListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;)V

    .line 168
    return-void
.end method

.method public isShow()Z
    .locals 1

    .line 298
    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    return v0
.end method

.method public onMakeupItemSelected()V
    .locals 2

    .line 256
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    .line 257
    iget-object v1, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 258
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isSupportTwoWayAdjustable(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result v1

    .line 259
    if-eqz v1, :cond_0

    .line 260
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    goto :goto_0

    .line 262
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->setSeekBarMode(I)V

    .line 264
    :goto_0
    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 265
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 267
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mRootView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 269
    :goto_1
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 204
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 206
    nop

    .line 207
    const/16 p3, 0xa3

    const/4 v0, 0x1

    if-eq p1, p3, :cond_0

    const/16 p3, 0xa5

    if-eq p1, p3, :cond_0

    .line 213
    const/4 p1, -0x1

    goto :goto_0

    .line 210
    :cond_0
    nop

    .line 211
    nop

    .line 217
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

    .line 218
    return-void

    .line 221
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 223
    const/16 p3, 0x50

    if-ne p1, v0, :cond_4

    .line 224
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    .line 225
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 228
    :cond_2
    if-nez p2, :cond_3

    .line 229
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1, p3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_1

    .line 231
    :cond_3
    new-instance p1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 232
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 231
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 235
    :cond_4
    if-nez p2, :cond_5

    .line 236
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1, p3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_1

    .line 238
    :cond_5
    new-instance p1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, v0, p3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 239
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 238
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    :goto_1
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 246
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

    .line 251
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

    .line 176
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 177
    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 178
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    .line 179
    return-void
.end method

.method public setSeekBarMode(I)V
    .locals 4

    .line 273
    nop

    .line 274
    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 281
    :pswitch_0
    const/16 p1, 0xc8

    sput p1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    .line 282
    nop

    .line 283
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02001f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 286
    move v1, v0

    goto :goto_0

    .line 276
    :pswitch_1
    const/16 p1, 0x64

    sput p1, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    .line 277
    nop

    .line 278
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020198

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 279
    nop

    .line 286
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    sget v2, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->SEEKBAR_PROGRESS_MAX:I

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/SeekBarCompat;->setMax(I)V

    .line 287
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setCenterSeekbarMode(Z)V

    .line 288
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getProgress()I

    move-result v1

    mul-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    .line 289
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

    .line 183
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 184
    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 185
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result p1

    if-nez p1, :cond_0

    .line 186
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 188
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->mIsShow:Z

    .line 189
    return-void
.end method
