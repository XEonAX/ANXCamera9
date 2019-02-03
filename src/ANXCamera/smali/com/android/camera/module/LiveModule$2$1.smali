.class Lcom/android/camera/module/LiveModule$2$1;
.super Ljava/lang/Object;
.source "LiveModule.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/LiveModule$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/LiveModule$2;


# direct methods
.method constructor <init>(Lcom/android/camera/module/LiveModule$2;)V
    .locals 0

    .line 300
    iput-object p1, p0, Lcom/android/camera/module/LiveModule$2$1;->this$1:Lcom/android/camera/module/LiveModule$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 303
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$2$1;->this$1:Lcom/android/camera/module/LiveModule$2;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule$2;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.settings.DATE_SETTINGS"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 304
    return-void
.end method
