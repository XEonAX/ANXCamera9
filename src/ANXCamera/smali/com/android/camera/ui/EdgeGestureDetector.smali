.class public Lcom/android/camera/ui/EdgeGestureDetector;
.super Ljava/lang/Object;
.source "EdgeGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;,
        Lcom/android/camera/ui/EdgeGestureDetector$PointerState;,
        Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "EdgeGestureDetector"


# instance fields
.field private final TAP_TIMEOUT:I

.field private final TAP_TO_TOUCH_TIME:I

.field private final TOUCH_SLOP_SQUARE:I

.field private mCurDown:Z

.field private mCurNumPointers:I

.field private mEdgeGestureListener:Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;

.field private mLastTapEvent:J

.field private mMaxNumPointers:I

.field private final mPointers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/ui/EdgeGestureDetector$PointerState;",
            ">;"
        }
    .end annotation
.end field

.field private mPrintCoords:Z

.field private final mTempCoords:Landroid/view/MotionEvent$PointerCoords;

.field private final mText:Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;)V
    .locals 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string v0, "edgetouch_slop_quare"

    const v1, 0x4285570a    # 66.67f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    mul-int/2addr v2, v1

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TOUCH_SLOP_SQUARE:I

    .line 18
    const-string v0, "tap_timeout"

    const/16 v1, 0x190

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TAP_TIMEOUT:I

    .line 19
    const-string v0, "tap_to_touch_min_time"

    const/16 v1, 0x64

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TAP_TO_TOUCH_TIME:I

    .line 24
    new-instance v0, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v0}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mTempCoords:Landroid/view/MotionEvent$PointerCoords;

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mPrintCoords:Z

    .line 26
    new-instance v0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    invoke-direct {v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mText:Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    .line 31
    iput-object p1, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mEdgeGestureListener:Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;

    .line 32
    return-void
.end method

.method private detectMoving(FFLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V
    .locals 6

    .line 35
    invoke-static {p3}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$000(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-static {p3}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$100(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)F

    move-result v0

    sub-float v0, p1, v0

    float-to-int v0, v0

    .line 37
    invoke-static {p3}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$200(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)F

    move-result v1

    sub-float v1, p2, v1

    float-to-int v1, v1

    .line 38
    mul-int/2addr v0, v0

    mul-int/2addr v1, v1

    add-int/2addr v0, v1

    .line 39
    iget v1, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TOUCH_SLOP_SQUARE:I

    if-le v0, v1, :cond_1

    .line 40
    const-string v1, "EdgeGestureDetector"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "detectMoving success currentX=%f currentY=%f distance=%d ps=%s TOUCH_SLOP_SQUARE=%d"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 42
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v4, v5

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v4, p2

    const/4 p1, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, p1

    const/4 p1, 0x3

    aput-object p3, v4, p1

    const/4 p1, 0x4

    iget v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TOUCH_SLOP_SQUARE:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, p1

    .line 41
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 40
    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-static {p3, p2}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$002(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 45
    :cond_1
    return-void
.end method

.method private detectTap(FFJLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V
    .locals 7

    .line 54
    const-string v0, "EdgeGestureDetector"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "detectTap currentX=%f currentY=%f upTime=%d ps=%s TAP_TIMEOUT=%d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    .line 57
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    const/4 v4, 0x3

    aput-object p5, v3, v4

    iget v4, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TAP_TIMEOUT:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    .line 55
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-static {p5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$300(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$000(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$400(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-static {p5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$500(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)J

    move-result-wide v3

    iget p5, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TAP_TIMEOUT:I

    int-to-long v5, p5

    move-wide v1, p3

    invoke-static/range {v1 .. v6}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p5

    if-nez p5, :cond_0

    .line 60
    const-string p5, "EdgeGestureDetector"

    const-string v0, "detectTap sucess"

    invoke-static {p5, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object p5, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mEdgeGestureListener:Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-interface {p5, p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;->onEdgeTap(II)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 62
    iput-wide p3, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mLastTapEvent:J

    .line 65
    :cond_0
    return-void
.end method

.method private detectTouch(FFJLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V
    .locals 7

    .line 68
    const-string v0, "EdgeGestureDetector"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "detectTouch currentX=%f currentY=%f ps=%s eventTime=%d mLastTapEvent=%d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    .line 71
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    aput-object p5, v3, v4

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget-wide v4, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mLastTapEvent:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    .line 69
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-static {p5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$400(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v3, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mLastTapEvent:J

    iget v0, p0, Lcom/android/camera/ui/EdgeGestureDetector;->TAP_TO_TOUCH_TIME:I

    int-to-long v5, v0

    move-wide v1, p3

    invoke-static/range {v1 .. v6}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 73
    iget-object p3, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mEdgeGestureListener:Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-interface {p3, p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;->onEdgeTouch(II)Z

    move-result p1

    invoke-static {p5, p1}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$302(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 75
    :cond_0
    return-void
.end method

.method private logCoords(Ljava/lang/String;IILandroid/view/MotionEvent$PointerCoords;ILandroid/view/MotionEvent;)V
    .locals 8

    .line 181
    invoke-virtual {p6, p3}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v0

    .line 182
    invoke-virtual {p6}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v1

    .line 184
    and-int/lit16 v2, p2, 0xff

    const v3, 0xff00

    packed-switch v2, :pswitch_data_0

    .line 229
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 223
    :pswitch_0
    const-string p2, "HOVER EXIT"

    .line 224
    goto :goto_0

    .line 220
    :pswitch_1
    const-string p2, "HOVER ENTER"

    .line 221
    goto :goto_0

    .line 226
    :pswitch_2
    const-string p2, "SCROLL"

    .line 227
    goto :goto_0

    .line 217
    :pswitch_3
    const-string p2, "HOVER MOVE"

    .line 218
    goto :goto_0

    .line 209
    :pswitch_4
    and-int/2addr p2, v3

    shr-int/lit8 p2, p2, 0x8

    if-ne p3, p2, :cond_0

    .line 211
    const-string p2, "UP"

    goto :goto_0

    .line 213
    :cond_0
    const-string p2, "MOVE"

    .line 215
    goto :goto_0

    .line 201
    :pswitch_5
    and-int/2addr p2, v3

    shr-int/lit8 p2, p2, 0x8

    if-ne p3, p2, :cond_1

    .line 203
    const-string p2, "DOWN"

    goto :goto_0

    .line 205
    :cond_1
    const-string p2, "MOVE"

    .line 207
    goto :goto_0

    .line 198
    :pswitch_6
    const-string p2, "OUTSIDE"

    .line 199
    goto :goto_0

    .line 195
    :pswitch_7
    const-string p2, "CANCEL"

    .line 196
    goto :goto_0

    .line 192
    :pswitch_8
    const-string p2, "MOVE"

    .line 193
    goto :goto_0

    .line 189
    :pswitch_9
    const-string p2, "UP"

    .line 190
    goto :goto_0

    .line 186
    :pswitch_a
    const-string p2, "DOWN"

    .line 187
    nop

    .line 233
    :goto_0
    const-string p3, "EdgeGestureDetector"

    iget-object v2, p0, Lcom/android/camera/ui/EdgeGestureDetector;->mText:Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    invoke-virtual {v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->clear()Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object v2

    .line 234
    invoke-virtual {v2, p1}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string v2, " id "

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/4 v2, 0x1

    add-int/2addr p5, v2

    invoke-virtual {p1, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(I)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p5, ": "

    .line 235
    invoke-virtual {p1, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    .line 236
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " ("

    .line 237
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->x:F

    const/4 p5, 0x3

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ", "

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->y:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ") Pressure="

    .line 238
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " Size="

    .line 239
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->size:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " TouchMajor="

    .line 240
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->touchMajor:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " TouchMinor="

    .line 241
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->touchMinor:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " ToolMajor="

    .line 242
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->toolMajor:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " ToolMinor="

    .line 243
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->toolMinor:F

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " Orientation="

    .line 244
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    iget p2, p4, Landroid/view/MotionEvent$PointerCoords;->orientation:F

    const/high16 v3, 0x43340000    # 180.0f

    mul-float/2addr p2, v3

    float-to-double v4, p2

    const-wide v6, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v4, v6

    double-to-float p2, v4

    invoke-virtual {p1, p2, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, "deg"

    .line 245
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " Tilt="

    .line 246
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x19

    .line 247
    invoke-virtual {p4, p2}, Landroid/view/MotionEvent$PointerCoords;->getAxisValue(I)F

    move-result p2

    mul-float/2addr p2, v3

    float-to-double v3, p2

    div-double/2addr v3, v6

    double-to-float p2, v3

    .line 246
    invoke-virtual {p1, p2, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, "deg"

    .line 248
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " Distance="

    .line 249
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x18

    invoke-virtual {p4, p2}, Landroid/view/MotionEvent$PointerCoords;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " VScroll="

    .line 250
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x9

    invoke-virtual {p4, p2}, Landroid/view/MotionEvent$PointerCoords;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " HScroll="

    .line 251
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0xa

    invoke-virtual {p4, p2}, Landroid/view/MotionEvent$PointerCoords;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " BoundingBox=[("

    .line 252
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x20

    .line 253
    invoke-virtual {p6, p2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ", "

    .line 254
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x21

    invoke-virtual {p6, p2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ", ("

    .line 255
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x22

    invoke-virtual {p6, p2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ", "

    .line 256
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const/16 p2, 0x23

    invoke-virtual {p6, p2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p2

    invoke-virtual {p1, p2, p5}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, ")]"

    .line 257
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " ToolType="

    .line 258
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    invoke-static {v0}, Landroid/view/MotionEvent;->toolTypeToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    const-string p2, " ButtonState="

    .line 259
    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    invoke-static {v1}, Landroid/view/MotionEvent;->buttonStateToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    .line 260
    invoke-virtual {p1}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 233
    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 22

    move-object/from16 v7, p0

    .line 78
    move-object/from16 v8, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v9

    .line 79
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 81
    const/4 v11, 0x2

    const v12, 0xff00

    const/4 v13, 0x6

    const/4 v14, 0x5

    const/4 v15, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    if-eqz v9, :cond_1

    and-int/lit16 v1, v9, 0xff

    if-ne v1, v14, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    move v10, v5

    goto/16 :goto_3

    .line 83
    :cond_1
    :goto_0
    and-int v1, v9, v12

    shr-int/lit8 v3, v1, 0x8

    .line 85
    if-nez v9, :cond_3

    .line 86
    move v1, v5

    :goto_1
    if-ge v1, v0, :cond_2

    .line 87
    iget-object v2, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    .line 88
    invoke-static {v2, v5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$402(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 86
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 90
    :cond_2
    iput-boolean v6, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurDown:Z

    .line 91
    iput v5, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    .line 92
    iput v5, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mMaxNumPointers:I

    .line 95
    :cond_3
    iget v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    add-int/2addr v1, v6

    iput v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    .line 96
    iget v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mMaxNumPointers:I

    iget v2, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    if-ge v1, v2, :cond_4

    .line 97
    iget v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    iput v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mMaxNumPointers:I

    .line 100
    :cond_4
    invoke-virtual {v8, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 101
    :goto_2
    if-gt v0, v4, :cond_5

    .line 102
    new-instance v1, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    invoke-direct {v1}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;-><init>()V

    .line 103
    iget-object v2, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    add-int/lit8 v0, v0, 0x1

    .line 105
    goto :goto_2

    .line 107
    :cond_5
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    .line 108
    invoke-static {v2, v6}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$402(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 109
    invoke-static {v2, v5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$002(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 110
    invoke-static {v2, v5}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$302(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 111
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-static {v2, v0, v1}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$502(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;J)J

    .line 112
    invoke-virtual {v8, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-static {v2, v0}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$102(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;F)F

    .line 113
    invoke-virtual {v8, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-static {v2, v0}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$202(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;F)F

    .line 114
    invoke-virtual {v8, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {v8, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v16

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v17

    move-object v0, v7

    move-object/from16 v19, v2

    move/from16 v2, v16

    move v12, v3

    move v14, v4

    move-wide/from16 v3, v17

    move v10, v5

    move-object/from16 v5, v19

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/EdgeGestureDetector;->detectTouch(FFJLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V

    .line 115
    const-string v0, "EdgeGestureDetector"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "new TouchDown event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d"

    new-array v3, v13, [Ljava/lang/Object;

    aput-object v19, v3, v10

    iget v4, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mMaxNumPointers:I

    .line 118
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    iget v4, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v11

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v15

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x5

    aput-object v4, v3, v5

    .line 116
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 115
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :goto_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v12

    .line 122
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v14

    .line 123
    move v5, v10

    :goto_4
    const/16 v16, 0x0

    if-ge v5, v14, :cond_c

    .line 124
    move v4, v10

    :goto_5
    if-ge v4, v12, :cond_b

    .line 125
    invoke-virtual {v8, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 126
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v3, v0, :cond_6

    .line 124
    move/from16 v18, v4

    move/from16 v19, v5

    move v10, v6

    goto :goto_a

    .line 127
    :cond_6
    iget-boolean v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurDown:Z

    if-eqz v0, :cond_7

    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    .line 128
    move-object v2, v0

    goto :goto_6

    .line 127
    :cond_7
    nop

    .line 128
    move-object/from16 v2, v16

    :goto_6
    if-eqz v2, :cond_8

    invoke-static {v2}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$600(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Landroid/view/MotionEvent$PointerCoords;

    move-result-object v0

    .line 129
    :goto_7
    move-object v1, v0

    goto :goto_8

    .line 128
    :cond_8
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mTempCoords:Landroid/view/MotionEvent$PointerCoords;

    goto :goto_7

    .line 129
    :goto_8
    invoke-virtual {v8, v4, v5, v1}, Landroid/view/MotionEvent;->getHistoricalPointerCoords(IILandroid/view/MotionEvent$PointerCoords;)V

    .line 130
    iget-boolean v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPrintCoords:Z

    if-eqz v0, :cond_9

    .line 131
    const-string v17, "Pointer"

    move-object v0, v7

    move-object/from16 v20, v1

    move-object/from16 v1, v17

    move-object v11, v2

    move v2, v9

    move/from16 v17, v3

    move v3, v4

    move/from16 v18, v4

    move-object/from16 v4, v20

    move/from16 v19, v5

    move/from16 v5, v17

    move v10, v6

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/ui/EdgeGestureDetector;->logCoords(Ljava/lang/String;IILandroid/view/MotionEvent$PointerCoords;ILandroid/view/MotionEvent;)V

    goto :goto_9

    .line 133
    :cond_9
    move-object/from16 v20, v1

    move-object v11, v2

    move/from16 v18, v4

    move/from16 v19, v5

    move v10, v6

    :goto_9
    if-eqz v11, :cond_a

    .line 134
    move-object/from16 v0, v20

    iget v1, v0, Landroid/view/MotionEvent$PointerCoords;->x:F

    iget v0, v0, Landroid/view/MotionEvent$PointerCoords;->y:F

    invoke-direct {v7, v1, v0, v11}, Lcom/android/camera/ui/EdgeGestureDetector;->detectMoving(FFLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V

    .line 124
    :cond_a
    :goto_a
    add-int/lit8 v4, v18, 0x1

    move v6, v10

    move/from16 v5, v19

    const/4 v10, 0x0

    const/4 v11, 0x2

    goto :goto_5

    .line 123
    :cond_b
    move/from16 v19, v5

    move v10, v6

    add-int/lit8 v5, v19, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x2

    goto :goto_4

    .line 138
    :cond_c
    move v10, v6

    const/4 v11, 0x0

    :goto_b
    if-ge v11, v12, :cond_12

    .line 139
    invoke-virtual {v8, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 140
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v5, v0, :cond_d

    goto :goto_10

    .line 141
    :cond_d
    iget-boolean v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurDown:Z

    if-eqz v0, :cond_e

    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    .line 142
    move-object v14, v0

    goto :goto_c

    .line 141
    :cond_e
    nop

    .line 142
    move-object/from16 v14, v16

    :goto_c
    if-eqz v14, :cond_f

    invoke-static {v14}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$600(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;)Landroid/view/MotionEvent$PointerCoords;

    move-result-object v0

    .line 143
    :goto_d
    move-object v6, v0

    goto :goto_e

    .line 142
    :cond_f
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mTempCoords:Landroid/view/MotionEvent$PointerCoords;

    goto :goto_d

    .line 143
    :goto_e
    invoke-virtual {v8, v11, v6}, Landroid/view/MotionEvent;->getPointerCoords(ILandroid/view/MotionEvent$PointerCoords;)V

    .line 144
    iget-boolean v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPrintCoords:Z

    if-eqz v0, :cond_10

    .line 145
    const-string v1, "Pointer"

    move-object v0, v7

    move v2, v9

    move v3, v11

    move-object v4, v6

    move-object v13, v6

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/ui/EdgeGestureDetector;->logCoords(Ljava/lang/String;IILandroid/view/MotionEvent$PointerCoords;ILandroid/view/MotionEvent;)V

    goto :goto_f

    .line 147
    :cond_10
    move-object v13, v6

    :goto_f
    if-eqz v14, :cond_11

    .line 148
    iget v0, v13, Landroid/view/MotionEvent$PointerCoords;->x:F

    iget v1, v13, Landroid/view/MotionEvent$PointerCoords;->y:F

    invoke-direct {v7, v0, v1, v14}, Lcom/android/camera/ui/EdgeGestureDetector;->detectMoving(FFLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V

    .line 138
    :cond_11
    :goto_10
    add-int/lit8 v11, v11, 0x1

    const/4 v13, 0x6

    goto :goto_b

    .line 152
    :cond_12
    if-eq v9, v10, :cond_13

    if-eq v9, v15, :cond_13

    and-int/lit16 v0, v9, 0xff

    const/4 v1, 0x6

    if-ne v0, v1, :cond_17

    .line 155
    :cond_13
    const v0, 0xff00

    and-int/2addr v0, v9

    shr-int/lit8 v0, v0, 0x8

    .line 158
    invoke-virtual {v8, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 159
    iget-object v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v6, v1, :cond_14

    .line 160
    iget-object v1, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;

    .line 161
    const-string v1, "EdgeGestureDetector"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "new TouchUp event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d"

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v11, v4, v5

    iget v5, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mMaxNumPointers:I

    .line 164
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v10

    iget v5, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v12, 0x2

    aput-object v5, v4, v12

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v15

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v12, 0x4

    aput-object v5, v4, v12

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v12, 0x5

    aput-object v5, v4, v12

    .line 162
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 161
    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-virtual {v8, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {v8, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    move-object v0, v7

    move-object v5, v11

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/EdgeGestureDetector;->detectTap(FFJLcom/android/camera/ui/EdgeGestureDetector$PointerState;)V

    .line 166
    const/4 v0, 0x0

    invoke-static {v11, v0}, Lcom/android/camera/ui/EdgeGestureDetector$PointerState;->access$402(Lcom/android/camera/ui/EdgeGestureDetector$PointerState;Z)Z

    .line 169
    :cond_14
    if-eq v9, v10, :cond_16

    if-ne v9, v15, :cond_15

    goto :goto_11

    .line 173
    :cond_15
    iget-object v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mPointers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_17

    .line 174
    iget v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    sub-int/2addr v0, v10

    iput v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    goto :goto_12

    .line 171
    :cond_16
    :goto_11
    const/4 v0, 0x0

    iput-boolean v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurDown:Z

    .line 172
    iput v0, v7, Lcom/android/camera/ui/EdgeGestureDetector;->mCurNumPointers:I

    .line 177
    :cond_17
    :goto_12
    return-void
.end method
