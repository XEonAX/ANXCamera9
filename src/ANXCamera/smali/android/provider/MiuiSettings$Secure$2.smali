.class Landroid/provider/MiuiSettings$Secure$2;
.super Ljava/lang/Object;
.source "MiuiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/provider/MiuiSettings$Secure;->showSetPasswordConfirmDialog(Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$businessKey:Ljava/lang/String;

.field final synthetic val$dialogClickListener:Landroid/content/DialogInterface$OnClickListener;

.field final synthetic val$setPasswordRequestCode:I


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)V
    .registers 5

    .line 3000
    iput-object p1, p0, Landroid/provider/MiuiSettings$Secure$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Landroid/provider/MiuiSettings$Secure$2;->val$businessKey:Ljava/lang/String;

    iput p3, p0, Landroid/provider/MiuiSettings$Secure$2;->val$setPasswordRequestCode:I

    iput-object p4, p0, Landroid/provider/MiuiSettings$Secure$2;->val$dialogClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 3003
    const/4 v0, -0x1

    if-ne p2, v0, :cond_10

    .line 3004
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$2;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Landroid/provider/MiuiSettings$Secure$2;->val$businessKey:Ljava/lang/String;

    # invokes: Landroid/provider/MiuiSettings$Secure;->buildNewPasswordIntent(Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {v1}, Landroid/provider/MiuiSettings$Secure;->access$000(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    iget v2, p0, Landroid/provider/MiuiSettings$Secure$2;->val$setPasswordRequestCode:I

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 3006
    :cond_10
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$2;->val$dialogClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_19

    .line 3007
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$2;->val$dialogClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 3009
    :cond_19
    return-void
.end method
