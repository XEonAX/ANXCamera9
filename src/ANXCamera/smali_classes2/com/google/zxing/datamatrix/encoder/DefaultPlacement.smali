.class public Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;
.super Ljava/lang/Object;
.source "DefaultPlacement.java"


# instance fields
.field private final bits:[B

.field private final codewords:Ljava/lang/CharSequence;

.field private final numcols:I

.field private final numrows:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .registers 6
    .param p1, "codewords"    # Ljava/lang/CharSequence;
    .param p2, "numcols"    # I
    .param p3, "numrows"    # I

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->codewords:Ljava/lang/CharSequence;

    .line 40
    iput p2, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    .line 41
    iput p3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    .line 42
    mul-int v0, p2, p3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    .line 43
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 44
    return-void
.end method

.method private corner1(I)V
    .registers 8
    .param p1, "pos"    # I

    .line 155
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 156
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v0, v1

    const/4 v3, 0x2

    invoke-direct {p0, v0, v1, p1, v3}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 157
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v0, v1

    const/4 v4, 0x3

    invoke-direct {p0, v0, v3, p1, v4}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 158
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/4 v5, 0x4

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 159
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/4 v5, 0x5

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 160
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/4 v2, 0x6

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 161
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/4 v2, 0x7

    invoke-direct {p0, v3, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 162
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/16 v1, 0x8

    invoke-direct {p0, v4, v0, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 163
    return-void
.end method

.method private corner2(I)V
    .registers 8
    .param p1, "pos"    # I

    .line 166
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v1, 0x3

    sub-int/2addr v0, v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v0, v3, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 167
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v4, 0x2

    sub-int/2addr v0, v4

    invoke-direct {p0, v0, v3, p1, v4}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 168
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v0, v2

    invoke-direct {p0, v0, v3, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 169
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    const/4 v5, 0x4

    sub-int/2addr v0, v5

    invoke-direct {p0, v3, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 170
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/4 v1, 0x5

    invoke-direct {p0, v3, v0, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 171
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v4

    const/4 v1, 0x6

    invoke-direct {p0, v3, v0, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 172
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v2

    const/4 v1, 0x7

    invoke-direct {p0, v3, v0, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 173
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v2

    const/16 v1, 0x8

    invoke-direct {p0, v2, v0, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 174
    return-void
.end method

.method private corner3(I)V
    .registers 8
    .param p1, "pos"    # I

    .line 177
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v1, 0x3

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, v0, v2, p1, v3}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 178
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v4, 0x2

    sub-int/2addr v0, v4

    invoke-direct {p0, v0, v2, p1, v4}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 179
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v0, v3

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 180
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v4

    const/4 v5, 0x4

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 181
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/4 v5, 0x5

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 182
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/4 v2, 0x6

    invoke-direct {p0, v3, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 183
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/4 v2, 0x7

    invoke-direct {p0, v4, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 184
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/16 v2, 0x8

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 185
    return-void
.end method

.method private corner4(I)V
    .registers 8
    .param p1, "pos"    # I

    .line 188
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 189
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v0, v1

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v3, v1

    const/4 v4, 0x2

    invoke-direct {p0, v0, v3, p1, v4}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 190
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    const/4 v3, 0x3

    sub-int/2addr v0, v3

    invoke-direct {p0, v2, v0, p1, v3}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 191
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v4

    const/4 v5, 0x4

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 192
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/4 v5, 0x5

    invoke-direct {p0, v2, v0, p1, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 193
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v3

    const/4 v2, 0x6

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 194
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v4

    const/4 v2, 0x7

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 195
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v0, v1

    const/16 v2, 0x8

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 196
    return-void
.end method

.method private module(IIII)V
    .registers 8
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "pos"    # I
    .param p4, "bit"    # I

    .line 122
    if-gez p1, :cond_e

    .line 123
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    add-int/2addr p1, v0

    .line 124
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    add-int/lit8 v0, v0, 0x4

    rem-int/lit8 v0, v0, 0x8

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p2, v0

    .line 126
    :cond_e
    if-gez p2, :cond_1c

    .line 127
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    add-int/2addr p2, v0

    .line 128
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    add-int/lit8 v0, v0, 0x4

    rem-int/lit8 v0, v0, 0x8

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p1, v0

    .line 131
    :cond_1c
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->codewords:Ljava/lang/CharSequence;

    invoke-interface {v0, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 132
    .local v0, "v":I
    rsub-int/lit8 v1, p4, 0x8

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v0, v1

    .line 133
    if-eqz v0, :cond_2b

    goto :goto_2c

    :cond_2b
    const/4 v2, 0x0

    :goto_2c
    invoke-virtual {p0, p2, p1, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->setBit(IIZ)V

    .line 134
    return-void
.end method

.method private utah(III)V
    .registers 7
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "pos"    # I

    .line 144
    add-int/lit8 v0, p1, -0x2

    add-int/lit8 v1, p2, -0x2

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 145
    add-int/lit8 v0, p1, -0x2

    add-int/lit8 v1, p2, -0x1

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 146
    add-int/lit8 v0, p1, -0x1

    add-int/lit8 v1, p2, -0x2

    const/4 v2, 0x3

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 147
    add-int/lit8 v0, p1, -0x1

    add-int/lit8 v1, p2, -0x1

    const/4 v2, 0x4

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 148
    add-int/lit8 v0, p1, -0x1

    const/4 v1, 0x5

    invoke-direct {p0, v0, p2, p3, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 149
    add-int/lit8 v0, p2, -0x2

    const/4 v1, 0x6

    invoke-direct {p0, p1, v0, p3, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 150
    add-int/lit8 v0, p2, -0x1

    const/4 v1, 0x7

    invoke-direct {p0, p1, v0, p3, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 151
    const/16 v0, 0x8

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->module(IIII)V

    .line 152
    return-void
.end method


# virtual methods
.method public final getBit(II)Z
    .registers 5
    .param p1, "col"    # I
    .param p2, "row"    # I

    .line 59
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    mul-int/2addr v1, p2

    add-int/2addr v1, p1

    aget-byte v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    return v1

    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method final getBits()[B
    .registers 2

    .line 55
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    return-object v0
.end method

.method final getNumcols()I
    .registers 2

    .line 51
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    return v0
.end method

.method final getNumrows()I
    .registers 2

    .line 47
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    return v0
.end method

.method final hasBit(II)Z
    .registers 5
    .param p1, "col"    # I
    .param p2, "row"    # I

    .line 67
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    mul-int/2addr v1, p2

    add-int/2addr v1, p1

    aget-byte v0, v0, v1

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    return v0

    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method public final place()V
    .registers 8

    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "pos":I
    const/4 v1, 0x4

    .line 73
    .local v1, "row":I
    const/4 v2, 0x0

    .line 77
    .local v2, "col":I
    :cond_3
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    if-ne v1, v3, :cond_f

    if-nez v2, :cond_f

    .line 78
    add-int/lit8 v3, v0, 0x1

    .local v3, "pos":I
    invoke-direct {p0, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->corner1(I)V

    .line 80
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_f
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    const/4 v4, 0x2

    sub-int/2addr v3, v4

    const/4 v5, 0x4

    if-ne v1, v3, :cond_23

    if-nez v2, :cond_23

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    rem-int/2addr v3, v5

    if-eqz v3, :cond_23

    .line 81
    add-int/lit8 v3, v0, 0x1

    .restart local v3    # "pos":I
    invoke-direct {p0, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->corner2(I)V

    .line 83
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_23
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v3, v4

    if-ne v1, v3, :cond_36

    if-nez v2, :cond_36

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    rem-int/lit8 v3, v3, 0x8

    if-ne v3, v5, :cond_36

    .line 84
    add-int/lit8 v3, v0, 0x1

    .restart local v3    # "pos":I
    invoke-direct {p0, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->corner3(I)V

    .line 86
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_36
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    add-int/2addr v3, v5

    if-ne v1, v3, :cond_49

    if-ne v2, v4, :cond_49

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    rem-int/lit8 v3, v3, 0x8

    if-nez v3, :cond_49

    .line 87
    add-int/lit8 v3, v0, 0x1

    .restart local v3    # "pos":I
    invoke-direct {p0, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->corner4(I)V

    .line 91
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_49
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    if-ge v1, v3, :cond_5b

    if-ltz v2, :cond_5b

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->hasBit(II)Z

    move-result v3

    if-nez v3, :cond_5b

    .line 92
    add-int/lit8 v3, v0, 0x1

    .restart local v3    # "pos":I
    invoke-direct {p0, v1, v2, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->utah(III)V

    .line 94
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_5b
    add-int/lit8 v1, v1, -0x2

    .line 95
    add-int/lit8 v2, v2, 0x2

    .line 96
    if-ltz v1, :cond_65

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    .line 90
    if-lt v2, v3, :cond_49

    .line 97
    :cond_65
    add-int/lit8 v1, v1, 0x1

    .line 98
    add-int/lit8 v2, v2, 0x3

    .line 102
    :cond_69
    if-ltz v1, :cond_7b

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    if-ge v2, v3, :cond_7b

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->hasBit(II)Z

    move-result v3

    if-nez v3, :cond_7b

    .line 103
    add-int/lit8 v3, v0, 0x1

    .restart local v3    # "pos":I
    invoke-direct {p0, v1, v2, v0}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->utah(III)V

    .line 105
    .end local v0    # "pos":I
    move v0, v3

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    :cond_7b
    add-int/lit8 v1, v1, 0x2

    .line 106
    add-int/lit8 v2, v2, -0x2

    .line 107
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    if-ge v1, v3, :cond_85

    .line 101
    if-gez v2, :cond_69

    .line 108
    :cond_85
    add-int/lit8 v1, v1, 0x3

    .line 109
    add-int/lit8 v2, v2, 0x1

    .line 112
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    if-lt v1, v3, :cond_3

    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    .line 75
    if-lt v2, v3, :cond_3

    .line 115
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    const/4 v5, 0x1

    sub-int/2addr v3, v5

    iget v6, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v6, v5

    invoke-virtual {p0, v3, v6}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->hasBit(II)Z

    move-result v3

    if-nez v3, :cond_b0

    .line 116
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v3, v5

    iget v6, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v6, v5

    invoke-virtual {p0, v3, v6, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->setBit(IIZ)V

    .line 117
    iget v3, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    sub-int/2addr v3, v4

    iget v6, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numrows:I

    sub-int/2addr v6, v4

    invoke-virtual {p0, v3, v6, v5}, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->setBit(IIZ)V

    .line 119
    :cond_b0
    return-void
.end method

.method final setBit(IIZ)V
    .registers 6
    .param p1, "col"    # I
    .param p2, "row"    # I
    .param p3, "bit"    # Z

    .line 63
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->bits:[B

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/DefaultPlacement;->numcols:I

    mul-int/2addr v1, p2

    add-int/2addr v1, p1

    aput-byte p3, v0, v1

    .line 64
    return-void
.end method
