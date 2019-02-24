.class public Lcom/android/camera2/autozoom/AutoZoomUtils;
.super Ljava/lang/Object;
.source "AutoZoomUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static dp2px(Landroid/content/Context;F)I
    .locals 0

    .line 112
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 113
    mul-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static fromVidhanceCoordinateSystem(Landroid/graphics/RectF;)V
    .locals 3

    .line 104
    iget v0, p0, Landroid/graphics/RectF;->left:F

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    iget v2, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr v2, v1

    invoke-virtual {p0, v0, v2}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 105
    return-void
.end method

.method public static getDisplayRotation(Landroid/content/Context;)I
    .locals 1

    .line 18
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    .line 19
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result p0

    .line 20
    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_0

    .line 32
    return v0

    .line 28
    :pswitch_0
    const/16 p0, 0x10e

    return p0

    .line 26
    :pswitch_1
    const/16 p0, 0xb4

    return p0

    .line 24
    :pswitch_2
    const/16 p0, 0x5a

    return p0

    .line 22
    :pswitch_3
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static mean(Ljava/util/ArrayList;)J
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)J"
        }
    .end annotation

    .line 92
    nop

    .line 93
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 94
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    int-to-long v3, p0

    div-long/2addr v1, v3

    return-wide v1
.end method

.method public static median(Ljava/util/ArrayList;)F
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 81
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 83
    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 84
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_1

    .line 85
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr p0, v1

    add-float/2addr v0, p0

    return v0

    .line 87
    :cond_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method public static normalizedRectToSize(Landroid/graphics/RectF;Landroid/util/Size;)V
    .locals 4

    .line 108
    iget v0, p0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    iget v2, p0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    iget v3, p0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr v3, p1

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 109
    return-void
.end method

.method public static rotateFromVidhance(Landroid/content/Context;Landroid/graphics/RectF;)V
    .locals 4

    .line 36
    invoke-static {p0}, Lcom/android/camera2/autozoom/AutoZoomUtils;->getDisplayRotation(Landroid/content/Context;)I

    move-result p0

    .line 37
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p0, :cond_3

    const/16 v1, 0x5a

    if-eq p0, v1, :cond_2

    const/16 v1, 0xb4

    if-eq p0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq p0, v1, :cond_0

    goto :goto_0

    .line 50
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->right:F

    sub-float p0, v0, p0

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    sub-float v2, v0, v2

    iget v3, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v3

    invoke-virtual {p1, p0, v1, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 51
    goto :goto_0

    .line 46
    :cond_1
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float p0, v0, p0

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    iget v2, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, p0, v1, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 47
    goto :goto_0

    .line 43
    :cond_2
    goto :goto_0

    .line 39
    :cond_3
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float p0, v0, p0

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    iget v2, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, p0, v1, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 40
    nop

    .line 55
    :goto_0
    return-void
.end method

.method public static rotateToVidhance(Landroid/content/Context;Landroid/graphics/RectF;)V
    .locals 4

    .line 58
    invoke-static {p0}, Lcom/android/camera2/autozoom/AutoZoomUtils;->getDisplayRotation(Landroid/content/Context;)I

    move-result p0

    .line 59
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p0, :cond_3

    const/16 v1, 0x5a

    if-eq p0, v1, :cond_2

    const/16 v1, 0xb4

    if-eq p0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq p0, v1, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->right:F

    sub-float p0, v0, p0

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    sub-float v2, v0, v2

    iget v3, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v3

    invoke-virtual {p1, p0, v1, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 73
    goto :goto_0

    .line 68
    :cond_1
    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    sub-float v1, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    iget v3, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v3

    invoke-virtual {p1, p0, v1, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 69
    goto :goto_0

    .line 65
    :cond_2
    goto :goto_0

    .line 61
    :cond_3
    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    sub-float v1, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    iget v3, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v3

    invoke-virtual {p1, p0, v1, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 62
    nop

    .line 78
    :goto_0
    return-void
.end method

.method public static toVidhanceCoordinateSystem(Landroid/graphics/RectF;)V
    .locals 3

    .line 100
    iget v0, p0, Landroid/graphics/RectF;->left:F

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr v0, v1

    iget v2, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v1

    invoke-virtual {p0, v0, v2}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 101
    return-void
.end method
