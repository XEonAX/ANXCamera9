.class Landroid/support/v4/widget/SwipeRefreshLayout$9;
.super Landroid/view/animation/Animation;
.source "SwipeRefreshLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/widget/SwipeRefreshLayout;->startScaleDownReturnToStartAnimation(ILandroid/view/animation/Animation$AnimationListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/widget/SwipeRefreshLayout;


# direct methods
.method constructor <init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V
    .registers 2

    .line 1108
    iput-object p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout$9;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 5
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .line 1111
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout$9;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    # getter for: Landroid/support/v4/widget/SwipeRefreshLayout;->mStartingScale:F
    invoke-static {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1400(Landroid/support/v4/widget/SwipeRefreshLayout;)F

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout$9;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    # getter for: Landroid/support/v4/widget/SwipeRefreshLayout;->mStartingScale:F
    invoke-static {v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1400(Landroid/support/v4/widget/SwipeRefreshLayout;)F

    move-result v1

    neg-float v1, v1

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    .line 1112
    .local v0, "targetScale":F
    iget-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout$9;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    # invokes: Landroid/support/v4/widget/SwipeRefreshLayout;->setAnimationProgress(F)V
    invoke-static {v1, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$700(Landroid/support/v4/widget/SwipeRefreshLayout;F)V

    .line 1113
    iget-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout$9;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    # invokes: Landroid/support/v4/widget/SwipeRefreshLayout;->moveToStart(F)V
    invoke-static {v1, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1300(Landroid/support/v4/widget/SwipeRefreshLayout;F)V

    .line 1114
    return-void
.end method
