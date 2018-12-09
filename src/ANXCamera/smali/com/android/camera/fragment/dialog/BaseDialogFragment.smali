.class public Lcom/android/camera/fragment/dialog/BaseDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "BaseDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/dialog/BaseDialogFragment$MyOnGestureListener;
    }
.end annotation


# instance fields
.field private gesture:Landroid/view/GestureDetector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/dialog/BaseDialogFragment;)Landroid/view/GestureDetector;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->gesture:Landroid/view/GestureDetector;

    return-object p0
.end method


# virtual methods
.method public canProvide()Z
    .locals 1

    .line 36
    const/4 v0, 0x0

    return v0
.end method

.method protected initViewOnTouchListener(Landroid/view/View;)V
    .locals 4

    .line 40
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/dialog/BaseDialogFragment$MyOnGestureListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/camera/fragment/dialog/BaseDialogFragment$MyOnGestureListener;-><init>(Lcom/android/camera/fragment/dialog/BaseDialogFragment;Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->gesture:Landroid/view/GestureDetector;

    .line 41
    new-instance v0, Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;-><init>(Lcom/android/camera/fragment/dialog/BaseDialogFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 47
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 0

    .line 31
    const/4 p1, 0x0

    return p1
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 26
    const/4 p1, 0x0

    return p1
.end method
