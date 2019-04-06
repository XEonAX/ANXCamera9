.class public Lcom/android/camera/ui/MimojiEditGLSurfaceView;
.super Landroid/opengl/GLSurfaceView;
.source "MimojiEditGLSurfaceView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;
    }
.end annotation


# static fields
.field public static final GET_SAVE_THUM_END:I = 0x4

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mDeviceRotation:I

.field private final mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;

.field private mHandler:Landroid/os/Handler;

.field private mNeedGetThumbnail:Z

.field private mSaveConfigThum:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;-><init>(Lcom/android/camera/ui/MimojiEditGLSurfaceView;Lcom/android/camera/ui/MimojiEditGLSurfaceView$1;)V

    iput-object p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;

    const/16 p1, 0x5a

    iput p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mDeviceRotation:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mNeedGetThumbnail:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mSaveConfigThum:Z

    const/4 p2, 0x2

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setEGLContextClientVersion(I)V

    iget-object p2, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLSurfaceView$MyEGLConfigChooser;

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    invoke-virtual {p0, p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setRenderMode(I)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    const/4 p2, 0x4

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    invoke-static {}, Lcom/mi/config/b;->it()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    sget p2, Lcom/android/camera/Util;->sWindowHeight:I

    const/16 v0, 0x2d0

    mul-int/2addr p2, v0

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr p2, v1

    invoke-interface {p1, v0, p2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setupAvatar()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getConfigThumbnail()V
    .locals 7

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSelectConfigList()Ljava/util/ArrayList;

    move-result-object v0

    sget-object v1, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->TAG:Ljava/lang/String;

    const-string v2, "start get thumbnail..."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arcsoft/avatar/AvatarConfig$c;

    iget-object v3, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v3, v2}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarConfig$c;)I

    nop

    nop

    const v3, 0x38400

    new-array v3, v3, [B

    iget-object v4, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v5, 0x3c0

    const/16 v6, 0xf0

    invoke-virtual {v4, v3, v6, v6, v5}, Lcom/arcsoft/avatar/AvatarEngine;->a([BIII)I

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v6, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    iput-object v4, v2, Lcom/arcsoft/avatar/AvatarConfig$c;->an:Landroid/graphics/Bitmap;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->updateThumbnail()V

    :cond_1
    return-void
.end method

.method private setupAvatar()V
    .locals 3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->a(ZF)V

    return-void
.end method


# virtual methods
.method public onDeviceRotationChange(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mDeviceRotation:I

    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 7

    const/4 p1, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, p1, p1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->getHeight()I

    move-result v3

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget v1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mDeviceRotation:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->a(IIIIZ[I)V

    iget-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mNeedGetThumbnail:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->getConfigThumbnail()V

    iput-boolean v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mNeedGetThumbnail:Z

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mSaveConfigThum:Z

    if-eqz p1, :cond_1

    iput-boolean v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mSaveConfigThum:Z

    nop

    nop

    const p1, 0x38400

    new-array p1, p1, [B

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v1, 0x3c0

    const/16 v2, 0xf0

    invoke-virtual {v0, p1, v2, v2, v1}, Lcom/arcsoft/avatar/AvatarEngine;->a([BIII)I

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1, p1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    const/4 p1, 0x0

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p1, p1, p1, p2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    return-void
.end method

.method public setNeedGetThumbnail(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mNeedGetThumbnail:Z

    return-void
.end method

.method public setmHandler(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public setmSaveConfigThum(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->mSaveConfigThum:Z

    return-void
.end method
