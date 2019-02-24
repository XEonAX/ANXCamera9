.class public Lcom/ss/android/medialib/common/ProgramObject;
.super Ljava/lang/Object;
.source "ProgramObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "ProgramObject"


# instance fields
.field private mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

.field private mProgramID:I

.field private mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v0

    iput v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    .line 19
    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/medialib/common/ProgramObject;
    .locals 1

    .line 22
    new-instance v0, Lcom/ss/android/medialib/common/ProgramObject;

    invoke-direct {v0}, Lcom/ss/android/medialib/common/ProgramObject;-><init>()V

    .line 23
    invoke-virtual {v0, p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->init(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 24
    invoke-virtual {v0}, Lcom/ss/android/medialib/common/ProgramObject;->release()V

    .line 25
    const/4 v0, 0x0

    .line 27
    :cond_0
    return-object v0
.end method


# virtual methods
.method public attributeLocation(Ljava/lang/String;)I
    .locals 1

    .line 148
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bind()V
    .locals 1

    .line 91
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 92
    return-void
.end method

.method public bindAttribLocation(Ljava/lang/String;I)V
    .locals 1

    .line 152
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {v0, p2, p1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 153
    return-void
.end method

.method public getProgramID()I
    .locals 1

    .line 32
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    return v0
.end method

.method public getUniformLoc(Ljava/lang/String;)I
    .locals 5

    .line 95
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    .line 97
    if-gez v0, :cond_0

    .line 98
    const-string v1, "ProgramObject"

    const-string v2, "uniform name %s does not exist"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_0
    return v0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 43
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/medialib/common/ProgramObject;->init(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 2

    .line 47
    if-nez p3, :cond_0

    .line 48
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result p3

    .line 51
    :cond_0
    if-nez p3, :cond_1

    .line 52
    const-string v0, "ProgramObject"

    const-string v1, "Invalid Program ID! Check if the context is binded!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    if-eqz v0, :cond_2

    .line 56
    iget-object v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {v0}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->release()V

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    if-eqz v0, :cond_3

    .line 58
    iget-object v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {v0}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->release()V

    .line 60
    :cond_3
    new-instance v0, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    const v1, 0x8b31

    invoke-direct {v0, p1, v1}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    .line 61
    new-instance p1, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    const v0, 0x8b30

    invoke-direct {p1, p2, v0}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    .line 63
    iget-object p1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {p1}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->getShaderID()I

    move-result p1

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 64
    iget-object p1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {p1}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->getShaderID()I

    move-result p1

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 65
    const-string p1, "AttachShaders..."

    invoke-static {p1}, Lcom/ss/android/medialib/common/Common;->checkGLError(Ljava/lang/String;)V

    .line 66
    invoke-static {p3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 68
    const/4 p1, 0x1

    new-array p2, p1, [I

    const/4 v0, 0x0

    aput v0, p2, v0

    .line 69
    const v1, 0x8b82

    invoke-static {p3, v1, p2, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 71
    iget-object v1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {v1}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->release()V

    .line 72
    iget-object v1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    invoke-virtual {v1}, Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;->release()V

    .line 73
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mVertexShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    .line 74
    iput-object v1, p0, Lcom/ss/android/medialib/common/ProgramObject;->mFragmentShader:Lcom/ss/android/medialib/common/ProgramObject$ShaderObject;

    .line 76
    aget p2, p2, v0

    if-eq p2, p1, :cond_4

    .line 77
    invoke-static {p3}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object p1

    .line 78
    const-string p2, "ProgramObject"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return v0

    .line 82
    :cond_4
    iget p2, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    if-eq p2, p3, :cond_5

    iget p2, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    if-eqz p2, :cond_5

    .line 83
    iget p2, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 86
    :cond_5
    iput p3, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    .line 87
    return p1
.end method

.method public final release()V
    .locals 1

    .line 36
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    if-eqz v0, :cond_0

    .line 37
    iget v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/medialib/common/ProgramObject;->mProgramID:I

    .line 40
    :cond_0
    return-void
.end method

.method public sendUniformMat2(Ljava/lang/String;IZ[F)V
    .locals 1

    .line 136
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix2fv(IIZ[FI)V

    .line 137
    return-void
.end method

.method public sendUniformMat3(Ljava/lang/String;IZ[F)V
    .locals 1

    .line 140
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 141
    return-void
.end method

.method public sendUniformMat4(Ljava/lang/String;IZ[F)V
    .locals 1

    .line 144
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 145
    return-void
.end method

.method public sendUniformf(Ljava/lang/String;F)V
    .locals 0

    .line 104
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 105
    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FF)V
    .locals 0

    .line 108
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 109
    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FFF)V
    .locals 0

    .line 112
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 113
    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FFFF)V
    .locals 0

    .line 116
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4, p5}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 117
    return-void
.end method

.method public sendUniformi(Ljava/lang/String;I)V
    .locals 0

    .line 120
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 121
    return-void
.end method

.method public sendUniformi(Ljava/lang/String;II)V
    .locals 0

    .line 124
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glUniform2i(III)V

    .line 125
    return-void
.end method

.method public sendUniformi(Ljava/lang/String;III)V
    .locals 0

    .line 128
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glUniform3i(IIII)V

    .line 129
    return-void
.end method

.method public sendUniformi(Ljava/lang/String;IIII)V
    .locals 0

    .line 132
    invoke-virtual {p0, p1}, Lcom/ss/android/medialib/common/ProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4, p5}, Landroid/opengl/GLES20;->glUniform4i(IIIII)V

    .line 133
    return-void
.end method
