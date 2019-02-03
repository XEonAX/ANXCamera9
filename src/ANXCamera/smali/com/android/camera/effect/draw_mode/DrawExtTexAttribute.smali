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

    .line 14
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 15
    const/16 v0, 0x8

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 23
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    .line 24
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    .line 25
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    .line 26
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    .line 27
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 28
    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    .line 29
    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    .line 30
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 19
    iput-boolean p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    .line 20
    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    .line 21
    return-void
.end method


# virtual methods
.method public init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
    .locals 0

    .line 33
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    .line 34
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    .line 35
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    .line 36
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    .line 37
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 38
    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    .line 39
    return-object p0
.end method
