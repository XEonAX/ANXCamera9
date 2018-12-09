.class Lcom/android/camera/fragment/CtaNoticeFragment$2;
.super Ljava/lang/Object;
.source "CtaNoticeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/CtaNoticeFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/CtaNoticeFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment$2;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 81
    iget-object p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment$2;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-virtual {p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    check-cast p1, Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result p1

    invoke-static {p1}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->setCanConnectNetwork(Z)V

    .line 82
    return-void
.end method
