.class public Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
.source "DrawBlurTexAttribute.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>()V

    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>()V

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V
    .locals 0

    .line 7
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    .line 8
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic init(Lcom/android/gallery3d/ui/BasicTexture;IIII)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 0

    .line 5
    invoke-virtual/range {p0 .. p5}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIII)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZ)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 0

    .line 5
    invoke-virtual/range {p0 .. p6}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZ)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZZ)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 0

    .line 5
    invoke-virtual/range {p0 .. p7}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZZ)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-result-object p1

    return-object p1
.end method

.method public init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
    .locals 0

    .line 19
    invoke-super {p0, p1}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 20
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    .line 21
    return-object p0
.end method

.method public init(Lcom/android/gallery3d/ui/BasicTexture;IIII)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
    .locals 0

    .line 25
    invoke-super/range {p0 .. p5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIII)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 26
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    .line 27
    return-object p0
.end method

.method public init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZ)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
    .locals 0

    .line 32
    invoke-super/range {p0 .. p6}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZ)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 33
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    .line 34
    return-object p0
.end method

.method public init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZZ)Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
    .locals 0

    .line 39
    invoke-super/range {p0 .. p7}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZZ)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 40
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    .line 41
    return-object p0
.end method
