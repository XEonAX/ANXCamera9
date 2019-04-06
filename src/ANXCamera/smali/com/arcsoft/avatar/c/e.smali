.class public Lcom/arcsoft/avatar/c/e;
.super Ljava/lang/Object;
.source "MediaManager.java"

# interfaces
.implements Lcom/arcsoft/avatar/c/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/avatar/c/e$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String; = "Arc_VideoEncoder"

.field public static final em:I = 0x1

.field public static final en:I = 0x1

.field public static final eo:I = 0x2

.field private static final s:I = 0x2


# instance fields
.field private b:I

.field private bP:Z

.field private bW:I

.field private bX:I

.field private c:I

.field private cY:I

.field private d:I

.field private e:Z

.field private el:Z

.field private ep:Ljava/lang/String;

.field private eq:Lcom/arcsoft/avatar/c/b;

.field private er:Lcom/arcsoft/avatar/c/b;

.field private es:Lcom/arcsoft/avatar/c/f;

.field private et:Lcom/arcsoft/avatar/a/e;

.field private eu:Ljava/lang/Object;

.field private ev:Lcom/arcsoft/avatar/c/g;

.field private ew:Lcom/arcsoft/avatar/c/d;

.field private g:Ljava/lang/String;

.field private n:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIZILcom/arcsoft/avatar/c/g;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p7, p0, Lcom/arcsoft/avatar/c/e;->ev:Lcom/arcsoft/avatar/c/g;

    iput p2, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iput p3, p0, Lcom/arcsoft/avatar/c/e;->c:I

    const/16 p7, 0x5a

    if-eq p7, p4, :cond_0

    const/16 p7, 0x10e

    if-ne p7, p4, :cond_1

    :cond_0
    iget p7, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget p7, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/c/e;->c:I

    iget p7, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/c/e;->b:I

    :cond_1
    iput p4, p0, Lcom/arcsoft/avatar/c/e;->d:I

    iput-boolean p5, p0, Lcom/arcsoft/avatar/c/e;->e:Z

    iput-object p1, p0, Lcom/arcsoft/avatar/c/e;->g:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/arcsoft/avatar/c/e;->n:I

    iput p1, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    new-instance p4, Lcom/arcsoft/avatar/c/f;

    iget-object p5, p0, Lcom/arcsoft/avatar/c/e;->g:Ljava/lang/String;

    invoke-direct {p4, p5, p6, p0}, Lcom/arcsoft/avatar/c/f;-><init>(Ljava/lang/String;ILcom/arcsoft/avatar/c/g;)V

    iput-object p4, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object p4

    const/16 p5, 0x305a

    invoke-static {p5}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object p5

    const/4 p6, 0x1

    new-array p7, p6, [I

    new-array p6, p6, [I

    const/16 v0, 0x3057

    invoke-static {p4, p5, v0, p7, p1}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    const/16 v0, 0x3056

    invoke-static {p4, p5, v0, p6, p1}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    aget p4, p7, p1

    iput p4, p0, Lcom/arcsoft/avatar/c/e;->bW:I

    aget p1, p6, p1

    iput p1, p0, Lcom/arcsoft/avatar/c/e;->bX:I

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    const-string p1, "Arc_VideoEncoder"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "MediaManager constructor mFrameWidth = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " ,mFrameHeight = "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/arcsoft/avatar/c/e;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/c/e;->b:I

    return p0
.end method

.method private a()V
    .locals 3

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->n:I

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/e;->el:Z

    return-void

    :cond_0
    iget v0, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    return-void

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Init encoder count great than need. need="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,but got="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic b(Lcom/arcsoft/avatar/c/e;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/c/e;->c:I

    return p0
.end method

.method private b()V
    .locals 8

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->c:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v4, p0, Lcom/arcsoft/avatar/c/e;->c:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    const-string v1, "Arc_VideoEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "glReadPixels() glError = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/arcsoft/avatar/c/e$a;

    invoke-direct {v1, p0, v0}, Lcom/arcsoft/avatar/c/e$a;-><init>(Lcom/arcsoft/avatar/c/e;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1}, Lcom/arcsoft/avatar/c/e$a;->start()V

    return-void
.end method


# virtual methods
.method public D()V
    .locals 10

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "MediaManager initVideoEncoder in"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/c/h;

    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    iget v4, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v5, p0, Lcom/arcsoft/avatar/c/e;->c:I

    iget-object v6, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    const v9, 0x989680

    move-object v2, v0

    move-object v7, p0

    invoke-direct/range {v2 .. v9}, Lcom/arcsoft/avatar/c/h;-><init>(Lcom/arcsoft/avatar/c/f;IILjava/lang/Object;Lcom/arcsoft/avatar/c/g;Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/c/b;->f(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/e;->el:Z

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/e;->a()V

    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MediaManager initVideoEncoder out mInitedEncoderCount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public E()V
    .locals 3

    new-instance v0, Lcom/arcsoft/avatar/c/a;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    iget-object v2, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, p0}, Lcom/arcsoft/avatar/c/a;-><init>(Lcom/arcsoft/avatar/c/f;Ljava/lang/Object;Lcom/arcsoft/avatar/c/g;)V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/c/b;->f(Z)V

    iget v0, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/e;->a()V

    return-void
.end method

.method public F()I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->pauseRecording()V

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->pauseRecording()V

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public G()I
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/c/b;->resumeRecording()V

    :cond_0
    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/c/b;->resumeRecording()V

    :cond_1
    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public H()J
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/f;->L()J

    move-result-wide v0

    return-wide v0
.end method

.method public I()J
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/f;->M()J

    move-result-wide v0

    return-wide v0
.end method

.method public a(Landroid/opengl/EGLContext;IZ)V
    .locals 10

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "MediaManager initVideoEncoderWithSharedContext in"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/c/h;

    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    iget v4, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v5, p0, Lcom/arcsoft/avatar/c/e;->c:I

    iget-object v6, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    move-object v2, v0

    move-object v7, p0

    move-object v8, p1

    move v9, p2

    invoke-direct/range {v2 .. v9}, Lcom/arcsoft/avatar/c/h;-><init>(Lcom/arcsoft/avatar/c/f;IILjava/lang/Object;Lcom/arcsoft/avatar/c/g;Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    const-string p1, "Arc_VideoEncoder"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "MediaManager initVideoEncoderWithSharedContext encoder type = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/e;->bP:Z

    iget-boolean p2, p0, Lcom/arcsoft/avatar/c/e;->bP:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {p2}, Lcom/arcsoft/avatar/c/b;->getInputSurface()Landroid/view/Surface;

    move-result-object p2

    if-eqz p2, :cond_0

    new-instance p2, Lcom/arcsoft/avatar/a/e;

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->c:I

    iget v3, p0, Lcom/arcsoft/avatar/c/e;->d:I

    iget-boolean v4, p0, Lcom/arcsoft/avatar/c/e;->e:Z

    invoke-direct {p2, v1, v2, v3, v4}, Lcom/arcsoft/avatar/a/e;-><init>(IIIZ)V

    iput-object p2, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    invoke-virtual {p2, p3}, Lcom/arcsoft/avatar/a/e;->e(Z)V

    goto :goto_0

    :cond_0
    const-string p2, "Arc_VideoEncoder"

    const-string p3, "initVideoEncoder()->getInputSurface null."

    invoke-static {p2, p3}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->ev:Lcom/arcsoft/avatar/c/g;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->ev:Lcom/arcsoft/avatar/c/g;

    const/16 p3, 0x232

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, p3, v1}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    :goto_0
    new-instance p2, Lcom/arcsoft/avatar/c/d;

    invoke-direct {p2}, Lcom/arcsoft/avatar/c/d;-><init>()V

    iput-object p2, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    const/4 p3, 0x2

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->c:I

    invoke-virtual {p2, p3, v1, v2, v0}, Lcom/arcsoft/avatar/c/d;->a(IIIZ)V

    iget-object p2, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    iget-object p3, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {p2, p3}, Lcom/arcsoft/avatar/c/b;->a(Lcom/arcsoft/avatar/c/d;)V

    iget p2, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/e;->a()V

    const-string p1, "Arc_VideoEncoder"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "MediaManager initVideoEncoderWithSharedContext out mInitedEncoderCount = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Lcom/arcsoft/avatar/c/e;->cY:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public i(I)V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/c/f;->i(I)V

    :cond_0
    iput p1, p0, Lcom/arcsoft/avatar/c/e;->n:I

    return-void
.end method

.method public j(I)V
    .locals 6

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/e;->el:Z

    if-nez v0, :cond_0

    const-string p1, "Arc_VideoEncoder"

    const-string v0, "drawSurfaceWithTextureId()-> MediaManager has not been initialized."

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    if-lez p1, :cond_6

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    if-eqz v0, :cond_5

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "drawSurfaceWithTextureId()->A-"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    nop

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/c/b;->lock()V

    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/c/d;->C()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/c/d;->y()Lcom/arcsoft/avatar/c/c;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_2

    :try_start_1
    iget-boolean v0, v3, Lcom/arcsoft/avatar/c/c;->mIsInited:Z

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, v3

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v1, v0

    move-object v0, v3

    goto :goto_2

    :cond_2
    :goto_0
    const-string v0, "Arc_VideoEncoder"

    const-string v1, "drawSurfaceWithTextureId()-> get a null frame item."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/b;->v()V

    return-void

    :cond_3
    nop

    move v1, v2

    :goto_1
    iget-object v3, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/c/b;->v()V

    goto :goto_3

    :catchall_0
    move-exception p1

    goto/16 :goto_7

    :catch_1
    move-exception v1

    :goto_2
    nop

    :try_start_2
    const-string v3, "Arc_VideoEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "drawSurfaceWithTextureId meet error when get lock : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/c/b;->v()V

    nop

    move v1, v2

    :goto_3
    if-nez v1, :cond_4

    return-void

    :cond_4
    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/c/d;->a(Lcom/arcsoft/avatar/c/c;)V

    iget-object v1, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v1, v2, v2}, Lcom/arcsoft/avatar/a/d;->b(ZZ)V

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->b:I

    iget v3, p0, Lcom/arcsoft/avatar/c/e;->c:I

    invoke-static {v2, v2, v1, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    invoke-virtual {v1, p1}, Lcom/arcsoft/avatar/a/e;->f(I)V

    const p1, 0x9117

    invoke-static {p1, v2}, Landroid/opengl/GLES30;->glFenceSync(II)J

    move-result-wide v3

    iput-wide v3, v0, Lcom/arcsoft/avatar/c/c;->a:J

    iget-object p1, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {p1, v2, v2}, Lcom/arcsoft/avatar/a/d;->c(ZZ)V

    iput-boolean v2, v0, Lcom/arcsoft/avatar/c/c;->ef:Z

    iget p1, p0, Lcom/arcsoft/avatar/c/e;->bW:I

    iget v1, p0, Lcom/arcsoft/avatar/c/e;->bX:I

    invoke-static {v2, v2, p1, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const-string p1, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drawSurfaceWithTextureId()-> A glError = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", fbo = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " ,textureId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/c;->ee:Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/d;->getTextureId()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_3
    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/b;->lock()V

    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/d;->A()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    nop

    :goto_4
    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/b;->w()V

    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/b;->v()V

    goto :goto_5

    :catchall_1
    move-exception p1

    goto :goto_6

    :catch_2
    move-exception p1

    nop

    :try_start_4
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drawSurfaceWithTextureId meet error when get lock : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    :goto_5
    const-string p1, "Arc_VideoEncoder"

    const-string v0, "drawSurfaceWithTextureId()->C"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :goto_6
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->w()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->v()V

    throw p1

    :goto_7
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->v()V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Could not call drawSurfaceWithTextureId() in with a null GLRender."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "textureId must >0 , your textureId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onRecordingListener(ILjava/lang/Object;)V
    .locals 4

    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRecordingListener()->in msg = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    nop

    nop

    const/16 v0, 0x270

    const/16 v1, 0x220

    const/16 v2, 0x230

    const/16 v3, 0x260

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    packed-switch p1, :pswitch_data_3

    goto :goto_3

    :pswitch_0
    nop

    goto :goto_0

    :pswitch_1
    nop

    goto :goto_0

    :pswitch_2
    nop

    nop

    :goto_0
    move v3, v0

    goto :goto_4

    :pswitch_3
    nop

    goto :goto_4

    :pswitch_4
    nop

    goto :goto_4

    :pswitch_5
    nop

    goto :goto_4

    :pswitch_6
    nop

    goto :goto_4

    :pswitch_7
    nop

    goto :goto_4

    :pswitch_8
    nop

    goto :goto_4

    :pswitch_9
    nop

    goto :goto_1

    :pswitch_a
    nop

    goto :goto_1

    :pswitch_b
    nop

    goto :goto_1

    :pswitch_c
    nop

    goto :goto_1

    :pswitch_d
    nop

    nop

    :goto_1
    move v3, v2

    goto :goto_4

    :pswitch_e
    nop

    goto :goto_2

    :pswitch_f
    nop

    goto :goto_2

    :pswitch_10
    nop

    goto :goto_2

    :pswitch_11
    nop

    goto :goto_2

    :pswitch_12
    nop

    nop

    :goto_2
    move v3, v1

    goto :goto_4

    :goto_3
    move v3, p1

    :goto_4
    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->ev:Lcom/arcsoft/avatar/c/g;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/c/e;->ev:Lcom/arcsoft/avatar/c/g;

    invoke-interface {p1, v3, p2}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    const-string p1, "Arc_VideoEncoder"

    const-string p2, "onRecordingListener()->out"

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x221
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x231
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x261
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x271
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startRecording()V
    .locals 3

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/e;->el:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->startRecording()V

    goto :goto_0

    :cond_0
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecording()-> VideoEncoder is null. maxEncoderCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->startRecording()V

    goto :goto_1

    :cond_1
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecording()-> AudioEncoder is null. maxEncoderCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/e;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unit Encoder or Muxer is null."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopRecording()V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->stopRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/c/b;->release(Z)V

    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->eq:Lcom/arcsoft/avatar/c/b;

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/b;->stopRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/c/b;->release(Z)V

    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->er:Lcom/arcsoft/avatar/c/b;

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/a/e;->n()V

    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->et:Lcom/arcsoft/avatar/a/e;

    :cond_2
    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/d;->unInit()V

    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->ew:Lcom/arcsoft/avatar/c/d;

    :cond_3
    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->es:Lcom/arcsoft/avatar/c/f;

    iput-object v1, p0, Lcom/arcsoft/avatar/c/e;->eu:Ljava/lang/Object;

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
