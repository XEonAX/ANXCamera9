.class public final Lcom/google/zxing/qrcode/decoder/Version;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/decoder/Version$ECB;,
        Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    }
.end annotation


# static fields
.field private static final VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

.field private static final VERSION_DECODE_INFO:[I


# instance fields
.field private final alignmentPatternCenters:[I

.field private final ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

.field private final totalCodewords:I

.field private final versionNumber:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 33
    const/16 v0, 0x22

    new-array v0, v0, [I

    fill-array-data v0, :array_18

    .line 34
    nop

    .line 35
    nop

    .line 36
    nop

    .line 37
    nop

    .line 38
    nop

    .line 39
    nop

    .line 40
    nop

    .line 33
    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    .line 43
    invoke-static {}, Lcom/google/zxing/qrcode/decoder/Version;->buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    return-void

    nop

    :array_18
    .array-data 4
        0x7c94
        0x85bc
        0x9a99
        0xa4d3
        0xbbf6
        0xc762
        0xd847
        0xe60d
        0xf928
        0x10b78
        0x1145d
        0x12a17
        0x13532
        0x149a6
        0x15683
        0x168c9
        0x177ec
        0x18ec4
        0x191e1
        0x1afab
        0x1b08e
        0x1cc1a
        0x1d33f
        0x1ed75
        0x1f250
        0x209d5
        0x216f0
        0x228ba
        0x2379f
        0x24b0b
        0x2542e
        0x26a64
        0x27541
        0x28c69
    .end array-data
.end method

.method private varargs constructor <init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V
    .registers 12
    .param p1, "versionNumber"    # I
    .param p2, "alignmentPatternCenters"    # [I
    .param p3, "ecBlocks"    # [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput p1, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    .line 54
    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    .line 55
    iput-object p3, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 56
    const/4 v0, 0x0

    .line 57
    .local v0, "total":I
    const/4 v1, 0x0

    aget-object v2, p3, v1

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v2

    .line 58
    .local v2, "ecCodewords":I
    aget-object v3, p3, v1

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v3

    .line 59
    .local v3, "ecbArray":[Lcom/google/zxing/qrcode/decoder/Version$ECB;
    array-length v4, v3

    :goto_18
    if-lt v1, v4, :cond_1d

    .line 62
    iput v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    .line 63
    return-void

    .line 59
    :cond_1d
    aget-object v5, v3, v1

    .line 60
    .local v5, "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    invoke-virtual {v5}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v6

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v7

    add-int/2addr v7, v2

    mul-int/2addr v6, v7

    add-int/2addr v0, v6

    .line 59
    .end local v5    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    add-int/lit8 v1, v1, 0x1

    goto :goto_18
.end method

.method private static buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;
    .registers 17

    .line 246
    const/16 v0, 0x28

    new-array v0, v0, [Lcom/google/zxing/qrcode/decoder/Version;

    .line 247
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v4, 0x4

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 248
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/4 v7, 0x1

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x13

    invoke-direct {v9, v7, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v8, v2

    const/4 v9, 0x7

    invoke-direct {v6, v9, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 249
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v10, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v10, v8, v2

    const/16 v10, 0xa

    invoke-direct {v6, v10, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 250
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    invoke-direct {v10, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v10, v8, v2

    const/16 v10, 0xd

    invoke-direct {v6, v10, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    const/4 v8, 0x2

    aput-object v6, v5, v8

    .line 251
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v10, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x9

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v10, v2

    const/16 v12, 0x11

    invoke-direct {v6, v12, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 247
    const/4 v10, 0x3

    aput-object v6, v5, v10

    invoke-direct {v1, v7, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v2

    .line 252
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1468

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 253
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x22

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0xa

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 254
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x1c

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 255
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 256
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 252
    aput-object v6, v5, v10

    invoke-direct {v1, v8, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v7

    .line 257
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1470

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 258
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x37

    invoke-direct {v13, v7, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v9, 0xf

    invoke-direct {v6, v9, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 259
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x2c

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 260
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x11

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 261
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0xd

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 257
    aput-object v6, v5, v10

    invoke-direct {v1, v10, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v8

    .line 262
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1478

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 263
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x50

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x14

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 264
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x20

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 265
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x18

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 266
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x9

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 262
    aput-object v6, v5, v10

    invoke-direct {v1, v4, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v10

    .line 267
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1480

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 268
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x6c

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 269
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2b

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 270
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 271
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 270
    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 272
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xb

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 273
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 272
    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 267
    aput-object v6, v5, v10

    const/4 v6, 0x5

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v4

    .line 274
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1488

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 275
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v13, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x44

    invoke-direct {v15, v8, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v13, v2

    const/16 v6, 0x12

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v12, v5, v2

    .line 276
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x1b

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 277
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 278
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v4, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1c

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 274
    aput-object v6, v5, v10

    const/4 v6, 0x6

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/4 v3, 0x5

    aput-object v1, v0, v3

    .line 279
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_1490

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 280
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v13, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x4e

    invoke-direct {v15, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v13, v2

    const/16 v11, 0x14

    invoke-direct {v12, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v12, v5, v2

    .line 281
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x1f

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    .line 282
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 283
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v4, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 282
    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    .line 284
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xd

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 285
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 284
    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 279
    aput-object v11, v5, v10

    const/4 v11, 0x7

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v6

    .line 286
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_149a

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 287
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x61

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    .line 288
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x26

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 289
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x27

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 288
    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    .line 290
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x12

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 291
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 290
    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    .line 292
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 293
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 292
    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 286
    aput-object v11, v5, v10

    const/16 v11, 0x8

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/4 v3, 0x7

    aput-object v1, v0, v3

    .line 294
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14a4

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 295
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x74

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1e

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    .line 296
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x24

    invoke-direct {v15, v10, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v12, v2

    .line 297
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x25

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 296
    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    .line 298
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x10

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 299
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x11

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 298
    aput-object v13, v12, v7

    const/16 v13, 0x14

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    .line 300
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 301
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xd

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 300
    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 294
    aput-object v11, v5, v10

    const/16 v11, 0x9

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x8

    aput-object v1, v0, v3

    .line 302
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14ae

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 303
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x44

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 304
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x45

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 303
    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    .line 305
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2b

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 306
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2c

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 305
    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    .line 307
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v6, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 308
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x14

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 307
    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    .line 309
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 310
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x10

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 309
    aput-object v13, v12, v7

    const/16 v13, 0x1c

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 302
    aput-object v11, v5, v10

    const/16 v11, 0xa

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x9

    aput-object v1, v0, v3

    .line 311
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14b8

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 312
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x51

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x14

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    .line 313
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x32

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 314
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x33

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 313
    aput-object v13, v12, v7

    const/16 v13, 0x1e

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    .line 315
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 316
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x17

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 315
    aput-object v13, v12, v7

    const/16 v13, 0x1c

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    .line 317
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v10, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    .line 318
    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x8

    const/16 v9, 0xd

    invoke-direct {v13, v15, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 317
    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 311
    aput-object v11, v5, v10

    const/16 v9, 0xb

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xa

    aput-object v1, v0, v3

    .line 319
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14c2

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 320
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x5c

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 321
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x5d

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 320
    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    .line 322
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x24

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 323
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x25

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 322
    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    .line 324
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x14

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 325
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x15

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 324
    aput-object v12, v11, v7

    const/16 v12, 0x1a

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    .line 326
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xe

    const/4 v15, 0x7

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 327
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xf

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 326
    aput-object v12, v11, v7

    const/16 v12, 0x1c

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 319
    aput-object v9, v5, v10

    const/16 v9, 0xc

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xb

    aput-object v1, v0, v3

    .line 328
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14cc

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 329
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x6b

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    const/16 v12, 0x1a

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    .line 330
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x8

    const/16 v15, 0x25

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 331
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x26

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 330
    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    .line 332
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x8

    const/16 v15, 0x14

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 333
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x15

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 332
    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    .line 334
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xc

    const/16 v15, 0xb

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 335
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 334
    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 328
    aput-object v9, v5, v10

    const/16 v9, 0xd

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xc

    aput-object v1, v0, v3

    .line 336
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14d6

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 337
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x73

    invoke-direct {v12, v10, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 338
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x74

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 337
    aput-object v12, v11, v7

    const/16 v12, 0x1e

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    .line 339
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x28

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 340
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x29

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 339
    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    .line 341
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xb

    const/16 v15, 0x10

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 342
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x11

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 341
    aput-object v12, v11, v7

    const/16 v12, 0x14

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    .line 343
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xb

    const/16 v15, 0xc

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 344
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xd

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 343
    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 336
    aput-object v9, v5, v10

    const/16 v9, 0xe

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xd

    aput-object v1, v0, v3

    .line 345
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14e2

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 346
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x57

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 347
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x58

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 346
    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    .line 348
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x29

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 349
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x2a

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 348
    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    .line 350
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v15, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 351
    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x19

    const/4 v15, 0x7

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 350
    aput-object v12, v11, v7

    const/16 v12, 0x1e

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    .line 352
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xb

    const/16 v6, 0xc

    invoke-direct {v12, v15, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    .line 353
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/4 v15, 0x7

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 352
    aput-object v6, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 345
    aput-object v9, v5, v10

    const/16 v6, 0xf

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xe

    aput-object v1, v0, v3

    .line 354
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14ee

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 355
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x62

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 356
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x63

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 355
    aput-object v11, v9, v7

    invoke-direct {v6, v14, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 357
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2d

    const/4 v15, 0x7

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 358
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2e

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 357
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 359
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0xf

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 360
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x14

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 359
    aput-object v11, v9, v7

    invoke-direct {v6, v14, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 361
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 362
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 361
    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 354
    aput-object v6, v5, v10

    invoke-direct {v1, v15, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xf

    aput-object v1, v0, v3

    .line 363
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14fa

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 364
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6b

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 365
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6c

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 364
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 366
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xa

    const/16 v15, 0x2e

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 367
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2f

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 366
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 368
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 369
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/16 v15, 0xf

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 368
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 370
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 371
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0xf

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 370
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 363
    aput-object v6, v5, v10

    const/16 v6, 0x11

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x10

    aput-object v1, v0, v3

    .line 372
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_1506

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 373
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x78

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 374
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x79

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 373
    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 375
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x9

    const/16 v15, 0x2b

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 376
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2c

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 375
    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 377
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x16

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 378
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 377
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 379
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 380
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0xf

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 379
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 372
    aput-object v6, v5, v10

    const/16 v6, 0x12

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x11

    aput-object v1, v0, v3

    .line 381
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_1512

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 382
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x71

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 383
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x72

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 382
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 384
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2c

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 385
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xb

    const/16 v15, 0x2d

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 384
    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 386
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x15

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 387
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 386
    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 388
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x9

    const/16 v15, 0xd

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 389
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    const/16 v15, 0x10

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 388
    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 381
    aput-object v6, v5, v10

    const/16 v6, 0x13

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x12

    aput-object v1, v0, v3

    .line 390
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_151e

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 391
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6b

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 392
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6c

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 391
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 393
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x29

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 394
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v15, 0x2a

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 393
    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    .line 395
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v12, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 396
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x5

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 395
    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    .line 397
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v12, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 398
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xa

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 397
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 390
    aput-object v6, v5, v10

    const/16 v6, 0x14

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x13

    aput-object v1, v0, v3

    .line 399
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v5, v3, [I

    fill-array-data v5, :array_152a

    new-array v3, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 400
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x74

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 401
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x75

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 400
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v2

    .line 402
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x2a

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v7

    .line 403
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 404
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 403
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v8

    .line 405
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 406
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 405
    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 399
    aput-object v6, v3, v10

    const/16 v6, 0x15

    invoke-direct {v1, v6, v5, v3}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x14

    aput-object v1, v0, v3

    .line 407
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v5, v3, [I

    fill-array-data v5, :array_1538

    new-array v3, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 408
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6f

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 409
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x70

    const/4 v15, 0x7

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 408
    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v2

    .line 410
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x11

    const/16 v4, 0x2e

    invoke-direct {v12, v15, v4}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v9, v2

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v7

    .line 411
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 412
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 411
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v4, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v4, v3, v8

    .line 413
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0xd

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    invoke-direct {v4, v14, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 407
    aput-object v4, v3, v10

    const/16 v4, 0x16

    invoke-direct {v1, v4, v5, v3}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x15

    aput-object v1, v0, v3

    .line 414
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1546

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 415
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x79

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 416
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7a

    const/4 v12, 0x5

    invoke-direct {v3, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 415
    aput-object v3, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 417
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 418
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 417
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 419
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 420
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 419
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 421
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 422
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 421
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 414
    aput-object v3, v5, v10

    const/16 v3, 0x17

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x16

    aput-object v1, v0, v3

    .line 423
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1554

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 424
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x75

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 425
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x76

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 424
    aput-object v11, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 426
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 427
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 426
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 428
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 429
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 428
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 430
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v9, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v6, v2

    .line 431
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 430
    aput-object v11, v6, v7

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 423
    aput-object v3, v5, v10

    invoke-direct {v1, v14, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x17

    aput-object v1, v0, v3

    .line 432
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1562

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 433
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x6a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 434
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x6b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 433
    aput-object v9, v6, v7

    const/16 v9, 0x1a

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 435
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 436
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 435
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 437
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 438
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 437
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 439
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 440
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 439
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 432
    aput-object v3, v5, v10

    invoke-direct {v1, v13, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v14

    .line 441
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1570

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 442
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x72

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 443
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x73

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 442
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 444
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 445
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 444
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 446
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v9, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v6, v2

    .line 447
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 446
    aput-object v11, v6, v7

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 448
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x21

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 449
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 448
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 441
    aput-object v3, v5, v10

    const/16 v3, 0x1a

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v13

    .line 450
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_157e

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 451
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 452
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 451
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 453
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 454
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 453
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 455
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x17

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 456
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 455
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 457
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 458
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1c

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 457
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 450
    aput-object v3, v5, v10

    const/16 v3, 0x1b

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1a

    aput-object v1, v0, v3

    .line 459
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_158c

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 460
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x75

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 461
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x76

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 460
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 462
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 463
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 462
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 464
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 465
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 464
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 466
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 467
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 466
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 459
    aput-object v3, v5, v10

    const/16 v3, 0x1c

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1b

    aput-object v1, v0, v3

    .line 468
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_159c

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 469
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 470
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x75

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 469
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 471
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x15

    const/16 v12, 0x2d

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 472
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 471
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 473
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 474
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x25

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 473
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 475
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 476
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 475
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 468
    aput-object v3, v5, v10

    const/16 v3, 0x1d

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1c

    aput-object v1, v0, v3

    .line 477
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15ac

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 478
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x73

    const/4 v12, 0x5

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 479
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x74

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 478
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 480
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 481
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 480
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 482
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 483
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v13, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 482
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 484
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 485
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v13, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 484
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 477
    aput-object v3, v5, v10

    invoke-direct {v1, v9, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1d

    aput-object v1, v0, v3

    .line 486
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15bc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 487
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 488
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 487
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 489
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 490
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 489
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 491
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2a

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 492
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 491
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 493
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 494
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1c

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 493
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 486
    aput-object v3, v5, v10

    const/16 v3, 0x1f

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v9

    .line 495
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15cc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 496
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 497
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 498
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 497
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 499
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 500
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x23

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 499
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 501
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 502
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x23

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 501
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 495
    aput-object v3, v5, v10

    const/16 v3, 0x20

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1f

    aput-object v1, v0, v3

    .line 503
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15dc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 504
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 505
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 504
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 506
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 507
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x15

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 506
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 508
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 509
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 508
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 510
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 511
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 510
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 503
    aput-object v3, v5, v10

    const/16 v3, 0x21

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x20

    aput-object v1, v0, v3

    .line 512
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15ec

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 513
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 514
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 513
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 515
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 516
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 515
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 517
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2c

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 518
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 517
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 519
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x3b

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 520
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 519
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 512
    aput-object v3, v5, v10

    const/16 v3, 0x22

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x21

    aput-object v1, v0, v3

    .line 521
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_15fc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 522
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0x79

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 523
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7a

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 522
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 524
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 525
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 524
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 526
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x27

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 527
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 526
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 528
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 529
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x29

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 528
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 521
    aput-object v3, v5, v10

    const/16 v3, 0x23

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x22

    aput-object v1, v0, v3

    .line 530
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_160e

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 531
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x79

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 532
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 531
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 533
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 534
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 533
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 535
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 536
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 535
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 537
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 538
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x40

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 537
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 530
    aput-object v3, v5, v10

    const/16 v3, 0x24

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x23

    aput-object v1, v0, v3

    .line 539
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1620

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 540
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 541
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 540
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 542
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 543
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 542
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 544
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x31

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 545
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 544
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 546
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 547
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 546
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 539
    aput-object v3, v5, v10

    const/16 v3, 0x25

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x24

    aput-object v1, v0, v3

    .line 548
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1632

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 549
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x7a

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    .line 550
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x12

    const/16 v12, 0x7b

    invoke-direct {v3, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 549
    aput-object v3, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    .line 551
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 552
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x20

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 551
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 553
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x30

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 554
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 553
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 555
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2a

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 556
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x20

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 555
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 548
    aput-object v3, v5, v10

    const/16 v3, 0x26

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x25

    aput-object v1, v0, v3

    .line 557
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1644

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 558
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x14

    const/16 v12, 0x75

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 559
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x76

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 558
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    .line 560
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x28

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 561
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x30

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 560
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    .line 562
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2b

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 563
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 562
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    .line 564
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 565
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x43

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 564
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 557
    aput-object v3, v5, v10

    const/16 v3, 0x27

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x26

    aput-object v1, v0, v3

    .line 566
    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v3, v3, [I

    fill-array-data v3, :array_1656

    const/4 v4, 0x4

    new-array v4, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 567
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x76

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 568
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x77

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 567
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v2

    .line 569
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x12

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 570
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 569
    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v7

    .line 571
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    .line 572
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 571
    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v8

    .line 573
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v8, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x14

    const/16 v11, 0xf

    invoke-direct {v8, v9, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v8, v6, v2

    .line 574
    new-instance v2, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v8, 0x3d

    const/16 v9, 0x10

    invoke-direct {v2, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 573
    aput-object v2, v6, v7

    const/16 v2, 0x1e

    invoke-direct {v5, v2, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 566
    aput-object v5, v4, v10

    const/16 v2, 0x28

    invoke-direct {v1, v2, v3, v4}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v2, 0x27

    aput-object v1, v0, v2

    .line 246
    return-object v0

    :array_1468
    .array-data 4
        0x6
        0x12
    .end array-data

    :array_1470
    .array-data 4
        0x6
        0x16
    .end array-data

    :array_1478
    .array-data 4
        0x6
        0x1a
    .end array-data

    :array_1480
    .array-data 4
        0x6
        0x1e
    .end array-data

    :array_1488
    .array-data 4
        0x6
        0x22
    .end array-data

    :array_1490
    .array-data 4
        0x6
        0x16
        0x26
    .end array-data

    :array_149a
    .array-data 4
        0x6
        0x18
        0x2a
    .end array-data

    :array_14a4
    .array-data 4
        0x6
        0x1a
        0x2e
    .end array-data

    :array_14ae
    .array-data 4
        0x6
        0x1c
        0x32
    .end array-data

    :array_14b8
    .array-data 4
        0x6
        0x1e
        0x36
    .end array-data

    :array_14c2
    .array-data 4
        0x6
        0x20
        0x3a
    .end array-data

    :array_14cc
    .array-data 4
        0x6
        0x22
        0x3e
    .end array-data

    :array_14d6
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
    .end array-data

    :array_14e2
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
    .end array-data

    :array_14ee
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
    .end array-data

    :array_14fa
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
    .end array-data

    :array_1506
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
    .end array-data

    :array_1512
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
    .end array-data

    :array_151e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
    .end array-data

    :array_152a
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
    .end array-data

    :array_1538
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
    .end array-data

    :array_1546
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
    .end array-data

    :array_1554
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
    .end array-data

    :array_1562
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
    .end array-data

    :array_1570
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
    .end array-data

    :array_157e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
    .end array-data

    :array_158c
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
    .end array-data

    :array_159c
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
    .end array-data

    :array_15ac
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
    .end array-data

    :array_15bc
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
    .end array-data

    :array_15cc
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
    .end array-data

    :array_15dc
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
    .end array-data

    :array_15ec
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
    .end array-data

    :array_15fc
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    :array_160e
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    :array_1620
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    :array_1632
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    :array_1644
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    :array_1656
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data
.end method

.method static decodeVersionInformation(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 6
    .param p0, "versionBits"    # I

    .line 111
    const v0, 0x7fffffff

    .line 112
    .local v0, "bestDifference":I
    const/4 v1, 0x0

    .line 113
    .local v1, "bestVersion":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    sget-object v3, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    array-length v3, v3

    if-lt v2, v3, :cond_14

    .line 129
    .end local v2    # "i":I
    const/4 v2, 0x3

    if-gt v0, v2, :cond_12

    .line 130
    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v2

    return-object v2

    .line 133
    :cond_12
    const/4 v2, 0x0

    return-object v2

    .line 114
    .restart local v2    # "i":I
    :cond_14
    sget-object v3, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    aget v3, v3, v2

    .line 116
    .local v3, "targetVersion":I
    if-ne v3, p0, :cond_21

    .line 117
    add-int/lit8 v4, v2, 0x7

    invoke-static {v4}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v4

    return-object v4

    .line 121
    :cond_21
    invoke-static {p0, v3}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->numBitsDiffering(II)I

    move-result v4

    .line 122
    .local v4, "bitsDifference":I
    if-ge v4, v0, :cond_2a

    .line 123
    add-int/lit8 v1, v2, 0x7

    .line 124
    move v0, v4

    .line 113
    .end local v3    # "targetVersion":I
    .end local v4    # "bitsDifference":I
    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public static getProvisionalVersionForDimension(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 3
    .param p0, "dimension"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 93
    rem-int/lit8 v0, p0, 0x4

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    .line 97
    add-int/lit8 v0, p0, -0x11

    :try_start_7
    div-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_d} :catch_e

    return-object v0

    .line 98
    :catch_e
    move-exception v0

    .line 99
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 94
    .end local v0    # "ignored":Ljava/lang/IllegalArgumentException;
    :cond_14
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method public static getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 3
    .param p0, "versionNumber"    # I

    .line 104
    const/4 v0, 0x1

    if-lt p0, v0, :cond_e

    const/16 v0, 0x28

    if-gt p0, v0, :cond_e

    .line 107
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    add-int/lit8 v1, p0, -0x1

    aget-object v0, v0, v1

    return-object v0

    .line 105
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method buildFunctionPattern()Lcom/google/zxing/common/BitMatrix;
    .registers 11

    .line 140
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v0

    .line 141
    .local v0, "dimension":I
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 144
    .local v1, "bitMatrix":Lcom/google/zxing/common/BitMatrix;
    const/16 v2, 0x9

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v2}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 146
    add-int/lit8 v4, v0, -0x8

    const/16 v5, 0x8

    invoke-virtual {v1, v4, v3, v5, v2}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 148
    add-int/lit8 v4, v0, -0x8

    invoke-virtual {v1, v3, v4, v2, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 151
    iget-object v4, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    array-length v4, v4

    .line 152
    .local v4, "max":I
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_1f
    if-lt v5, v4, :cond_3d

    .line 164
    .end local v5    # "x":I
    add-int/lit8 v5, v0, -0x11

    const/4 v6, 0x6

    const/4 v7, 0x1

    invoke-virtual {v1, v6, v2, v7, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 166
    add-int/lit8 v5, v0, -0x11

    invoke-virtual {v1, v2, v6, v5, v7}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 168
    iget v2, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    if-le v2, v6, :cond_3c

    .line 170
    add-int/lit8 v2, v0, -0xb

    const/4 v5, 0x3

    invoke-virtual {v1, v2, v3, v5, v6}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 172
    add-int/lit8 v2, v0, -0xb

    invoke-virtual {v1, v3, v2, v6, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 175
    :cond_3c
    return-object v1

    .line 153
    .restart local v5    # "x":I
    :cond_3d
    iget-object v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v6, v6, v5

    add-int/lit8 v6, v6, -0x2

    .line 154
    .local v6, "i":I
    const/4 v7, 0x0

    .local v7, "y":I
    :goto_44
    if-lt v7, v4, :cond_49

    .line 152
    .end local v6    # "i":I
    .end local v7    # "y":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 155
    .restart local v6    # "i":I
    .restart local v7    # "y":I
    :cond_49
    if-nez v5, :cond_51

    if-eqz v7, :cond_62

    add-int/lit8 v8, v4, -0x1

    if-eq v7, v8, :cond_62

    :cond_51
    add-int/lit8 v8, v4, -0x1

    if-ne v5, v8, :cond_58

    if-nez v7, :cond_58

    .line 157
    goto :goto_62

    .line 159
    :cond_58
    iget-object v8, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v8, v8, v7

    add-int/lit8 v8, v8, -0x2

    const/4 v9, 0x5

    invoke-virtual {v1, v8, v6, v9, v9}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 154
    :cond_62
    :goto_62
    add-int/lit8 v7, v7, 0x1

    goto :goto_44
.end method

.method public getAlignmentPatternCenters()[I
    .registers 2

    .line 70
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    return-object v0
.end method

.method public getDimensionForVersion()I
    .registers 3

    .line 78
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    const/4 v1, 0x4

    mul-int/2addr v1, v0

    const/16 v0, 0x11

    add-int/2addr v0, v1

    return v0
.end method

.method public getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .registers 4
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    .line 82
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getTotalCodewords()I
    .registers 2

    .line 74
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    return v0
.end method

.method public getVersionNumber()I
    .registers 2

    .line 66
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 239
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
