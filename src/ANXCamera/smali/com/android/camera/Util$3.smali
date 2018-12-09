.class Lcom/android/camera/Util$3;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$countdownTimer:Landroid/os/CountDownTimer;


# direct methods
.method constructor <init>(Landroid/os/CountDownTimer;)V
    .locals 0

    .line 625
    iput-object p1, p0, Lcom/android/camera/Util$3;->val$countdownTimer:Landroid/os/CountDownTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 628
    iget-object p1, p0, Lcom/android/camera/Util$3;->val$countdownTimer:Landroid/os/CountDownTimer;

    if-eqz p1, :cond_0

    .line 629
    iget-object p1, p0, Lcom/android/camera/Util$3;->val$countdownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    .line 631
    :cond_0
    return-void
.end method
