.class public abstract Lio/reactivex/subscribers/DefaultSubscriber;
.super Ljava/lang/Object;
.source "DefaultSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private s:Lorg/reactivestreams/Subscription;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected final cancel()V
    .locals 2

    .line 100
    iget-object v0, p0, Lio/reactivex/subscribers/DefaultSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 101
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v1, p0, Lio/reactivex/subscribers/DefaultSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 102
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 103
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 111
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lio/reactivex/subscribers/DefaultSubscriber;->request(J)V

    .line 112
    return-void
.end method

.method public final onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2

    .line 79
    iget-object v0, p0, Lio/reactivex/subscribers/DefaultSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lio/reactivex/internal/util/EndConsumerHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    iput-object p1, p0, Lio/reactivex/subscribers/DefaultSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 81
    invoke-virtual {p0}, Lio/reactivex/subscribers/DefaultSubscriber;->onStart()V

    .line 83
    :cond_0
    return-void
.end method

.method protected final request(J)V
    .locals 1

    .line 90
    iget-object v0, p0, Lio/reactivex/subscribers/DefaultSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 91
    if-eqz v0, :cond_0

    .line 92
    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 94
    :cond_0
    return-void
.end method
