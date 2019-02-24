.class public Lcom/ss/android/ugc/effectmanager/common/WeakHandler;
.super Landroid/os/Handler;
.source "WeakHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;
    }
.end annotation


# instance fields
.field mRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;->mRef:Ljava/lang/ref/WeakReference;

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V
    .locals 1

    .line 19
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 20
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;->mRef:Ljava/lang/ref/WeakReference;

    .line 21
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;->mRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;

    .line 31
    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 32
    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;->handleMsg(Landroid/os/Message;)V

    .line 33
    :cond_0
    return-void
.end method
