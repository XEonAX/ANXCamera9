.class Lcom/android/camera/effect/renders/TextWaterMark;
.super Lcom/android/camera/effect/renders/WaterMark;
.source "TextWaterMark.java"


# static fields
.field private static final RATIO:F = 0.82f

.field private static final TAG:Ljava/lang/String;

.field private static final TEXT_COLOR:I = -0x40008

.field private static final TEXT_PIXEL_SIZE:I = 0x90


# instance fields
.field private final PIC_WIDTHS:[[I

.field private final WATERMARK_FONT_SIZES:[[I

.field private mCenterX:I

.field private mCenterY:I

.field private mCharMargin:I

.field private mFontIndex:I

.field private mPadding:I

.field private mWaterHeight:I

.field private mWaterText:Ljava/lang/String;

.field private mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field private mWaterWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const-class v0, Lcom/android/camera/effect/renders/TextWaterMark;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/TextWaterMark;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    .line 52
    move/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/effect/renders/WaterMark;-><init>(III)V

    .line 10
    const/16 v3, 0xb

    new-array v4, v3, [[I

    const/4 v5, 0x6

    new-array v6, v5, [I

    fill-array-data v6, :array_0

    const/4 v7, 0x0

    aput-object v6, v4, v7

    new-array v6, v5, [I

    fill-array-data v6, :array_1

    const/4 v8, 0x1

    aput-object v6, v4, v8

    new-array v6, v5, [I

    fill-array-data v6, :array_2

    const/4 v9, 0x2

    aput-object v6, v4, v9

    new-array v6, v5, [I

    fill-array-data v6, :array_3

    const/4 v10, 0x3

    aput-object v6, v4, v10

    new-array v6, v5, [I

    fill-array-data v6, :array_4

    const/4 v11, 0x4

    aput-object v6, v4, v11

    new-array v6, v5, [I

    fill-array-data v6, :array_5

    const/4 v12, 0x5

    aput-object v6, v4, v12

    new-array v6, v5, [I

    fill-array-data v6, :array_6

    aput-object v6, v4, v5

    new-array v6, v5, [I

    fill-array-data v6, :array_7

    const/4 v13, 0x7

    aput-object v6, v4, v13

    new-array v6, v5, [I

    fill-array-data v6, :array_8

    const/16 v14, 0x8

    aput-object v6, v4, v14

    new-array v6, v5, [I

    fill-array-data v6, :array_9

    const/16 v15, 0x9

    aput-object v6, v4, v15

    new-array v6, v5, [I

    fill-array-data v6, :array_a

    const/16 v16, 0xa

    aput-object v6, v4, v16

    iput-object v4, v0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    .line 24
    new-array v3, v3, [[I

    new-array v4, v9, [I

    fill-array-data v4, :array_b

    aput-object v4, v3, v7

    new-array v4, v9, [I

    fill-array-data v4, :array_c

    aput-object v4, v3, v8

    new-array v4, v9, [I

    fill-array-data v4, :array_d

    aput-object v4, v3, v9

    new-array v4, v9, [I

    fill-array-data v4, :array_e

    aput-object v4, v3, v10

    new-array v4, v9, [I

    fill-array-data v4, :array_f

    aput-object v4, v3, v11

    new-array v4, v9, [I

    fill-array-data v4, :array_10

    aput-object v4, v3, v12

    new-array v4, v9, [I

    fill-array-data v4, :array_11

    aput-object v4, v3, v5

    new-array v4, v9, [I

    fill-array-data v4, :array_12

    aput-object v4, v3, v13

    new-array v4, v9, [I

    fill-array-data v4, :array_13

    aput-object v4, v3, v14

    new-array v4, v9, [I

    fill-array-data v4, :array_14

    aput-object v4, v3, v15

    new-array v4, v9, [I

    fill-array-data v4, :array_15

    aput-object v4, v3, v16

    iput-object v3, v0, Lcom/android/camera/effect/renders/TextWaterMark;->PIC_WIDTHS:[[I

    .line 54
    move-object/from16 v3, p1

    iput-object v3, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterText:Ljava/lang/String;

    .line 55
    iget-object v13, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterText:Ljava/lang/String;

    const/high16 v14, 0x43100000    # 144.0f

    const v15, -0x40008

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x1

    invoke-static/range {v13 .. v18}, Lcom/android/gallery3d/ui/StringTexture;->newInstance(Ljava/lang/String;FIFZI)Lcom/android/gallery3d/ui/StringTexture;

    move-result-object v3

    iput-object v3, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 57
    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/TextWaterMark;->getFontIndex(II)I

    move-result v1

    iput v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mFontIndex:I

    .line 58
    iget-object v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterText:Ljava/lang/String;

    iget v2, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mFontIndex:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/TextWaterMark;->getWaterMarkWidth(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    .line 59
    iget-object v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    iget v2, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mFontIndex:I

    aget-object v1, v1, v2

    aget v1, v1, v7

    int-to-float v1, v1

    const v2, 0x3f51eb85    # 0.82f

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    .line 60
    iget-object v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    iget v2, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mFontIndex:I

    aget-object v1, v1, v2

    aget v1, v1, v12

    iput v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    .line 61
    iget v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    int-to-float v1, v1

    const v2, 0x3e3851ec    # 0.18f

    mul-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/android/camera/effect/renders/TextWaterMark;->mCharMargin:I

    .line 63
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/TextWaterMark;->calcCenterAxis()V

    .line 64
    sget-boolean v1, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v1, :cond_0

    .line 65
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/TextWaterMark;->print()V

    .line 67
    :cond_0
    return-void

    :array_0
    .array-data 4
        0x5
        0x4
        0x2
        0x4
        0x3
        0x7
    .end array-data

    :array_1
    .array-data 4
        0x8
        0x6
        0x2
        0x6
        0x3
        0x7
    .end array-data

    :array_2
    .array-data 4
        0xb
        0x6
        0x5
        0x6
        0x5
        0xc
    .end array-data

    :array_3
    .array-data 4
        0xc
        0x7
        0x5
        0x7
        0x5
        0xc
    .end array-data

    :array_4
    .array-data 4
        0x32
        0x20
        0xb
        0x1f
        0x14
        0x2f
    .end array-data

    :array_5
    .array-data 4
        0x3a
        0x24
        0x13
        0x26
        0x18
        0x37
    .end array-data

    :array_6
    .array-data 4
        0x41
        0x29
        0x18
        0x2a
        0x1b
        0x3f
    .end array-data

    :array_7
    .array-data 4
        0x50
        0x32
        0x18
        0x32
        0x20
        0x4b
    .end array-data

    :array_8
    .array-data 4
        0x53
        0x34
        0x19
        0x34
        0x21
        0x4e
    .end array-data

    :array_9
    .array-data 4
        0x68
        0x41
        0x21
        0x41
        0x2a
        0x62
    .end array-data

    :array_a
    .array-data 4
        0x80
        0x50
        0x28
        0x50
        0x30
        0x84
    .end array-data

    :array_b
    .array-data 4
        0x0
        0x95
    .end array-data

    :array_c
    .array-data 4
        0x96
        0xef
    .end array-data

    :array_d
    .array-data 4
        0xf0
        0x117
    .end array-data

    :array_e
    .array-data 4
        0x118
        0x190
    .end array-data

    :array_f
    .array-data 4
        0x191
        0x59f
    .end array-data

    :array_10
    .array-data 4
        0x5a0
        0x5e7
    .end array-data

    :array_11
    .array-data 4
        0x5e8
        0x707
    .end array-data

    :array_12
    .array-data 4
        0x708
        0x76b
    .end array-data

    :array_13
    .array-data 4
        0x76c
        0x8fb
    .end array-data

    :array_14
    .array-data 4
        0x8fc
        0xc30
    .end array-data

    :array_15
    .array-data 4
        0xc31
        0xfa0
    .end array-data
.end method

.method private calcCenterAxis()V
    .locals 2

    .line 102
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mOrientation:I

    if-eqz v0, :cond_3

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_2

    const/16 v1, 0xb4

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCharMargin:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    .line 117
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    goto :goto_0

    .line 112
    :cond_1
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    .line 113
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCharMargin:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    .line 114
    goto :goto_0

    .line 108
    :cond_2
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCharMargin:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    .line 109
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    .line 110
    goto :goto_0

    .line 104
    :cond_3
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    .line 105
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCharMargin:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    .line 106
    nop

    .line 120
    :goto_0
    return-void
.end method

.method private getFontIndex(II)I
    .locals 4

    .line 70
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 71
    iget-object p2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    array-length p2, p2

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    .line 72
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/android/camera/effect/renders/TextWaterMark;->PIC_WIDTHS:[[I

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 73
    iget-object v3, p0, Lcom/android/camera/effect/renders/TextWaterMark;->PIC_WIDTHS:[[I

    aget-object v3, v3, v2

    aget v3, v3, v1

    if-lt p1, v3, :cond_0

    iget-object v3, p0, Lcom/android/camera/effect/renders/TextWaterMark;->PIC_WIDTHS:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    if-gt p1, v3, :cond_0

    .line 74
    nop

    .line 75
    nop

    .line 78
    move p2, v2

    goto :goto_1

    .line 72
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    :cond_1
    :goto_1
    return p2
.end method

.method private getWaterMarkWidth(Ljava/lang/String;I)I
    .locals 8

    .line 82
    iget-object v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    aget-object v0, v0, p2

    const/4 v1, 0x1

    aget v0, v0, v1

    .line 83
    iget-object v1, p0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    aget-object v1, v1, p2

    const/4 v2, 0x2

    aget v1, v1, v2

    .line 84
    iget-object v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    aget-object v2, v2, p2

    const/4 v3, 0x3

    aget v2, v2, v3

    .line 85
    iget-object v3, p0, Lcom/android/camera/effect/renders/TextWaterMark;->WATERMARK_FONT_SIZES:[[I

    aget-object p2, v3, p2

    const/4 v3, 0x4

    aget p2, p2, v3

    .line 86
    nop

    .line 87
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    array-length v3, p1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v4, v3, :cond_4

    aget-char v6, p1, v4

    .line 88
    const/16 v7, 0x30

    if-lt v6, v7, :cond_0

    const/16 v7, 0x39

    if-gt v6, v7, :cond_0

    .line 89
    add-int/2addr v5, v0

    goto :goto_1

    .line 90
    :cond_0
    const/16 v7, 0x3a

    if-ne v6, v7, :cond_1

    .line 91
    add-int/2addr v5, p2

    goto :goto_1

    .line 92
    :cond_1
    const/16 v7, 0x2d

    if-ne v6, v7, :cond_2

    .line 93
    add-int/2addr v5, v1

    goto :goto_1

    .line 94
    :cond_2
    const/16 v7, 0x20

    if-ne v6, v7, :cond_3

    .line 95
    add-int/2addr v5, v2

    .line 87
    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 98
    :cond_4
    return v5
.end method

.method private print()V
    .locals 3

    .line 148
    sget-object v0, Lcom/android/camera/effect/renders/TextWaterMark;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WaterMark mPictureWidth="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mPictureHeight ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPictureHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mWaterText="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " mFontIndex="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mFontIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mCenterX="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mCenterY="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mWaterWidth="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mWaterHeight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mPadding="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mPadding:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method


# virtual methods
.method public getCenterX()I
    .locals 1

    .line 124
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterX:I

    return v0
.end method

.method public getCenterY()I
    .locals 1

    .line 129
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mCenterY:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 139
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterHeight:I

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/BasicTexture;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/android/camera/effect/renders/TextWaterMark;->mWaterWidth:I

    return v0
.end method
