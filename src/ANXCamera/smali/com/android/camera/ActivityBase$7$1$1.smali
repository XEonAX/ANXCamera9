.class Lcom/android/camera/ActivityBase$7$1$1;
.super Ljava/lang/Object;
.source "ActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase$7$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/camera/ActivityBase$7$1;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase$7$1;)V
    .locals 0

    .line 639
    iput-object p1, p0, Lcom/android/camera/ActivityBase$7$1$1;->this$2:Lcom/android/camera/ActivityBase$7$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 642
    iget-object v0, p0, Lcom/android/camera/ActivityBase$7$1$1;->this$2:Lcom/android/camera/ActivityBase$7$1;

    iget-object v0, v0, Lcom/android/camera/ActivityBase$7$1;->this$1:Lcom/android/camera/ActivityBase$7;

    iget-object v0, v0, Lcom/android/camera/ActivityBase$7;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mGLCoverView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 643
    return-void
.end method
