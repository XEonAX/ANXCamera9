.class Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;
.super Ljava/lang/Object;
.source "InterpolatorJNI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/extravideo/interpolation/InterpolatorJNI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TypicalMotion"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

.field public x:D

.field public y:D


# direct methods
.method public constructor <init>(Lcom/miui/extravideo/interpolation/InterpolatorJNI;)V
    .locals 2

    .line 27
    iput-object p1, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->this$0:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->x:D

    .line 29
    iput-wide v0, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->y:D

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/miui/extravideo/interpolation/InterpolatorJNI;DD)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->this$0:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-wide p2, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->x:D

    .line 24
    iput-wide p4, p0, Lcom/miui/extravideo/interpolation/InterpolatorJNI$TypicalMotion;->y:D

    .line 25
    return-void
.end method
