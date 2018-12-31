.class public abstract Lcom/android/camera/module/loader/Func1Base;
.super Ljava/lang/Object;
.source "Func1Base.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Lcom/android/camera/module/loader/NullHolder<",
        "TT;>;",
        "Lcom/android/camera/module/loader/NullHolder<",
        "TR;>;>;"
    }
.end annotation


# instance fields
.field protected mTargetMode:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/android/camera/module/loader/Func1Base;->mTargetMode:I

    .line 17
    return-void
.end method


# virtual methods
.method public abstract getWorkThread()Lio/reactivex/Scheduler;
.end method
