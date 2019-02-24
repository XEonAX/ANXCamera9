.class public Lcom/android/camera/effect/VideoRecorderCanvas;
.super Lcom/android/gallery3d/ui/BaseGLCanvas;
.source "VideoRecorderCanvas.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lcom/android/gallery3d/ui/BaseGLCanvas;-><init>()V

    .line 12
    new-instance v0, Lcom/android/camera/effect/renders/RenderGroup;

    invoke-direct {v0, p0}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    .line 13
    new-instance v0, Lcom/android/camera/effect/renders/VideoRecorderRender;

    invoke-direct {v0, p0}, Lcom/android/camera/effect/renders/VideoRecorderRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    .line 14
    invoke-virtual {p0}, Lcom/android/camera/effect/VideoRecorderCanvas;->initialize()V

    .line 15
    return-void
.end method


# virtual methods
.method public applyFilterId(I)V
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    check-cast v0, Lcom/android/camera/effect/renders/VideoRecorderRender;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/VideoRecorderRender;->setFilterId(I)V

    .line 27
    return-void
.end method

.method public deleteProgram()V
    .locals 1

    .line 31
    invoke-super {p0}, Lcom/android/gallery3d/ui/BaseGLCanvas;->deleteProgram()V

    .line 32
    iget-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/RenderGroup;->destroy()V

    .line 33
    iget-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/RenderGroup;->destroy()V

    .line 34
    return-void
.end method

.method public setSize(II)V
    .locals 3

    .line 19
    invoke-super {p0, p1, p2}, Lcom/android/gallery3d/ui/BaseGLCanvas;->setSize(II)V

    .line 20
    const-string v0, "VideoRecorderCanvas"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSize: size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "x"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " modelMatrix="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mState:Lcom/android/camera/effect/GLCanvasState;

    .line 21
    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->getModelMatrix()[F

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->dumpMatrix([F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 20
    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    return-void
.end method
