.class Landroid/support/v4/view/MotionEventCompat$HoneycombMr1MotionEventVersionImpl;
.super Landroid/support/v4/view/MotionEventCompat$GingerbreadMotionEventVersionImpl;
.source "MotionEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/MotionEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HoneycombMr1MotionEventVersionImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 135
    invoke-direct {p0}, Landroid/support/v4/view/MotionEventCompat$GingerbreadMotionEventVersionImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getAxisValue(Landroid/view/MotionEvent;I)F
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "axis"    # I

    .line 139
    invoke-static {p1, p2}, Landroid/support/v4/view/MotionEventCompatHoneycombMr1;->getAxisValue(Landroid/view/MotionEvent;I)F

    move-result v0

    return v0
.end method

.method public getAxisValue(Landroid/view/MotionEvent;II)F
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "axis"    # I
    .param p3, "pointerIndex"    # I

    .line 144
    invoke-static {p1, p2, p3}, Landroid/support/v4/view/MotionEventCompatHoneycombMr1;->getAxisValue(Landroid/view/MotionEvent;II)F

    move-result v0

    return v0
.end method
