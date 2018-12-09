.class public Lcom/bumptech/glide/request/h;
.super Ljava/lang/Object;
.source "ThumbnailRequestCoordinator.java"

# interfaces
.implements Lcom/bumptech/glide/request/c;
.implements Lcom/bumptech/glide/request/d;


# instance fields
.field private isRunning:Z

.field private final mV:Lcom/bumptech/glide/request/d;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private oo:Lcom/bumptech/glide/request/c;

.field private oq:Lcom/bumptech/glide/request/c;


# direct methods
.method constructor <init>()V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/h;-><init>(Lcom/bumptech/glide/request/d;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/request/d;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    .line 25
    return-void
.end method

.method private de()Z
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

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

    .line 64
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

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

    .line 68
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

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

    .line 104
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

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


# virtual methods
.method public a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    .line 29
    iput-object p2, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    .line 30
    return-void
.end method

.method public begin()V
    .locals 1

    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/h;->isRunning:Z

    .line 115
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    .line 118
    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/request/h;->isRunning:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    .line 119
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    .line 121
    :cond_1
    return-void
.end method

.method public c(Lcom/bumptech/glide/request/c;)Z
    .locals 3

    .line 184
    instance-of v0, p1, Lcom/bumptech/glide/request/h;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 185
    check-cast p1, Lcom/bumptech/glide/request/h;

    .line 186
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    if-nez v0, :cond_2

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    iget-object v2, p1, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0, v2}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    if-nez v0, :cond_1

    iget-object p1, p1, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    if-nez p1, :cond_2

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    iget-object p1, p1, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    .line 187
    invoke-interface {v0, p1}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_2

    :goto_1
    const/4 v1, 0x1

    nop

    .line 186
    :cond_2
    return v1

    .line 189
    :cond_3
    return v1
.end method

.method public clear()V
    .locals 1

    .line 132
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/h;->isRunning:Z

    .line 133
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    .line 134
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    .line 135
    return-void
.end method

.method public d(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/bumptech/glide/request/h;->de()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->dd()Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public dd()Z
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->dd()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->dd()Z

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

.method public dh()Z
    .locals 1

    .line 73
    invoke-direct {p0}, Lcom/bumptech/glide/request/h;->di()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/bumptech/glide/request/h;->dd()Z

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

    .line 55
    invoke-direct {p0}, Lcom/bumptech/glide/request/h;->dg()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/h;->dh()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public f(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    .line 60
    invoke-direct {p0}, Lcom/bumptech/glide/request/h;->df()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 79
    return-void

    .line 81
    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_1

    .line 82
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->h(Lcom/bumptech/glide/request/c;)V

    .line 87
    :cond_1
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result p1

    if-nez p1, :cond_2

    .line 88
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->clear()V

    .line 90
    :cond_2
    return-void
.end method

.method public i(Lcom/bumptech/glide/request/c;)V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 95
    return-void

    .line 98
    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_1

    .line 99
    iget-object p1, p0, Lcom/bumptech/glide/request/h;->mV:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->i(Lcom/bumptech/glide/request/c;)V

    .line 101
    :cond_1
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isComplete()Z
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isComplete()Z

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

.method public isFailed()Z
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    return v0
.end method

.method public isPaused()Z
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isPaused()Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    return v0
.end method

.method public pause()V
    .locals 1

    .line 125
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/h;->isRunning:Z

    .line 126
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    .line 127
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    .line 128
    return-void
.end method

.method public recycle()V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oo:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    .line 179
    iget-object v0, p0, Lcom/bumptech/glide/request/h;->oq:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    .line 180
    return-void
.end method
