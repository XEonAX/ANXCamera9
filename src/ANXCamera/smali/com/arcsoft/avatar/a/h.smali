.class public Lcom/arcsoft/avatar/a/h;
.super Ljava/lang/Object;
.source "TextureHelper.java"


# instance fields
.field private a:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v2, v1, p1, v1}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void
.end method

.method public deleteTexture()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    invoke-static {v0}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    array-length v1, v1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glDeleteTextures(ILjava/nio/IntBuffer;)V

    return-void
.end method

.method public getTextureId()I
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    aget v0, v0, v1

    return v0

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error generating texture name."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public s()V
    .locals 4

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    aget v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/a/h;->a:[I

    aget v0, v0, v2

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2801

    const/16 v3, 0x2600

    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2800

    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error generating texture name."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
