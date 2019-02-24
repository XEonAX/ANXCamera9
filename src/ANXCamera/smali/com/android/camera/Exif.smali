.class public Lcom/android/camera/Exif;
.super Ljava/lang/Object;
.source "Exif.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraExif"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOrientation([B)I
    .locals 10

    .line 26
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 27
    return v0

    .line 30
    :cond_0
    nop

    .line 31
    nop

    .line 34
    move v1, v0

    :goto_0
    add-int/lit8 v2, v1, 0x3

    array-length v3, p0

    const/4 v4, 0x4

    const/16 v5, 0x8

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-ge v2, v3, :cond_9

    add-int/lit8 v2, v1, 0x1

    aget-byte v1, p0, v1

    const/16 v3, 0xff

    and-int/2addr v1, v3

    if-ne v1, v3, :cond_8

    .line 35
    aget-byte v1, p0, v2

    and-int/2addr v1, v3

    .line 38
    if-ne v1, v3, :cond_2

    .line 39
    nop

    .line 34
    :cond_1
    :goto_1
    move v1, v2

    goto :goto_0

    .line 41
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 44
    const/16 v3, 0xd8

    if-eq v1, v3, :cond_1

    if-ne v1, v6, :cond_3

    .line 45
    goto :goto_1

    .line 48
    :cond_3
    const/16 v3, 0xd9

    if-eq v1, v3, :cond_8

    const/16 v3, 0xda

    if-ne v1, v3, :cond_4

    .line 49
    goto :goto_3

    .line 53
    :cond_4
    invoke-static {p0, v2, v7, v0}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v3

    .line 54
    if-lt v3, v7, :cond_7

    add-int v8, v2, v3

    array-length v9, p0

    if-le v8, v9, :cond_5

    goto :goto_2

    .line 60
    :cond_5
    const/16 v9, 0xe1

    if-ne v1, v9, :cond_6

    if-lt v3, v5, :cond_6

    add-int/lit8 v1, v2, 0x2

    .line 61
    invoke-static {p0, v1, v4, v0}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v1

    const v9, 0x45786966

    if-ne v1, v9, :cond_6

    add-int/lit8 v1, v2, 0x6

    .line 62
    invoke-static {p0, v1, v7, v0}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v1

    if-nez v1, :cond_6

    .line 63
    add-int/lit8 v1, v2, 0x8

    .line 64
    add-int/lit8 v2, v3, -0x8

    .line 65
    goto :goto_4

    .line 69
    :cond_6
    nop

    .line 70
    nop

    .line 71
    nop

    .line 34
    move v1, v8

    goto :goto_0

    .line 55
    :cond_7
    :goto_2
    const-string p0, "CameraExif"

    const-string v1, "Invalid length"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return v0

    .line 74
    :cond_8
    :goto_3
    move v1, v2

    :cond_9
    move v2, v0

    :goto_4
    if-le v2, v5, :cond_13

    .line 76
    invoke-static {p0, v1, v4, v0}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v3

    .line 77
    const v8, 0x49492a00    # 823968.0f

    if-eq v3, v8, :cond_a

    const v9, 0x4d4d002a    # 2.14958752E8f

    if-eq v3, v9, :cond_a

    .line 78
    const-string p0, "CameraExif"

    const-string v1, "Invalid byte order"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return v0

    .line 81
    :cond_a
    if-ne v3, v8, :cond_b

    .line 84
    move v3, v6

    goto :goto_5

    .line 81
    :cond_b
    nop

    .line 84
    move v3, v0

    :goto_5
    add-int/lit8 v8, v1, 0x4

    invoke-static {p0, v8, v4, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v4

    add-int/2addr v4, v7

    .line 85
    const/16 v8, 0xa

    if-lt v4, v8, :cond_12

    if-le v4, v2, :cond_c

    goto :goto_7

    .line 89
    :cond_c
    add-int/2addr v1, v4

    .line 90
    sub-int/2addr v2, v4

    .line 93
    add-int/lit8 v4, v1, -0x2

    invoke-static {p0, v4, v7, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v4

    .line 94
    :goto_6
    add-int/lit8 v8, v4, -0x1

    if-lez v4, :cond_13

    const/16 v4, 0xc

    if-lt v2, v4, :cond_13

    .line 96
    invoke-static {p0, v1, v7, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v4

    .line 97
    const/16 v9, 0x112

    if-ne v4, v9, :cond_11

    .line 99
    add-int/2addr v1, v5

    invoke-static {p0, v1, v7, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result p0

    .line 100
    if-eq p0, v6, :cond_10

    const/4 v1, 0x3

    if-eq p0, v1, :cond_f

    const/4 v1, 0x6

    if-eq p0, v1, :cond_e

    if-eq p0, v5, :cond_d

    .line 110
    const-string p0, "CameraExif"

    const-string v1, "Unsupported orientation"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    return v0

    .line 108
    :cond_d
    const/16 p0, 0x10e

    return p0

    .line 106
    :cond_e
    const/16 p0, 0x5a

    return p0

    .line 104
    :cond_f
    const/16 p0, 0xb4

    return p0

    .line 102
    :cond_10
    return v0

    .line 113
    :cond_11
    add-int/lit8 v1, v1, 0xc

    .line 114
    add-int/lit8 v2, v2, -0xc

    .line 94
    move v4, v8

    goto :goto_6

    .line 86
    :cond_12
    :goto_7
    const-string p0, "CameraExif"

    const-string v1, "Invalid offset"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return v0

    .line 118
    :cond_13
    const-string p0, "CameraExif"

    const-string v1, "Orientation not found"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    return v0
.end method

.method private static pack([BIIZ)I
    .locals 2

    .line 124
    nop

    .line 125
    if-eqz p3, :cond_0

    .line 126
    add-int/lit8 p3, p2, -0x1

    add-int/2addr p1, p3

    .line 127
    nop

    .line 130
    const/4 p3, -0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x1

    :goto_0
    const/4 v0, 0x0

    .line 131
    :goto_1
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_1

    .line 132
    shl-int/lit8 p2, v0, 0x8

    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, p2

    .line 133
    add-int/2addr p1, p3

    .line 131
    move p2, v1

    goto :goto_1

    .line 135
    :cond_1
    return v0
.end method
