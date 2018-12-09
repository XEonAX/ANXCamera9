.class abstract Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;
.super Lio/reactivex/internal/subscriptions/BasicQueueSubscription;
.source "FlowableRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseRangeSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/internal/subscriptions/BasicQueueSubscription<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1f442a7d211232e5L


# instance fields
.field volatile cancelled:Z

.field final end:I

.field index:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .line 53
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicQueueSubscription;-><init>()V

    .line 54
    iput p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->index:I

    .line 55
    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->end:I

    .line 56
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->cancelled:Z

    .line 101
    return-void
.end method

.method public final clear()V
    .locals 1

    .line 81
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->end:I

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->index:I

    .line 82
    return-void
.end method

.method abstract fastPath()V
.end method

.method public final isEmpty()Z
    .locals 2

    .line 76
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->index:I

    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->end:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final poll()Ljava/lang/Integer;
    .locals 2
    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .line 66
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->index:I

    .line 67
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->end:I

    if-ne v0, v1, :cond_0

    .line 68
    const/4 v0, 0x0

    return-object v0

    .line 70
    :cond_0
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->index:I

    .line 71
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .line 44
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->poll()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final request(J)V
    .locals 4

    .line 86
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 87
    invoke-static {p0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 88
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 89
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->fastPath()V

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;->slowPath(J)V

    .line 95
    :cond_1
    :goto_0
    return-void
.end method

.method public final requestFusion(I)I
    .locals 0

    .line 60
    and-int/lit8 p1, p1, 0x1

    return p1
.end method

.method abstract slowPath(J)V
.end method
