.class public final Lcom/google/zxing/multi/GenericMultipleBarcodeReader;
.super Ljava/lang/Object;
.source "GenericMultipleBarcodeReader.java"

# interfaces
.implements Lcom/google/zxing/multi/MultipleBarcodeReader;


# static fields
.field private static final MAX_DEPTH:I = 0x4

.field private static final MIN_DIMENSION_TO_RECUR:I = 0x64


# instance fields
.field private final delegate:Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Reader;)V
    .locals 0
    .param p1, "delegate"    # Lcom/google/zxing/Reader;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    .line 54
    return-void
.end method

.method private doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V
    .locals 27
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "currentDepth"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;III)V"
        }
    .end annotation

    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    .local p3, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    move-object/from16 v1, p1

    move/from16 v9, p4

    move/from16 v10, p5

    .line 78
    move/from16 v11, p6

    const/4 v0, 0x4

    if-le v11, v0, :cond_0

    .line 79
    return-void

    .line 84
    :cond_0
    move-object/from16 v12, p0

    :try_start_0
    iget-object v0, v12, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v13, p2

    :try_start_1
    invoke-interface {v0, v1, v13}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0
    :try_end_1
    .catch Lcom/google/zxing/ReaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 85
    .local v0, "result":Lcom/google/zxing/Result;
    nop

    .line 86
    nop

    .line 88
    const/4 v2, 0x0

    .line 89
    .local v2, "alreadyFound":Z
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 95
    .end local v2    # "alreadyFound":Z
    .local v14, "alreadyFound":Z
    :goto_1
    move v14, v2

    goto :goto_2

    .line 89
    .end local v14    # "alreadyFound":Z
    .restart local v2    # "alreadyFound":Z
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/Result;

    .line 90
    .local v4, "existingResult":Lcom/google/zxing/Result;
    invoke-virtual {v4}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 91
    const/4 v2, 0x1

    .line 92
    goto :goto_1

    .line 95
    .end local v2    # "alreadyFound":Z
    .end local v4    # "existingResult":Lcom/google/zxing/Result;
    .restart local v14    # "alreadyFound":Z
    :goto_2
    if-nez v14, :cond_2

    .line 96
    invoke-static {v0, v9, v10}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;

    move-result-object v2

    move-object/from16 v15, p3

    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 98
    :cond_2
    move-object/from16 v15, p3

    :goto_3
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 99
    .local v8, "resultPoints":[Lcom/google/zxing/ResultPoint;
    if-eqz v8, :cond_d

    array-length v2, v8

    if-nez v2, :cond_3

    .line 100
    move-object/from16 v16, v0

    move-object/from16 v24, v8

    move/from16 v17, v14

    goto/16 :goto_b

    .line 102
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v7

    .line 103
    .local v7, "width":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v6

    .line 104
    .local v6, "height":I
    int-to-float v2, v7

    .line 105
    .local v2, "minX":F
    int-to-float v3, v6

    .line 106
    .local v3, "minY":F
    const/4 v4, 0x0

    .line 107
    .local v4, "maxX":F
    const/4 v5, 0x0

    .line 108
    .local v5, "maxY":F
    move-object/from16 v16, v0

    array-length v0, v8

    .end local v0    # "result":Lcom/google/zxing/Result;
    .local v16, "result":Lcom/google/zxing/Result;
    move/from16 v17, v14

    const/4 v14, 0x0

    .end local v14    # "alreadyFound":Z
    .local v17, "alreadyFound":Z
    move/from16 v18, v5

    move v5, v2

    move v2, v14

    move/from16 v26, v4

    move v4, v3

    move/from16 v3, v26

    .end local v2    # "minX":F
    .local v3, "maxX":F
    .local v4, "minY":F
    .local v5, "minX":F
    .local v18, "maxY":F
    :goto_4
    if-lt v2, v0, :cond_8

    .line 126
    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float v2, v5, v0

    if-lez v2, :cond_4

    .line 127
    float-to-int v2, v5

    invoke-virtual {v1, v14, v14, v2, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v19

    .line 128
    nop

    .line 129
    nop

    .line 130
    add-int/lit8 v20, v11, 0x1

    .line 127
    move-object v2, v12

    move/from16 v21, v3

    move-object/from16 v3, v19

    .end local v3    # "maxX":F
    .local v21, "maxX":F
    move v14, v4

    move-object v4, v13

    .end local v4    # "minY":F
    .local v14, "minY":F
    move/from16 v19, v5

    move-object v5, v15

    .end local v5    # "minX":F
    .local v19, "minX":F
    move/from16 v22, v6

    move v6, v9

    .end local v6    # "height":I
    .local v22, "height":I
    move/from16 v23, v7

    move v7, v10

    .end local v7    # "width":I
    .local v23, "width":I
    move-object/from16 v24, v8

    move/from16 v8, v20

    .end local v8    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .local v24, "resultPoints":[Lcom/google/zxing/ResultPoint;
    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_5

    .line 133
    .end local v14    # "minY":F
    .end local v19    # "minX":F
    .end local v21    # "maxX":F
    .end local v22    # "height":I
    .end local v23    # "width":I
    .end local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v3    # "maxX":F
    .restart local v4    # "minY":F
    .restart local v5    # "minX":F
    .restart local v6    # "height":I
    .restart local v7    # "width":I
    .restart local v8    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    :cond_4
    move/from16 v21, v3

    move v14, v4

    move/from16 v19, v5

    move/from16 v22, v6

    move/from16 v23, v7

    move-object/from16 v24, v8

    .end local v3    # "maxX":F
    .end local v4    # "minY":F
    .end local v5    # "minX":F
    .end local v6    # "height":I
    .end local v7    # "width":I
    .end local v8    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v14    # "minY":F
    .restart local v19    # "minX":F
    .restart local v21    # "maxX":F
    .restart local v22    # "height":I
    .restart local v23    # "width":I
    .restart local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    :goto_5
    cmpl-float v0, v14, v0

    if-lez v0, :cond_5

    .line 134
    float-to-int v0, v14

    move/from16 v8, v23

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v8, v0}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    .line 135
    .end local v23    # "width":I
    .local v8, "width":I
    nop

    .line 136
    nop

    .line 137
    add-int/lit8 v0, v11, 0x1

    .line 134
    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move v6, v9

    move v7, v10

    move/from16 v25, v14

    move v14, v8

    move v8, v0

    .end local v8    # "width":I
    .local v14, "width":I
    .local v25, "minY":F
    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_6

    .line 140
    .end local v25    # "minY":F
    .local v14, "minY":F
    .restart local v23    # "width":I
    :cond_5
    move/from16 v25, v14

    move/from16 v14, v23

    .end local v23    # "width":I
    .local v14, "width":I
    .restart local v25    # "minY":F
    :goto_6
    add-int/lit8 v7, v14, -0x64

    int-to-float v0, v7

    move/from16 v8, v21

    cmpg-float v0, v8, v0

    .end local v21    # "maxX":F
    .local v8, "maxX":F
    if-gez v0, :cond_6

    .line 141
    float-to-int v0, v8

    float-to-int v2, v8

    sub-int v7, v14, v2

    move/from16 v6, v22

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v7, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    .line 142
    .end local v22    # "height":I
    .restart local v6    # "height":I
    nop

    .line 143
    float-to-int v0, v8

    add-int/2addr v0, v9

    .line 144
    add-int/lit8 v20, v11, 0x1

    .line 141
    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move/from16 v21, v6

    move v6, v0

    .end local v6    # "height":I
    .local v21, "height":I
    move v7, v10

    move/from16 v22, v8

    move/from16 v8, v20

    .end local v8    # "maxX":F
    .local v22, "maxX":F
    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_7

    .line 147
    .end local v21    # "height":I
    .restart local v8    # "maxX":F
    .local v22, "height":I
    :cond_6
    move/from16 v21, v22

    move/from16 v22, v8

    .end local v8    # "maxX":F
    .restart local v21    # "height":I
    .local v22, "maxX":F
    :goto_7
    add-int/lit8 v6, v21, -0x64

    int-to-float v0, v6

    move/from16 v8, v18

    cmpg-float v0, v8, v0

    .end local v18    # "maxY":F
    .local v8, "maxY":F
    if-gez v0, :cond_7

    .line 148
    float-to-int v0, v8

    float-to-int v2, v8

    sub-int v6, v21, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v0, v14, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    .line 149
    nop

    .line 150
    float-to-int v0, v8

    add-int v7, v10, v0

    .line 151
    add-int/lit8 v0, v11, 0x1

    .line 148
    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move v6, v9

    move/from16 v18, v8

    move v8, v0

    .end local v8    # "maxY":F
    .restart local v18    # "maxY":F
    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_8

    .line 153
    .end local v18    # "maxY":F
    .restart local v8    # "maxY":F
    :cond_7
    move/from16 v18, v8

    .end local v8    # "maxY":F
    .restart local v18    # "maxY":F
    :goto_8
    return-void

    .line 108
    .end local v14    # "width":I
    .end local v19    # "minX":F
    .end local v21    # "height":I
    .end local v22    # "maxX":F
    .end local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .end local v25    # "minY":F
    .restart local v3    # "maxX":F
    .restart local v4    # "minY":F
    .restart local v5    # "minX":F
    .restart local v6    # "height":I
    .restart local v7    # "width":I
    .local v8, "resultPoints":[Lcom/google/zxing/ResultPoint;
    :cond_8
    move/from16 v22, v3

    move/from16 v25, v4

    move/from16 v19, v5

    move/from16 v21, v6

    move-object/from16 v24, v8

    move v3, v14

    move v14, v7

    .end local v3    # "maxX":F
    .end local v4    # "minY":F
    .end local v5    # "minX":F
    .end local v6    # "height":I
    .end local v7    # "width":I
    .end local v8    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v14    # "width":I
    .restart local v19    # "minX":F
    .restart local v21    # "height":I
    .restart local v22    # "maxX":F
    .restart local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v25    # "minY":F
    aget-object v4, v24, v2

    .line 109
    .local v4, "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    .line 110
    .local v5, "x":F
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    .line 111
    .local v6, "y":F
    cmpg-float v7, v5, v19

    if-gez v7, :cond_9

    .line 112
    move v7, v5

    .end local v19    # "minX":F
    .local v7, "minX":F
    goto :goto_9

    .line 114
    .end local v7    # "minX":F
    .restart local v19    # "minX":F
    :cond_9
    move/from16 v7, v19

    .end local v19    # "minX":F
    .restart local v7    # "minX":F
    :goto_9
    cmpg-float v8, v6, v25

    if-gez v8, :cond_a

    .line 115
    move v8, v6

    .end local v25    # "minY":F
    .local v8, "minY":F
    goto :goto_a

    .line 117
    .end local v8    # "minY":F
    .restart local v25    # "minY":F
    :cond_a
    move/from16 v8, v25

    .end local v25    # "minY":F
    .restart local v8    # "minY":F
    :goto_a
    cmpl-float v19, v5, v22

    if-lez v19, :cond_b

    .line 118
    move/from16 v19, v5

    .line 120
    .end local v22    # "maxX":F
    .local v19, "maxX":F
    move/from16 v22, v19

    .end local v19    # "maxX":F
    .restart local v22    # "maxX":F
    :cond_b
    cmpl-float v19, v6, v18

    if-lez v19, :cond_c

    .line 121
    move v4, v6

    .line 108
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v18    # "maxY":F
    .local v4, "maxY":F
    move/from16 v18, v4

    .end local v4    # "maxY":F
    .restart local v18    # "maxY":F
    :cond_c
    add-int/lit8 v2, v2, 0x1

    move v5, v7

    move v4, v8

    move v7, v14

    move/from16 v6, v21

    move-object/from16 v8, v24

    move v14, v3

    move/from16 v3, v22

    goto/16 :goto_4

    .line 100
    .end local v7    # "minX":F
    .end local v16    # "result":Lcom/google/zxing/Result;
    .end local v17    # "alreadyFound":Z
    .end local v18    # "maxY":F
    .end local v21    # "height":I
    .end local v22    # "maxX":F
    .end local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v0    # "result":Lcom/google/zxing/Result;
    .local v8, "resultPoints":[Lcom/google/zxing/ResultPoint;
    .local v14, "alreadyFound":Z
    :cond_d
    move-object/from16 v16, v0

    move-object/from16 v24, v8

    move/from16 v17, v14

    .end local v0    # "result":Lcom/google/zxing/Result;
    .end local v8    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .end local v14    # "alreadyFound":Z
    .restart local v16    # "result":Lcom/google/zxing/Result;
    .restart local v17    # "alreadyFound":Z
    .restart local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    :goto_b
    return-void

    .line 89
    .end local v16    # "result":Lcom/google/zxing/Result;
    .end local v17    # "alreadyFound":Z
    .end local v24    # "resultPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v0    # "result":Lcom/google/zxing/Result;
    .local v2, "alreadyFound":Z
    :cond_e
    move-object/from16 v15, p3

    .end local v0    # "result":Lcom/google/zxing/Result;
    .restart local v16    # "result":Lcom/google/zxing/Result;
    goto/16 :goto_0

    .line 85
    .end local v2    # "alreadyFound":Z
    .end local v16    # "result":Lcom/google/zxing/Result;
    :catch_0
    move-exception v0

    goto :goto_c

    :catch_1
    move-exception v0

    move-object/from16 v13, p2

    :goto_c
    move-object/from16 v15, p3

    .line 86
    .local v0, "ignored":Lcom/google/zxing/ReaderException;
    return-void
.end method

.method private static translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;
    .locals 8
    .param p0, "result"    # Lcom/google/zxing/Result;
    .param p1, "xOffset"    # I
    .param p2, "yOffset"    # I

    .line 156
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 157
    .local v0, "oldResultPoints":[Lcom/google/zxing/ResultPoint;
    if-nez v0, :cond_0

    .line 158
    return-object p0

    .line 160
    :cond_0
    array-length v1, v0

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    .line 161
    .local v1, "newResultPoints":[Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-lt v2, v3, :cond_1

    .line 165
    .end local v2    # "i":I
    new-instance v2, Lcom/google/zxing/Result;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 166
    .local v2, "newResult":Lcom/google/zxing/Result;
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    .line 167
    return-object v2

    .line 162
    .local v2, "i":I
    :cond_1
    aget-object v3, v0, v2

    .line 163
    .local v3, "oldPoint":Lcom/google/zxing/ResultPoint;
    new-instance v4, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    int-to-float v6, p1

    add-float/2addr v5, v6

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    int-to-float v7, p2

    add-float/2addr v6, v7

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v1, v2

    .line 161
    .end local v3    # "oldPoint":Lcom/google/zxing/ResultPoint;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    .locals 8
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 64
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .local v0, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v0

    invoke-direct/range {v1 .. v7}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    .line 66
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/google/zxing/Result;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/google/zxing/Result;

    return-object v1

    .line 67
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method
