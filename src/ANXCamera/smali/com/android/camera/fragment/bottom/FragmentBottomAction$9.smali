.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;
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

    .line 1060
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1063
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$302(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 1064
    return-void
.end method
