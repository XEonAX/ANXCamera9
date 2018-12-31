.class public Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;
.super Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.source "RemodelingParamsFragment.java"


# static fields
.field private static final MAKEUP_ITEM_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBeautyTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    .line 26
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f02016a

    const v5, 0x7f0b01d8

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020167

    const v5, 0x7f0b01d7

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020173

    const v5, 0x7f0b01d9

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020175

    const v5, 0x7f0b01da

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f02016e

    const v5, 0x7f0b01db

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020163

    const v5, 0x7f0b01dc

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020172

    const v5, 0x7f0b01dd

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020177

    const v5, 0x7f0b01de

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020178

    const v5, 0x7f0b01df

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)Ljava/util/List;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100()Ljava/util/HashMap;
    .locals 1

    .line 20
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method protected initItems()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getBeautyItems()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getBeautyItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 63
    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getBeautyItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 64
    sget-object v3, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 65
    sget-object v3, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_1
    goto :goto_0

    .line 69
    :cond_2
    return-object v0

    .line 61
    :cond_3
    :goto_1
    return-object v0
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    .line 74
    new-instance v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V

    return-object v0
.end method

.method protected reSelectItem()V
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 93
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 94
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 96
    :cond_0
    return-void
.end method
