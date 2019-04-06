.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;
.super Ljava/lang/Object;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji;->showEditDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

.field final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/app/AlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$202(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    return-void
.end method
