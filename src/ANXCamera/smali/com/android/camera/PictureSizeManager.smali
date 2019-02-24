.class public Lcom/android/camera/PictureSizeManager;
.super Ljava/lang/Object;
.source "PictureSizeManager.java"


# static fields
.field private static sDefaultValue:Ljava/lang/String;

.field private static final sEntryValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sPictureList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    .line 14
    const-string v0, "4x3"

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 17
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string v1, "4x3"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string v1, "16x9"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    invoke-static {}, Lcom/mi/config/b;->gs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string v1, "18x9"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fh()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 23
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string v1, "19.5x9"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 244
    nop

    .line 245
    nop

    .line 246
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 247
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x3fe28f5c    # 1.77f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 248
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    .line 249
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 250
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 253
    :cond_0
    goto :goto_0

    .line 254
    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 258
    nop

    .line 259
    nop

    .line 260
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 261
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 262
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    .line 263
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 264
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 267
    :cond_0
    goto :goto_0

    .line 268
    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 272
    nop

    .line 273
    nop

    .line 274
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 275
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x400a3d71    # 2.16f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 276
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    .line 277
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 278
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 281
    :cond_0
    goto :goto_0

    .line 282
    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 230
    nop

    .line 231
    nop

    .line 232
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 233
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 234
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    .line 235
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 236
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 239
    :cond_0
    goto :goto_0

    .line 240
    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 216
    nop

    .line 217
    nop

    .line 218
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 219
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x3faa3d71    # 1.33f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 220
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    .line 221
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 222
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 225
    :cond_0
    goto :goto_0

    .line 226
    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method public static getBestPanoPictureSize()Lcom/android/camera/CameraSize;
    .locals 4

    .line 129
    nop

    .line 130
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 132
    :cond_0
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio18_9(II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 133
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 134
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 135
    :cond_1
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 138
    :cond_2
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 141
    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 142
    :cond_4
    new-instance v0, Lcom/android/camera/CameraSize;

    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    .line 143
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    sget-object v3, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    .line 144
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 146
    :cond_5
    return-object v0
.end method

.method public static getBestPictureSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 101
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public static getBestPictureSize(F)Lcom/android/camera/CameraSize;
    .locals 5

    .line 78
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    if-eqz v0, :cond_8

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 81
    :cond_0
    const/4 v0, 0x0

    .line 82
    const v1, 0x3fe28f5c    # 1.77f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    const-wide v3, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v1, v1, v3

    if-gez v1, :cond_1

    .line 83
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_1
    const v1, 0x3faa3d71    # 1.33f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_2

    .line 85
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 86
    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_3

    .line 87
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 88
    :cond_3
    const/high16 v1, 0x40000000    # 2.0f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_4

    .line 89
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 90
    :cond_4
    const v1, 0x400a3d71    # 2.16f

    sub-float/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    float-to-double v1, p0

    cmpg-double p0, v1, v3

    if-gez p0, :cond_5

    .line 91
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 94
    :cond_5
    :goto_0
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_7

    .line 95
    :cond_6
    new-instance v0, Lcom/android/camera/CameraSize;

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera/CameraSize;

    iget p0, p0, Lcom/android/camera/CameraSize;->width:I

    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v0, p0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 97
    :cond_7
    return-object v0

    .line 79
    :cond_8
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    return-object p0
.end method

.method public static getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 105
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 108
    :cond_0
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getPictureSizeRatioString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getRatio(Ljava/lang/String;)F

    move-result v0

    .line 109
    const/4 v1, 0x0

    .line 110
    const v2, 0x3fe28f5c    # 1.77f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    const-wide v4, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v2, v2, v4

    if-gez v2, :cond_1

    .line 111
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    .line 112
    :cond_1
    const v2, 0x3faa3d71    # 1.33f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_2

    .line 113
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    .line 114
    :cond_2
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_3

    .line 115
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    .line 116
    :cond_3
    const/high16 v2, 0x40000000    # 2.0f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_4

    .line 117
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    .line 118
    :cond_4
    const v2, 0x400a3d71    # 2.16f

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v2, v0

    cmpg-double v0, v2, v4

    if-gez v0, :cond_5

    .line 119
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 122
    :cond_5
    :goto_0
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 123
    :cond_6
    new-instance v1, Lcom/android/camera/CameraSize;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera/CameraSize;

    iget p0, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v1, v2, p0}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 125
    :cond_7
    return-object v1

    .line 106
    :cond_8
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    return-object p0
.end method

.method public static getBestSquareSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 197
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 201
    :cond_0
    nop

    .line 202
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    .line 203
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 204
    goto :goto_0

    .line 207
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 208
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    .line 210
    :cond_2
    goto :goto_0

    .line 212
    :cond_3
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    return-object p0

    .line 198
    :cond_4
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    return-object p0
.end method

.method public static getDefaultValue()Ljava/lang/String;
    .locals 1

    .line 62
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public static getEntries()[Ljava/lang/String;
    .locals 7

    .line 28
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    const v1, 0x7f090047

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fB()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    new-array v0, v3, [Ljava/lang/String;

    .line 30
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 29
    return-object v0

    .line 32
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->gs()Z

    move-result v0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const v6, 0x7f090048

    if-eqz v0, :cond_1

    .line 33
    new-array v0, v4, [Ljava/lang/String;

    .line 34
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 35
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f090049

    .line 36
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    .line 33
    return-object v0

    .line 38
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fh()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 39
    new-array v0, v4, [Ljava/lang/String;

    .line 40
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 41
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f09004a

    .line 42
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    .line 39
    return-object v0

    .line 45
    :cond_2
    new-array v0, v5, [Ljava/lang/String;

    .line 46
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 47
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    .line 45
    return-object v0
.end method

.method public static getEntryValues()[Ljava/lang/String;
    .locals 2

    .line 53
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fB()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    const-string v0, "4x3"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 56
    :cond_0
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 57
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 58
    return-object v0
.end method

.method public static getPictureSizeRatioString()Ljava/lang/String;
    .locals 1

    .line 66
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUnsolicited4X3Ratio()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const-string v0, "4x3"

    return-object v0

    .line 69
    :cond_0
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getPictureSizeRatioString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserPictureSizeRatioString()Ljava/lang/String;
    .locals 1

    .line 74
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getPictureSizeRatioString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static initSensorRatio(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)V"
        }
    .end annotation

    .line 287
    sget-boolean v0, Lcom/mi/config/b;->qj:Z

    if-nez v0, :cond_4

    sget-boolean v0, Lcom/mi/config/b;->qq:Z

    if-eqz v0, :cond_0

    goto :goto_2

    .line 292
    :cond_0
    const/4 v0, -0x1

    .line 293
    nop

    .line 294
    new-instance v1, Lcom/android/camera/CameraSize;

    invoke-direct {v1}, Lcom/android/camera/CameraSize;-><init>()V

    .line 295
    const/4 v2, 0x0

    move v3, v0

    move v0, v2

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 296
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v4}, Lcom/android/camera/CameraSize;->parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;

    .line 297
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 298
    nop

    .line 299
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->area()I

    move-result v0

    .line 295
    move v3, v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 302
    :cond_2
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera/CameraSize;

    invoke-virtual {v1, p0}, Lcom/android/camera/CameraSize;->parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;

    .line 303
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result p0

    const v0, 0x3faa3d71    # 1.33f

    sub-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    float-to-double v0, p0

    const-wide v2, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, v0, v2

    if-gez p0, :cond_3

    .line 304
    const-string p0, "4x3"

    sput-object p0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    goto :goto_1

    .line 306
    :cond_3
    const-string p0, "16x9"

    sput-object p0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 308
    :goto_1
    return-void

    .line 288
    :cond_4
    :goto_2
    const-string p0, "16x9"

    sput-object p0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 289
    return-void
.end method

.method public static initialize(Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;I)V"
        }
    .end annotation

    .line 150
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 151
    if-eqz p0, :cond_9

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_9

    .line 154
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->initSensorRatio(Ljava/util/List;)V

    .line 156
    if-eqz p1, :cond_2

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 158
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    .line 159
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->area()I

    move-result v2

    if-gt v2, p1, :cond_0

    .line 160
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_0
    goto :goto_0

    .line 163
    :cond_1
    nop

    .line 166
    move-object p0, v0

    :cond_2
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    .line 167
    if-eqz p1, :cond_3

    .line 168
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_3
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    .line 172
    if-eqz p1, :cond_4

    .line 173
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    :cond_4
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    .line 177
    if-eqz p1, :cond_5

    .line 178
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    :cond_5
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    .line 182
    if-eqz p1, :cond_6

    .line 183
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    :cond_6
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p0

    .line 187
    if-eqz p0, :cond_7

    .line 188
    sget-object p1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    :cond_7
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-eqz p0, :cond_8

    .line 194
    return-void

    .line 192
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Not find the desire picture sizes!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 152
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The supported picture size list return from hal is null!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
