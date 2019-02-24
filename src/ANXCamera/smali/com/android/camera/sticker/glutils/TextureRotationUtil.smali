.class public Lcom/android/camera/sticker/glutils/TextureRotationUtil;
.super Ljava/lang/Object;
.source "TextureRotationUtil.java"


# static fields
.field public static final CUBE:[F

.field public static final TEXTURE_NO_ROTATION:[F

.field public static final TEXTURE_ROTATED_180:[F

.field public static final TEXTURE_ROTATED_270:[F

.field public static final TEXTURE_ROTATED_90:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 20
    const/16 v0, 0x8

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_NO_ROTATION:[F

    .line 27
    new-array v1, v0, [F

    fill-array-data v1, :array_1

    sput-object v1, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_90:[F

    .line 33
    new-array v1, v0, [F

    fill-array-data v1, :array_2

    sput-object v1, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_180:[F

    .line 39
    new-array v1, v0, [F

    fill-array-data v1, :array_3

    sput-object v1, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_270:[F

    .line 46
    new-array v0, v0, [F

    fill-array-data v0, :array_4

    sput-object v0, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->CUBE:[F

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method

.method private static flip(F)F
    .locals 1

    .line 97
    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-nez p0, :cond_0

    .line 98
    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    .line 100
    :cond_0
    return v0
.end method

.method public static getRotation(IZZ)[F
    .locals 10

    .line 60
    const/16 v0, 0x5a

    if-eq p0, v0, :cond_2

    const/16 v0, 0xb4

    if-eq p0, v0, :cond_1

    const/16 v0, 0x10e

    if-eq p0, v0, :cond_0

    .line 73
    sget-object p0, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_NO_ROTATION:[F

    goto :goto_0

    .line 68
    :cond_0
    sget-object p0, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_270:[F

    .line 69
    goto :goto_0

    .line 65
    :cond_1
    sget-object p0, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_180:[F

    .line 66
    goto :goto_0

    .line 62
    :cond_2
    sget-object p0, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->TEXTURE_ROTATED_90:[F

    .line 63
    nop

    .line 76
    :goto_0
    const/16 v0, 0x8

    const/4 v1, 0x7

    const/4 v2, 0x6

    const/4 v3, 0x5

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz p1, :cond_3

    .line 77
    new-array p1, v0, [F

    aget v9, p0, v8

    .line 78
    invoke-static {v9}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result v9

    aput v9, p1, v8

    aget v9, p0, v7

    aput v9, p1, v7

    aget v9, p0, v6

    .line 79
    invoke-static {v9}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result v9

    aput v9, p1, v6

    aget v9, p0, v5

    aput v9, p1, v5

    aget v9, p0, v4

    .line 80
    invoke-static {v9}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result v9

    aput v9, p1, v4

    aget v9, p0, v3

    aput v9, p1, v3

    aget v9, p0, v2

    .line 81
    invoke-static {v9}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result v9

    aput v9, p1, v2

    aget p0, p0, v1

    aput p0, p1, v1

    .line 84
    move-object p0, p1

    :cond_3
    if-eqz p2, :cond_4

    .line 85
    new-array p1, v0, [F

    aget p2, p0, v8

    aput p2, p1, v8

    aget p2, p0, v7

    .line 86
    invoke-static {p2}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result p2

    aput p2, p1, v7

    aget p2, p0, v6

    aput p2, p1, v6

    aget p2, p0, v5

    .line 87
    invoke-static {p2}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result p2

    aput p2, p1, v5

    aget p2, p0, v4

    aput p2, p1, v4

    aget p2, p0, v3

    .line 88
    invoke-static {p2}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result p2

    aput p2, p1, v3

    aget p2, p0, v2

    aput p2, p1, v2

    aget p0, p0, v1

    .line 89
    invoke-static {p0}, Lcom/android/camera/sticker/glutils/TextureRotationUtil;->flip(F)F

    move-result p0

    aput p0, p1, v1

    .line 92
    move-object p0, p1

    :cond_4
    return-object p0
.end method
