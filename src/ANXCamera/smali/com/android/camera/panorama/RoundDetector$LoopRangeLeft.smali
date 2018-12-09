.class Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;
.super Lcom/android/camera/panorama/RoundDetector$LoopRange;
.source "RoundDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/panorama/RoundDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoopRangeLeft"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/panorama/RoundDetector;


# direct methods
.method public constructor <init>(Lcom/android/camera/panorama/RoundDetector;III)V
    .locals 1

    .line 84
    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->this$0:Lcom/android/camera/panorama/RoundDetector;

    .line 85
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/panorama/RoundDetector$LoopRange;-><init>(Lcom/android/camera/panorama/RoundDetector;III)V

    .line 86
    if-gt p2, p3, :cond_0

    .line 87
    return-void

    .line 90
    :cond_0
    new-instance p1, Landroid/util/Range;

    add-int/lit8 v0, p4, -0x5

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-direct {p1, p2, p4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRange:Landroid/util/Range;

    .line 91
    new-instance p1, Landroid/util/Range;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p4, 0x5

    invoke-static {p4, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRangeSecond:Landroid/util/Range;

    .line 92
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 96
    iget-object v0, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRangeSecond:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    const-string v0, "%s, %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRange:Landroid/util/Range;

    invoke-virtual {v3}, Landroid/util/Range;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;->mRangeSecond:Landroid/util/Range;

    invoke-virtual {v3}, Landroid/util/Range;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
