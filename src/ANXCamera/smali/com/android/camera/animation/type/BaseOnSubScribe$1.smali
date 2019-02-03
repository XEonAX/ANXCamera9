.class Lcom/android/camera/animation/type/BaseOnSubScribe$1;
.super Ljava/lang/Object;
.source "BaseOnSubScribe.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/animation/type/BaseOnSubScribe;->subscribe(Lio/reactivex/CompletableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/animation/type/BaseOnSubScribe;

.field final synthetic val$completableEmitter:Lio/reactivex/CompletableEmitter;


# direct methods
.method constructor <init>(Lcom/android/camera/animation/type/BaseOnSubScribe;Lio/reactivex/CompletableEmitter;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe$1;->this$0:Lcom/android/camera/animation/type/BaseOnSubScribe;

    iput-object p2, p0, Lcom/android/camera/animation/type/BaseOnSubScribe$1;->val$completableEmitter:Lio/reactivex/CompletableEmitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/android/camera/animation/type/BaseOnSubScribe$1;->this$0:Lcom/android/camera/animation/type/BaseOnSubScribe;

    invoke-virtual {v0}, Lcom/android/camera/animation/type/BaseOnSubScribe;->onAnimationEnd()V

    .line 65
    iget-object v0, p0, Lcom/android/camera/animation/type/BaseOnSubScribe$1;->val$completableEmitter:Lio/reactivex/CompletableEmitter;

    invoke-interface {v0}, Lio/reactivex/CompletableEmitter;->onComplete()V

    .line 66
    return-void
.end method
