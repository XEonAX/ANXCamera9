.class public Lcom/arcsoft/avatar/a/d;
.super Ljava/lang/Object;
.source "GLFramebuffer.java"


# static fields
.field private static final f:Ljava/lang/String;


# instance fields
.field a:[I

.field cE:[I

.field cF:[I

.field cG:[I

.field private cH:I

.field private cI:I

.field e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/arcsoft/avatar/a/d;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/a/d;->f:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    return-void
.end method

.method private a()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    aput v1, v0, v1

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    aput v1, v0, v1

    iput v1, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    iput v1, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    iput-boolean v1, p0, Lcom/arcsoft/avatar/a/d;->e:Z

    return-void
.end method


# virtual methods
.method public a(IIZ)V
    .locals 12

    invoke-direct {p0}, Lcom/arcsoft/avatar/a/d;->a()V

    iput p1, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    iput p2, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    iput-boolean p3, p0, Lcom/arcsoft/avatar/a/d;->e:Z

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    const/4 p2, 0x0

    aput p2, p1, p2

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    aput p2, p1, p2

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    aput p2, p1, p2

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    const p3, 0x8ca6

    invoke-static {p3, p1, p2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    const/4 p3, 0x1

    invoke-static {p3, p1, p2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    aget p1, p1, p2

    const v0, 0x8d40

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 p1, 0xcf5

    invoke-static {p1, p3}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    invoke-static {p3, p1, p2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    aget p1, p1, p2

    const/16 v1, 0xde1

    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 p1, 0x2600

    const/16 v2, 0x2801

    invoke-static {v1, v2, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v2, 0x2800

    invoke-static {v1, v2, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const p1, 0x812f

    const/16 v2, 0x2802

    invoke-static {v1, v2, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v2, 0x2803

    invoke-static {v1, v2, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    iget v6, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    iget v7, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    const/16 v3, 0xde1

    const/4 v4, 0x0

    const/16 v5, 0x1908

    const/4 v8, 0x0

    const/16 v9, 0x1908

    const/16 v10, 0x1401

    const/4 v11, 0x0

    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    aget p1, p1, p2

    const v2, 0x8ce0

    invoke-static {v0, v2, v1, p1, p2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    iget-boolean p1, p0, Lcom/arcsoft/avatar/a/d;->e:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    invoke-static {p3, p1, p2}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    aget p1, p1, p2

    const p3, 0x8d41

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    const p1, 0x81a6

    iget v2, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    iget v3, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    invoke-static {p3, p1, v2, v3}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    const p1, 0x8d00

    iget-object v2, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    aget v2, v2, p2

    invoke-static {v0, p1, p3, v2}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    :cond_0
    nop

    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    iget-object p1, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    aget p1, p1, p2

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void
.end method

.method public b(ZZ)V
    .locals 2

    if-eqz p1, :cond_0

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnable(I)V

    :cond_0
    const p1, 0x8ca6

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    const p1, 0x8d40

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    aget v0, v0, v1

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    if-eqz p2, :cond_1

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    :cond_1
    return-void
.end method

.method public c(ZZ)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    :cond_0
    if-eqz p2, :cond_1

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    :cond_1
    const p1, 0x8d40

    iget-object p2, p0, Lcom/arcsoft/avatar/a/d;->a:[I

    const/4 v0, 0x0

    aget p2, p2, v0

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    return v0
.end method

.method public getTextureId()I
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    return v0
.end method

.method public m()Z
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a/d;->e:Z

    return v0
.end method

.method public unInit()V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cF:[I

    aput v2, v0, v2

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cE:[I

    aput v2, v0, v2

    iget-boolean v0, p0, Lcom/arcsoft/avatar/a/d;->e:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/d;->cG:[I

    aput v2, v0, v2

    :cond_0
    iput v2, p0, Lcom/arcsoft/avatar/a/d;->cI:I

    iput v2, p0, Lcom/arcsoft/avatar/a/d;->cH:I

    return-void
.end method
