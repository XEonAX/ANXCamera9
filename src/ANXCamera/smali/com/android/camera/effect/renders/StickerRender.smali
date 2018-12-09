.class public Lcom/android/camera/effect/renders/StickerRender;
.super Lcom/android/camera/effect/renders/PixelEffectRender;
.source "StickerRender.java"


# static fields
.field private static final FRAG_SHADER:Ljava/lang/String; = "uniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord); \n}"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBeautifyTextureId:[I

.field private mCurrentSticker:Ljava/lang/String;

.field private mFrameBufferHeight:I

.field private mFrameBufferId:I

.field private mFrameBufferWidth:I

.field private mHumanActionHandleLock:Ljava/lang/Object;

.field private mHumanActionInitDone:Z

.field private mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mNeedBeautify:Z

.field private mRGBABuffer:Ljava/nio/ByteBuffer;

.field private mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

.field private mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

.field private mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

.field private mTextureOutId:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const-class v0, Lcom/android/camera/effect/renders/StickerRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;ILjava/lang/String;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 30
    new-instance p1, Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-direct {p1}, Lcom/sensetime/stmobile/STMobileStickerNative;-><init>()V

    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    .line 31
    new-instance p1, Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-direct {p1}, Lcom/sensetime/stmobile/STBeautifyNative;-><init>()V

    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    .line 32
    new-instance p1, Lcom/sensetime/stmobile/STMobileHumanActionNative;

    invoke-direct {p1}, Lcom/sensetime/stmobile/STMobileHumanActionNative;-><init>()V

    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    .line 34
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    .line 39
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    .line 49
    iput-object p3, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->onInit()V

    .line 51
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/effect/renders/StickerRender;)Ljava/lang/Object;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/effect/renders/StickerRender;)Lcom/sensetime/stmobile/STMobileHumanActionNative;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/camera/effect/renders/StickerRender;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionInitDone:Z

    return p1
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 26
    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private destroyGLResource()V
    .locals 4

    .line 280
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    .line 281
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 282
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 283
    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    .line 285
    :cond_0
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    if-eqz v1, :cond_1

    .line 286
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 287
    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    .line 289
    :cond_1
    return-void
.end method

.method private getRGBABuffer(II)Ljava/nio/ByteBuffer;
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 215
    mul-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    .line 217
    :cond_0
    iget-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 218
    iget-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method private getRotateType()I
    .locals 2

    .line 199
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->getOrientation()I

    move-result v0

    .line 201
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_2

    const/16 v1, 0xb4

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_0

    .line 209
    const/4 v0, 0x0

    return v0

    .line 207
    :cond_0
    const/4 v0, 0x3

    return v0

    .line 205
    :cond_1
    const/4 v0, 0x2

    return v0

    .line 203
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private hasSticker()Z
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private initBeauty()V
    .locals 4

    .line 250
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    iget v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mPreviewWidth:I

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mPreviewHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->createInstance(II)I

    move-result v0

    .line 251
    new-instance v1, Lcom/android/camera/sticker/beautyprocessor/StickerBeautyProcessor;

    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-direct {v1, v2}, Lcom/android/camera/sticker/beautyprocessor/StickerBeautyProcessor;-><init>(Lcom/sensetime/stmobile/STBeautifyNative;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 252
    sget-object v1, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initBeautify: result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    if-nez v0, :cond_0

    .line 254
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x1

    const v2, 0x3eb851ec    # 0.36f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 255
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x3

    const v2, 0x3f3d70a4    # 0.74f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 256
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x4

    const v2, 0x3ca3d70a    # 0.02f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 257
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x5

    const v2, 0x3e051eb8    # 0.13f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 258
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x6

    const v2, 0x3de147ae    # 0.11f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 259
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v1, 0x7

    const v2, 0x3dcccccd    # 0.1f

    invoke-virtual {v0, v1, v2}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 261
    :cond_0
    return-void
.end method

.method private initHumanAction()V
    .locals 2

    .line 222
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/camera/effect/renders/StickerRender$1;

    invoke-direct {v1, p0}, Lcom/android/camera/effect/renders/StickerRender$1;-><init>(Lcom/android/camera/effect/renders/StickerRender;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 240
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 241
    return-void
.end method

.method private initSticker()V
    .locals 4

    .line 244
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/sensetime/stmobile/STMobileStickerNative;->createInstance(Ljava/lang/String;)I

    move-result v0

    .line 245
    sget-object v1, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initSticker: result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    return-void
.end method

.method private onDestroy()V
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->destroyInstance()V

    .line 294
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STMobileStickerNative;->destroyInstance()V

    .line 295
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STBeautifyNative;->destroyBeautify()V

    .line 297
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->destroyGLResource()V

    .line 299
    return-void
.end method

.method private onInit()V
    .locals 4

    .line 264
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initHumanAction()V

    .line 265
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initBeauty()V

    .line 266
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initSticker()V

    .line 267
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    monitor-enter v0

    .line 268
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionInitDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 270
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 274
    goto :goto_0

    .line 271
    :catch_0
    move-exception v1

    .line 272
    :try_start_2
    sget-object v2, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 273
    nop

    .line 276
    :cond_0
    monitor-exit v0

    .line 277
    return-void

    .line 276
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private processTexture(IIII)I
    .locals 20

    move-object/from16 v0, p0

    move/from16 v11, p3

    .line 91
    move/from16 v12, p4

    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    const/16 v2, 0xde1

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 92
    new-array v1, v3, [I

    iput-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    .line 93
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    invoke-static {v11, v12, v1, v2}, Lcom/android/camera/sticker/glutils/GlUtil;->initEffectTexture(II[II)I

    .line 96
    :cond_0
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    if-nez v1, :cond_1

    .line 97
    new-array v1, v3, [I

    iput-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    .line 98
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    invoke-static {v11, v12, v1, v2}, Lcom/android/camera/sticker/glutils/GlUtil;->initEffectTexture(II[II)I

    .line 102
    :cond_1
    const v8, 0x8d40

    move/from16 v1, p2

    invoke-static {v8, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 103
    const-string v1, "glBindFramebuffer"

    invoke-static {v1}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 105
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    .line 106
    invoke-direct {v0, v11, v12}, Lcom/android/camera/effect/renders/StickerRender;->getRGBABuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 105
    move v3, v11

    move v4, v12

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 108
    iget v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mParentFrameBufferId:I

    invoke-static {v8, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 110
    const/4 v1, -0x1

    .line 111
    iget-boolean v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    const/4 v13, 0x0

    if-nez v2, :cond_3

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->hasSticker()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_2

    goto :goto_0

    .line 159
    :cond_2
    move/from16 v14, p1

    goto/16 :goto_4

    .line 112
    :cond_3
    :goto_0
    nop

    .line 113
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->getRotateType()I

    move-result v8

    .line 115
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    iget-object v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    const/4 v3, 0x6

    const v4, 0x7d83f

    move v5, v8

    move v6, v11

    move v7, v12

    invoke-virtual/range {v1 .. v7}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->humanActionDetect([BIIIII)Lcom/sensetime/stmobile/STHumanAction;

    move-result-object v9

    .line 121
    iget-boolean v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    if-eqz v1, :cond_8

    .line 122
    const/4 v1, 0x0

    if-eqz v9, :cond_5

    .line 123
    invoke-virtual {v9}, Lcom/sensetime/stmobile/STHumanAction;->getMobileFaces()[Lcom/sensetime/stmobile/model/STMobile106;

    move-result-object v2

    .line 124
    if-eqz v2, :cond_4

    array-length v3, v2

    if-lez v3, :cond_4

    .line 125
    array-length v1, v2

    new-array v1, v1, [Lcom/sensetime/stmobile/model/STMobile106;

    .line 128
    :cond_4
    move-object v10, v1

    move-object v5, v2

    goto :goto_1

    :cond_5
    move-object v5, v1

    move-object v10, v5

    :goto_1
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    iget-object v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    aget v6, v2, v13

    move/from16 v2, p1

    move v3, v11

    move v4, v12

    move-object v7, v10

    invoke-virtual/range {v1 .. v7}, Lcom/sensetime/stmobile/STBeautifyNative;->processTexture(III[Lcom/sensetime/stmobile/model/STMobile106;I[Lcom/sensetime/stmobile/model/STMobile106;)I

    move-result v1

    .line 130
    if-nez v1, :cond_6

    .line 131
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    aget v1, v1, v13

    goto :goto_2

    .line 133
    :cond_6
    move/from16 v1, p1

    :goto_2
    if-eqz v10, :cond_7

    array-length v2, v10

    if-eqz v2, :cond_7

    if-eqz v9, :cond_7

    .line 134
    invoke-virtual {v9, v10}, Lcom/sensetime/stmobile/STHumanAction;->replaceMobile106([Lcom/sensetime/stmobile/model/STMobile106;)Z

    .line 140
    :cond_7
    move v14, v1

    goto :goto_3

    :cond_8
    move/from16 v14, p1

    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->getFrameBufferCallback()Lcom/android/camera/effect/renders/Render$FrameBufferCallback;

    move-result-object v15

    .line 141
    if-eqz v15, :cond_a

    .line 142
    mul-int v1, v11, v12

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 144
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    const/4 v7, 0x0

    iget-object v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    aget v16, v2, v13

    const/16 v17, 0x6

    .line 146
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v18

    .line 144
    move v2, v14

    move-object v3, v9

    move v4, v8

    move v5, v11

    move v6, v12

    move/from16 v8, v16

    move/from16 v9, v17

    move-object v13, v10

    move-object/from16 v10, v18

    invoke-virtual/range {v1 .. v10}, Lcom/sensetime/stmobile/STMobileStickerNative;->processTextureAndOutputBuffer(ILcom/sensetime/stmobile/STHumanAction;IIIZII[B)I

    move-result v1

    .line 148
    if-nez v1, :cond_9

    .line 149
    invoke-interface {v15, v13, v11, v12}, Lcom/android/camera/effect/renders/Render$FrameBufferCallback;->onFrameBuffer(Ljava/nio/ByteBuffer;II)V

    .line 151
    :cond_9
    goto :goto_4

    .line 153
    :cond_a
    iget-object v1, v0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    const/4 v7, 0x0

    iget-object v2, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v3, 0x0

    aget v10, v2, v3

    move v2, v14

    move-object v3, v9

    move v4, v8

    move v5, v11

    move v6, v12

    move v8, v10

    invoke-virtual/range {v1 .. v8}, Lcom/sensetime/stmobile/STMobileStickerNative;->processTexture(ILcom/sensetime/stmobile/STHumanAction;IIIZI)I

    move-result v1

    .line 159
    :goto_4
    if-nez v1, :cond_b

    .line 160
    iget-object v0, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v1, 0x0

    aget v14, v0, v1

    goto :goto_5

    .line 162
    :cond_b
    sget-object v2, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "processTexture: result="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " outTexId="

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :goto_5
    return v14
.end method


# virtual methods
.method protected drawTexture(IFFFFZ)V
    .locals 7

    .line 85
    iget v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/android/camera/effect/renders/StickerRender;->processTexture(IIII)I

    move-result v1

    .line 86
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-super/range {v0 .. v6}, Lcom/android/camera/effect/renders/PixelEffectRender;->drawTexture(IFFFFZ)V

    .line 88
    return-void
.end method

.method protected drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFFZ)V
    .locals 7

    .line 71
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/ui/BasicTexture;->onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 72
    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "drawTexture: fail to bind texture "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void

    .line 75
    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v1

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    iget v3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    iget v4, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/android/camera/effect/renders/StickerRender;->processTexture(IIII)I

    move-result v1

    .line 77
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-super/range {v0 .. v6}, Lcom/android/camera/effect/renders/PixelEffectRender;->drawTexture(IFFFFZ)V

    .line 79
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->onDestroy()V

    .line 61
    invoke-super {p0}, Lcom/android/camera/effect/renders/PixelEffectRender;->finalize()V

    .line 62
    return-void
.end method

.method public getBeautify()Z
    .locals 1

    .line 195
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    return v0
.end method

.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .line 55
    const-string v0, "uniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord); \n}"

    return-object v0
.end method

.method public getMakeupProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    return-object v0
.end method

.method public setBeautify(Z)V
    .locals 0

    .line 191
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    .line 192
    return-void
.end method

.method public setPreviousFrameBufferInfo(III)V
    .locals 0

    .line 170
    iput p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    .line 171
    iget p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    if-eq p1, p3, :cond_1

    .line 172
    :cond_0
    iput p2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    .line 173
    iput p3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    .line 174
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->destroyGLResource()V

    .line 176
    :cond_1
    return-void
.end method

.method public setSticker(Ljava/lang/String;)V
    .locals 3

    .line 179
    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSticker: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-virtual {v0, p1}, Lcom/sensetime/stmobile/STMobileStickerNative;->changeSticker(Ljava/lang/String;)I

    .line 183
    :cond_0
    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    .line 184
    return-void
.end method
