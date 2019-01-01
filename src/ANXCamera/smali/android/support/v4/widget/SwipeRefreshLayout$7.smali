.class Landroid/support/v4/widget/SwipeRefreshLayout$7;
.super Landroid/view/animation/Animation;
.source "SwipeRefreshLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/SwipeRefreshLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/widget/SwipeRefreshLayout;


# direct methods
.method constructor <init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V
    .locals 0

    .line 1069
    iput-object p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 5
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .line 1072
    const/4 v0, 0x0

    .line 1073
    .local v0, "targetTop":I
    const/4 v1, 0x0

    .line 1074
    .local v1, "endTarget":I
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-static {v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1100(Landroid/support/v4/widget/SwipeRefreshLayout;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1075
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-static {v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1200(Landroid/support/v4/widget/SwipeRefreshLayout;)F

    move-result v2

    iget-object v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget v3, v3, Landroid/support/v4/widget/SwipeRefreshLayout;->mOriginalOffsetTop:I

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v1, v2

    goto :goto_0

    .line 1077
    :cond_0
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-static {v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$1200(Landroid/support/v4/widget/SwipeRefreshLayout;)F

    move-result v2

    float-to-int v1, v2

    .line 1079
    :goto_0
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget v2, v2, Landroid/support/v4/widget/SwipeRefreshLayout;->mFrom:I

    iget-object v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget v3, v3, Landroid/support/v4/widget/SwipeRefreshLayout;->mFrom:I

    sub-int v3, v1, v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    float-to-int v3, v3

    add-int/2addr v2, v3

    .line 1080
    .end local v0    # "targetTop":I
    .local v2, "targetTop":I
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-static {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$400(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/support/v4/widget/CircleImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/widget/CircleImageView;->getTop()I

    move-result v0

    sub-int v0, v2, v0

    .line 1081
    .local v0, "offset":I
    iget-object v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v4, 0x0

    invoke-static {v3, v0, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$900(Landroid/support/v4/widget/SwipeRefreshLayout;IZ)V

    .line 1082
    iget-object v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout$7;->this$0:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-static {v3}, Landroid/support/v4/widget/SwipeRefreshLayout;->access$100(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/support/v4/widget/MaterialProgressDrawable;

    move-result-object v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v4, p1

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/MaterialProgressDrawable;->setArrowScale(F)V

    .line 1083
    return-void
.end method
