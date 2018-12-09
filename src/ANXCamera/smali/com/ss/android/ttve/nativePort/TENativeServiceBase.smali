.class public Lcom/ss/android/ttve/nativePort/TENativeServiceBase;
.super Ljava/lang/Object;
.source "TENativeServiceBase.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field protected mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

.field protected mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

.field protected mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    .line 13
    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    .line 14
    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-void
.end method


# virtual methods
.method public getErrorListener()Lcom/ss/android/ttve/common/TECommonCallback;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-object v0
.end method

.method public getInfoListener()Lcom/ss/android/ttve/common/TECommonCallback;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-object v0
.end method

.method public getOpenGLListeners()Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    return-object v0
.end method

.method public nativeCallback_onErrorListener(IIFLjava/lang/String;)V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/common/TECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 77
    :cond_0
    return-void
.end method

.method public nativeCallback_onInfoListener(IIF)V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/ss/android/ttve/common/TECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 83
    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLCreate(I)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLCreate(I)I

    .line 47
    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDestroy(I)V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDestroy(I)I

    .line 65
    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDrawAfter(ID)V
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDrawAfter(ID)I

    .line 59
    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDrawBefore(ID)V
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDrawBefore(ID)I

    .line 53
    :cond_0
    return-void
.end method

.method public nativeCallback_onPreviewSurface(I)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onPreviewSurface(I)I

    .line 71
    :cond_0
    return-void
.end method

.method public setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    .line 18
    return-void
.end method

.method public setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    .line 22
    return-void
.end method

.method public setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    .line 34
    return-void
.end method
