.class Lcom/android/camera/fragment/FragmentFullScreen$10;
.super Ljava/lang/Object;
.source "FragmentFullScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentFullScreen;->onPlayCompleted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFullScreen;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 477
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen$10;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 480
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen$10;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentFullScreen;->access$402(Lcom/android/camera/fragment/FragmentFullScreen;Z)Z

    .line 481
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen$10;->this$0:Lcom/android/camera/fragment/FragmentFullScreen;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentFullScreen;->access$500(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 482
    return-void
.end method
