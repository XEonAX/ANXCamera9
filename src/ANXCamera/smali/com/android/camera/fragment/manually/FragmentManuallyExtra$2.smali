.class Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;
.super Ljava/lang/Object;
.source "FragmentManuallyExtra.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->animateOut()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

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

    .line 120
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 121
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->access$002(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;Z)Z

    .line 122
    return-void
.end method
