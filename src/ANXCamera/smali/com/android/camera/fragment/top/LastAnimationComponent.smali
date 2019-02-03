.class public Lcom/android/camera/fragment/top/LastAnimationComponent;
.super Ljava/lang/Object;
.source "LastAnimationComponent.java"


# instance fields
.field public mAnchorView:Landroid/view/View;

.field private mExpandOffset:I

.field private mGravity:I

.field public mHidedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mQuartEaseIn:Landroid/view/animation/Interpolator;

.field private mQuartEaseOut:Landroid/view/animation/Interpolator;

.field public mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field public mReverseLeft:I

.field public mReverseRecyclerViewLeft:I

.field private mShowDelay:I

.field public mShown:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lmiui/view/animation/QuarticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseInInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseIn:Landroid/view/animation/Interpolator;

    .line 50
    new-instance v0, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 51
    return-void
.end method


# virtual methods
.method public hideOtherViews(ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;)V"
        }
    .end annotation

    .line 171
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    if-eqz v0, :cond_0

    .line 172
    return-void

    .line 175
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    .line 177
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    if-nez v0, :cond_1

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    goto :goto_0

    .line 180
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 182
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 184
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_2

    .line 185
    goto :goto_1

    .line 188
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_3

    .line 189
    goto :goto_1

    .line 192
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_4

    .line 193
    goto :goto_1

    .line 196
    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 199
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    const-wide/16 v3, 0x0

    .line 200
    invoke-virtual {v1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 201
    iget v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    if-lez v3, :cond_5

    const-wide/16 v3, 0x8c

    goto :goto_2

    :cond_5
    const-wide/16 v3, 0x118

    :goto_2
    invoke-virtual {v1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 202
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    int-to-float v2, v2

    .line 203
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationXBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 204
    iget v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    if-lez v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseIn:Landroid/view/animation/Interpolator;

    goto :goto_3

    :cond_6
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    :goto_3
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 205
    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 206
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 208
    goto :goto_1

    .line 209
    :cond_7
    return-void
.end method

.method public reverse(Z)Z
    .locals 11

    .line 66
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 67
    return v1

    .line 70
    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-wide/16 v3, 0x118

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    if-eqz v0, :cond_3

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    .line 74
    if-eqz p1, :cond_1

    .line 81
    invoke-static {v8, v7}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 82
    invoke-static {v8}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    .line 83
    invoke-virtual {v9, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    .line 84
    invoke-virtual {v9, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    const/high16 v10, 0x3f800000    # 1.0f

    .line 85
    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    .line 86
    invoke-virtual {v9, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    iget-object v10, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 87
    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    .line 88
    invoke-virtual {v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 89
    invoke-virtual {v8, v1}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    .line 91
    :cond_1
    invoke-static {v8, v7}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 92
    invoke-static {v8}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 95
    :goto_1
    goto :goto_0

    .line 96
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 97
    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    .line 101
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    if-eqz v0, :cond_5

    .line 102
    if-eqz p1, :cond_4

    .line 103
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v9, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 104
    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    sub-int/2addr v8, v9

    int-to-float v8, v8

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 105
    invoke-virtual {v0, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 106
    invoke-virtual {v0, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget-object v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 107
    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_2

    .line 111
    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    iget v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v9, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v0, v8}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 113
    :goto_2
    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 117
    :cond_5
    if-eqz p1, :cond_6

    .line 118
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 119
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 120
    invoke-virtual {p1, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 121
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 122
    invoke-virtual {p1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 123
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/top/LastAnimationComponent$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/LastAnimationComponent$1;-><init>(Lcom/android/camera/fragment/top/LastAnimationComponent;)V

    .line 124
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 132
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_3

    .line 134
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1, v7}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 135
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v0, v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 136
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 137
    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 141
    :goto_3
    return v1
.end method

.method public setExpandGravity(I)V
    .locals 1

    .line 54
    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mGravity:I

    .line 55
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 56
    const/16 p1, -0xc8

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    .line 57
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    goto :goto_0

    .line 59
    :cond_0
    const/16 p1, 0xc8

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    .line 60
    const/16 p1, 0x8c

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    .line 62
    :goto_0
    return-void
.end method

.method public showExtraView(II)V
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 159
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    int-to-float p1, p1

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 160
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    int-to-long v0, v0

    .line 161
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 162
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    int-to-float p2, p2

    .line 163
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 164
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 165
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 166
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 167
    return-void
.end method

.method public translateAnchorView(I)V
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-float p1, p1

    .line 149
    invoke-virtual {v0, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    int-to-long v0, v0

    .line 150
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 151
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    .line 152
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 154
    return-void
.end method
