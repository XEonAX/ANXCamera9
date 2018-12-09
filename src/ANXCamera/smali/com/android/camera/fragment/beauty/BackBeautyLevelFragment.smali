.class public Lcom/android/camera/fragment/beauty/BackBeautyLevelFragment;
.super Lcom/android/camera/fragment/beauty/BeautyLevelFragment;
.source "BackBeautyLevelFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

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

    .line 15
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BackBeautyLevelFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0028

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 16
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v3, 0x7f020036

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x0

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x2

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x3

    aget-object v3, v0, v3

    invoke-direct {v2, v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    new-instance v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const/4 v3, 0x4

    aget-object v0, v0, v3

    invoke-direct {v2, v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
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

    .line 28
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    .line 29
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    .line 30
    return-void
.end method
