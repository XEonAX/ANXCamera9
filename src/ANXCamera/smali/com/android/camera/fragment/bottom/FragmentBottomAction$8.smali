.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showReverseConfirmDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V
    .locals 0

    .line 1043
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1046
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/CameraSnapView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->removeLastSegment()V

    .line 1047
    const-string p1, "live\u5f55\u5236\u56de\u9000\u786e\u8ba4"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 1049
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1050
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1051
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->doReverse()V

    .line 1053
    return-void
.end method
