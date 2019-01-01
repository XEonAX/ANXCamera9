.class final Lcom/google/zxing/qrcode/encoder/MatrixUtil;
.super Ljava/lang/Object;
.source "MatrixUtil.java"


# static fields
.field private static final POSITION_ADJUSTMENT_PATTERN:[[I

.field private static final POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

.field private static final POSITION_DETECTION_PATTERN:[[I

.field private static final TYPE_INFO_COORDINATES:[[I

.field private static final TYPE_INFO_MASK_PATTERN:I = 0x5412

.field private static final TYPE_INFO_POLY:I = 0x537

.field private static final VERSION_INFO_POLY:I = 0x1f25


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 34
    const/4 v0, 0x7

    new-array v1, v0, [[I

    .line 35
    new-array v2, v0, [I

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 36
    new-array v2, v0, [I

    const/4 v4, 0x1

    aput v4, v2, v3

    const/4 v5, 0x6

    aput v4, v2, v5

    aput-object v2, v1, v4

    .line 37
    new-array v2, v0, [I

    aput v4, v2, v3

    const/4 v6, 0x2

    aput v4, v2, v6

    const/4 v7, 0x3

    aput v4, v2, v7

    const/4 v8, 0x4

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v6

    .line 38
    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v7

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v7

    .line 39
    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v7

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v8

    .line 40
    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v5

    const/4 v9, 0x5

    aput-object v2, v1, v9

    .line 41
    new-array v2, v0, [I

    fill-array-data v2, :array_1

    aput-object v2, v1, v5

    .line 34
    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    .line 44
    new-array v1, v9, [[I

    .line 45
    new-array v2, v9, [I

    fill-array-data v2, :array_2

    aput-object v2, v1, v3

    .line 46
    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v8

    aput-object v2, v1, v4

    .line 47
    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v8

    aput-object v2, v1, v6

    .line 48
    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v8

    aput-object v2, v1, v7

    .line 49
    new-array v2, v9, [I

    fill-array-data v2, :array_3

    aput-object v2, v1, v8

    .line 44
    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    .line 53
    const/16 v1, 0x28

    new-array v1, v1, [[I

    .line 54
    new-array v2, v0, [I

    fill-array-data v2, :array_4

    aput-object v2, v1, v3

    .line 55
    new-array v2, v0, [I

    fill-array-data v2, :array_5

    aput-object v2, v1, v4

    .line 56
    new-array v2, v0, [I

    fill-array-data v2, :array_6

    aput-object v2, v1, v6

    .line 57
    new-array v2, v0, [I

    fill-array-data v2, :array_7

    aput-object v2, v1, v7

    .line 58
    new-array v2, v0, [I

    fill-array-data v2, :array_8

    aput-object v2, v1, v8

    .line 59
    new-array v2, v0, [I

    fill-array-data v2, :array_9

    aput-object v2, v1, v9

    .line 60
    new-array v2, v0, [I

    fill-array-data v2, :array_a

    aput-object v2, v1, v5

    .line 61
    new-array v2, v0, [I

    fill-array-data v2, :array_b

    aput-object v2, v1, v0

    .line 62
    new-array v2, v0, [I

    fill-array-data v2, :array_c

    const/16 v10, 0x8

    aput-object v2, v1, v10

    .line 63
    new-array v2, v0, [I

    fill-array-data v2, :array_d

    const/16 v11, 0x9

    aput-object v2, v1, v11

    .line 64
    new-array v2, v0, [I

    fill-array-data v2, :array_e

    const/16 v12, 0xa

    aput-object v2, v1, v12

    .line 65
    new-array v2, v0, [I

    fill-array-data v2, :array_f

    const/16 v13, 0xb

    aput-object v2, v1, v13

    .line 66
    new-array v2, v0, [I

    fill-array-data v2, :array_10

    const/16 v14, 0xc

    aput-object v2, v1, v14

    .line 67
    new-array v2, v0, [I

    fill-array-data v2, :array_11

    const/16 v15, 0xd

    aput-object v2, v1, v15

    .line 68
    new-array v2, v0, [I

    fill-array-data v2, :array_12

    const/16 v16, 0xe

    aput-object v2, v1, v16

    .line 69
    new-array v2, v0, [I

    fill-array-data v2, :array_13

    const/16 v17, 0xf

    aput-object v2, v1, v17

    .line 70
    new-array v2, v0, [I

    fill-array-data v2, :array_14

    const/16 v17, 0x10

    aput-object v2, v1, v17

    .line 71
    new-array v2, v0, [I

    fill-array-data v2, :array_15

    const/16 v17, 0x11

    aput-object v2, v1, v17

    .line 72
    new-array v2, v0, [I

    fill-array-data v2, :array_16

    const/16 v17, 0x12

    aput-object v2, v1, v17

    .line 73
    new-array v2, v0, [I

    fill-array-data v2, :array_17

    const/16 v17, 0x13

    aput-object v2, v1, v17

    .line 74
    new-array v2, v0, [I

    fill-array-data v2, :array_18

    const/16 v17, 0x14

    aput-object v2, v1, v17

    .line 75
    new-array v2, v0, [I

    fill-array-data v2, :array_19

    const/16 v17, 0x15

    aput-object v2, v1, v17

    .line 76
    new-array v2, v0, [I

    fill-array-data v2, :array_1a

    const/16 v17, 0x16

    aput-object v2, v1, v17

    .line 77
    new-array v2, v0, [I

    fill-array-data v2, :array_1b

    const/16 v17, 0x17

    aput-object v2, v1, v17

    .line 78
    new-array v2, v0, [I

    fill-array-data v2, :array_1c

    const/16 v17, 0x18

    aput-object v2, v1, v17

    .line 79
    new-array v2, v0, [I

    fill-array-data v2, :array_1d

    const/16 v17, 0x19

    aput-object v2, v1, v17

    .line 80
    new-array v2, v0, [I

    fill-array-data v2, :array_1e

    const/16 v17, 0x1a

    aput-object v2, v1, v17

    .line 81
    new-array v2, v0, [I

    fill-array-data v2, :array_1f

    const/16 v17, 0x1b

    aput-object v2, v1, v17

    .line 82
    new-array v2, v0, [I

    fill-array-data v2, :array_20

    const/16 v17, 0x1c

    aput-object v2, v1, v17

    .line 83
    new-array v2, v0, [I

    fill-array-data v2, :array_21

    const/16 v17, 0x1d

    aput-object v2, v1, v17

    .line 84
    new-array v2, v0, [I

    fill-array-data v2, :array_22

    const/16 v17, 0x1e

    aput-object v2, v1, v17

    .line 85
    new-array v2, v0, [I

    fill-array-data v2, :array_23

    const/16 v17, 0x1f

    aput-object v2, v1, v17

    .line 86
    new-array v2, v0, [I

    fill-array-data v2, :array_24

    const/16 v17, 0x20

    aput-object v2, v1, v17

    .line 87
    new-array v2, v0, [I

    fill-array-data v2, :array_25

    const/16 v17, 0x21

    aput-object v2, v1, v17

    .line 88
    new-array v2, v0, [I

    fill-array-data v2, :array_26

    const/16 v17, 0x22

    aput-object v2, v1, v17

    .line 89
    new-array v2, v0, [I

    fill-array-data v2, :array_27

    const/16 v17, 0x23

    aput-object v2, v1, v17

    .line 90
    new-array v2, v0, [I

    fill-array-data v2, :array_28

    const/16 v17, 0x24

    aput-object v2, v1, v17

    .line 91
    new-array v2, v0, [I

    fill-array-data v2, :array_29

    const/16 v17, 0x25

    aput-object v2, v1, v17

    .line 92
    new-array v2, v0, [I

    fill-array-data v2, :array_2a

    const/16 v17, 0x26

    aput-object v2, v1, v17

    .line 93
    new-array v2, v0, [I

    fill-array-data v2, :array_2b

    const/16 v17, 0x27

    aput-object v2, v1, v17

    .line 53
    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    .line 97
    const/16 v1, 0xf

    new-array v1, v1, [[I

    .line 98
    new-array v2, v6, [I

    aput v10, v2, v3

    aput-object v2, v1, v3

    .line 99
    new-array v2, v6, [I

    fill-array-data v2, :array_2c

    aput-object v2, v1, v4

    .line 100
    new-array v2, v6, [I

    fill-array-data v2, :array_2d

    aput-object v2, v1, v6

    .line 101
    new-array v2, v6, [I

    fill-array-data v2, :array_2e

    aput-object v2, v1, v7

    .line 102
    new-array v2, v6, [I

    fill-array-data v2, :array_2f

    aput-object v2, v1, v8

    .line 103
    new-array v2, v6, [I

    fill-array-data v2, :array_30

    aput-object v2, v1, v9

    .line 104
    new-array v2, v6, [I

    fill-array-data v2, :array_31

    aput-object v2, v1, v5

    .line 105
    new-array v2, v6, [I

    fill-array-data v2, :array_32

    aput-object v2, v1, v0

    .line 106
    new-array v0, v6, [I

    fill-array-data v0, :array_33

    aput-object v0, v1, v10

    .line 107
    new-array v0, v6, [I

    fill-array-data v0, :array_34

    aput-object v0, v1, v11

    .line 108
    new-array v0, v6, [I

    fill-array-data v0, :array_35

    aput-object v0, v1, v12

    .line 109
    new-array v0, v6, [I

    fill-array-data v0, :array_36

    aput-object v0, v1, v13

    .line 110
    new-array v0, v6, [I

    fill-array-data v0, :array_37

    aput-object v0, v1, v14

    .line 111
    new-array v0, v6, [I

    fill-array-data v0, :array_38

    aput-object v0, v1, v15

    .line 112
    new-array v0, v6, [I

    aput v10, v0, v4

    aput-object v0, v1, v16

    .line 97
    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    .line 120
    return-void

    :array_0
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_2
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_3
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_4
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_5
    .array-data 4
        0x6
        0x12
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_6
    .array-data 4
        0x6
        0x16
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_7
    .array-data 4
        0x6
        0x1a
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_8
    .array-data 4
        0x6
        0x1e
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_9
    .array-data 4
        0x6
        0x22
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_a
    .array-data 4
        0x6
        0x16
        0x26
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_b
    .array-data 4
        0x6
        0x18
        0x2a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_c
    .array-data 4
        0x6
        0x1a
        0x2e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_d
    .array-data 4
        0x6
        0x1c
        0x32
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_e
    .array-data 4
        0x6
        0x1e
        0x36
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_f
    .array-data 4
        0x6
        0x20
        0x3a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_10
    .array-data 4
        0x6
        0x22
        0x3e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_11
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_12
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_13
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_14
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_15
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_16
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_17
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_18
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
        -0x1
        -0x1
    .end array-data

    :array_19
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        -0x1
        -0x1
    .end array-data

    :array_1a
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        -0x1
        -0x1
    .end array-data

    :array_1b
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        -0x1
        -0x1
    .end array-data

    :array_1c
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        -0x1
        -0x1
    .end array-data

    :array_1d
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        -0x1
        -0x1
    .end array-data

    :array_1e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        -0x1
        -0x1
    .end array-data

    :array_1f
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
        -0x1
    .end array-data

    :array_20
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        -0x1
    .end array-data

    :array_21
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
        -0x1
    .end array-data

    :array_22
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
        -0x1
    .end array-data

    :array_23
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
        -0x1
    .end array-data

    :array_24
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        -0x1
    .end array-data

    :array_25
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
        -0x1
    .end array-data

    :array_26
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    :array_27
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    :array_28
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    :array_29
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    :array_2a
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    :array_2b
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data

    :array_2c
    .array-data 4
        0x8
        0x1
    .end array-data

    :array_2d
    .array-data 4
        0x8
        0x2
    .end array-data

    :array_2e
    .array-data 4
        0x8
        0x3
    .end array-data

    :array_2f
    .array-data 4
        0x8
        0x4
    .end array-data

    :array_30
    .array-data 4
        0x8
        0x5
    .end array-data

    :array_31
    .array-data 4
        0x8
        0x7
    .end array-data

    :array_32
    .array-data 4
        0x8
        0x8
    .end array-data

    :array_33
    .array-data 4
        0x7
        0x8
    .end array-data

    :array_34
    .array-data 4
        0x5
        0x8
    .end array-data

    :array_35
    .array-data 4
        0x4
        0x8
    .end array-data

    :array_36
    .array-data 4
        0x3
        0x8
    .end array-data

    :array_37
    .array-data 4
        0x2
        0x8
    .end array-data

    :array_38
    .array-data 4
        0x1
        0x8
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method static buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 0
    .param p0, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p2, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p3, "maskPattern"    # I
    .param p4, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 137
    invoke-static {p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 138
    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedBasicPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 140
    invoke-static {p1, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 142
    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedVersionInfo(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 144
    invoke-static {p0, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 145
    return-void
.end method

.method static calculateBCHCode(II)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "poly"    # I

    .line 308
    if-eqz p1, :cond_1

    .line 313
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v0

    .line 314
    .local v0, "msbSetInPoly":I
    add-int/lit8 v1, v0, -0x1

    shl-int/2addr p0, v1

    .line 316
    :goto_0
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    if-ge v1, v0, :cond_0

    .line 320
    return p0

    .line 317
    :cond_0
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    sub-int/2addr v1, v0

    shl-int v1, p1, v1

    xor-int/2addr p0, v1

    goto :goto_0

    .line 309
    .end local v0    # "msbSetInPoly":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "0 polynomial"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 1
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 127
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->clear(B)V

    .line 128
    return-void
.end method

.method static embedBasicPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 0
    .param p0, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 155
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 157
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 160
    invoke-static {p0, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedPositionAdjustmentPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 162
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 163
    return-void
.end method

.method private static embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 3
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 381
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    const/16 v1, 0x8

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v0

    if-eqz v0, :cond_0

    .line 384
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 385
    return-void

    .line 382
    :cond_0
    new-instance v0, Lcom/google/zxing/WriterException;

    invoke-direct {v0}, Lcom/google/zxing/WriterException;-><init>()V

    throw v0
.end method

.method static embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 10
    .param p0, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "maskPattern"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 223
    const/4 v0, 0x0

    .line 224
    .local v0, "bitIndex":I
    const/4 v1, -0x1

    .line 226
    .local v1, "direction":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 227
    .local v2, "x":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    sub-int/2addr v4, v3

    .line 228
    .local v4, "y":I
    :goto_0
    if-gtz v2, :cond_1

    .line 263
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-ne v0, v3, :cond_0

    .line 266
    return-void

    .line 264
    :cond_0
    new-instance v3, Lcom/google/zxing/WriterException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Not all bits consumed: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 230
    :cond_1
    const/4 v5, 0x6

    if-ne v2, v5, :cond_2

    .line 231
    add-int/lit8 v2, v2, -0x1

    .line 233
    :cond_2
    :goto_1
    if-ltz v4, :cond_9

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    if-lt v4, v5, :cond_3

    goto :goto_6

    .line 234
    :cond_3
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    const/4 v6, 0x2

    if-lt v5, v6, :cond_4

    .line 256
    .end local v5    # "i":I
    add-int/2addr v4, v1

    goto :goto_1

    .line 235
    .restart local v5    # "i":I
    :cond_4
    sub-int v6, v2, v5

    .line 237
    .local v6, "xx":I
    invoke-virtual {p2, v6, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-nez v7, :cond_5

    .line 238
    goto :goto_5

    .line 241
    :cond_5
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    const/4 v8, 0x0

    if-ge v0, v7, :cond_6

    .line 242
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    .line 243
    .local v7, "bit":Z
    add-int/lit8 v0, v0, 0x1

    .line 244
    goto :goto_3

    .line 247
    .end local v7    # "bit":Z
    :cond_6
    move v7, v8

    .line 251
    .restart local v7    # "bit":Z
    :goto_3
    const/4 v9, -0x1

    if-eq p1, v9, :cond_8

    invoke-static {p1, v6, v4}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->getDataMaskBit(III)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 252
    if-eqz v7, :cond_7

    goto :goto_4

    :cond_7
    move v8, v3

    :goto_4
    move v7, v8

    .line 254
    :cond_8
    invoke-virtual {p2, v6, v4, v7}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 234
    .end local v6    # "xx":I
    .end local v7    # "bit":Z
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 258
    .end local v5    # "i":I
    :cond_9
    :goto_6
    neg-int v1, v1

    .line 259
    add-int/2addr v4, v1

    .line 260
    add-int/lit8 v2, v2, -0x2

    goto :goto_0
.end method

.method private static embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 3
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 390
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_0
    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 396
    .end local v0    # "x":I
    return-void

    .line 391
    .restart local v0    # "x":I
    :cond_0
    add-int v1, p0, v0

    invoke-virtual {p2, v1, p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 394
    add-int v1, p0, v0

    const/4 v2, 0x0

    invoke-virtual {p2, v1, p1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 390
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 392
    :cond_1
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1
.end method

.method private static embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 413
    const/4 v0, 0x0

    .local v0, "y":I
    :goto_0
    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 418
    .end local v0    # "y":I
    return-void

    .line 414
    .restart local v0    # "y":I
    :cond_0
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_1
    if-lt v2, v1, :cond_1

    .line 413
    .end local v2    # "x":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 415
    .restart local v2    # "x":I
    :cond_1
    add-int v3, p0, v2

    add-int v4, p1, v0

    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    aget-object v5, v5, v0

    aget v5, v5, v2

    invoke-virtual {p2, v3, v4, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 414
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private static embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 421
    const/4 v0, 0x0

    .local v0, "y":I
    :goto_0
    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 426
    .end local v0    # "y":I
    return-void

    .line 422
    .restart local v0    # "y":I
    :cond_0
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_1
    if-lt v2, v1, :cond_1

    .line 421
    .end local v2    # "x":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 423
    .restart local v2    # "x":I
    :cond_1
    add-int v3, p0, v2

    add-int v4, p1, v0

    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    aget-object v5, v5, v0

    aget v5, v5, v2

    invoke-virtual {p2, v3, v4, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 422
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private static embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 5
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 431
    sget-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    const/4 v1, 0x0

    aget-object v0, v0, v1

    array-length v0, v0

    .line 433
    .local v0, "pdpWidth":I
    invoke-static {v1, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 435
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-static {v2, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 437
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-static {v1, v2, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 440
    const/16 v2, 0x8

    .line 442
    .local v2, "hspWidth":I
    add-int/lit8 v3, v2, -0x1

    invoke-static {v1, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 444
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    .line 445
    add-int/lit8 v4, v2, -0x1

    .line 444
    invoke-static {v3, v4, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 447
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v1, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 450
    const/4 v3, 0x7

    .line 452
    .local v3, "vspSize":I
    invoke-static {v3, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 454
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    sub-int/2addr v4, v3

    add-int/lit8 v4, v4, -0x1

    invoke-static {v4, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 456
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v1

    sub-int/2addr v1, v3

    .line 457
    nop

    .line 456
    invoke-static {v3, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 458
    return-void
.end method

.method private static embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 4
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 366
    const/16 v0, 0x8

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x8

    if-lt v0, v1, :cond_0

    .line 377
    .end local v0    # "i":I
    return-void

    .line 367
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v1, v0, 0x1

    rem-int/lit8 v1, v1, 0x2

    .line 369
    .local v1, "bit":I
    const/4 v2, 0x6

    invoke-virtual {p0, v0, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 370
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 373
    :cond_1
    invoke-virtual {p0, v2, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 374
    invoke-virtual {p0, v2, v0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 366
    .end local v1    # "bit":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 8
    .param p0, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p1, "maskPattern"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 168
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 169
    .local v0, "typeInfoBits":Lcom/google/zxing/common/BitArray;
    invoke-static {p0, p1, v0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V

    .line 171
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 193
    .end local v1    # "i":I
    return-void

    .line 174
    .restart local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    .line 177
    .local v2, "bit":Z
    sget-object v4, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v4, v4, v1

    const/4 v5, 0x0

    aget v4, v4, v5

    .line 178
    .local v4, "x1":I
    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v5, v5, v1

    aget v5, v5, v3

    .line 179
    .local v5, "y1":I
    invoke-virtual {p2, v4, v5, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 181
    const/16 v6, 0x8

    if-ge v1, v6, :cond_1

    .line 183
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v6

    sub-int/2addr v6, v1

    sub-int/2addr v6, v3

    .line 184
    .local v6, "x2":I
    const/16 v3, 0x8

    .line 185
    .local v3, "y2":I
    invoke-virtual {p2, v6, v3, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 186
    .end local v3    # "y2":I
    .end local v6    # "x2":I
    goto :goto_1

    .line 188
    :cond_1
    const/16 v3, 0x8

    .line 189
    .local v3, "x2":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v6

    add-int/lit8 v6, v6, -0x7

    add-int/lit8 v7, v1, -0x8

    add-int/2addr v6, v7

    .line 190
    .local v6, "y2":I
    invoke-virtual {p2, v3, v6, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 171
    .end local v2    # "bit":Z
    .end local v3    # "x2":I
    .end local v4    # "x1":I
    .end local v5    # "y1":I
    .end local v6    # "y2":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 3
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 401
    const/4 v0, 0x0

    .local v0, "y":I
    :goto_0
    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 407
    .end local v0    # "y":I
    return-void

    .line 402
    .restart local v0    # "y":I
    :cond_0
    add-int v1, p1, v0

    invoke-virtual {p2, p0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 405
    add-int v1, p1, v0

    const/4 v2, 0x0

    invoke-virtual {p2, p0, v1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 401
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 403
    :cond_1
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1
.end method

.method static findMSBSet(I)I
    .locals 1
    .param p0, "value"    # I

    .line 274
    const/4 v0, 0x0

    .line 275
    .local v0, "numDigits":I
    :goto_0
    if-nez p0, :cond_0

    .line 279
    return v0

    .line 276
    :cond_0
    ushr-int/lit8 p0, p0, 0x1

    .line 277
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static isEmpty(I)Z
    .locals 1
    .param p0, "value"    # I

    .line 360
    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V
    .locals 6
    .param p0, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p1, "maskPattern"    # I
    .param p2, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 328
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/QRCode;->isValidMaskPattern(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 331
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->getBits()I

    move-result v0

    shl-int/lit8 v0, v0, 0x3

    or-int/2addr v0, p1

    .line 332
    .local v0, "typeInfo":I
    const/4 v1, 0x5

    invoke-virtual {p2, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 334
    const/16 v1, 0x537

    invoke-static {v0, v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v1

    .line 335
    .local v1, "bchCode":I
    const/16 v2, 0xa

    invoke-virtual {p2, v1, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 337
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 338
    .local v2, "maskBits":Lcom/google/zxing/common/BitArray;
    const/16 v3, 0x5412

    const/16 v4, 0xf

    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 339
    invoke-virtual {p2, v2}, Lcom/google/zxing/common/BitArray;->xor(Lcom/google/zxing/common/BitArray;)V

    .line 341
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-ne v3, v4, :cond_0

    .line 344
    return-void

    .line 342
    :cond_0
    new-instance v3, Lcom/google/zxing/WriterException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "should not happen but we got: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 329
    .end local v0    # "typeInfo":I
    .end local v1    # "bchCode":I
    .end local v2    # "maskBits":Lcom/google/zxing/common/BitArray;
    :cond_1
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Invalid mask pattern"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static makeVersionInfoBits(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/common/BitArray;)V
    .locals 4
    .param p0, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 349
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x6

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 350
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/16 v1, 0x1f25

    invoke-static {v0, v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v0

    .line 351
    .local v0, "bchCode":I
    const/16 v1, 0xc

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 353
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    const/16 v2, 0x12

    if-ne v1, v2, :cond_0

    .line 356
    return-void

    .line 354
    :cond_0
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "should not happen but we got: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static maybeEmbedPositionAdjustmentPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 9
    .param p0, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 462
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 463
    return-void

    .line 465
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 466
    .local v0, "index":I
    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v1, v1, v0

    .line 467
    .local v1, "coordinates":[I
    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v2, v2, v0

    array-length v2, v2

    .line 468
    .local v2, "numCoordinates":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v2, :cond_1

    .line 483
    .end local v3    # "i":I
    return-void

    .line 469
    .restart local v3    # "i":I
    :cond_1
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    if-lt v4, v2, :cond_2

    .line 468
    .end local v4    # "j":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 470
    .restart local v4    # "j":I
    :cond_2
    aget v5, v1, v3

    .line 471
    .local v5, "y":I
    aget v6, v1, v4

    .line 472
    .local v6, "x":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_4

    if-ne v5, v7, :cond_3

    .line 473
    goto :goto_2

    .line 476
    :cond_3
    invoke-virtual {p1, v6, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 479
    add-int/lit8 v7, v6, -0x2

    add-int/lit8 v8, v5, -0x2

    invoke-static {v7, v8, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 469
    .end local v5    # "y":I
    .end local v6    # "x":I
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method static maybeEmbedVersionInfo(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 198
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x7

    if-ge v0, v1, :cond_0

    .line 199
    return-void

    .line 201
    :cond_0
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 202
    .local v0, "versionInfoBits":Lcom/google/zxing/common/BitArray;
    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeVersionInfoBits(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/common/BitArray;)V

    .line 204
    const/16 v1, 0x11

    .line 205
    .local v1, "bitIndex":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x6

    if-lt v2, v3, :cond_1

    .line 216
    .end local v2    # "i":I
    return-void

    .line 206
    .restart local v2    # "i":I
    :cond_1
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    const/4 v4, 0x3

    if-lt v3, v4, :cond_2

    .line 205
    .end local v3    # "j":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 208
    .restart local v3    # "j":I
    :cond_2
    invoke-virtual {v0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v4

    .line 209
    .local v4, "bit":Z
    add-int/lit8 v1, v1, -0x1

    .line 211
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v2, v5, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 213
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v5, v2, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 206
    .end local v4    # "bit":Z
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
