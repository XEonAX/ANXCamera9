.class public Lcom/ss/android/ttve/common/TEEglStateSaver;
.super Ljava/lang/Object;
.source "TEEglStateSaver.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "TEEglStateSaver"


# instance fields
.field private mSavedContext:Landroid/opengl/EGLContext;

.field private mSavedDisplay:Landroid/opengl/EGLDisplay;

.field private mSavedDrawSurface:Landroid/opengl/EGLSurface;

.field private mSavedReadSurface:Landroid/opengl/EGLSurface;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    .line 22
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    .line 23
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    .line 24
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    return-void
.end method


# virtual methods
.method public getSavedEGLContext()Landroid/opengl/EGLContext;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    return-object v0
.end method

.method public logState()V
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved context DOES NOT equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 61
    :cond_0
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved context DOES equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    const/16 v1, 0x305a

    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 64
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved read surface is EGL_NO_SURFACE"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 67
    :cond_1
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved read surface DOES NOT equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 69
    :cond_2
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved read surface DOES equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    :goto_1
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    const/16 v1, 0x3059

    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 72
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 73
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved draw surface is EGL_NO_SURFACE"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 75
    :cond_3
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved draw surface DOES NOT equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 77
    :cond_4
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved draw surface DOES equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    :goto_2
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 80
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved display DOES NOT equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 82
    :cond_5
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved display DOES equal current."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :goto_3
    return-void
.end method

.method public makeNothingCurrent()V
    .locals 4

    .line 54
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 55
    return-void
.end method

.method public makeSavedStateCurrent()V
    .locals 4

    .line 50
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    iget-object v2, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    iget-object v3, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 51
    return-void
.end method

.method public saveEGLState()V
    .locals 2

    .line 27
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    .line 28
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedContext:Landroid/opengl/EGLContext;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved EGL_NO_CONTEXT"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :cond_0
    const/16 v0, 0x305a

    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    .line 32
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedReadSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved EGL_NO_SURFACE"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :cond_1
    const/16 v0, 0x3059

    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    .line 36
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDrawSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 37
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved EGL_NO_SURFACE"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    .line 41
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEEglStateSaver;->mSavedDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    invoke-virtual {v0, v1}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 42
    const-string v0, "TEEglStateSaver"

    const-string v1, "Saved EGL_NO_DISPLAY"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :cond_3
    return-void
.end method
