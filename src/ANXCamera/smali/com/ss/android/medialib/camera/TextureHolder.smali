.class public Lcom/ss/android/medialib/camera/TextureHolder;
.super Ljava/lang/Object;
.source "TextureHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/camera/TextureHolder$Texture;
    }
.end annotation


# instance fields
.field protected mMPV:[F

.field private mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

.field private onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mMPV:[F

    .line 42
    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-direct {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    return-void
.end method

.method static synthetic access$200(Lcom/ss/android/medialib/camera/TextureHolder;)Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
    .locals 0

    .line 11
    iget-object p0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    return-object p0
.end method


# virtual methods
.method public frameAvailable()V
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mMPV:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 78
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    iget-object v1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 82
    :cond_0
    return-void
.end method

.method public getMPV()[F
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mMPV:[F

    return-object v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    return-object v0
.end method

.method public getSurfaceTextureID()I
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v0

    return v0
.end method

.method public getTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .line 85
    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-direct {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    .line 86
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {}, Lcom/ss/android/medialib/common/Common;->genSurfaceTextureID()I

    move-result v1

    invoke-static {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 87
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    new-instance v1, Landroid/graphics/SurfaceTexture;

    iget-object v2, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v2}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-static {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 89
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    new-instance v1, Lcom/ss/android/medialib/camera/TextureHolder$2;

    invoke-direct {v1, p0}, Lcom/ss/android/medialib/camera/TextureHolder$2;-><init>(Lcom/ss/android/medialib/camera/TextureHolder;)V

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 98
    return-void
.end method

.method public onCreate(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V
    .locals 2

    .line 48
    if-nez p1, :cond_0

    .line 49
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {}, Lcom/ss/android/medialib/common/Common;->genSurfaceTextureID()I

    move-result v0

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 50
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    goto :goto_0

    .line 52
    :cond_0
    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v0

    invoke-static {v0}, Lcom/ss/android/medialib/common/Common;->isTextureID(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 53
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {}, Lcom/ss/android/medialib/common/Common;->genSurfaceTextureID()I

    move-result v0

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 54
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    goto :goto_0

    .line 55
    :cond_1
    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_2

    .line 56
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result p1

    invoke-static {v0, p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 57
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    goto :goto_0

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 60
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 64
    :goto_0
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object p1

    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder$1;

    invoke-direct {v0, p0}, Lcom/ss/android/medialib/camera/TextureHolder$1;-><init>(Lcom/ss/android/medialib/camera/TextureHolder;)V

    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 70
    return-void
.end method

.method public onDestroy(Z)V
    .locals 1

    .line 102
    if-eqz p1, :cond_1

    .line 104
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 105
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 106
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 109
    :cond_0
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result p1

    invoke-static {p1}, Lcom/ss/android/medialib/common/Common;->isTextureID(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 110
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I

    move-result p1

    invoke-static {p1}, Lcom/ss/android/medialib/common/Common;->deleteTextureID(I)V

    .line 111
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I

    .line 114
    :cond_1
    return-void
.end method

.method public setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 45
    return-void
.end method

.method public updateTexImage()V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder;->mTexture:Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 118
    return-void
.end method
