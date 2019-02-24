.class Lcom/android/camera/fragment/top/LastAnimationComponent$1;
.super Ljava/lang/Object;
.source "LastAnimationComponent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/LastAnimationComponent;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/LastAnimationComponent;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent$1;->this$0:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent$1;->this$0:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v0, v0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 128
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent$1;->this$0:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 130
    return-void
.end method
