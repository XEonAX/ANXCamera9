.class public Lcom/android/camera/fragment/sticker/FragmentSticker;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentSticker.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;,
        Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xff


# instance fields
.field private mBackButton:Landroid/widget/ImageView;

.field private mOnRadioButtonChangedListener:Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

.field private mRadioGroup:Landroid/widget/RadioGroup;

.field private mViewPager:Lcom/android/camera/ui/NoScrollViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/ui/NoScrollViewPager;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mOnRadioButtonChangedListener:Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/sticker/FragmentSticker;)I
    .locals 0

    .line 30
    iget p0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mCurrentMode:I

    return p0
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 141
    const/16 v0, 0xff

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 136
    const v0, 0x7f04002b

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 42
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 43
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 45
    int-to-float v1, v1

    int-to-float v0, v0

    const/high16 v2, 0x3f400000    # 0.75f

    div-float/2addr v0, v2

    sub-float/2addr v1, v0

    float-to-int v0, v1

    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 48
    const v0, 0x7f0d0013

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {v1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {v1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    .line 53
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 54
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentSticker$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$1;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 76
    const v0, 0x7f0d0080

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    .line 77
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentSticker$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$2;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 95
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f0d0081

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 97
    const v0, 0x7f0d0083

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mBackButton:Landroid/widget/ImageView;

    .line 98
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mBackButton:Landroid/widget/ImageView;

    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentSticker$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$3;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;)Z

    .line 118
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 3

    .line 193
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 194
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 195
    return v0

    .line 197
    :cond_0
    const v1, 0x7f0d0019

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xff

    if-eq v1, v2, :cond_1

    .line 198
    return v0

    .line 201
    :cond_1
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 202
    const/4 p1, 0x1

    return p1
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 146
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 147
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 0

    .line 178
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1

    nop

    :array_0
    .array-data 4
        0xa7
        0xa1
    .end array-data
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .line 185
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0

    nop

    :array_0
    .array-data 4
        0xa8
        0xa2
    .end array-data
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 122
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 123
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 125
    return-void
.end method

.method public setOnRadioButtonChangedListener(Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mOnRadioButtonChangedListener:Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

    .line 170
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 129
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 130
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 132
    return-void
.end method
