.class Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;
.super Ljava/lang/Object;
.source "LegacyMakeupParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

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

    .line 40
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

    iput p3, p1, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->mSelectedParam:I

    .line 42
    packed-switch p3, :pswitch_data_0

    .line 53
    sget-object p1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    goto :goto_0

    .line 50
    :pswitch_0
    sget-object p1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 51
    goto :goto_0

    .line 47
    :pswitch_1
    sget-object p1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 48
    goto :goto_0

    .line 44
    :pswitch_2
    sget-object p1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 45
    nop

    .line 56
    :goto_0
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 58
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xb4

    .line 59
    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 60
    if-eqz p1, :cond_0

    .line 61
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 63
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
