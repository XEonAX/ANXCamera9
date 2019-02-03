.class public Lcom/android/camera2/autozoom/AutoZoomTracker;
.super Ljava/lang/Object;
.source "AutoZoomTracker.java"


# instance fields
.field private id:I

.field private mBounds:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(ILandroid/graphics/RectF;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput p1, p0, Lcom/android/camera2/autozoom/AutoZoomTracker;->id:I

    .line 11
    iput-object p2, p0, Lcom/android/camera2/autozoom/AutoZoomTracker;->mBounds:Landroid/graphics/RectF;

    .line 12
    return-void
.end method


# virtual methods
.method public getBounds()Landroid/graphics/RectF;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomTracker;->mBounds:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .line 15
    iget v0, p0, Lcom/android/camera2/autozoom/AutoZoomTracker;->id:I

    return v0
.end method
