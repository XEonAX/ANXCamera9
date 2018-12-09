.class Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;
.super Ljava/lang/Object;
.source "FragmentFilter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;)V
    .locals 0

    .line 396
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;->this$1:Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 399
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;->this$1:Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 400
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;->this$1:Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->itemView:Landroid/view/View;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 402
    :cond_0
    return-void
.end method
