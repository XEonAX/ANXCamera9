.class public final Lcom/google/zxing/oned/ITFWriter;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "ITFWriter.java"


# static fields
.field private static final END_PATTERN:[I

.field private static final START_PATTERN:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_12

    sput-object v0, Lcom/google/zxing/oned/ITFWriter;->START_PATTERN:[I

    .line 34
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_1e

    sput-object v0, Lcom/google/zxing/oned/ITFWriter;->END_PATTERN:[I

    return-void

    nop

    :array_12
    .array-data 4
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_1e
    .array-data 4
        0x3
        0x1
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 9
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 42
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_9

    .line 46
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0

    .line 43
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode ITF, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)[Z
    .registers 14
    .param p1, "contents"    # Ljava/lang/String;

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 52
    .local v0, "length":I
    rem-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_74

    .line 55
    const/16 v1, 0x50

    if-gt v0, v1, :cond_60

    .line 59
    const/16 v1, 0x9

    mul-int v2, v1, v0

    add-int/2addr v1, v2

    new-array v1, v1, [Z

    .line 60
    .local v1, "result":[Z
    const/4 v2, 0x0

    sget-object v3, Lcom/google/zxing/oned/ITFWriter;->START_PATTERN:[I

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([ZI[IZ)I

    move-result v2

    .line 61
    .local v2, "pos":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    if-lt v3, v0, :cond_24

    .line 71
    .end local v3    # "i":I
    sget-object v3, Lcom/google/zxing/oned/ITFWriter;->END_PATTERN:[I

    invoke-static {v1, v2, v3, v4}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([ZI[IZ)I

    .line 73
    return-object v1

    .line 62
    .restart local v3    # "i":I
    :cond_24
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xa

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    .line 63
    .local v5, "one":I
    add-int/lit8 v7, v3, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    .line 64
    .local v6, "two":I
    const/16 v7, 0x12

    new-array v7, v7, [I

    .line 65
    .local v7, "encoding":[I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_3d
    const/4 v9, 0x5

    if-lt v8, v9, :cond_48

    .line 69
    .end local v8    # "j":I
    invoke-static {v1, v2, v7, v4}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([ZI[IZ)I

    move-result v8

    add-int/2addr v2, v8

    .line 61
    .end local v5    # "one":I
    .end local v6    # "two":I
    .end local v7    # "encoding":[I
    add-int/lit8 v3, v3, 0x2

    goto :goto_1c

    .line 66
    .restart local v5    # "one":I
    .restart local v6    # "two":I
    .restart local v7    # "encoding":[I
    .restart local v8    # "j":I
    :cond_48
    const/4 v9, 0x2

    mul-int v10, v9, v8

    sget-object v11, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v11, v11, v5

    aget v11, v11, v8

    aput v11, v7, v10

    .line 67
    mul-int/2addr v9, v8

    add-int/2addr v9, v4

    sget-object v10, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v10, v10, v6

    aget v10, v10, v8

    aput v10, v7, v9

    .line 65
    add-int/lit8 v8, v8, 0x1

    goto :goto_3d

    .line 56
    .end local v1    # "result":[Z
    .end local v2    # "pos":I
    .end local v3    # "i":I
    .end local v5    # "one":I
    .end local v6    # "two":I
    .end local v7    # "encoding":[I
    .end local v8    # "j":I
    :cond_60
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Requested contents should be less than 80 digits long, but got "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 56
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 53
    :cond_74
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The lenght of the input should be even"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
