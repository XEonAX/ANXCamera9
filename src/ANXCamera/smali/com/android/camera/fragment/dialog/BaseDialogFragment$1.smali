.class Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;
.super Ljava/lang/Object;
.source "BaseDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/dialog/BaseDialogFragment;->initViewOnTouchListener(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/dialog/BaseDialogFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dialog/BaseDialogFragment;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;->this$0:Lcom/android/camera/fragment/dialog/BaseDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 44
    iget-object p1, p0, Lcom/android/camera/fragment/dialog/BaseDialogFragment$1;->this$0:Lcom/android/camera/fragment/dialog/BaseDialogFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/dialog/BaseDialogFragment;->access$100(Lcom/android/camera/fragment/dialog/BaseDialogFragment;)Landroid/view/GestureDetector;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
