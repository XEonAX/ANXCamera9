.class Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$4;
.super Ljava/lang/Object;
.source "FragmentFullScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->showExitConfirm()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;)V
    .locals 0

    .line 436
    iput-object p1, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$4;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 439
    const-string p1, "live\u9884\u89c8\u9000\u51fa\u786e\u8ba4"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 440
    iget-object p1, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$4;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->access$202(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 441
    iget-object p1, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$4;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->quitLiveRecordPreview(Z)V

    .line 442
    return-void
.end method
