.class public Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawExtTexAttribute.java"


# instance fields
.field public mEffectPopup:Z

.field public mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

.field public mHeight:I

.field public mTextureTransform:[F

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V
    .locals 1

    .line 14
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 15
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    .line 16
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    .line 17
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    .line 18
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    .line 19
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 20
    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    .line 21
    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    .line 22
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 36
    iput-boolean p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 37
    return-void
.end method


# virtual methods
.method public init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
    .locals 0

    .line 25
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    .line 26
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    .line 27
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    .line 28
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    .line 29
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 30
    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    .line 31
    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    .line 32
    return-object p0
.end method
