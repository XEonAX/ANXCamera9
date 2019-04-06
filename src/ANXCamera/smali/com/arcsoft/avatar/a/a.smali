.class public Lcom/arcsoft/avatar/a/a;
.super Ljava/lang/Object;
.source "DrawTexture.java"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private bN:Z

.field private c:I

.field private ct:[I

.field private cu:[I

.field private cv:Ljava/nio/FloatBuffer;

.field private cw:[F

.field private cx:[F

.field private d:I

.field private e:I

.field private f:I

.field private l:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "#version 310 es\nprecision mediump float;\nin vec2 vTextureCoord;\nuniform sampler2D sTexture;\nout vec4 fragColor;\nvoid main()\n{ \n   fragColor = texture(sTexture, vTextureCoord); \n}"

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->a:Ljava/lang/String;

    const-string v0, "#version 310 es\nlayout(location = 0) in vec2 arc_tex_coord;\nlayout(location = 1) in vec2 aPosition;\nout vec2 vTextureCoord;\nvoid main()\n{\n   vTextureCoord = arc_tex_coord;\n   gl_Position = vec4(aPosition, 1.0, 1.0);\n} "

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->b:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/arcsoft/avatar/a/a;->c:I

    iput v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    iput v0, p0, Lcom/arcsoft/avatar/a/a;->e:I

    iput v0, p0, Lcom/arcsoft/avatar/a/a;->f:I

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    const/16 v0, 0x8

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/arcsoft/avatar/a/a;->cw:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_1

    iput-object v1, p0, Lcom/arcsoft/avatar/a/a;->l:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->cx:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private a(Z)V
    .locals 12

    nop

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->cx:[F

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->l:[F

    :goto_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    iget-object v1, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    const/4 v2, -0x1

    const/4 v3, 0x1

    aput v2, v1, v3

    const/4 v1, 0x0

    aput v2, v0, v1

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    aput v2, v0, v1

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES30;->glGenVertexArrays(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    aget v0, v0, v1

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES30;->glGenBuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cw:[F

    array-length v0, v0

    const/4 v2, 0x4

    mul-int/2addr v0, v2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iget-object v4, p0, Lcom/arcsoft/avatar/a/a;->cw:[F

    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v4, p0, Lcom/arcsoft/avatar/a/a;->d:I

    const-string v5, "aPosition"

    invoke-static {v4, v5}, Landroid/opengl/GLES30;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/arcsoft/avatar/a/a;->e:I

    iget-object v4, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    aget v4, v4, v1

    const v5, 0x8892

    invoke-static {v5, v4}, Landroid/opengl/GLES30;->glBindBuffer(II)V

    iget-object v4, p0, Lcom/arcsoft/avatar/a/a;->cw:[F

    array-length v4, v4

    mul-int/2addr v4, v2

    const v6, 0x88e4

    invoke-static {v5, v4, v0, v6}, Landroid/opengl/GLES30;->glBufferData(IILjava/nio/Buffer;I)V

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->e:I

    invoke-static {v0}, Landroid/opengl/GLES30;->glEnableVertexAttribArray(I)V

    iget v6, p0, Lcom/arcsoft/avatar/a/a;->e:I

    const/4 v7, 0x2

    const/16 v8, 0x1406

    const/4 v9, 0x0

    const/16 v10, 0x8

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES30;->glVertexAttribPointer(IIIZII)V

    array-length v0, p1

    mul-int/2addr v0, v2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iput-boolean v1, p0, Lcom/arcsoft/avatar/a/a;->bN:Z

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    const-string v4, "arc_tex_coord"

    invoke-static {v0, v4}, Landroid/opengl/GLES30;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/a/a;->f:I

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    aget v0, v0, v3

    invoke-static {v5, v0}, Landroid/opengl/GLES30;->glBindBuffer(II)V

    array-length p1, p1

    mul-int/2addr v2, p1

    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    const v0, 0x88e8

    invoke-static {v5, v2, p1, v0}, Landroid/opengl/GLES30;->glBufferData(IILjava/nio/Buffer;I)V

    iget p1, p0, Lcom/arcsoft/avatar/a/a;->f:I

    invoke-static {p1}, Landroid/opengl/GLES30;->glEnableVertexAttribArray(I)V

    iget v6, p0, Lcom/arcsoft/avatar/a/a;->f:I

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES30;->glVertexAttribPointer(IIIZII)V

    invoke-static {v5, v1}, Landroid/opengl/GLES30;->glBindBuffer(II)V

    invoke-static {v1}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    return-void
.end method

.method private b(Z)V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-boolean v2, p0, Lcom/arcsoft/avatar/a/a;->bN:Z

    if-nez v2, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/arcsoft/avatar/a/a;->cx:[F

    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iput-boolean v0, p0, Lcom/arcsoft/avatar/a/a;->bN:Z

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-boolean p1, p0, Lcom/arcsoft/avatar/a/a;->bN:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/arcsoft/avatar/a/a;->l:[F

    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iput-boolean v1, p0, Lcom/arcsoft/avatar/a/a;->bN:Z

    :goto_0
    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    aget p1, p1, v0

    const v0, 0x8892

    invoke-static {v0, p1}, Landroid/opengl/GLES30;->glBindBuffer(II)V

    iget-object p1, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/4 p1, 0x4

    iget-object v2, p0, Lcom/arcsoft/avatar/a/a;->l:[F

    array-length v2, v2

    mul-int/2addr p1, v2

    iget-object v2, p0, Lcom/arcsoft/avatar/a/a;->cv:Ljava/nio/FloatBuffer;

    invoke-static {v0, v1, p1, v2}, Landroid/opengl/GLES30;->glBufferSubData(IIILjava/nio/Buffer;)V

    invoke-static {v0, v1}, Landroid/opengl/GLES30;->glBindBuffer(II)V

    return-void

    :cond_1
    return-void
.end method


# virtual methods
.method public d(Z)V
    .locals 6

    const v0, 0x8b31

    invoke-static {v0}, Landroid/opengl/GLES30;->glCreateShader(I)I

    move-result v0

    const v1, 0x8b30

    invoke-static {v1}, Landroid/opengl/GLES30;->glCreateShader(I)I

    move-result v1

    const v2, 0x8b81

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_0

    const-string v5, "#version 310 es\nlayout(location = 0) in vec2 arc_tex_coord;\nlayout(location = 1) in vec2 aPosition;\nout vec2 vTextureCoord;\nvoid main()\n{\n   vTextureCoord = arc_tex_coord;\n   gl_Position = vec4(aPosition, 1.0, 1.0);\n} "

    invoke-static {v0, v5}, Landroid/opengl/GLES30;->glShaderSource(ILjava/lang/String;)V

    invoke-static {v0}, Landroid/opengl/GLES30;->glCompileShader(I)V

    new-array v5, v3, [I

    invoke-static {v0, v2, v5, v4}, Landroid/opengl/GLES30;->glGetShaderiv(II[II)V

    aget v5, v5, v4

    if-nez v5, :cond_0

    invoke-static {v0}, Landroid/opengl/GLES30;->glDeleteShader(I)V

    :cond_0
    if-eqz v1, :cond_1

    const-string v5, "#version 310 es\nprecision mediump float;\nin vec2 vTextureCoord;\nuniform sampler2D sTexture;\nout vec4 fragColor;\nvoid main()\n{ \n   fragColor = texture(sTexture, vTextureCoord); \n}"

    invoke-static {v1, v5}, Landroid/opengl/GLES30;->glShaderSource(ILjava/lang/String;)V

    invoke-static {v1}, Landroid/opengl/GLES30;->glCompileShader(I)V

    new-array v5, v3, [I

    invoke-static {v1, v2, v5, v4}, Landroid/opengl/GLES30;->glGetShaderiv(II[II)V

    aget v2, v5, v4

    if-nez v2, :cond_1

    invoke-static {v1}, Landroid/opengl/GLES30;->glDeleteShader(I)V

    :cond_1
    invoke-static {}, Landroid/opengl/GLES30;->glCreateProgram()I

    move-result v2

    iput v2, p0, Lcom/arcsoft/avatar/a/a;->d:I

    iget v2, p0, Lcom/arcsoft/avatar/a/a;->d:I

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/arcsoft/avatar/a/a;->d:I

    invoke-static {v2, v0}, Landroid/opengl/GLES30;->glAttachShader(II)V

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    invoke-static {v0, v1}, Landroid/opengl/GLES30;->glAttachShader(II)V

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    invoke-static {v0}, Landroid/opengl/GLES30;->glLinkProgram(I)V

    new-array v0, v3, [I

    iget v1, p0, Lcom/arcsoft/avatar/a/a;->d:I

    const v2, 0x8b82

    invoke-static {v1, v2, v0, v4}, Landroid/opengl/GLES30;->glGetProgramiv(II[II)V

    aget v0, v0, v4

    if-nez v0, :cond_2

    iput v4, p0, Lcom/arcsoft/avatar/a/a;->d:I

    :cond_2
    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/a/a;->a(Z)V

    iget p1, p0, Lcom/arcsoft/avatar/a/a;->d:I

    const-string v0, "sTexture"

    invoke-static {p1, v0}, Landroid/opengl/GLES30;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/arcsoft/avatar/a/a;->c:I

    return-void
.end method

.method public e(I)V
    .locals 3

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    invoke-static {v0}, Landroid/opengl/GLES30;->glUseProgram(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES30;->glActiveTexture(I)V

    const/16 v0, 0xde1

    invoke-static {v0, p1}, Landroid/opengl/GLES30;->glBindTexture(II)V

    iget p1, p0, Lcom/arcsoft/avatar/a/a;->c:I

    invoke-static {p1, v1}, Landroid/opengl/GLES30;->glUniform1i(II)V

    const/4 p1, 0x6

    const/4 v2, 0x4

    invoke-static {p1, v1, v2}, Landroid/opengl/GLES30;->glDrawArrays(III)V

    invoke-static {v0, v1}, Landroid/opengl/GLES30;->glBindTexture(II)V

    invoke-static {v1}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    return-void
.end method

.method public h()V
    .locals 5

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    const/4 v1, -0x1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/arcsoft/avatar/a/a;->d:I

    invoke-static {v0}, Landroid/opengl/GLES30;->glDeleteProgram(I)V

    iput v1, p0, Lcom/arcsoft/avatar/a/a;->d:I

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const/4 v3, 0x1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES30;->glDeleteVertexArrays(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->cu:[I

    aput v1, v0, v2

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    aget v0, v0, v2

    if-lez v0, :cond_2

    const/4 v0, 0x2

    iget-object v4, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    invoke-static {v0, v4, v2}, Landroid/opengl/GLES30;->glDeleteBuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    iget-object v4, p0, Lcom/arcsoft/avatar/a/a;->ct:[I

    aput v1, v4, v3

    aput v1, v0, v2

    :cond_2
    return-void
.end method
