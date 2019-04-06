.class public Lcom/arcsoft/avatar/c/d;
.super Ljava/lang/Object;
.source "FrameQueue.java"


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private eh:Lcom/arcsoft/avatar/c/c;

.field private ei:Lcom/arcsoft/avatar/c/c;

.field private ej:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/c/c;",
            ">;"
        }
    .end annotation
.end field

.field private ek:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/arcsoft/avatar/c/c;",
            ">;"
        }
    .end annotation
.end field

.field private el:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/arcsoft/avatar/c/d;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/c/d;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    invoke-interface {v0, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    :cond_0
    return-void
.end method

.method public B()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    :cond_0
    return-void
.end method

.method public C()Z
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/d;->el:Z

    return v0
.end method

.method public a(IIIZ)V
    .locals 3

    invoke-virtual {p0}, Lcom/arcsoft/avatar/c/d;->unInit()V

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x1

    if-ge v0, p1, :cond_0

    new-instance v2, Lcom/arcsoft/avatar/c/c;

    invoke-direct {v2}, Lcom/arcsoft/avatar/c/c;-><init>()V

    iput-boolean v1, v2, Lcom/arcsoft/avatar/c/c;->ef:Z

    iput-boolean v1, v2, Lcom/arcsoft/avatar/c/c;->mIsInited:Z

    iput v0, v2, Lcom/arcsoft/avatar/c/c;->eg:I

    new-instance v1, Lcom/arcsoft/avatar/a/d;

    invoke-direct {v1}, Lcom/arcsoft/avatar/a/d;-><init>()V

    iput-object v1, v2, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    iget-object v1, v2, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v1, p2, p3, p4}, Lcom/arcsoft/avatar/a/d;->a(IIZ)V

    iget-object v1, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iput-boolean v1, p0, Lcom/arcsoft/avatar/c/d;->el:Z

    return-void
.end method

.method public a(Lcom/arcsoft/avatar/c/c;)V
    .locals 6

    const-wide/16 v0, 0x0

    :try_start_0
    iget-wide v2, p1, Lcom/arcsoft/avatar/c/c;->a:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/arcsoft/avatar/c/d;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deleteSync delete_a_sync : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p1, Lcom/arcsoft/avatar/c/c;->a:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v2, p1, Lcom/arcsoft/avatar/c/c;->a:J

    invoke-static {v2, v3}, Landroid/opengl/GLES30;->glDeleteSync(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    iput-wide v0, p1, Lcom/arcsoft/avatar/c/c;->a:J

    goto :goto_1

    :catchall_0
    move-exception v2

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v3, Lcom/arcsoft/avatar/c/d;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deleteSync meet error : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    :goto_2
    iput-wide v0, p1, Lcom/arcsoft/avatar/c/c;->a:J

    throw v2
.end method

.method public queueSize()I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method

.method public unInit()V
    .locals 4

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/d;->unInit()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    invoke-virtual {p0, v0}, Lcom/arcsoft/avatar/c/d;->a(Lcom/arcsoft/avatar/c/c;)V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    iput-object v1, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    iput-object v1, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/d;->unInit()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    invoke-virtual {p0, v0}, Lcom/arcsoft/avatar/c/d;->a(Lcom/arcsoft/avatar/c/c;)V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    iput-object v1, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    iput-object v1, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arcsoft/avatar/c/c;

    iget-object v3, v2, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    if-eqz v3, :cond_2

    iget-object v3, v2, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/a/d;->unInit()V

    invoke-virtual {p0, v2}, Lcom/arcsoft/avatar/c/d;->a(Lcom/arcsoft/avatar/c/c;)V

    iput-object v1, v2, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    :cond_2
    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :goto_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_4

    iget-object v2, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    if-eqz v2, :cond_4

    iget-object v2, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/a/d;->unInit()V

    invoke-virtual {p0, v0}, Lcom/arcsoft/avatar/c/d;->a(Lcom/arcsoft/avatar/c/c;)V

    iput-object v1, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    :cond_4
    nop

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/d;->el:Z

    return-void
.end method

.method public y()Lcom/arcsoft/avatar/c/c;
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ej:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/c/c;

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/c/c;

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    :goto_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->eh:Lcom/arcsoft/avatar/c/c;

    return-object v0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public z()Lcom/arcsoft/avatar/c/c;
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ek:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/c/c;

    iput-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    iget-object v0, p0, Lcom/arcsoft/avatar/c/d;->ei:Lcom/arcsoft/avatar/c/c;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
