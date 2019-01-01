.class public final Lcom/google/zxing/aztec/encoder/HighLevelEncoder;
.super Ljava/lang/Object;
.source "HighLevelEncoder.java"


# static fields
.field private static final CHAR_MAP:[[I

.field static final LATCH_TABLE:[[I

.field static final MODE_DIGIT:I = 0x2

.field static final MODE_LOWER:I = 0x1

.field static final MODE_MIXED:I = 0x3

.field static final MODE_NAMES:[Ljava/lang/String;

.field static final MODE_PUNCT:I = 0x4

.field static final MODE_UPPER:I

.field static final SHIFT_TABLE:[[I


# instance fields
.field private final text:[B


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 43
    const-string v0, "UPPER"

    const-string v1, "LOWER"

    const-string v2, "DIGIT"

    const-string v3, "MIXED"

    const-string v4, "PUNCT"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->MODE_NAMES:[Ljava/lang/String;

    .line 56
    const/4 v0, 0x5

    new-array v1, v0, [[I

    .line 57
    new-array v2, v0, [I

    .line 59
    const/4 v3, 0x1

    const v4, 0x5001c

    aput v4, v2, v3

    .line 60
    const v4, 0x5001e

    const/4 v5, 0x2

    aput v4, v2, v5

    .line 61
    const v6, 0x5001d

    const/4 v7, 0x3

    aput v6, v2, v7

    .line 62
    const v8, 0xa03be

    const/4 v9, 0x4

    aput v8, v2, v9

    const/4 v10, 0x0

    aput-object v2, v1, v10

    .line 64
    new-array v2, v0, [I

    .line 65
    const v11, 0x901ee

    aput v11, v2, v10

    .line 67
    aput v4, v2, v5

    .line 68
    aput v6, v2, v7

    .line 69
    aput v8, v2, v9

    aput-object v2, v1, v3

    .line 71
    new-array v2, v0, [I

    .line 72
    const v11, 0x4000e

    aput v11, v2, v10

    .line 73
    const v11, 0x901dc

    aput v11, v2, v3

    .line 75
    const v11, 0x901dd

    aput v11, v2, v7

    .line 76
    const v11, 0xe3bbe

    aput v11, v2, v9

    aput-object v2, v1, v5

    .line 79
    new-array v2, v0, [I

    .line 80
    aput v6, v2, v10

    .line 81
    const v6, 0x5001c

    aput v6, v2, v3

    .line 82
    aput v8, v2, v5

    .line 84
    aput v4, v2, v9

    aput-object v2, v1, v7

    .line 86
    new-array v2, v0, [I

    .line 87
    const v4, 0x5001f

    aput v4, v2, v10

    .line 88
    const v4, 0xa03fc

    aput v4, v2, v3

    .line 89
    const v4, 0xa03fe

    aput v4, v2, v5

    .line 90
    const v4, 0xa03fd

    aput v4, v2, v7

    aput-object v2, v1, v9

    .line 56
    sput-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->LATCH_TABLE:[[I

    .line 97
    const/16 v1, 0x100

    filled-new-array {v0, v1}, [I

    move-result-object v1

    const-class v2, I

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    sput-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    .line 99
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v10

    const/16 v2, 0x20

    aput v3, v1, v2

    .line 100
    const/16 v1, 0x41

    .local v1, "c":I
    :goto_0
    const/16 v4, 0x5a

    if-le v1, v4, :cond_6

    .line 103
    .end local v1    # "c":I
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v3

    aput v3, v1, v2

    .line 104
    const/16 v1, 0x61

    .restart local v1    # "c":I
    :goto_1
    const/16 v4, 0x7a

    if-le v1, v4, :cond_5

    .line 107
    .end local v1    # "c":I
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    aput v3, v1, v2

    .line 108
    const/16 v1, 0x30

    .restart local v1    # "c":I
    :goto_2
    const/16 v4, 0x39

    if-le v1, v4, :cond_4

    .line 111
    .end local v1    # "c":I
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    const/16 v4, 0x2c

    const/16 v6, 0xc

    aput v6, v1, v4

    .line 112
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    const/16 v4, 0x2e

    const/16 v8, 0xd

    aput v8, v1, v4

    .line 113
    const/16 v4, 0x1c

    new-array v1, v4, [I

    .line 114
    aput v2, v1, v3

    aput v3, v1, v5

    aput v5, v1, v7

    aput v7, v1, v9

    aput v9, v1, v0

    const/4 v11, 0x6

    aput v0, v1, v11

    const/4 v12, 0x7

    aput v11, v1, v12

    const/16 v0, 0x8

    aput v12, v1, v0

    const/16 v0, 0x9

    const/16 v2, 0x8

    aput v2, v1, v0

    const/16 v0, 0xa

    const/16 v2, 0x9

    aput v2, v1, v0

    const/16 v0, 0xb

    const/16 v2, 0xa

    aput v2, v1, v0

    .line 115
    aput v0, v1, v6

    aput v6, v1, v8

    const/16 v0, 0xe

    aput v8, v1, v0

    const/16 v0, 0xf

    const/16 v2, 0x1b

    aput v2, v1, v0

    const/16 v0, 0x10

    aput v4, v1, v0

    const/16 v0, 0x11

    const/16 v2, 0x1d

    aput v2, v1, v0

    const/16 v0, 0x12

    const/16 v2, 0x1e

    aput v2, v1, v0

    const/16 v0, 0x13

    const/16 v2, 0x1f

    aput v2, v1, v0

    const/16 v0, 0x14

    const/16 v2, 0x40

    aput v2, v1, v0

    const/16 v0, 0x15

    const/16 v2, 0x5c

    aput v2, v1, v0

    const/16 v0, 0x16

    const/16 v2, 0x5e

    aput v2, v1, v0

    const/16 v0, 0x17

    .line 116
    const/16 v2, 0x5f

    aput v2, v1, v0

    const/16 v0, 0x18

    const/16 v2, 0x60

    aput v2, v1, v0

    const/16 v0, 0x19

    const/16 v2, 0x7c

    aput v2, v1, v0

    const/16 v0, 0x1a

    const/16 v2, 0x7e

    aput v2, v1, v0

    const/16 v0, 0x1b

    const/16 v2, 0x7f

    aput v2, v1, v0

    .line 113
    move-object v13, v1

    .line 118
    .local v13, "mixedTable":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v1, v13

    if-lt v0, v1, :cond_3

    .line 121
    .end local v0    # "i":I
    const/16 v0, 0x1f

    new-array v0, v0, [I

    .line 122
    aput v8, v0, v3

    const/16 v1, 0x21

    aput v1, v0, v11

    const/16 v1, 0x27

    aput v1, v0, v12

    const/16 v1, 0x8

    const/16 v2, 0x23

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x24

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x25

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0x26

    aput v2, v0, v1

    const/16 v1, 0x27

    aput v1, v0, v6

    .line 123
    const/16 v1, 0x28

    aput v1, v0, v8

    const/16 v1, 0xe

    const/16 v2, 0x29

    aput v2, v0, v1

    const/16 v1, 0xf

    const/16 v2, 0x2a

    aput v2, v0, v1

    const/16 v1, 0x10

    const/16 v2, 0x2b

    aput v2, v0, v1

    const/16 v1, 0x11

    const/16 v2, 0x2c

    aput v2, v0, v1

    const/16 v1, 0x12

    const/16 v2, 0x2d

    aput v2, v0, v1

    const/16 v1, 0x13

    const/16 v2, 0x2e

    aput v2, v0, v1

    const/16 v1, 0x14

    const/16 v2, 0x2f

    aput v2, v0, v1

    const/16 v1, 0x15

    const/16 v2, 0x3a

    aput v2, v0, v1

    const/16 v1, 0x16

    const/16 v2, 0x3b

    aput v2, v0, v1

    const/16 v1, 0x17

    const/16 v2, 0x3c

    aput v2, v0, v1

    const/16 v1, 0x18

    const/16 v2, 0x3d

    aput v2, v0, v1

    const/16 v1, 0x19

    const/16 v2, 0x3e

    aput v2, v0, v1

    const/16 v1, 0x1a

    const/16 v2, 0x3f

    aput v2, v0, v1

    const/16 v1, 0x1b

    .line 124
    const/16 v2, 0x5b

    aput v2, v0, v1

    const/16 v1, 0x5d

    aput v1, v0, v4

    const/16 v1, 0x1d

    const/16 v2, 0x7b

    aput v2, v0, v1

    const/16 v1, 0x1e

    const/16 v2, 0x7d

    aput v2, v0, v1

    .line 121
    move-object v1, v0

    .line 126
    .local v1, "punctTable":[I
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    array-length v2, v1

    if-lt v0, v2, :cond_1

    .line 135
    .end local v0    # "i":I
    .end local v1    # "punctTable":[I
    .end local v13    # "mixedTable":[I
    filled-new-array {v11, v11}, [I

    move-result-object v0

    const-class v1, I

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    sput-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    .line 137
    sget-object v2, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    array-length v6, v2

    move v0, v10

    :goto_5
    if-lt v0, v6, :cond_0

    .line 140
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v10

    aput v10, v0, v9

    .line 142
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v3

    aput v10, v0, v9

    .line 143
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v3

    aput v4, v0, v10

    .line 145
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v7

    aput v10, v0, v9

    .line 147
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v5

    aput v10, v0, v9

    .line 148
    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v5

    const/16 v1, 0xf

    aput v1, v0, v10

    .line 149
    return-void

    .line 137
    :cond_0
    aget-object v1, v2, v0

    .line 138
    .local v1, "table":[I
    const/4 v8, -0x1

    invoke-static {v1, v8}, Ljava/util/Arrays;->fill([II)V

    .line 137
    .end local v1    # "table":[I
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 127
    .restart local v0    # "i":I
    .local v1, "punctTable":[I
    .restart local v13    # "mixedTable":[I
    :cond_1
    aget v2, v1, v0

    if-lez v2, :cond_2

    .line 128
    sget-object v2, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v2, v2, v9

    aget v6, v1, v0

    aput v0, v2, v6

    .line 126
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 119
    .end local v1    # "punctTable":[I
    :cond_3
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v7

    aget v2, v13, v0

    aput v0, v1, v2

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_3

    .line 109
    .end local v0    # "i":I
    .end local v13    # "mixedTable":[I
    .local v1, "c":I
    :cond_4
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v5

    add-int/lit8 v6, v1, -0x30

    add-int/2addr v6, v5

    aput v6, v4, v1

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    .line 105
    :cond_5
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v3

    add-int/lit8 v6, v1, -0x61

    add-int/2addr v6, v5

    aput v6, v4, v1

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 101
    :cond_6
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v10

    add-int/lit8 v6, v1, -0x41

    add-int/2addr v6, v5

    aput v6, v4, v1

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "text"    # [B

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    iput-object p1, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    .line 155
    return-void
.end method

.method private static simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .line 287
    .local p0, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 288
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 304
    return-object v0

    .line 288
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    .line 289
    .local v2, "newState":Lcom/google/zxing/aztec/encoder/State;
    const/4 v3, 0x1

    .line 290
    .local v3, "add":Z
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    goto :goto_2

    .line 291
    .restart local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/aztec/encoder/State;

    .line 292
    .local v5, "oldState":Lcom/google/zxing/aztec/encoder/State;
    invoke-virtual {v5, v2}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 293
    const/4 v3, 0x0

    .line 294
    nop

    .line 300
    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    .end local v5    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    :goto_2
    if-eqz v3, :cond_0

    .line 301
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v2    # "newState":Lcom/google/zxing/aztec/encoder/State;
    .end local v3    # "add":Z
    goto :goto_0

    .line 296
    .restart local v2    # "newState":Lcom/google/zxing/aztec/encoder/State;
    .restart local v3    # "add":Z
    .restart local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    .restart local v5    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    :cond_4
    invoke-virtual {v2, v5}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 297
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .end local v5    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    goto :goto_1
.end method

.method private updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V
    .locals 7
    .param p1, "state"    # Lcom/google/zxing/aztec/encoder/State;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "I",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    .line 217
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    iget-object v0, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v0, v0, p2

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    .line 218
    .local v0, "ch":C
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v2

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 219
    .local v1, "charInCurrentTable":Z
    :goto_0
    const/4 v2, 0x0

    .line 220
    .local v2, "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    const/4 v3, 0x0

    .local v3, "mode":I
    :goto_1
    const/4 v4, 0x4

    if-le v3, v4, :cond_3

    .line 245
    .end local v3    # "mode":I
    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v3

    if-gtz v3, :cond_1

    sget-object v3, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v4

    aget-object v3, v3, v4

    aget v3, v3, v0

    if-nez v3, :cond_2

    .line 249
    :cond_1
    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    .line 250
    .local v3, "binaryState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 252
    .end local v3    # "binaryState":Lcom/google/zxing/aztec/encoder/State;
    :cond_2
    return-void

    .line 221
    .local v3, "mode":I
    :cond_3
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v3

    aget v4, v4, v0

    .line 222
    .local v4, "charInMode":I
    if-lez v4, :cond_7

    .line 223
    if-nez v2, :cond_4

    .line 225
    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    .line 228
    :cond_4
    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v5

    if-eq v3, v5, :cond_5

    const/4 v5, 0x2

    if-ne v3, v5, :cond_6

    .line 233
    :cond_5
    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v5

    .line 234
    .local v5, "latch_state":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 237
    .end local v5    # "latch_state":Lcom/google/zxing/aztec/encoder/State;
    :cond_6
    if-nez v1, :cond_7

    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v6

    aget-object v5, v5, v6

    aget v5, v5, v3

    if-ltz v5, :cond_7

    .line 240
    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v5

    .line 241
    .local v5, "shift_state":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 220
    .end local v4    # "charInMode":I
    .end local v5    # "shift_state":Lcom/google/zxing/aztec/encoder/State;
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private static updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V
    .locals 4
    .param p0, "state"    # Lcom/google/zxing/aztec/encoder/State;
    .param p1, "index"    # I
    .param p2, "pairCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "II",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    .line 263
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v0

    .line 265
    .local v0, "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 266
    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 269
    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 271
    :cond_0
    const/4 v2, 0x3

    if-eq p2, v2, :cond_1

    if-ne p2, v1, :cond_2

    .line 273
    :cond_1
    nop

    .line 274
    rsub-int/lit8 v1, p2, 0x10

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    .line 275
    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    .line 273
    nop

    .line 276
    .local v1, "digit_state":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 278
    .end local v1    # "digit_state":Lcom/google/zxing/aztec/encoder/State;
    :cond_2
    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v1

    if-lez v1, :cond_3

    .line 281
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    .line 282
    .local v1, "binaryState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 284
    .end local v1    # "binaryState":Lcom/google/zxing/aztec/encoder/State;
    :cond_3
    return-void
.end method

.method private updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;
    .locals 3
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;I)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .line 206
    .local p1, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 207
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    return-object v1

    .line 207
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    .line 208
    .local v2, "state":Lcom/google/zxing/aztec/encoder/State;
    invoke-direct {p0, v2, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V

    .end local v2    # "state":Lcom/google/zxing/aztec/encoder/State;
    goto :goto_0
.end method

.method private static updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;
    .locals 3
    .param p1, "index"    # I
    .param p2, "pairCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;II)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .line 255
    .local p0, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 256
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 259
    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    return-object v1

    .line 256
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    .line 257
    .local v2, "state":Lcom/google/zxing/aztec/encoder/State;
    invoke-static {v2, p1, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V

    .end local v2    # "state":Lcom/google/zxing/aztec/encoder/State;
    goto :goto_0
.end method


# virtual methods
.method public encode()Lcom/google/zxing/common/BitArray;
    .locals 7

    .line 161
    sget-object v0, Lcom/google/zxing/aztec/encoder/State;->INITIAL_STATE:Lcom/google/zxing/aztec/encoder/State;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 162
    .local v0, "states":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 192
    .end local v1    # "index":I
    new-instance v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;

    invoke-direct {v1, p0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;-><init>(Lcom/google/zxing/aztec/encoder/HighLevelEncoder;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/aztec/encoder/State;

    .line 199
    .local v1, "minState":Lcom/google/zxing/aztec/encoder/State;
    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    invoke-virtual {v1, v2}, Lcom/google/zxing/aztec/encoder/State;->toBitArray([B)Lcom/google/zxing/common/BitArray;

    move-result-object v2

    return-object v2

    .line 164
    .local v1, "index":I
    :cond_0
    add-int/lit8 v2, v1, 0x1

    iget-object v3, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v3, v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    add-int/lit8 v3, v1, 0x1

    aget-byte v2, v2, v3

    goto :goto_1

    :cond_1
    move v2, v4

    .line 165
    .local v2, "nextChar":I
    :goto_1
    iget-object v3, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v3, v3, v1

    const/16 v5, 0xd

    if-eq v3, v5, :cond_8

    const/16 v5, 0x2c

    const/16 v6, 0x20

    if-eq v3, v5, :cond_6

    const/16 v5, 0x2e

    if-eq v3, v5, :cond_4

    const/16 v5, 0x3a

    if-eq v3, v5, :cond_2

    .line 179
    goto :goto_2

    .line 176
    :cond_2
    if-ne v2, v6, :cond_3

    const/4 v4, 0x5

    nop

    .line 177
    .local v4, "pairCode":I
    :cond_3
    goto :goto_2

    .line 170
    .end local v4    # "pairCode":I
    :cond_4
    if-ne v2, v6, :cond_5

    const/4 v4, 0x3

    nop

    .line 171
    .restart local v4    # "pairCode":I
    :cond_5
    goto :goto_2

    .line 173
    .end local v4    # "pairCode":I
    :cond_6
    if-ne v2, v6, :cond_7

    const/4 v4, 0x4

    nop

    .line 174
    .restart local v4    # "pairCode":I
    :cond_7
    goto :goto_2

    .line 167
    .end local v4    # "pairCode":I
    :cond_8
    const/16 v3, 0xa

    if-ne v2, v3, :cond_9

    const/4 v4, 0x2

    nop

    .line 168
    .restart local v4    # "pairCode":I
    :cond_9
    nop

    .line 179
    :goto_2
    move v3, v4

    .line 181
    .end local v4    # "pairCode":I
    .local v3, "pairCode":I
    if-lez v3, :cond_a

    .line 184
    invoke-static {v0, v1, v3}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;

    move-result-object v0

    .line 185
    add-int/lit8 v1, v1, 0x1

    .line 186
    goto :goto_3

    .line 188
    :cond_a
    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;

    move-result-object v0

    .line 162
    .end local v2    # "nextChar":I
    .end local v3    # "pairCode":I
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
