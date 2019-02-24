.class Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;
.super Ljava/lang/Object;
.source "BeautyEyeLightFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

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

    .line 136
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-static {p1, p3}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->access$000(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;I)V

    .line 137
    return-void
.end method
