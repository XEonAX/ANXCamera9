.class public Lcom/android/camera/effect/draw_mode/FillRectAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "FillRectAttribute.java"


# instance fields
.field public mColor:I

.field public mHeight:F

.field public mWidth:F

.field public mX:F

.field public mY:F


# direct methods
.method public constructor <init>(FFFFI)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 12
    iput p1, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mX:F

    .line 13
    iput p2, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mY:F

    .line 14
    iput p3, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mWidth:F

    .line 15
    iput p4, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mHeight:F

    .line 16
    iput p5, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mColor:I

    .line 17
    const/4 p1, 0x4

    iput p1, p0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mTarget:I

    .line 18
    return-void
.end method
