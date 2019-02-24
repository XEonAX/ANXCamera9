.class Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;
.super Ljava/lang/Object;
.source "RemodelingParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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

    .line 77
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    iput p3, p1, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mSelectedParam:I

    .line 78
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->access$000(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 79
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 80
    invoke-static {}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->access$100()Ljava/util/HashMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 82
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 83
    const/16 p2, 0xb4

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 84
    if-eqz p1, :cond_0

    .line 85
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 87
    :cond_0
    return-void
.end method
