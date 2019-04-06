.class public Lcom/android/camera/fragment/FragmentWideSelfie;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentWideSelfie.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xffe

.field private static final TAG:Ljava/lang/String; = "WideSelfie"


# instance fields
.field private mIsCurrentLandScape:Z

.field private mIsShooting:Z

.field private mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

.field private mStillPreview:Lcom/android/camera/ui/GLTextureView;

.field private mStillPreviewHeight:I

.field private mStillPreviewLayout:Landroid/widget/RelativeLayout;

.field private mStillPreviewWidth:I

.field private mThumbBgHeight:I

.field private mThumbBgHeightVertical:I

.field private mThumbBgTopMargin:I

.field private mThumbBgTopMarginVertical:I

.field private mThumbBgWidth:I

.field private mThumbBgWidthVertical:I

.field private mThumbNailBackground:Landroid/view/ViewGroup;

.field private mThumbViewHeight:I

.field private mThumbViewHeightVertical:I

.field private mThumbViewTopMargin:I

.field private mThumbViewTopMarginVertical:I

.field private mThumbViewWidth:I

.field private mThumbViewWidthVertical:I

.field private mUseHint:Landroid/widget/TextView;

.field private mUseHintLeft:Landroid/widget/TextView;

.field private mUseHintRight:Landroid/widget/TextView;

.field private mViewRoot:Landroid/view/View;

.field private mWaitingFirstFrame:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mWaitingFirstFrame:Z

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentWideSelfie;)Lcom/android/camera/ui/GLTextureView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentWideSelfie;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mWaitingFirstFrame:Z

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/FragmentWideSelfie;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mWaitingFirstFrame:Z

    return p1
.end method

.method private updateProgressImageViewLayout(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    invoke-virtual {v0}, Lcom/android/camera/wideselfie/DrawImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewWidthVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewHeightVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewTopMarginVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/DrawImageView;->requestLayout()V

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewWidth:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewHeight:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewTopMargin:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/DrawImageView;->requestLayout()V

    :goto_0
    return-void
.end method

.method private updateStillPreviewLayout(Z)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMarginVertical:I

    add-int/lit8 p1, p1, 0x1

    iget v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeightVertical:I

    add-int/lit8 v1, v1, -0x2

    iget v2, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewHeight:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr p1, v1

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->requestLayout()V

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMargin:I

    add-int/lit8 p1, p1, 0x1

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->requestLayout()V

    :goto_0
    return-void
.end method

.method private updateThumbnailBackgroundLayout(Z)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgWidthVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeightVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMarginVertical:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgWidth:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeight:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMargin:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    :goto_0
    return-void
.end method

.method private updateUiLayout(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHint:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintRight:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    iget v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mDegree:I

    invoke-virtual {v0, v1}, Lcom/android/camera/wideselfie/DrawImageView;->setOrientation(I)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentWideSelfie;->isLandScape()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "WideSelfie"

    const-string v1, "updateUiLayout LandScape"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentWideSelfie;->isLeftLandScape()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->startAnimateViewVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentWideSelfie;->isRightLandScape()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintRight:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->startAnimateViewVisible(Landroid/view/View;Z)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateThumbnailBackgroundLayout(Z)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateProgressImageViewLayout(Z)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateStillPreviewLayout(Z)V

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mIsCurrentLandScape:Z

    goto :goto_1

    :cond_3
    const-string v0, "WideSelfie"

    const-string v1, "updateUiLayout Portrait"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHint:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->startAnimateViewVisible(Landroid/view/View;Z)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateThumbnailBackgroundLayout(Z)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateProgressImageViewLayout(Z)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateStillPreviewLayout(Z)V

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mIsCurrentLandScape:Z

    :goto_1
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xffe

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040053

    return v0
.end method

.method public initPreviewLayout(IIII)V
    .locals 0

    iget-object p3, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {p3}, Lcom/android/camera/ui/GLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView;->requestLayout()V

    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    const-string v0, "WideSelfie"

    const-string v1, "initView"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d012f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHint:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d0130

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d0131

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintRight:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    const/high16 v0, 0x42b40000    # 90.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintRight:Landroid/widget/TextView;

    const/high16 v0, -0x3d4c0000    # -90.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d012e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/wideselfie/DrawImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d012d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/GLTextureView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d012c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const v0, 0x7f0d012b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewWidth:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewHeight:I

    iget v2, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgWidth:I

    iget v3, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeightVertical:I

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/android/camera/wideselfie/DrawImageView;->setParams(IIII)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView;->getRenderer()Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    new-instance p1, Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1}, Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;-><init>(Lcom/android/camera/fragment/FragmentWideSelfie;Lcom/android/camera/fragment/FragmentWideSelfie$1;)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/GLTextureView;->setEGLContextClientVersion(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    new-instance v2, Lcom/android/camera/fragment/FragmentWideSelfie$1;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentWideSelfie$1;-><init>(Lcom/android/camera/fragment/FragmentWideSelfie;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/GLTextureView;->setEGLShareContextGetter(Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/GLTextureView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/GLTextureView;->setRenderMode(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    :cond_0
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateThumbnailBackgroundLayout(Z)V

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateProgressImageViewLayout(Z)V

    return-void
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mCurrentMode:I

    const/16 v0, 0xb0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->showSmallPreview(Z)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentWideSelfie;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewWidth()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewWidth:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewHeight()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewHeight:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgWidth()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgWidth:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgHeight()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeight:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgTopMargin()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMargin:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgWidthVertical()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgWidthVertical:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgHeightVertical()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgHeightVertical:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgTopMarginVertical()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbBgTopMarginVertical:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewWidth()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewWidth:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewHeight()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewHeight:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewTopMargin()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewTopMargin:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewWidthVertical()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewWidthVertical:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewHeightVertical()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewHeightVertical:I

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbViewTopMarginVertical()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbViewTopMarginVertical:I

    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onDestroy()V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    const/16 p3, 0xb0

    if-eq p1, p3, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    if-nez p2, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p3, 0x96

    invoke-virtual {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/GLTextureView;->setAlpha(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    nop

    :cond_2
    :goto_0
    return-void
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mIsShooting:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateUiLayout(Z)V

    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    const/16 v0, 0xd8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->requestRender()V

    :cond_0
    return-void
.end method

.method public resetShootUI()V
    .locals 3

    const-string v0, "WideSelfie"

    const-string v1, "resetShootUI"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mIsShooting:Z

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentWideSelfie;->setClickEnable(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/android/camera/wideselfie/DrawImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->updateUiLayout(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->onResume()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHint:Landroid/widget/TextView;

    const v1, 0x7f0902bf

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintRight:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public setShootingUI()V
    .locals 3

    const-string v0, "WideSelfie"

    const-string v1, "setShootingUI"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mIsShooting:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->setClickEnable(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2}, Lcom/android/camera/wideselfie/DrawImageView;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    invoke-virtual {v1, v0}, Lcom/android/camera/wideselfie/DrawImageView;->setVisibility(I)V

    return-void
.end method

.method public showSmallPreview(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->requestLayout()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->onResume()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->requestRender()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mWaitingFirstFrame:Z

    if-eqz p1, :cond_0

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v0, 0x258

    invoke-virtual {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mViewRoot:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    const/16 v0, 0xd8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public updateHintText(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHint:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mUseHintLeft:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public updatePreviewBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mStillPreviewLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mProgressImageView:Lcom/android/camera/wideselfie/DrawImageView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/wideselfie/DrawImageView;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method

.method public updateThumbBackgroudLayout(ZZI)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz p1, :cond_1

    iget p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    sub-int/2addr p1, p3

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-eqz p2, :cond_0

    iget p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    add-int/2addr p1, p3

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    goto :goto_1

    :cond_1
    iget p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    sub-int v1, p1, p3

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    const/16 v1, 0xe

    if-eqz p2, :cond_2

    sget p2, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr p2, p1

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, p3

    iput p2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    goto :goto_0

    :cond_2
    sget p2, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr p2, p1

    div-int/lit8 p2, p2, 0x2

    iput p2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie;->mThumbNailBackground:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    :goto_1
    return-void
.end method
