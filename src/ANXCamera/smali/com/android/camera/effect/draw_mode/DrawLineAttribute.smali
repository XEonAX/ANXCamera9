.class public Lcom/android/camera/effect/draw_mode/DrawLineAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawLineAttribute.java"


# instance fields
.field public mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

.field public mX1:F

.field public mX2:F

.field public mY1:F

.field public mY2:F


# direct methods
.method public constructor <init>(FFFFLcom/android/gallery3d/ui/GLPaint;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 13
    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mX1:F

    .line 14
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mY1:F

    .line 15
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mX2:F

    .line 16
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mY2:F

    .line 17
    iput-object p5, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

    .line 18
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mTarget:I

    .line 19
    return-void
.end method
