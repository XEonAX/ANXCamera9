.class public Lcom/ss/android/medialib/camera/TextureHolder$Texture;
.super Ljava/lang/Object;
.source "TextureHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/medialib/camera/TextureHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Texture"
.end annotation


# instance fields
.field private surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private surfaceTextureID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILandroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTextureID:I

    .line 28
    iput-object p2, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 29
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)I
    .locals 0

    .line 13
    iget p0, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTextureID:I

    return p0
.end method

.method static synthetic access$002(Lcom/ss/android/medialib/camera/TextureHolder$Texture;I)I
    .locals 0

    .line 13
    iput p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTextureID:I

    return p1
.end method

.method static synthetic access$100(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method static synthetic access$102(Lcom/ss/android/medialib/camera/TextureHolder$Texture;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p1
.end method


# virtual methods
.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getSurfaceTextureID()I
    .locals 1

    .line 32
    iget v0, p0, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->surfaceTextureID:I

    return v0
.end method
