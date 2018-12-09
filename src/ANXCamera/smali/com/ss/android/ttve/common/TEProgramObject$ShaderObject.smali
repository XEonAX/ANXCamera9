.class public Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;
.super Ljava/lang/Object;
.source "TEProgramObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/common/TEProgramObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShaderObject"
.end annotation


# instance fields
.field private mShaderID:I

.field private mShaderType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderType:I

    .line 170
    iput v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    .line 171
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->init(Ljava/lang/String;I)Z

    .line 175
    return-void
.end method

.method public static loadShader(ILjava/lang/String;)I
    .locals 3

    .line 200
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p0

    .line 202
    if-eqz p0, :cond_0

    .line 203
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 204
    invoke-static {p0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 205
    const/4 p1, 0x1

    new-array v0, p1, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 206
    const v2, 0x8b81

    invoke-static {p0, v2, v0, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 207
    aget v0, v0, v1

    if-eq v0, p1, :cond_0

    .line 208
    invoke-static {p0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p1

    .line 209
    const-string v0, "TEProgramObject"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 211
    return v1

    .line 214
    :cond_0
    return p0
.end method


# virtual methods
.method public getShaderID()I
    .locals 1

    .line 165
    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    return v0
.end method

.method public init(Ljava/lang/String;I)Z
    .locals 0

    .line 178
    iput p2, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderType:I

    .line 179
    invoke-static {p2, p1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->loadShader(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    .line 182
    iget p1, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    if-eqz p1, :cond_1

    .line 184
    iget p1, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    if-nez p1, :cond_0

    .line 185
    const-string p1, "TEProgramObject"

    const-string p2, "glCreateShader Failed!..."

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    const/4 p1, 0x0

    return p1

    .line 189
    :cond_0
    const/4 p1, 0x1

    return p1

    .line 182
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Shader Create Failed!"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public final release()V
    .locals 1

    .line 193
    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    if-nez v0, :cond_0

    .line 194
    return-void

    .line 195
    :cond_0
    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 196
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->mShaderID:I

    .line 197
    return-void
.end method
