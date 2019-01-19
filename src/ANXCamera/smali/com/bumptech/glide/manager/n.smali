.class public Lcom/bumptech/glide/manager/n;
.super Ljava/lang/Object;
.source "RequestTracker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "RequestTracker"


# instance fields
.field private final mC:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/request/c;",
            ">;"
        }
    .end annotation
.end field

.field private final mD:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/c;",
            ">;"
        }
    .end annotation
.end field

.field private mE:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 30
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    return-void
.end method

.method private a(Lcom/bumptech/glide/request/c;Z)Z
    .locals 3
    .param p1    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 69
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 72
    return v0

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 76
    iget-object v2, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    nop

    .line 77
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 78
    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->clear()V

    .line 79
    if-eqz p2, :cond_3

    .line 80
    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->recycle()V

    .line 83
    :cond_3
    return v0
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/request/c;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 42
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    if-nez v0, :cond_0

    .line 44
    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->begin()V

    goto :goto_0

    .line 46
    :cond_0
    const-string v0, "RequestTracker"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    const-string v0, "RequestTracker"

    const-string v1, "Paused, delaying request"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    :goto_0
    return-void
.end method

.method addRequest(Lcom/bumptech/glide/request/c;)V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public b(Lcom/bumptech/glide/request/c;)Z
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 65
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/manager/n;->a(Lcom/bumptech/glide/request/c;Z)Z

    move-result p1

    return p1
.end method

.method public cX()V
    .locals 3

    .line 136
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/c;

    .line 139
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/bumptech/glide/manager/n;->a(Lcom/bumptech/glide/request/c;Z)Z

    .line 140
    goto :goto_0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 142
    return-void
.end method

.method public cY()V
    .locals 3

    .line 148
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/c;

    .line 149
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 151
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->pause()V

    .line 152
    iget-boolean v2, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    if-nez v2, :cond_0

    .line 153
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->begin()V

    goto :goto_1

    .line 155
    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    :cond_1
    :goto_1
    goto :goto_0

    .line 159
    :cond_2
    return-void
.end method

.method public isPaused()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{numRequests="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isPaused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public w()V
    .locals 3

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    .line 98
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/c;

    .line 99
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 100
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->pause()V

    .line 101
    iget-object v2, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    :cond_0
    goto :goto_0

    .line 104
    :cond_1
    return-void
.end method

.method public x()V
    .locals 3

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    .line 109
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/c;

    .line 110
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 111
    :cond_0
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->pause()V

    .line 112
    iget-object v2, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    :cond_1
    goto :goto_0

    .line 115
    :cond_2
    return-void
.end method

.method public z()V
    .locals 3

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/n;->mE:Z

    .line 122
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mC:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/c;

    .line 123
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v2

    if-nez v2, :cond_0

    .line 124
    invoke-interface {v1}, Lcom/bumptech/glide/request/c;->begin()V

    .line 126
    :cond_0
    goto :goto_0

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/manager/n;->mD:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 128
    return-void
.end method
