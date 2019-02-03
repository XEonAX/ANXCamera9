.class public Lcom/android/camera/ui/V6PreviewFrame;
.super Lcom/android/camera/ui/V6RelativeLayout;
.source "V6PreviewFrame.java"


# instance fields
.field public mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V6RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    return-void
.end method

.method private isReferenceLineEnabled()Z
    .locals 3

    .line 85
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_referenceline_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private needReferenceLineMode()Z
    .locals 2

    .line 76
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 77
    const/16 v1, 0xa3

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_1

    const/16 v1, 0xab

    if-eq v0, v1, :cond_1

    const/16 v1, 0xad

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public hidePreviewGrid()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0}, Lcom/android/camera/ui/SplitLineDrawer;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    .line 73
    :cond_0
    return-void
.end method

.method public onCameraOpen()V
    .locals 0

    .line 25
    invoke-super {p0}, Lcom/android/camera/ui/V6RelativeLayout;->onCameraOpen()V

    .line 26
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 37
    invoke-super {p0}, Lcom/android/camera/ui/V6RelativeLayout;->onFinishInflate()V

    .line 38
    const v0, 0x7f0d00e7

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewFrame;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/SplitLineDrawer;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    .line 39
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/ui/SplitLineDrawer;->initialize(II)V

    .line 40
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setBorderVisible(ZZ)V

    .line 41
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const v1, -0x7f000001

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setLineColor(I)V

    .line 42
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 30
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    .line 33
    :cond_0
    return-void
.end method

.method public updatePreviewGrid()V
    .locals 2

    .line 60
    invoke-direct {p0}, Lcom/android/camera/ui/V6PreviewFrame;->isReferenceLineEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/ui/V6PreviewFrame;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isScanQRCodeIntent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 62
    invoke-direct {p0}, Lcom/android/camera/ui/V6PreviewFrame;->needReferenceLineMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    goto :goto_0

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    .line 67
    :goto_0
    return-void
.end method

.method public updateReferenceLineAccordSquare()V
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0}, Lcom/android/camera/ui/SplitLineDrawer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 46
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/lit8 v1, v1, 0x6

    .line 48
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 49
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 v1, 0x0

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 52
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 54
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0}, Lcom/android/camera/ui/SplitLineDrawer;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0}, Lcom/android/camera/ui/SplitLineDrawer;->requestLayout()V

    .line 57
    :cond_1
    return-void
.end method
