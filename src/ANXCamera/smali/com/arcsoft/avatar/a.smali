.class public Lcom/arcsoft/avatar/a;
.super Ljava/lang/Object;
.source "RecordModule.java"


# static fields
.field private static final b:Ljava/lang/String; = "RecordModule"

.field private static final c:I = 0x2

.field private static final d:I = 0x7d000


# instance fields
.field private final E:I

.field private bI:Landroid/content/Context;

.field private bJ:Ljava/util/concurrent/locks/Lock;

.field private bK:Ljava/util/concurrent/locks/Lock;

.field private volatile bL:Z

.field private volatile bM:Z

.field private volatile bN:Z

.field private volatile bO:Z

.field private bP:Z

.field private bQ:Landroid/opengl/EGLDisplay;

.field private bR:Landroid/opengl/EGLContext;

.field private bS:Landroid/opengl/EGLSurface;

.field private bT:I

.field private bU:I

.field private bV:I

.field private bW:I

.field private bX:I

.field private bY:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/arcsoft/avatar/d/a;",
            ">;"
        }
    .end annotation
.end field

.field private bZ:Lcom/arcsoft/avatar/a/f;

.field private ca:Lcom/arcsoft/avatar/a/f;

.field private cb:Lcom/arcsoft/avatar/a/d;

.field private cc:Lcom/arcsoft/avatar/a/h;

.field private cd:Z

.field private ce:Z

.field private cf:I

.field private cg:J

.field private ci:J

.field private cj:J

.field private ck:Lcom/arcsoft/avatar/AvatarEngine;

.field private cl:Lcom/arcsoft/avatar/c/e;

.field private volatile cm:Z

.field private volatile cn:Z

.field private cp:Z

.field private cq:Lcom/arcsoft/avatar/c/g;

.field cr:Lcom/arcsoft/avatar/AvatarConfig$g;

.field private s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bM:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bN:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bO:Z

    const/16 v0, 0x10e

    iput v0, p0, Lcom/arcsoft/avatar/a;->cf:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->cg:J

    const v2, 0xf4240

    iput v2, p0, Lcom/arcsoft/avatar/a;->E:I

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->ci:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->cj:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    iput-object p1, p0, Lcom/arcsoft/avatar/a;->bI:Landroid/content/Context;

    return-void
.end method

.method private a(ZZ)I
    .locals 4

    if-eqz p1, :cond_0

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    :cond_0
    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/d/a;

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bP:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/d/a;->Q()[I

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/a/f;->a([I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    iget-boolean v2, p0, Lcom/arcsoft/avatar/a;->ce:Z

    iget v3, p0, Lcom/arcsoft/avatar/a;->cf:I

    invoke-virtual {v0, v2, v3}, Lcom/arcsoft/avatar/a/f;->a(ZI)V

    iput-boolean v1, p0, Lcom/arcsoft/avatar/a;->bP:Z

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/arcsoft/avatar/a/d;->b(ZZ)V

    invoke-direct {p0, v2}, Lcom/arcsoft/avatar/a;->a(Z)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/a/f;->b(Lcom/arcsoft/avatar/d/a;)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {p1, v2, v2}, Lcom/arcsoft/avatar/a/d;->c(ZZ)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/a/d;->getTextureId()I

    move-result p1

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/arcsoft/avatar/a/f;->a(F)V

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {p2, v1}, Lcom/arcsoft/avatar/a/f;->g(I)V

    invoke-direct {p0, v1}, Lcom/arcsoft/avatar/a;->a(Z)V

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {p2, p1}, Lcom/arcsoft/avatar/a/f;->f(I)V

    invoke-direct {p0, v2}, Lcom/arcsoft/avatar/a;->a(Z)V

    :cond_2
    return p1
.end method

.method private a(J)J
    .locals 4

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    return-wide v0

    :cond_0
    const-wide/32 v2, 0x7d000

    sub-long/2addr p1, v2

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    const-wide/16 p1, 0x1

    :cond_1
    return-wide p1
.end method

.method private a()V
    .locals 1

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bQ:Landroid/opengl/EGLDisplay;

    const/16 v0, 0x3059

    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bS:Landroid/opengl/EGLSurface;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bR:Landroid/opengl/EGLContext;

    return-void
.end method

.method private a(Lcom/arcsoft/avatar/d/a;)V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/ClassCastException;->printStackTrace()V

    :goto_0
    nop

    :goto_1
    return-void
.end method

.method private a(Z)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget v1, p0, Lcom/arcsoft/avatar/a;->bW:I

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    if-eqz p1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/a;->bX:I

    nop

    :cond_1
    iget p1, p0, Lcom/arcsoft/avatar/a;->bV:I

    iget v2, p0, Lcom/arcsoft/avatar/a;->s:I

    invoke-static {v1, v0, p1, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    return-void
.end method

.method private b()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/arcsoft/avatar/a/f;

    const/16 v1, 0x305

    invoke-direct {v0, v1}, Lcom/arcsoft/avatar/a/f;-><init>(I)V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/f;->q()V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/f;->r()V

    :cond_0
    invoke-direct {p0}, Lcom/arcsoft/avatar/a;->c()V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    if-nez v0, :cond_1

    new-instance v0, Lcom/arcsoft/avatar/a/h;

    invoke-direct {v0}, Lcom/arcsoft/avatar/a/h;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/h;->s()V

    :cond_1
    return-void
.end method

.method private c(I)I
    .locals 11

    const/4 v0, 0x1

    invoke-direct {p0, v0, v0}, Lcom/arcsoft/avatar/a;->a(ZZ)I

    move-result v1

    if-gtz v1, :cond_0

    const-string v2, "RecordModule"

    const-string v3, "loadBackground fail..."

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Lcom/arcsoft/avatar/a/d;->b(ZZ)V

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/a/f;->a(F)V

    :cond_1
    iget-object v4, p0, Lcom/arcsoft/avatar/a;->ck:Lcom/arcsoft/avatar/AvatarEngine;

    iget v6, p0, Lcom/arcsoft/avatar/a;->bV:I

    iget v7, p0, Lcom/arcsoft/avatar/a;->s:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v5, p1

    invoke-virtual/range {v4 .. v10}, Lcom/arcsoft/avatar/AvatarEngine;->a(IIIIZ[I)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {p1, v3, v0}, Lcom/arcsoft/avatar/a/d;->c(ZZ)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/a/d;->getTextureId()I

    move-result p1

    if-lez p1, :cond_2

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/a/f;->a(F)V

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/a/f;->g(I)V

    invoke-direct {p0, v0}, Lcom/arcsoft/avatar/a;->a(Z)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/a/f;->f(I)V

    invoke-direct {p0, v3}, Lcom/arcsoft/avatar/a;->a(Z)V

    :cond_2
    return p1
.end method

.method private c()V
    .locals 4

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/arcsoft/avatar/a;->bV:I

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/a/d;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/arcsoft/avatar/a;->s:I

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/a/d;->getHeight()I

    move-result v1

    if-eq v0, v1, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/d;->unInit()V

    :cond_1
    const-string v0, "RecordModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initFramebuffer init FBO first time. size :["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/a;->bV:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/a;->s:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/a/d;

    invoke-direct {v0}, Lcom/arcsoft/avatar/a/d;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    iget v1, p0, Lcom/arcsoft/avatar/a;->bV:I

    iget v2, p0, Lcom/arcsoft/avatar/a;->s:I

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/arcsoft/avatar/a/d;->a(IIZ)V

    :cond_2
    return-void
.end method

.method private d()V
    .locals 4

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/arcsoft/avatar/a/f;

    iget v1, p0, Lcom/arcsoft/avatar/a;->bT:I

    iget v2, p0, Lcom/arcsoft/avatar/a;->bU:I

    const/16 v3, 0x802

    invoke-direct {v0, v1, v2, v3}, Lcom/arcsoft/avatar/a/f;-><init>(III)V

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/f;->p()V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/f;->r()V

    :cond_0
    return-void
.end method

.method private d(I)V
    .locals 3

    if-gtz p1, :cond_0

    const-string v0, "RecordModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "recordingIfNeed textureId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/c/e;->j(I)V

    invoke-direct {p0}, Lcom/arcsoft/avatar/a;->g()V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method private g()V
    .locals 10

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->H()J

    move-result-wide v0

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/c/e;->I()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/arcsoft/avatar/a;->cg:J

    invoke-direct {p0, v4, v5}, Lcom/arcsoft/avatar/a;->a(J)J

    move-result-wide v4

    const-wide/32 v6, 0xf4240

    div-long v6, v0, v6

    iget-wide v8, p0, Lcom/arcsoft/avatar/a;->ci:J

    cmp-long v8, v6, v8

    if-lez v8, :cond_0

    iput-wide v6, p0, Lcom/arcsoft/avatar/a;->ci:J

    iget-object v6, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    const/16 v7, 0x102

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    iget-object v6, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    const/16 v7, 0x104

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    iget-wide v6, p0, Lcom/arcsoft/avatar/a;->cj:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    iget-wide v6, p0, Lcom/arcsoft/avatar/a;->cj:J

    cmp-long v6, v0, v6

    if-lez v6, :cond_1

    invoke-virtual {p0}, Lcom/arcsoft/avatar/a;->stopRecording()V

    iget-object v6, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    const/16 v7, 0x101

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v6, v7, v0}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    cmp-long v0, v4, v8

    if-lez v0, :cond_2

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    invoke-virtual {p0}, Lcom/arcsoft/avatar/a;->stopRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    const/16 v1, 0x103

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public a(IIII)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/avatar/a;->bW:I

    iput p2, p0, Lcom/arcsoft/avatar/a;->bX:I

    iput p3, p0, Lcom/arcsoft/avatar/a;->bV:I

    iput p4, p0, Lcom/arcsoft/avatar/a;->s:I

    return-void
.end method

.method public a(IIILcom/arcsoft/avatar/AvatarEngine;Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bM:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bN:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bO:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cd:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    iput p2, p0, Lcom/arcsoft/avatar/a;->bT:I

    iput p3, p0, Lcom/arcsoft/avatar/a;->bU:I

    iput-object p4, p0, Lcom/arcsoft/avatar/a;->ck:Lcom/arcsoft/avatar/AvatarEngine;

    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {p2}, Ljava/util/Queue;->clear()V

    iput-boolean p5, p0, Lcom/arcsoft/avatar/a;->ce:Z

    iput p1, p0, Lcom/arcsoft/avatar/a;->cf:I

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bP:Z

    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object p1, p0, Lcom/arcsoft/avatar/a;->bQ:Landroid/opengl/EGLDisplay;

    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object p1, p0, Lcom/arcsoft/avatar/a;->bR:Landroid/opengl/EGLContext;

    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object p1, p0, Lcom/arcsoft/avatar/a;->bS:Landroid/opengl/EGLSurface;

    new-instance p1, Lcom/arcsoft/avatar/AvatarConfig$g;

    invoke-direct {p1}, Lcom/arcsoft/avatar/AvatarConfig$g;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/a;->bL:Z

    return-void
.end method

.method public a(IZ)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bM:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    goto :goto_5

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_1
    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bO:Z

    invoke-direct {p0}, Lcom/arcsoft/avatar/a;->a()V

    invoke-direct {p0}, Lcom/arcsoft/avatar/a;->b()V

    nop

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    if-nez v2, :cond_1

    invoke-direct {p0}, Lcom/arcsoft/avatar/a;->d()V

    :cond_1
    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    iget p2, p2, Lcom/arcsoft/avatar/AvatarConfig$g;->faceCount:I

    if-gtz p2, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/a;->c(I)I

    move-result p1

    goto :goto_1

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_2

    :cond_4
    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/a;->a(ZZ)I

    move-result p1

    :goto_1
    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/a;->d(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :cond_5
    :goto_2
    iput-boolean v1, p0, Lcom/arcsoft/avatar/a;->bO:Z

    return-void

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "RecordModule"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRender meet error = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_3
    iput-boolean v1, p0, Lcom/arcsoft/avatar/a;->bO:Z

    nop

    return-void

    :goto_4
    iput-boolean v1, p0, Lcom/arcsoft/avatar/a;->bO:Z

    throw p1

    :cond_6
    :goto_5
    :try_start_3
    const-string p1, "RecordModule"

    const-string p2, "startRender() failed, engine is not inited or startRender process not ready! "

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1
    move-exception p1

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public a(Landroid/media/Image;IZ)V
    .locals 7
    .param p1    # Landroid/media/Image;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    if-nez v0, :cond_0

    const-string p1, "RecordModule"

    const-string p2, "startProcess_1() failed, engine is not inited. "

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    invoke-static {p1}, Lcom/arcsoft/avatar/d/d;->b(Landroid/media/Image;)Lcom/arcsoft/avatar/d/a;

    move-result-object p1

    if-eqz p3, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->ck:Lcom/arcsoft/avatar/AvatarEngine;

    const/4 v3, 0x0

    const/16 v4, 0x5a

    iget-boolean v5, p0, Lcom/arcsoft/avatar/a;->ce:Z

    move-object v2, p1

    move v6, p2

    invoke-virtual/range {v1 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/d/a;[BIZI)I

    :cond_1
    const/4 p2, 0x1

    const/4 p3, 0x0

    :try_start_1
    iput-boolean p2, p0, Lcom/arcsoft/avatar/a;->bN:Z

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v0, :cond_2

    :try_start_2
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/a;->a(Lcom/arcsoft/avatar/d/a;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    :goto_0
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_4
    const-string v0, "RecordModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startProcess_1 putPreviewInQueue_ error = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    iget-object p1, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    goto :goto_0

    :goto_1
    iput-boolean p2, p0, Lcom/arcsoft/avatar/a;->bM:Z

    goto :goto_3

    :goto_2
    iget-object p2, p0, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :try_start_6
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_2
    :goto_3
    iput-boolean p3, p0, Lcom/arcsoft/avatar/a;->bN:Z

    nop

    return-void

    :goto_4
    iput-boolean p3, p0, Lcom/arcsoft/avatar/a;->bN:Z

    throw p1

    :catchall_2
    move-exception p1

    iget-object p2, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public a(Ljava/lang/String;Lcom/arcsoft/avatar/c/g;IIII)V
    .locals 11
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    move-object v1, p0

    move v0, p3

    const-string v2, "RecordModule"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "save video path = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v2, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v2, v1, Lcom/arcsoft/avatar/a;->bL:Z

    if-nez v2, :cond_0

    const-string v0, "RecordModule"

    const-string v2, "startRecording-> StickerApi is not init."

    invoke-static {v0, v2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    iget-object v2, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    if-eqz p4, :cond_6

    if-eqz p5, :cond_6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_1

    :cond_1
    iget-object v2, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    if-nez v2, :cond_5

    if-eqz v0, :cond_3

    const/16 v2, 0x5a

    if-eq v2, v0, :cond_3

    const/16 v2, 0xb4

    if-eq v2, v0, :cond_3

    const/16 v2, 0x10e

    if-ne v2, v0, :cond_2

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "StickerApi-> startRecording(...) screenOrientation = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " is invalid"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    :goto_0
    move-object v9, p2

    iput-object v9, v1, Lcom/arcsoft/avatar/a;->cq:Lcom/arcsoft/avatar/c/g;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iget-object v3, v1, Lcom/arcsoft/avatar/a;->bR:Landroid/opengl/EGLContext;

    if-ne v2, v3, :cond_4

    invoke-direct {v1}, Lcom/arcsoft/avatar/a;->a()V

    :cond_4
    new-instance v10, Lcom/arcsoft/avatar/c/e;

    iget v7, v1, Lcom/arcsoft/avatar/a;->cf:I

    iget-boolean v8, v1, Lcom/arcsoft/avatar/a;->ce:Z

    move-object v2, v10

    move-object v3, v4

    move v4, p4

    move/from16 v5, p5

    move v6, v7

    move v7, v8

    move v8, v0

    invoke-direct/range {v2 .. v9}, Lcom/arcsoft/avatar/c/e;-><init>(Ljava/lang/String;IIIZILcom/arcsoft/avatar/c/g;)V

    iput-object v10, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/c/e;->i(I)V

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    iget-object v2, v1, Lcom/arcsoft/avatar/a;->bR:Landroid/opengl/EGLContext;

    const/4 v3, 0x0

    move/from16 v4, p6

    invoke-virtual {v0, v2, v4, v3}, Lcom/arcsoft/avatar/c/e;->a(Landroid/opengl/EGLContext;IZ)V

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->E()V

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->startRecording()V

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/arcsoft/avatar/a;->cp:Z

    iput-boolean v3, v1, Lcom/arcsoft/avatar/a;->cm:Z

    return-void

    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Recording has been started already."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    :goto_1
    return-void

    :catchall_0
    move-exception v0

    iget-object v1, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public a([BIIIZ)V
    .locals 13
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    move-object v1, p0

    :try_start_0
    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, v1, Lcom/arcsoft/avatar/a;->bL:Z

    if-nez v0, :cond_0

    const-string v0, "RecordModule"

    const-string v2, "startProcess_1() failed, engine is not inited. "

    invoke-static {v0, v2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_1
    iput-boolean v2, v1, Lcom/arcsoft/avatar/a;->bN:Z

    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v0, :cond_1

    :try_start_2
    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    new-instance v0, Lcom/arcsoft/avatar/d/a;

    const/4 v9, 0x1

    move-object v4, v0

    move-object v5, p1

    move/from16 v6, p3

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-direct/range {v4 .. v9}, Lcom/arcsoft/avatar/d/a;-><init>([BIIIZ)V

    invoke-direct {v1, v0}, Lcom/arcsoft/avatar/a;->a(Lcom/arcsoft/avatar/d/a;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_4
    const-string v4, "RecordModule"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startProcess_1 putPreviewInQueue_ error = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    iget-object v0, v1, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    goto :goto_0

    :goto_1
    iput-boolean v2, v1, Lcom/arcsoft/avatar/a;->bM:Z

    goto :goto_3

    :goto_2
    iget-object v2, v1, Lcom/arcsoft/avatar/a;->bK:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :cond_1
    :goto_3
    if-nez p5, :cond_2

    iput-boolean v3, v1, Lcom/arcsoft/avatar/a;->bN:Z

    return-void

    :cond_2
    :try_start_6
    iget-object v4, v1, Lcom/arcsoft/avatar/a;->ck:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v9, 0x5a

    iget-boolean v10, v1, Lcom/arcsoft/avatar/a;->ce:Z

    iget-object v12, v1, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    move-object v5, p1

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p3

    move v11, p2

    invoke-virtual/range {v4 .. v12}, Lcom/arcsoft/avatar/AvatarEngine;->b([BIIIIZILcom/arcsoft/avatar/AvatarConfig$g;)I

    const-string v0, "RecordModule"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "avatarProcessWithInfo -> face count = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/arcsoft/avatar/a;->cr:Lcom/arcsoft/avatar/AvatarConfig$g;

    iget v4, v4, Lcom/arcsoft/avatar/AvatarConfig$g;->faceCount:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :goto_4
    iput-boolean v3, v1, Lcom/arcsoft/avatar/a;->bN:Z

    nop

    return-void

    :goto_5
    iput-boolean v3, v1, Lcom/arcsoft/avatar/a;->bN:Z

    throw v0

    :catchall_2
    move-exception v0

    iget-object v1, v1, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public b(I)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/avatar/a;->cf:I

    return-void
.end method

.method public pauseRecording()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->F()I

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public resumeRecording()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->G()I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMirror(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/a;->ce:Z

    return-void
.end method

.method public setPreviewSize(II)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/avatar/a;->bT:I

    iput p2, p0, Lcom/arcsoft/avatar/a;->bU:I

    return-void
.end method

.method public stopRecording()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :catch_0
    move-exception v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/arcsoft/avatar/a;->resumeRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/e;->stopRecording()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/a;->cl:Lcom/arcsoft/avatar/c/e;

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cp:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cm:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->cj:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->ci:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/a;->cg:J

    return-void
.end method

.method public unInit()V
    .locals 4

    invoke-virtual {p0}, Lcom/arcsoft/avatar/a;->stopRecording()V

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    if-nez v0, :cond_0

    const-string v0, "RecordModule"

    const-string v1, "uninit () failed, engine is not inited. "

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bL:Z

    const/16 v1, 0x64

    :goto_0
    iget-boolean v2, p0, Lcom/arcsoft/avatar/a;->bN:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/arcsoft/avatar/a;->bO:Z

    if-eqz v2, :cond_2

    :cond_1
    add-int/lit8 v1, v1, -0x1

    if-gtz v1, :cond_7

    nop

    :cond_2
    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bP:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->cn:Z

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->clear()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->bY:Ljava/util/Queue;

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/a/h;->deleteTexture()V

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->cc:Lcom/arcsoft/avatar/a/h;

    :cond_3
    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/a/d;->unInit()V

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->cb:Lcom/arcsoft/avatar/a/d;

    :cond_4
    iget-object v2, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/a/f;->unInit()V

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->bZ:Lcom/arcsoft/avatar/a/f;

    :cond_5
    iget-object v2, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/a/f;->unInit()V

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->ca:Lcom/arcsoft/avatar/a/f;

    :cond_6
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->bR:Landroid/opengl/EGLContext;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->bS:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v1, p0, Lcom/arcsoft/avatar/a;->bQ:Landroid/opengl/EGLDisplay;

    iput v0, p0, Lcom/arcsoft/avatar/a;->bV:I

    iput v0, p0, Lcom/arcsoft/avatar/a;->s:I

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bN:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bO:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a;->bM:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    nop

    return-void

    :cond_7
    const-wide/16 v2, 0x1

    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_3
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a;->bJ:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
