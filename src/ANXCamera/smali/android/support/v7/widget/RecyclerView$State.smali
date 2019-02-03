.class public Landroid/support/v7/widget/RecyclerView$State;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "State"
.end annotation


# instance fields
.field private mData:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDeletedInvisibleItemCountSincePreviousLayout:I

.field final mDisappearingViewsInLayoutPass:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mInPreLayout:Z

.field mItemCount:I

.field mOldChangedHolders:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/Long;",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            "Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;",
            ">;"
        }
    .end annotation
.end field

.field mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            "Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPreviousLayoutItemCount:I

.field private mRunPredictiveAnimations:Z

.field private mRunSimpleAnimations:Z

.field private mStructureChanged:Z

.field private mTargetPosition:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 9375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9377
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    .line 9378
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    .line 9380
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    .line 9383
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    .line 9386
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    .line 9393
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    .line 9398
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreviousLayoutItemCount:I

    .line 9404
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    .line 9406
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    .line 9408
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    .line 9410
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    .line 9412
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z

    return-void
.end method

.method static synthetic access$1202(Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # I

    .line 9375
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    return p1
.end method

.method static synthetic access$1212(Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # I

    .line 9375
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    return v0
.end method

.method static synthetic access$1400(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 9375
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    return v0
.end method

.method static synthetic access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # Z

    .line 9375
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    return p1
.end method

.method static synthetic access$1600(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 9375
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z

    return v0
.end method

.method static synthetic access$1602(Landroid/support/v7/widget/RecyclerView$State;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # Z

    .line 9375
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z

    return p1
.end method

.method static synthetic access$1700(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 9375
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    return v0
.end method

.method static synthetic access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # Z

    .line 9375
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    return p1
.end method

.method static synthetic access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 9375
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    return v0
.end method

.method static synthetic access$1802(Landroid/support/v7/widget/RecyclerView$State;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # Z

    .line 9375
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    return p1
.end method

.method static synthetic access$2102(Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # I

    .line 9375
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreviousLayoutItemCount:I

    return p1
.end method

.method static synthetic access$4802(Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p1, "x1"    # I

    .line 9375
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    return p1
.end method

.method private removeFrom(Landroid/support/v4/util/ArrayMap;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 5
    .param p2, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/Long;",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ")V"
        }
    .end annotation

    .line 9565
    .local p1, "holderMap":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/Long;Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_15

    .line 9566
    invoke-virtual {p1, v0}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p2, v1, :cond_12

    .line 9567
    invoke-virtual {p1, v0}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 9568
    return-void

    .line 9565
    :cond_12
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 9571
    .end local v0    # "i":I
    :cond_15
    return-void
.end method


# virtual methods
.method addToDisappearingList(Landroid/view/View;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .line 9578
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 9579
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9581
    :cond_d
    return-void
.end method

.method public didStructureChange()Z
    .registers 2

    .line 9517
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    return v0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "resourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)TT;"
        }
    .end annotation

    .line 9471
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    if-nez v0, :cond_6

    .line 9472
    const/4 v0, 0x0

    return-object v0

    .line 9474
    :cond_6
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .registers 3

    .line 9545
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    if-eqz v0, :cond_a

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreviousLayoutItemCount:I

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    sub-int/2addr v0, v1

    goto :goto_c

    :cond_a
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    :goto_c
    return v0
.end method

.method public getTargetScrollPosition()I
    .registers 2

    .line 9500
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    return v0
.end method

.method public hasTargetScrollPosition()Z
    .registers 3

    .line 9509
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return v0
.end method

.method public isPreLayout()Z
    .registers 2

    .line 9425
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    return v0
.end method

.method public onViewIgnored(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 9561
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$State;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9562
    return-void
.end method

.method onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 9551
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9552
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9553
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    if-eqz v0, :cond_13

    .line 9554
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-direct {p0, v0, p1}, Landroid/support/v7/widget/RecyclerView$State;->removeFrom(Landroid/support/v4/util/ArrayMap;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9556
    :cond_13
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9558
    return-void
.end method

.method public put(ILjava/lang/Object;)V
    .registers 4
    .param p1, "resourceId"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 9486
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    if-nez v0, :cond_b

    .line 9487
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    .line 9489
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 9490
    return-void
.end method

.method public remove(I)V
    .registers 3
    .param p1, "resourceId"    # I

    .line 9456
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    if-nez v0, :cond_5

    .line 9457
    return-void

    .line 9459
    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 9460
    return-void
.end method

.method removeFromDisappearingList(Landroid/view/View;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .line 9574
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9575
    return-void
.end method

.method reset()Landroid/support/v7/widget/RecyclerView$State;
    .registers 2

    .line 9415
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    .line 9416
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    if-eqz v0, :cond_c

    .line 9417
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 9419
    :cond_c
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    .line 9420
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    .line 9421
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 9585
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "State{mTargetPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mPreLayoutHolderMap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mPostLayoutHolderMap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mData:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mItemCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mPreviousLayoutItemCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mPreviousLayoutItemCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDeletedInvisibleItemCountSincePreviousLayout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mStructureChanged="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mInPreLayout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mRunSimpleAnimations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mRunPredictiveAnimations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public willRunPredictiveAnimations()Z
    .registers 2

    .line 9436
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z

    return v0
.end method

.method public willRunSimpleAnimations()Z
    .registers 2

    .line 9447
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    return v0
.end method
