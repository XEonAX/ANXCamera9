.class Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$3;
.super Ljava/lang/Object;
.source "BaseBeautyMakeupFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;)V
    .locals 0

    .line 138
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$3;->this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;

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

    .line 141
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$3;->this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    invoke-static {p1, p4, p5}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->access$202(Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;J)J

    .line 142
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$3;->this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;

    iput p3, p1, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->mSelectedParam:I

    .line 143
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    .line 144
    if-eqz p1, :cond_0

    instance-of p2, p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    if-eqz p2, :cond_0

    .line 145
    check-cast p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 146
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p2

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 147
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$3;->this$0:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;

    invoke-virtual {p2, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V

    .line 149
    :cond_0
    return-void
.end method
