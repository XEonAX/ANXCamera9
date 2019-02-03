.class Landroid/support/v7/widget/ChildHelper;
.super Ljava/lang/Object;
.source "ChildHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ChildHelper$Callback;,
        Landroid/support/v7/widget/ChildHelper$Bucket;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "ChildrenHelper"


# instance fields
.field final mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

.field final mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

.field final mHiddenViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/ChildHelper$Callback;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/widget/ChildHelper$Callback;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    .line 50
    new-instance v0, Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-direct {v0}, Landroid/support/v7/widget/ChildHelper$Bucket;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    .line 52
    return-void
.end method

.method private getOffset(I)I
    .registers 7
    .param p1, "index"    # I

    .line 114
    const/4 v0, -0x1

    if-gez p1, :cond_4

    .line 115
    return v0

    .line 117
    :cond_4
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v1

    .line 118
    .local v1, "limit":I
    move v2, p1

    .line 119
    .local v2, "offset":I
    :goto_b
    if-ge v2, v1, :cond_27

    .line 120
    iget-object v3, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ChildHelper$Bucket;->countOnesBefore(I)I

    move-result v3

    .line 121
    .local v3, "removedBefore":I
    sub-int v4, v2, v3

    sub-int v4, p1, v4

    .line 122
    .local v4, "diff":I
    if-nez v4, :cond_25

    .line 123
    :goto_19
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 124
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 126
    :cond_24
    return v2

    .line 128
    :cond_25
    add-int/2addr v2, v4

    .line 130
    .end local v3    # "removedBefore":I
    .end local v4    # "diff":I
    goto :goto_b

    .line 131
    :cond_27
    return v0
.end method

.method private hideViewInternal(Landroid/view/View;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .line 60
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->onEnteredHiddenState(Landroid/view/View;)V

    .line 62
    return-void
.end method

.method private unhideViewInternal(Landroid/view/View;)Z
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .line 70
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 71
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->onLeftHiddenState(Landroid/view/View;)V

    .line 72
    const/4 v0, 0x1

    return v0

    .line 74
    :cond_f
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method addView(Landroid/view/View;IZ)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "hidden"    # Z

    .line 98
    if-gez p2, :cond_9

    .line 99
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    .local v0, "offset":I
    goto :goto_d

    .line 101
    .end local v0    # "offset":I
    :cond_9
    invoke-direct {p0, p2}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 103
    .restart local v0    # "offset":I
    :goto_d
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0, p3}, Landroid/support/v7/widget/ChildHelper$Bucket;->insert(IZ)V

    .line 104
    if-eqz p3, :cond_17

    .line 105
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->hideViewInternal(Landroid/view/View;)V

    .line 107
    :cond_17
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->addView(Landroid/view/View;I)V

    .line 111
    return-void
.end method

.method addView(Landroid/view/View;Z)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "hidden"    # Z

    .line 85
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0, p2}, Landroid/support/v7/widget/ChildHelper;->addView(Landroid/view/View;IZ)V

    .line 86
    return-void
.end method

.method attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;
    .param p4, "hidden"    # Z

    .line 230
    if-gez p2, :cond_9

    .line 231
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    .local v0, "offset":I
    goto :goto_d

    .line 233
    .end local v0    # "offset":I
    :cond_9
    invoke-direct {p0, p2}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 235
    .restart local v0    # "offset":I
    :goto_d
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0, p4}, Landroid/support/v7/widget/ChildHelper$Bucket;->insert(IZ)V

    .line 236
    if-eqz p4, :cond_17

    .line 237
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->hideViewInternal(Landroid/view/View;)V

    .line 239
    :cond_17
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1, v0, p3}, Landroid/support/v7/widget/ChildHelper$Callback;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 244
    return-void
.end method

.method detachViewFromParent(I)V
    .registers 4
    .param p1, "index"    # I

    .line 282
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 283
    .local v0, "offset":I
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    .line 284
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->detachViewFromParent(I)V

    .line 288
    return-void
.end method

.method findHiddenNonRemovedView(II)Landroid/view/View;
    .registers 8
    .param p1, "position"    # I
    .param p2, "type"    # I

    .line 207
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 208
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_30

    .line 209
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 210
    .local v2, "view":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    .line 211
    .local v3, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v4

    if-ne v4, p1, :cond_2d

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v4

    if-nez v4, :cond_2d

    const/4 v4, -0x1

    if-eq p2, v4, :cond_2c

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v4

    if-ne v4, p2, :cond_2d

    .line 213
    :cond_2c
    return-object v2

    .line 208
    .end local v2    # "view":Landroid/view/View;
    .end local v3    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 216
    .end local v1    # "i":I
    :cond_30
    const/4 v1, 0x0

    return-object v1
.end method

.method getChildAt(I)Landroid/view/View;
    .registers 4
    .param p1, "index"    # I

    .line 180
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 181
    .local v0, "offset":I
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method getChildCount()I
    .registers 3

    .line 253
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method getUnfilteredChildAt(I)Landroid/view/View;
    .registers 3
    .param p1, "index"    # I

    .line 273
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getUnfilteredChildCount()I
    .registers 2

    .line 263
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    return v0
.end method

.method hide(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .line 328
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 329
    .local v0, "offset":I
    if-ltz v0, :cond_11

    .line 335
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->set(I)V

    .line 336
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->hideViewInternal(Landroid/view/View;)V

    .line 340
    return-void

    .line 330
    :cond_11
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "view is not a child, cannot hide "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method indexOfChild(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .line 297
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 298
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 299
    return v1

    .line 301
    :cond_a
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 305
    return v1

    .line 309
    :cond_13
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->countOnesBefore(I)I

    move-result v1

    sub-int v1, v0, v1

    return v1
.end method

.method isHidden(Landroid/view/View;)Z
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 319
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method removeAllViewsUnfiltered()V
    .registers 4

    .line 188
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->reset()V

    .line 189
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_d
    if-ltz v0, :cond_24

    .line 190
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1, v2}, Landroid/support/v7/widget/ChildHelper$Callback;->onLeftHiddenState(Landroid/view/View;)V

    .line 191
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 189
    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    .line 193
    .end local v0    # "i":I
    :cond_24
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeAllViews()V

    .line 197
    return-void
.end method

.method removeView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .line 140
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 141
    .local v0, "index":I
    if-gez v0, :cond_9

    .line 142
    return-void

    .line 144
    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 145
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->unhideViewInternal(Landroid/view/View;)Z

    .line 147
    :cond_14
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 151
    return-void
.end method

.method removeViewAt(I)V
    .registers 5
    .param p1, "index"    # I

    .line 160
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 161
    .local v0, "offset":I
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 162
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_d

    .line 163
    return-void

    .line 165
    :cond_d
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 166
    invoke-direct {p0, v1}, Landroid/support/v7/widget/ChildHelper;->unhideViewInternal(Landroid/view/View;)Z

    .line 168
    :cond_18
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 172
    return-void
.end method

.method removeViewIfHidden(Landroid/view/View;)Z
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .line 354
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 355
    .local v0, "index":I
    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    .line 356
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->unhideViewInternal(Landroid/view/View;)Z

    .line 359
    return v1

    .line 361
    :cond_e
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 362
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    .line 363
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->unhideViewInternal(Landroid/view/View;)Z

    .line 367
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 368
    return v1

    .line 370
    :cond_24
    const/4 v1, 0x0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 344
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1}, Landroid/support/v7/widget/ChildHelper$Bucket;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hidden list:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
