.class Lcom/facebook/rebound/AnimationQueue$1;
.super Lcom/facebook/rebound/ChoreographerCompat$FrameCallback;
.source "AnimationQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/rebound/AnimationQueue;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/rebound/AnimationQueue;


# direct methods
.method constructor <init>(Lcom/facebook/rebound/AnimationQueue;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/facebook/rebound/AnimationQueue$1;->this$0:Lcom/facebook/rebound/AnimationQueue;

    invoke-direct {p0}, Lcom/facebook/rebound/ChoreographerCompat$FrameCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/facebook/rebound/AnimationQueue$1;->this$0:Lcom/facebook/rebound/AnimationQueue;

    invoke-static {v0, p1, p2}, Lcom/facebook/rebound/AnimationQueue;->access$000(Lcom/facebook/rebound/AnimationQueue;J)V

    .line 51
    return-void
.end method
