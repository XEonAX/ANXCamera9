.class public Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
.super Ljava/lang/Object;
.source "SymbolInfo.java"


# static fields
.field static final PROD_SYMBOLS:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

.field private static symbols:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;


# instance fields
.field private final dataCapacity:I

.field private final dataRegions:I

.field private final errorCodewords:I

.field public final matrixHeight:I

.field public final matrixWidth:I

.field private final rectangular:Z

.field private final rsBlockData:I

.field private final rsBlockError:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 28
    const/16 v0, 0x1e

    new-array v0, v0, [Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 29
    new-instance v8, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x5

    const/16 v5, 0x8

    const/16 v6, 0x8

    const/4 v7, 0x1

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v1, 0x0

    aput-object v8, v0, v1

    .line 30
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v10, 0x0

    const/4 v11, 0x5

    const/4 v12, 0x7

    const/16 v13, 0xa

    const/16 v14, 0xa

    const/4 v15, 0x1

    move-object v9, v1

    invoke-direct/range {v9 .. v15}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 31
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/4 v5, 0x5

    const/4 v6, 0x7

    const/16 v7, 0x10

    const/4 v8, 0x6

    const/4 v9, 0x1

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 32
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0x8

    const/16 v6, 0xa

    const/16 v7, 0xc

    const/16 v8, 0xc

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 33
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/16 v5, 0xa

    const/16 v6, 0xb

    const/16 v7, 0xe

    const/4 v8, 0x6

    const/4 v9, 0x2

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 34
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0xc

    const/16 v6, 0xc

    const/16 v8, 0xe

    const/4 v9, 0x1

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 35
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/16 v5, 0x10

    const/16 v6, 0xe

    const/16 v7, 0x18

    const/16 v8, 0xa

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 37
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0x12

    const/16 v7, 0x10

    const/16 v8, 0x10

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 38
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x16

    const/16 v6, 0x12

    const/16 v7, 0x12

    const/16 v8, 0x12

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    .line 39
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/16 v7, 0x10

    const/16 v8, 0xa

    const/4 v9, 0x2

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 40
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0x1e

    const/16 v6, 0x14

    const/16 v7, 0x14

    const/16 v8, 0x14

    const/4 v9, 0x1

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    .line 41
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/16 v5, 0x20

    const/16 v6, 0x18

    const/16 v7, 0x10

    const/16 v8, 0xe

    const/4 v9, 0x2

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    .line 42
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0x24

    const/16 v7, 0x16

    const/16 v8, 0x16

    const/4 v9, 0x1

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    .line 43
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x2c

    const/16 v6, 0x1c

    const/16 v7, 0x18

    const/16 v8, 0x18

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    .line 44
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x1

    const/16 v5, 0x31

    const/16 v7, 0x16

    const/16 v8, 0xe

    const/4 v9, 0x2

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    .line 46
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/4 v4, 0x0

    const/16 v5, 0x3e

    const/16 v6, 0x24

    const/16 v7, 0xe

    const/4 v9, 0x4

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    .line 47
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x56

    const/16 v6, 0x2a

    const/16 v7, 0x10

    const/16 v8, 0x10

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    .line 48
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x72

    const/16 v6, 0x30

    const/16 v7, 0x12

    const/16 v8, 0x12

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    .line 49
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x90

    const/16 v6, 0x38

    const/16 v7, 0x14

    const/16 v8, 0x14

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    .line 50
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0xae

    const/16 v6, 0x44

    const/16 v7, 0x16

    const/16 v8, 0x16

    move-object v3, v1

    invoke-direct/range {v3 .. v9}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIII)V

    const/16 v2, 0x13

    aput-object v1, v0, v2

    .line 52
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0xcc

    const/16 v6, 0x54

    const/16 v7, 0x18

    const/16 v8, 0x18

    const/16 v10, 0x66

    const/16 v11, 0x2a

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x14

    aput-object v1, v0, v2

    .line 53
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x118

    const/16 v6, 0x70

    const/16 v7, 0xe

    const/16 v8, 0xe

    const/16 v9, 0x10

    const/16 v10, 0x8c

    const/16 v11, 0x38

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    .line 54
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x170

    const/16 v6, 0x90

    const/16 v7, 0x10

    const/16 v8, 0x10

    const/16 v10, 0x5c

    const/16 v11, 0x24

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    .line 55
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x1c8

    const/16 v6, 0xc0

    const/16 v7, 0x12

    const/16 v8, 0x12

    const/16 v10, 0x72

    const/16 v11, 0x30

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    .line 56
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x240

    const/16 v6, 0xe0

    const/16 v7, 0x14

    const/16 v8, 0x14

    const/16 v10, 0x90

    const/16 v11, 0x38

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    .line 57
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x2b8

    const/16 v6, 0x110

    const/16 v7, 0x16

    const/16 v8, 0x16

    const/16 v10, 0xae

    const/16 v11, 0x44

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x19

    aput-object v1, v0, v2

    .line 58
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x330

    const/16 v6, 0x150

    const/16 v7, 0x18

    const/16 v8, 0x18

    const/16 v10, 0x88

    const/16 v11, 0x38

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    .line 59
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x41a

    const/16 v6, 0x198

    const/16 v7, 0x12

    const/16 v8, 0x12

    const/16 v9, 0x24

    const/16 v10, 0xaf

    const/16 v11, 0x44

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    .line 60
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    const/16 v5, 0x518

    const/16 v6, 0x1f0

    const/16 v7, 0x14

    const/16 v8, 0x14

    const/16 v10, 0xa3

    const/16 v11, 0x3e

    move-object v3, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    .line 61
    new-instance v1, Lcom/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144;

    invoke-direct {v1}, Lcom/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144;-><init>()V

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    .line 28
    sput-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->PROD_SYMBOLS:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 64
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->PROD_SYMBOLS:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    sput-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->symbols:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    return-void
.end method

.method public constructor <init>(ZIIIII)V
    .locals 9
    .param p1, "rectangular"    # Z
    .param p2, "dataCapacity"    # I
    .param p3, "errorCodewords"    # I
    .param p4, "matrixWidth"    # I
    .param p5, "matrixHeight"    # I
    .param p6, "dataRegions"    # I

    .line 86
    nop

    .line 87
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;-><init>(ZIIIIIII)V

    .line 88
    return-void
.end method

.method constructor <init>(ZIIIIIII)V
    .locals 0
    .param p1, "rectangular"    # Z
    .param p2, "dataCapacity"    # I
    .param p3, "errorCodewords"    # I
    .param p4, "matrixWidth"    # I
    .param p5, "matrixHeight"    # I
    .param p6, "dataRegions"    # I
    .param p7, "rsBlockData"    # I
    .param p8, "rsBlockError"    # I

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-boolean p1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rectangular:Z

    .line 94
    iput p2, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    .line 95
    iput p3, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->errorCodewords:I

    .line 96
    iput p4, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixWidth:I

    .line 97
    iput p5, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixHeight:I

    .line 98
    iput p6, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataRegions:I

    .line 99
    iput p7, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rsBlockData:I

    .line 100
    iput p8, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rsBlockError:I

    .line 101
    return-void
.end method

.method public static lookup(I)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .locals 2
    .param p0, "dataCodewords"    # I

    .line 104
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_NONE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v0

    return-object v0
.end method

.method public static lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .locals 1
    .param p0, "dataCodewords"    # I
    .param p1, "shape"    # Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 108
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v0

    return-object v0
.end method

.method public static lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .locals 6
    .param p0, "dataCodewords"    # I
    .param p1, "shape"    # Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    .param p2, "minSize"    # Lcom/google/zxing/Dimension;
    .param p3, "maxSize"    # Lcom/google/zxing/Dimension;
    .param p4, "fail"    # Z

    .line 126
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->symbols:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_1

    .line 147
    if-nez p4, :cond_0

    .line 152
    const/4 v0, 0x0

    return-object v0

    .line 148
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can\'t find a symbol arrangement that matches the message. Data codewords: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_1
    aget-object v3, v0, v2

    .line 127
    .local v3, "symbol":Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    sget-object v4, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_SQUARE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    if-ne p1, v4, :cond_2

    iget-boolean v4, v3, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rectangular:Z

    if-eqz v4, :cond_2

    .line 128
    goto :goto_1

    .line 130
    :cond_2
    sget-object v4, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_RECTANGLE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    if-ne p1, v4, :cond_3

    iget-boolean v4, v3, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rectangular:Z

    if-nez v4, :cond_3

    .line 131
    goto :goto_1

    .line 133
    :cond_3
    if-eqz p2, :cond_4

    .line 134
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolWidth()I

    move-result v4

    invoke-virtual {p2}, Lcom/google/zxing/Dimension;->getWidth()I

    move-result v5

    if-lt v4, v5, :cond_6

    .line 135
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolHeight()I

    move-result v4

    invoke-virtual {p2}, Lcom/google/zxing/Dimension;->getHeight()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 136
    goto :goto_1

    .line 138
    :cond_4
    if-eqz p3, :cond_5

    .line 139
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolWidth()I

    move-result v4

    invoke-virtual {p3}, Lcom/google/zxing/Dimension;->getWidth()I

    move-result v5

    if-gt v4, v5, :cond_6

    .line 140
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolHeight()I

    move-result v4

    invoke-virtual {p3}, Lcom/google/zxing/Dimension;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_5

    .line 141
    goto :goto_1

    .line 143
    :cond_5
    iget v4, v3, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    if-gt p0, v4, :cond_6

    .line 144
    return-object v3

    .line 126
    .end local v3    # "symbol":Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    :cond_6
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .locals 1
    .param p0, "dataCodewords"    # I
    .param p1, "shape"    # Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    .param p2, "fail"    # Z

    .line 118
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0, p2}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v0

    return-object v0
.end method

.method public static lookup(IZZ)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .locals 2
    .param p0, "dataCodewords"    # I
    .param p1, "allowRectangular"    # Z
    .param p2, "fail"    # Z

    .line 112
    if-eqz p1, :cond_0

    .line 113
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_NONE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_SQUARE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 112
    :goto_0
    nop

    .line 114
    .local v0, "shape":Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    invoke-static {p0, v0, p2}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v1

    return-object v1
.end method

.method public static overrideSymbolSet([Lcom/google/zxing/datamatrix/encoder/SymbolInfo;)V
    .locals 0
    .param p0, "override"    # [Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 72
    sput-object p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->symbols:[Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 73
    return-void
.end method


# virtual methods
.method public getCodewordCount()I
    .locals 2

    .line 206
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->errorCodewords:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final getDataCapacity()I
    .locals 1

    .line 214
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    return v0
.end method

.method public getDataLengthForInterleavedBlock(I)I
    .locals 1
    .param p1, "index"    # I

    .line 222
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rsBlockData:I

    return v0
.end method

.method public final getErrorCodewords()I
    .locals 1

    .line 218
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->errorCodewords:I

    return v0
.end method

.method public final getErrorLengthForInterleavedBlock(I)I
    .locals 1
    .param p1, "index"    # I

    .line 226
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rsBlockError:I

    return v0
.end method

.method final getHorizontalDataRegions()I
    .locals 4

    .line 156
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataRegions:I

    const/4 v1, 0x2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_2

    const/16 v3, 0x10

    if-eq v0, v3, :cond_1

    const/16 v2, 0x24

    if-eq v0, v2, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 168
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot handle this number of data regions"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :pswitch_0
    return v1

    .line 158
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 166
    :cond_0
    const/4 v0, 0x6

    return v0

    .line 164
    :cond_1
    return v2

    .line 162
    :cond_2
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getInterleavedBlockCount()I
    .locals 2

    .line 210
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rsBlockData:I

    div-int/2addr v0, v1

    return v0
.end method

.method public final getSymbolDataHeight()I
    .locals 2

    .line 194
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getVerticalDataRegions()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixHeight:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public final getSymbolDataWidth()I
    .locals 2

    .line 190
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getHorizontalDataRegions()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixWidth:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public final getSymbolHeight()I
    .locals 2

    .line 202
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolDataHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getVerticalDataRegions()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method public final getSymbolWidth()I
    .locals 2

    .line 198
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolDataWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getHorizontalDataRegions()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method final getVerticalDataRegions()I
    .locals 3

    .line 173
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataRegions:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/16 v2, 0x10

    if-eq v0, v2, :cond_1

    const/16 v1, 0x24

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    .line 185
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot handle this number of data regions"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :pswitch_0
    return v1

    .line 175
    :pswitch_1
    return v1

    .line 183
    :cond_0
    const/4 v0, 0x6

    return v0

    .line 181
    :cond_1
    return v1

    .line 179
    :cond_2
    const/4 v0, 0x2

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->rectangular:Z

    if-eqz v1, :cond_0

    const-string v1, "Rectangular Symbol:"

    goto :goto_0

    :cond_0
    const-string v1, "Square Symbol:"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    const-string v1, " data region "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->matrixHeight:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    const-string v2, ", symbol size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolHeight()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    const-string v2, ", symbol data size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolDataWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getSymbolDataHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    const-string v1, ", codewords "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->dataCapacity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->errorCodewords:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
