.class public final Lcom/bumptech/glide/request/a;
.super Ljava/lang/Object;
.source "ErrorRequestCoordinator.java"

# interfaces
.implements Lcom/bumptech/glide/request/c;
.implements Lcom/bumptech/glide/request/d;


# instance fields
.field private final mU:Lcom/bumptech/glide/request/d;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mV:Lcom/bumptech/glide/request/c;

.field private mW:Lcom/bumptech/glide/request/c;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/request/d;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    .line 19
    return-void
.end method

.method private de()Z
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->d(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private df()Z
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->f(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private dg()Z
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->e(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private di()Z
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {v0}, Lcom/bumptech/glide/request/d;->dh()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private g(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    .line 23
    iput-object p2, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    .line 24
    return-void
.end method

.method public begin()V
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    .line 31
    :cond_0
    return-void
.end method

.method public c(Lcom/bumptech/glide/request/c;)Z
    .locals 3

    .line 91
    instance-of v0, p1, Lcom/bumptech/glide/request/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 92
    check-cast p1, Lcom/bumptech/glide/request/a;

    .line 93
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    iget-object v2, p1, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0, v2}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    iget-object p1, p1, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 95
    :cond_1
    return v1
.end method

.method public clear()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    .line 48
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    .line 51
    :cond_0
    return-void
.end method

.method public d(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 100
    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->de()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public dd()Z
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->dd()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public dh()Z
    .locals 1

    .line 131
    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->di()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/bumptech/glide/request/a;->dd()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public e(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 109
    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->dg()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public f(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 114
    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->df()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public h(Lcom/bumptech/glide/request/c;)V
    .locals 0

    .line 140
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_0

    .line 141
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->h(Lcom/bumptech/glide/request/c;)V

    .line 143
    :cond_0
    return-void
.end method

.method public i(Lcom/bumptech/glide/request/c;)V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 148
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result p1

    if-nez p1, :cond_0

    .line 149
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->begin()V

    .line 151
    :cond_0
    return-void

    .line 154
    :cond_1
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_2

    .line 155
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->mU:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->i(Lcom/bumptech/glide/request/c;)V

    .line 157
    :cond_2
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isComplete()Z
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isFailed()Z
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPaused()Z
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isPaused()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public pause()V
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 39
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    .line 41
    :cond_1
    return-void
.end method

.method public recycle()V
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mV:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    .line 86
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->mW:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    .line 87
    return-void
.end method
