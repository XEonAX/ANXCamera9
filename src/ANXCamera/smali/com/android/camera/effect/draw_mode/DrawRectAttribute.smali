.class public Lcom/android/camera/effect/draw_mode/DrawRectAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawRectAttribute.java"


# instance fields
.field public mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

.field public mHeight:F

.field public mWidth:F

.field public mX:F

.field public mY:F


# direct methods
.method public constructor <init>(FFFFLcom/android/gallery3d/ui/GLPaint;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 13
    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mX:F

    .line 14
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mY:F

    .line 15
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mWidth:F

    .line 16
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mHeight:F

    .line 17
    iput-object p5, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

    .line 18
    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mTarget:I

    .line 19
    return-void
.end method
