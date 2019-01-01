.class Landroid/provider/MiuiSettings$Secure$3;
.super Ljava/lang/Object;
.source "MiuiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/provider/MiuiSettings$Secure;->showApplyPasswordConfirmDialog(Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$businessKey:Ljava/lang/String;

.field final synthetic val$clickListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .line 3025
    iput-object p1, p0, Landroid/provider/MiuiSettings$Secure$3;->val$act:Landroid/app/Activity;

    iput-object p2, p0, Landroid/provider/MiuiSettings$Secure$3;->val$businessKey:Ljava/lang/String;

    iput-object p3, p0, Landroid/provider/MiuiSettings$Secure$3;->val$clickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 3028
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 3029
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$3;->val$act:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Landroid/provider/MiuiSettings$Secure$3;->val$businessKey:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 3031
    :cond_0
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$3;->val$clickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_1

    .line 3032
    iget-object v0, p0, Landroid/provider/MiuiSettings$Secure$3;->val$clickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 3034
    :cond_1
    return-void
.end method
