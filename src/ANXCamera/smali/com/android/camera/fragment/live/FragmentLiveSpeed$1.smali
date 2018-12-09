.class Lcom/android/camera/fragment/live/FragmentLiveSpeed$1;
.super Ljava/lang/Object;
.source "FragmentLiveSpeed.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSpeed;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSpeed;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

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

    .line 59
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    invoke-virtual {p1, p3}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->onItemSelected(I)V

    .line 60
    return-void
.end method
