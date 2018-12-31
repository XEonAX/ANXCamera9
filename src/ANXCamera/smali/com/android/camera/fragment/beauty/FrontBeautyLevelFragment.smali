.class public Lcom/android/camera/fragment/beauty/FrontBeautyLevelFragment;
.super Lcom/android/camera/fragment/beauty/BeautyLevelFragment;
.source "FrontBeautyLevelFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

    return-void
.end method

.method private setBeautyLevel(I)V
    .locals 3

    .line 36
    invoke-static {}, Lcom/mi/config/b;->hr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 37
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    .line 39
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc5

    .line 40
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 41
    if-eqz v1, :cond_1

    .line 42
    const/4 v2, 0x1

    if-nez v0, :cond_0

    if-lez p1, :cond_0

    .line 43
    const/16 v0, 0xa0

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onBottomMenuAnimate(II)V

    goto :goto_0

    .line 44
    :cond_0
    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    .line 45
    const/16 v0, 0xa1

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onBottomMenuAnimate(II)V

    .line 49
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    .line 50
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    .line 51
    return-void
.end method


# virtual methods
.method protected initBeautyItems()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;",
            ">;"
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FrontBeautyLevelFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0028

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 20
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v3, 0x7f020041

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x0

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x2

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x3

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x4

    aget-object v0, v0, v3

    invoke-direct {v2, v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    return-object v1
.end method

.method protected onLevelClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/beauty/FrontBeautyLevelFragment;->setBeautyLevel(I)V

    .line 33
    return-void
.end method
