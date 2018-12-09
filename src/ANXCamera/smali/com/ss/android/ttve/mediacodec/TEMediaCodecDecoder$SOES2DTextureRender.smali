.class Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;
.super Ljava/lang/Object;
.source "TEMediaCodecDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SOES2DTextureRender"
.end annotation


# static fields
.field private static final FLOAT_SIZE_BYTES:I = 0x4

.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field private static final TRIANGLE_VERTICES_DATA_POS_OFFSET:I = 0x0

.field private static final TRIANGLE_VERTICES_DATA_STRIDE_BYTES:I = 0x14

.field private static final TRIANGLE_VERTICES_DATA_UV_OFFSET:I = 0x3

.field private static final VERTEX_SHADER:Ljava/lang/String; = "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"


# instance fields
.field private mMVPMatrix:[F

.field private mProgram:I

.field private mSTMatrix:[F

.field private mTriangleVertices:Ljava/nio/FloatBuffer;

.field private final mTriangleVerticesData:[F

.field private maPositionHandle:I

.field private maTextureHandle:I

.field private muFrameBuffer:[I

.field private muMVPMatrixHandle:I

.field private muSTMatrixHandle:I


# direct methods
.method public constructor <init>(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 821
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 804
    const/16 v0, 0x14

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVerticesData:[F

    .line 812
    const/16 v0, 0x10

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mMVPMatrix:[F

    .line 813
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mSTMatrix:[F

    .line 819
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muFrameBuffer:[I

    .line 822
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVerticesData:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 824
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    .line 825
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVerticesData:[F

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 827
    if-eqz p1, :cond_0

    .line 828
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mSTMatrix:[F

    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    goto :goto_0

    .line 830
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mSTMatrix:[F

    invoke-static {p1, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 832
    :goto_0
    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 980
    const v0, 0x8b31

    invoke-direct {p0, v0, p1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->loadShader(ILjava/lang/String;)I

    move-result p1

    .line 981
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 982
    return v0

    .line 984
    :cond_0
    const v1, 0x8b30

    invoke-direct {p0, v1, p2}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->loadShader(ILjava/lang/String;)I

    move-result p2

    .line 985
    if-nez p2, :cond_1

    .line 986
    return v0

    .line 989
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v1

    .line 990
    const-string v2, "glCreateProgram"

    invoke-virtual {p0, v2}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 991
    if-nez v1, :cond_2

    .line 992
    const-string v2, "MediaCodecDecoder"

    const-string v3, "Could not create program"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 994
    :cond_2
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 995
    const-string p1, "glAttachShader"

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 996
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 997
    const-string p1, "glAttachShader"

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 998
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 999
    const/4 p1, 0x1

    new-array p2, p1, [I

    .line 1000
    const v2, 0x8b82

    invoke-static {v1, v2, p2, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 1001
    aget p2, p2, v0

    if-eq p2, p1, :cond_3

    .line 1002
    const-string p1, "MediaCodecDecoder"

    const-string p2, "Could not link program: "

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1003
    const-string p1, "MediaCodecDecoder"

    invoke-static {v1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1004
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 1005
    goto :goto_0

    .line 1007
    :cond_3
    move v0, v1

    :goto_0
    return v0
.end method

.method private loadShader(ILjava/lang/String;)I
    .locals 4

    .line 964
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    .line 965
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "glCreateShader type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 966
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 967
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 968
    const/4 p2, 0x1

    new-array p2, p2, [I

    .line 969
    const/4 v1, 0x0

    const v2, 0x8b81

    invoke-static {v0, v2, p2, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 970
    aget p2, p2, v1

    if-nez p2, :cond_0

    .line 971
    const-string p2, "MediaCodecDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not compile shader "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 972
    const-string p1, "MediaCodecDecoder"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 973
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 974
    nop

    .line 976
    move v0, v1

    :cond_0
    return v0
.end method


# virtual methods
.method public changeFragmentShader(Ljava/lang/String;)V
    .locals 1

    .line 953
    if-nez p1, :cond_0

    .line 954
    const-string p1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    .line 956
    :cond_0
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 957
    const-string v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"

    invoke-direct {p0, v0, p1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    .line 958
    iget p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    if-eqz p1, :cond_1

    .line 961
    return-void

    .line 959
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "failed creating program"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public checkGlError(Ljava/lang/String;)V
    .locals 3

    .line 1023
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-nez v0, :cond_0

    .line 1027
    return-void

    .line 1024
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": glError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MediaCodecDecoder"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1025
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": glError "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public drawFrame(IIII)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 837
    const/4 v0, 0x0

    invoke-static {v0, v0, p1, p2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 839
    const/16 p1, 0xde1

    invoke-static {p1, p4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 840
    const-string p2, "glBindTexture"

    invoke-virtual {p0, p2}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 842
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muFrameBuffer:[I

    aget p2, p2, v0

    const v1, 0x8d40

    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 844
    const p2, 0x8ce0

    invoke-static {v1, p2, p1, p4, v0}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 846
    const-string p4, "glFramebufferTexture2D"

    invoke-virtual {p0, p4}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 849
    const-string p4, "onDrawFrame start"

    invoke-virtual {p0, p4}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 850
    const/high16 p4, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-static {v2, p4, v2, p4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 851
    const/16 p4, 0x4100

    invoke-static {p4}, Landroid/opengl/GLES20;->glClear(I)V

    .line 853
    iget p4, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    invoke-static {p4}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 854
    const-string p4, "glUseProgram"

    invoke-virtual {p0, p4}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 856
    const p4, 0x84c0

    invoke-static {p4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 857
    const p4, 0x8d65

    invoke-static {p4, p3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 858
    const-string p3, "glBindTexture"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 861
    iget-object p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 862
    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maPositionHandle:I

    iget-object v7, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/16 v6, 0x14

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 864
    const-string p3, "glVertexAttribPointer maPosition"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 865
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maPositionHandle:I

    invoke-static {p3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 866
    const-string p3, "glEnableVertexAttribArray maPositionHandle"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 868
    iget-object p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    const/4 v2, 0x3

    invoke-virtual {p3, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 869
    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maTextureHandle:I

    iget-object v8, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mTriangleVertices:Ljava/nio/FloatBuffer;

    const/4 v4, 0x2

    const/16 v5, 0x1406

    const/4 v6, 0x0

    const/16 v7, 0x14

    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 871
    const-string p3, "glVertexAttribPointer maTextureHandle"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 872
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maTextureHandle:I

    invoke-static {p3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 873
    const-string p3, "glEnableVertexAttribArray maTextureHandle"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 875
    iget-object p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mMVPMatrix:[F

    invoke-static {p3, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 876
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muMVPMatrixHandle:I

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mMVPMatrix:[F

    const/4 v3, 0x1

    invoke-static {p3, v3, v0, v2, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 877
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muSTMatrixHandle:I

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mSTMatrix:[F

    invoke-static {p3, v3, v0, v2, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 879
    const/4 p3, 0x5

    const/4 v2, 0x4

    invoke-static {p3, v0, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 880
    const-string p3, "glDrawArrays"

    invoke-virtual {p0, p3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 882
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maPositionHandle:I

    invoke-static {p3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 883
    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maTextureHandle:I

    invoke-static {p3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 884
    invoke-static {p4, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 885
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 908
    invoke-static {v1, p2, p1, v0, v0}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 910
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 911
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 912
    return-void
.end method

.method public release()V
    .locals 3

    .line 1011
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1012
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 1013
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    .line 1015
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muFrameBuffer:[I

    aget v0, v0, v1

    if-eqz v0, :cond_1

    .line 1016
    const/4 v0, 0x1

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muFrameBuffer:[I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 1018
    :cond_1
    return-void
.end method

.method public surfaceCreated()V
    .locals 3

    .line 918
    const-string v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"

    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    .line 919
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    if-eqz v0, :cond_4

    .line 922
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    const-string v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maPositionHandle:I

    .line 923
    const-string v0, "glGetAttribLocation aPosition"

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 924
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maPositionHandle:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 927
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    const-string v2, "aTextureCoord"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maTextureHandle:I

    .line 928
    const-string v0, "glGetAttribLocation aTextureCoord"

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 929
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->maTextureHandle:I

    if-eq v0, v1, :cond_2

    .line 933
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    const-string v2, "uMVPMatrix"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muMVPMatrixHandle:I

    .line 934
    const-string v0, "glGetUniformLocation uMVPMatrix"

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 935
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muMVPMatrixHandle:I

    if-eq v0, v1, :cond_1

    .line 939
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->mProgram:I

    const-string v2, "uSTMatrix"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muSTMatrixHandle:I

    .line 940
    const-string v0, "glGetUniformLocation uSTMatrix"

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 941
    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muSTMatrixHandle:I

    if-eq v0, v1, :cond_0

    .line 945
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->muFrameBuffer:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 946
    const-string v0, "glGenFramebuffers"

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->checkGlError(Ljava/lang/String;)V

    .line 947
    return-void

    .line 942
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not get attrib location for uSTMatrix"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 936
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not get attrib location for uMVPMatrix"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 930
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not get attrib location for aTextureCoord"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 925
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not get attrib location for aPosition"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 920
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "failed creating program"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
