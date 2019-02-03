.class Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$1;
.super Ljava/lang/Object;
.source "FragmentFullScreen.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->hideScreenLight()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$1;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$1;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    invoke-static {v0}, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->access$000(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 132
    iget-object v0, p0, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen$1;->this$0:Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;

    invoke-static {v0}, Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;->access$100(Lcom/android/camera/fragment/fullscreen/FragmentFullScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 133
    return-void
.end method
