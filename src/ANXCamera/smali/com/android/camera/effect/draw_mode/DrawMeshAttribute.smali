.class public Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawMeshAttribute.java"


# instance fields
.field public mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field public mHeight:F

.field public mIndexBuffer:I

.field public mIndexCount:I

.field public mUVBuffer:I

.field public mWidth:F

.field public mX:F

.field public mXYBuffer:I

.field public mY:F


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;FFIIII)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 18
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mX:F

    .line 19
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mY:F

    .line 20
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mXYBuffer:I

    .line 21
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mUVBuffer:I

    .line 22
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexBuffer:I

    .line 23
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 24
    iput p7, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexCount:I

    .line 25
    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mTarget:I

    .line 26
    return-void
.end method
