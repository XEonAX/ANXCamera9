.class Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;
.super Ljava/lang/Object;
.source "LiveBeautyFilterFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->bindEffectIndex(ILcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;)V
    .locals 0

    .line 296
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;->this$1:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;->this$1:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;->this$1:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->itemView:Landroid/view/View;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 302
    :cond_0
    return-void
.end method
