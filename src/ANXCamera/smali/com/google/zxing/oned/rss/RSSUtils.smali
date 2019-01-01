.class public final Lcom/google/zxing/oned/rss/RSSUtils;
.super Ljava/lang/Object;
.source "RSSUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static combins(II)I
    .locals 5
    .param p0, "n"    # I
    .param p1, "r"    # I

    .line 106
    sub-int v0, p0, p1

    if-le v0, p1, :cond_0

    .line 107
    move v0, p1

    .line 108
    .local v0, "minDenom":I
    sub-int v1, p0, p1

    .line 109
    .local v1, "maxDenom":I
    goto :goto_0

    .line 110
    .end local v0    # "minDenom":I
    .end local v1    # "maxDenom":I
    :cond_0
    sub-int v0, p0, p1

    .line 111
    .restart local v0    # "minDenom":I
    move v1, p1

    .line 113
    .restart local v1    # "maxDenom":I
    :goto_0
    const/4 v2, 0x1

    .line 114
    .local v2, "val":I
    const/4 v3, 0x1

    .line 115
    .local v3, "j":I
    move v4, p0

    .local v4, "i":I
    :goto_1
    if-gt v4, v1, :cond_2

    .line 122
    .end local v4    # "i":I
    :goto_2
    if-le v3, v0, :cond_1

    .line 126
    return v2

    .line 123
    :cond_1
    div-int/2addr v2, v3

    .line 124
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 116
    .restart local v4    # "i":I
    :cond_2
    mul-int/2addr v2, v4

    .line 117
    if-gt v3, v0, :cond_3

    .line 118
    div-int/2addr v2, v3

    .line 119
    add-int/lit8 v3, v3, 0x1

    .line 115
    :cond_3
    add-int/lit8 v4, v4, -0x1

    goto :goto_1
.end method

.method public static getRSSvalue([IIZ)I
    .locals 12
    .param p0, "widths"    # [I
    .param p1, "maxWidth"    # I
    .param p2, "noNarrow"    # Z

    .line 67
    array-length v0, p0

    .line 68
    .local v0, "elements":I
    const/4 v1, 0x0

    .line 69
    .local v1, "n":I
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v2, :cond_6

    .line 72
    const/4 v2, 0x0

    .line 73
    .local v2, "val":I
    const/4 v3, 0x0

    .line 74
    .local v3, "narrowMask":I
    const/4 v4, 0x0

    .local v4, "bar":I
    move v5, v1

    .end local v1    # "n":I
    .local v5, "n":I
    :goto_1
    add-int/lit8 v1, v0, -0x1

    if-lt v4, v1, :cond_0

    .line 100
    .end local v4    # "bar":I
    return v2

    .line 76
    .restart local v4    # "bar":I
    :cond_0
    const/4 v1, 0x1

    .local v1, "elmWidth":I
    const/4 v6, 0x1

    shl-int v7, v6, v4

    or-int/2addr v3, v7

    .line 77
    :goto_2
    aget v7, p0, v4

    .line 76
    if-lt v1, v7, :cond_1

    .line 98
    sub-int/2addr v5, v1

    .line 74
    .end local v1    # "elmWidth":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 79
    .restart local v1    # "elmWidth":I
    :cond_1
    sub-int v7, v5, v1

    sub-int/2addr v7, v6

    sub-int v8, v0, v4

    add-int/lit8 v8, v8, -0x2

    invoke-static {v7, v8}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v7

    .line 80
    .local v7, "subVal":I
    if-eqz p2, :cond_2

    if-nez v3, :cond_2

    .line 81
    sub-int v8, v5, v1

    sub-int v9, v0, v4

    sub-int/2addr v9, v6

    sub-int/2addr v8, v9

    sub-int v9, v0, v4

    sub-int/2addr v9, v6

    if-lt v8, v9, :cond_2

    .line 82
    sub-int v8, v5, v1

    sub-int v9, v0, v4

    sub-int/2addr v8, v9

    .line 83
    sub-int v9, v0, v4

    add-int/lit8 v9, v9, -0x2

    invoke-static {v8, v9}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v8

    sub-int/2addr v7, v8

    .line 85
    :cond_2
    sub-int v8, v0, v4

    sub-int/2addr v8, v6

    if-le v8, v6, :cond_4

    .line 86
    const/4 v8, 0x0

    .line 87
    .local v8, "lessVal":I
    sub-int v9, v5, v1

    sub-int v10, v0, v4

    add-int/lit8 v10, v10, -0x2

    sub-int/2addr v9, v10

    .line 88
    .local v9, "mxwElement":I
    nop

    .line 87
    :goto_3
    if-gt v9, p1, :cond_3

    .line 92
    .end local v9    # "mxwElement":I
    add-int/lit8 v9, v0, -0x1

    sub-int/2addr v9, v4

    mul-int/2addr v9, v8

    sub-int/2addr v7, v9

    .line 93
    .end local v8    # "lessVal":I
    goto :goto_4

    .line 89
    .restart local v8    # "lessVal":I
    .restart local v9    # "mxwElement":I
    :cond_3
    sub-int v10, v5, v1

    sub-int/2addr v10, v9

    sub-int/2addr v10, v6

    .line 90
    sub-int v11, v0, v4

    add-int/lit8 v11, v11, -0x3

    invoke-static {v10, v11}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v10

    add-int/2addr v8, v10

    .line 88
    add-int/lit8 v9, v9, -0x1

    goto :goto_3

    .line 93
    .end local v8    # "lessVal":I
    .end local v9    # "mxwElement":I
    :cond_4
    sub-int v8, v5, v1

    if-le v8, p1, :cond_5

    .line 94
    add-int/lit8 v7, v7, -0x1

    .line 96
    :cond_5
    :goto_4
    add-int/2addr v2, v7

    .line 78
    .end local v7    # "subVal":I
    add-int/lit8 v1, v1, 0x1

    shl-int v7, v6, v4

    not-int v7, v7

    and-int/2addr v3, v7

    goto :goto_2

    .line 69
    .end local v2    # "val":I
    .end local v3    # "narrowMask":I
    .end local v4    # "bar":I
    .end local v5    # "n":I
    .local v1, "n":I
    :cond_6
    aget v4, p0, v3

    .line 70
    .local v4, "width":I
    add-int/2addr v1, v4

    .line 69
    .end local v4    # "width":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
