.class public Landroid/support/v7/util/SortedList$BatchedCallback;
.super Landroid/support/v7/util/SortedList$Callback;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/SortedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BatchedCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T2:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/util/SortedList$Callback<",
        "TT2;>;"
    }
.end annotation


# static fields
.field static final TYPE_ADD:I = 0x1

.field static final TYPE_CHANGE:I = 0x3

.field static final TYPE_MOVE:I = 0x4

.field static final TYPE_NONE:I = 0x0

.field static final TYPE_REMOVE:I = 0x2


# instance fields
.field mLastEventCount:I

.field mLastEventPosition:I

.field mLastEventType:I

.field private final mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT2;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/util/SortedList$Callback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT2;>;)V"
        }
    .end annotation

    .line 800
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "wrappedCallback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT2;>;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList$Callback;-><init>()V

    .line 789
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 790
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 791
    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 801
    iput-object p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 802
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/SortedList$BatchedCallback;

    .line 780
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    return-object v0
.end method


# virtual methods
.method public areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    .line 860
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "oldItem":Ljava/lang/Object;, "TT2;"
    .local p2, "newItem":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    .line 865
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "item1":Ljava/lang/Object;, "TT2;"
    .local p2, "item2":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)I"
        }
    .end annotation

    .line 806
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "o1":Ljava/lang/Object;, "TT2;"
    .local p2, "o2":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public dispatchLastEvent()V
    .registers 4

    .line 874
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-nez v0, :cond_5

    .line 875
    return-void

    .line 877
    :cond_5
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    packed-switch v0, :pswitch_data_2e

    goto :goto_29

    .line 885
    :pswitch_b
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_29

    .line 882
    :pswitch_15
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    .line 883
    goto :goto_29

    .line 879
    :pswitch_1f
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    .line 880
    nop

    .line 888
    :goto_29
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 889
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_15
        :pswitch_b
    .end packed-switch
.end method

.method public onChanged(II)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "count"    # I

    .line 843
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2b

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v2

    if-gt p1, v0, :cond_2b

    add-int v0, p1, p2

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt v0, v2, :cond_2b

    .line 847
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v1

    .line 848
    .local v0, "previousEnd":I
    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 849
    add-int v1, p1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 850
    return-void

    .line 852
    .end local v0    # "previousEnd":I
    :cond_2b
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 853
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 854
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 855
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 856
    return-void
.end method

.method public onInserted(II)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "count"    # I

    .line 811
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt p1, v0, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v2

    if-gt p1, v0, :cond_1e

    .line 813
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 814
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 815
    return-void

    .line 817
    :cond_1e
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 818
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 819
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 820
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 821
    return-void
.end method

.method public onMoved(II)V
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .line 837
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 838
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    .line 839
    return-void
.end method

.method public onRemoved(II)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "count"    # I

    .line 825
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-ne v0, p1, :cond_f

    .line 826
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 827
    return-void

    .line 829
    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 830
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 831
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 832
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 833
    return-void
.end method
