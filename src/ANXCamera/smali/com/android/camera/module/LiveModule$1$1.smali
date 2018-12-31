.class Lcom/android/camera/module/LiveModule$1$1;
.super Ljava/lang/Object;
.source "LiveModule.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/LiveModule$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/LiveModule$1;


# direct methods
.method constructor <init>(Lcom/android/camera/module/LiveModule$1;)V
    .locals 0

    .line 244
    iput-object p1, p0, Lcom/android/camera/module/LiveModule$1$1;->this$1:Lcom/android/camera/module/LiveModule$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 247
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$1$1;->this$1:Lcom/android/camera/module/LiveModule$1;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule$1;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.settings.DATE_SETTINGS"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 248
    return-void
.end method
