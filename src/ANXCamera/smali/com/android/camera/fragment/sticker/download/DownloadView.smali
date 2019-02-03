.class public Lcom/android/camera/fragment/sticker/download/DownloadView;
.super Landroid/widget/RelativeLayout;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;,
        Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
    }
.end annotation


# static fields
.field private static final ALPHA_MIN:F = 0.0f

.field private static final ALPHA_NORMAL:F = 1.0f

.field private static final ANIMAL_APPEAR_TIME:I = 0x15e

.field private static final ANIMAL_DISAPPEAR_TIME:I = 0xfa

.field private static final ANIMAL_ROTATION_TIME:I = 0x3e8

.field private static final SCALE_MIN:F = 0.6f

.field private static final SCALE_NORMAL:F = 1.0f


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mListener:Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;

.field private mRotationAnimal:Landroid/animation/ObjectAnimator;

.field protected mState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 40
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->initView()V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->initView()V

    .line 46
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->doDownloading()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->rotation()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/sticker/download/DownloadView;)Landroid/widget/ImageView;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/sticker/download/DownloadView;)Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mListener:Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;->show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method private doDownloading()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getStateImageResource(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 71
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$2;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 79
    return-void
.end method

.method private hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 7

    .line 178
    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v2, v1, [F

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getAlphaNormal()F

    move-result v3

    const/4 v4, 0x0

    aput v3, v2, v4

    const/4 v3, 0x1

    const/4 v5, 0x0

    aput v5, v2, v3

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 179
    const-string v2, "scaleX"

    new-array v5, v1, [F

    fill-array-data v5, :array_0

    invoke-static {v2, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 180
    const-string v5, "scaleY"

    new-array v6, v1, [F

    fill-array-data v6, :array_1

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 181
    const/4 v6, 0x3

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v6, v4

    aput-object v2, v6, v3

    aput-object v5, v6, v1

    invoke-static {p1, v6}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 182
    if-eqz p2, :cond_0

    .line 183
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 185
    :cond_0
    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 186
    const-wide/16 v0, 0xfa

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 187
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
    .end array-data
.end method

.method private initView()V
    .locals 2

    .line 49
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    .line 50
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    const/4 v1, -0x2

    invoke-virtual {p0, v0, v1, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->addView(Landroid/view/View;II)V

    .line 51
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 52
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 53
    return-void
.end method

.method private rotation()V
    .locals 3

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    const-string v1, "rotation"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    .line 192
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 194
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 197
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method private show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 7

    .line 165
    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v2, v1, [F

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v2, v3

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getAlphaNormal()F

    move-result v4

    const/4 v5, 0x1

    aput v4, v2, v5

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 166
    const-string v2, "scaleX"

    new-array v4, v1, [F

    fill-array-data v4, :array_0

    invoke-static {v2, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 167
    const-string v4, "scaleY"

    new-array v6, v1, [F

    fill-array-data v6, :array_1

    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    .line 169
    const/4 v6, 0x3

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v6, v3

    aput-object v2, v6, v5

    aput-object v4, v6, v1

    invoke-static {p1, v6}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 170
    if-eqz p2, :cond_0

    .line 171
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 173
    :cond_0
    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 174
    const-wide/16 v0, 0x15e

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 175
    return-void

    :array_0
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public clearAnimation()V
    .locals 1

    .line 106
    invoke-super {p0}, Landroid/widget/RelativeLayout;->clearAnimation()V

    .line 107
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 108
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    .line 111
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getAlphaNormal()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setAlpha(F)V

    .line 112
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setScaleX(F)V

    .line 113
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setScaleY(F)V

    .line 114
    return-void
.end method

.method public endDownloading()V
    .locals 2

    .line 82
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 83
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$3;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 102
    return-void
.end method

.method protected getAlphaNormal()F
    .locals 1

    .line 131
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method protected getStateImageResource(I)I
    .locals 1

    .line 117
    const v0, 0x7f020190

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 127
    const/4 p1, 0x0

    return p1

    .line 125
    :pswitch_0
    return v0

    .line 123
    :pswitch_1
    const p1, 0x7f020191

    return p1

    .line 121
    :pswitch_2
    const p1, 0x7f020192

    return p1

    .line 119
    :cond_0
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setOnDownloadSuccessListener(Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mListener:Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;

    .line 57
    return-void
.end method

.method public setStateImage(I)V
    .locals 1

    .line 135
    iput p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mState:I

    .line 136
    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 157
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 158
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 159
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getStateImageResource(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 153
    :pswitch_1
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 154
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->endDownloading()V

    .line 155
    goto :goto_0

    .line 148
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 149
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 150
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->doDownloading()V

    .line 151
    goto :goto_0

    .line 139
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 140
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 141
    goto :goto_0

    .line 143
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 144
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 145
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getStateImageResource(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 146
    nop

    .line 162
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public startDownload()V
    .locals 2

    .line 60
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 61
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$1;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    return-void
.end method
