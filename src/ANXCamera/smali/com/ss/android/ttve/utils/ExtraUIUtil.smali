.class public Lcom/ss/android/ttve/utils/ExtraUIUtil;
.super Ljava/lang/Object;
.source "ExtraUIUtil.java"


# static fields
.field public static final DEFAULT_SURFACE_SCALE_HEIGHT:F = 16.0f

.field public static final DEFAULT_SURFACE_SCALE_WIDTH:F = 9.0f

.field public static final SURFACE_LOCATION_HEIGHT_INDEX:I = 0x3

.field public static final SURFACE_LOCATION_WIDTH_INDEX:I = 0x2

.field public static final SURFACE_LOCATION_X_INDEX:I = 0x0

.field public static final SURFACE_LOCATION_Y_INDEX:I = 0x1

.field public static final TAG:Ljava/lang/String; = "ExtraUIUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calScreenSurfaceLocation(Landroid/content/Context;IIIII)[F
    .locals 17

    move/from16 v0, p1

    .line 47
    move/from16 v1, p5

    const/16 v2, 0x5a

    if-eq v1, v2, :cond_0

    const/16 v2, 0x10e

    if-eq v1, v2, :cond_0

    .line 53
    nop

    .line 54
    nop

    .line 57
    move/from16 v1, p3

    move/from16 v2, p4

    goto :goto_0

    .line 49
    :cond_0
    nop

    .line 50
    nop

    .line 51
    nop

    .line 57
    move/from16 v2, p3

    move/from16 v1, p4

    :goto_0
    const/4 v3, 0x4

    new-array v4, v3, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v5, v4, v6

    const/4 v7, 0x1

    aput v5, v4, v7

    int-to-float v8, v1

    const/4 v9, 0x2

    aput v8, v4, v9

    int-to-float v10, v2

    const/4 v11, 0x3

    aput v10, v4, v11

    .line 58
    if-nez p0, :cond_1

    .line 59
    const-string v0, "ExtraUIUtil"

    const-string v1, "Context is null while calculating surface location!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    return-object v4

    .line 63
    :cond_1
    const/high16 v12, 0x41800000    # 16.0f

    mul-float v13, v8, v12

    const/high16 v14, 0x41100000    # 9.0f

    mul-float v15, v10, v14

    cmpl-float v13, v13, v15

    const/high16 v15, 0x3f800000    # 1.0f

    if-lez v13, :cond_2

    .line 64
    int-to-float v5, v0

    aput v5, v4, v9

    .line 65
    mul-float/2addr v15, v10

    mul-float/2addr v15, v5

    div-float/2addr v15, v8

    aput v15, v4, v11

    .line 79
    move/from16 v13, p2

    goto :goto_1

    .line 67
    :cond_2
    move/from16 v13, p2

    int-to-float v3, v13

    aput v3, v4, v11

    .line 68
    mul-float/2addr v14, v3

    div-float/2addr v14, v12

    aput v14, v4, v9

    .line 69
    int-to-float v3, v0

    aget v12, v4, v9

    sub-float v12, v3, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v12, v14

    aput v12, v4, v6

    .line 71
    aget v12, v4, v6

    cmpl-float v12, v12, v5

    if-lez v12, :cond_3

    .line 72
    aput v5, v4, v6

    .line 73
    aput v3, v4, v9

    .line 74
    mul-float/2addr v15, v10

    mul-float/2addr v15, v3

    div-float/2addr v15, v8

    aput v15, v4, v11

    .line 79
    :cond_3
    :goto_1
    const-string v3, "ExtraUIUtil"

    const-string v5, "video[%d, %d], max[%d, %d], screen[%d, %d], surface[%f, %f, %f, %f]"

    const/16 v8, 0xa

    new-array v8, v8, [Ljava/lang/Object;

    .line 80
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v7

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v8, v9

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v8, v11

    .line 81
    invoke-static/range {p0 .. p0}, Lcom/ss/android/ttve/utils/UIUtils;->getScreenWidth(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x4

    aput-object v0, v8, v1

    const/4 v0, 0x5

    invoke-static/range {p0 .. p0}, Lcom/ss/android/ttve/utils/UIUtils;->getScreenHeight(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x6

    aget v1, v4, v6

    .line 82
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x7

    aget v1, v4, v7

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v8, v0

    const/16 v0, 0x8

    aget v1, v4, v9

    .line 83
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v8, v0

    const/16 v0, 0x9

    aget v1, v4, v11

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v8, v0

    .line 79
    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-object v4
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .locals 5

    .line 108
    nop

    .line 109
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 110
    return v0

    .line 113
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 114
    const-string v2, "navigation_bar_height"

    const-string v3, "dimen"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 115
    if-lez v1, :cond_1

    .line 116
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 119
    :cond_1
    return v0
.end method

.method public static getRealDisplayHeight(Landroid/content/Context;)I
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 91
    nop

    .line 92
    if-nez p0, :cond_0

    .line 93
    const/4 p0, 0x0

    return p0

    .line 96
    :cond_0
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 98
    :try_start_0
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 99
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 101
    invoke-static {p0}, Lcom/ss/android/ttve/utils/UIUtils;->getScreenHeight(Landroid/content/Context;)I

    move-result v0

    .line 104
    :goto_0
    return v0
.end method
