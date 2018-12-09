.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingPostAction()V
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

    .line 819
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 822
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    .line 823
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible()V

    .line 824
    return-void
.end method
