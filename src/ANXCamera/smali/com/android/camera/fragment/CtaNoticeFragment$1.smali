.class Lcom/android/camera/fragment/CtaNoticeFragment$1;
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

    .line 114
    iput-object p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 117
    iget-object v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->access$000(Lcom/android/camera/fragment/CtaNoticeFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 118
    :goto_0
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->setCanConnectNetwork(ZZ)V

    .line 119
    iget-object v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->access$100(Lcom/android/camera/fragment/CtaNoticeFragment;)Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->access$100(Lcom/android/camera/fragment/CtaNoticeFragment;)Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;->onNegativeClick(Landroid/content/DialogInterface;I)V

    .line 122
    :cond_1
    return-void
.end method
