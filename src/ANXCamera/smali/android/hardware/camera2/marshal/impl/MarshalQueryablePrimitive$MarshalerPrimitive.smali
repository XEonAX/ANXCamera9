.class Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryablePrimitive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerPrimitive"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)V"
        }
    .end annotation

    .line 56
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 60
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getRawType()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->wrapClassIfPrimitive(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mClass:Ljava/lang/Class;

    .line 61
    return-void
.end method

.method private marshalPrimitive(BLjava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "value"    # B
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 126
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 127
    return-void
.end method

.method private marshalPrimitive(DLjava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # D
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;

    .line 113
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p3, p1, p2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 114
    return-void
.end method

.method private marshalPrimitive(FLjava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "value"    # F
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 109
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 110
    return-void
.end method

.method private marshalPrimitive(ILjava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "value"    # I
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 105
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 106
    return-void
.end method

.method private marshalPrimitive(JLjava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # J
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;

    .line 117
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p3, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 118
    return-void
.end method

.method private marshalPrimitive(Landroid/util/Rational;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Landroid/util/Rational;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 121
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 122
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 123
    return-void
.end method

.method private unmarshalObject(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 130
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    iget v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    packed-switch v0, :pswitch_data_5a

    .line 146
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t unmarshal native type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :pswitch_1e
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 139
    .local v0, "numerator":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 140
    .local v1, "denominator":I
    new-instance v2, Landroid/util/Rational;

    invoke-direct {v2, v0, v1}, Landroid/util/Rational;-><init>(II)V

    return-object v2

    .line 142
    .end local v0    # "numerator":I
    .end local v1    # "denominator":I
    :pswitch_2c
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 136
    :pswitch_35
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 134
    :pswitch_3e
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 132
    :pswitch_47
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 144
    :pswitch_50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_50
        :pswitch_47
        :pswitch_3e
        :pswitch_35
        :pswitch_2c
        :pswitch_1e
    .end packed-switch
.end method


# virtual methods
.method public calculateMarshalSize(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 70
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalHelpers;->getPrimitiveTypeSize(I)I

    move-result v0

    return v0
.end method

.method public getNativeSize()I
    .registers 2

    .line 153
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    iget v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalHelpers;->getPrimitiveTypeSize(I)I

    move-result v0

    return v0
.end method

.method public marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 6
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation

    .line 75
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_15

    .line 76
    const/4 v0, 0x1

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 77
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 78
    .local v0, "val":I
    invoke-direct {p0, v0, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(ILjava/nio/ByteBuffer;)V

    .line 79
    .end local v0    # "val":I
    goto :goto_7a

    :cond_15
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_2a

    .line 80
    const/4 v0, 0x2

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 81
    move-object v0, p1

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 82
    .local v0, "val":F
    invoke-direct {p0, v0, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(FLjava/nio/ByteBuffer;)V

    .line 83
    .end local v0    # "val":F
    goto :goto_7a

    :cond_2a
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_3f

    .line 84
    const/4 v0, 0x3

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 85
    move-object v0, p1

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 86
    .local v0, "val":J
    invoke-direct {p0, v0, v1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(JLjava/nio/ByteBuffer;)V

    .line 87
    .end local v0    # "val":J
    goto :goto_7a

    :cond_3f
    instance-of v0, p1, Landroid/util/Rational;

    if-eqz v0, :cond_50

    .line 88
    const/4 v0, 0x5

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 89
    move-object v0, p1

    check-cast v0, Landroid/util/Rational;

    invoke-direct {p0, v0, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(Landroid/util/Rational;Ljava/nio/ByteBuffer;)V

    goto :goto_7a

    .line 90
    :cond_50
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_65

    .line 91
    const/4 v0, 0x4

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 92
    move-object v0, p1

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 93
    .local v0, "val":D
    invoke-direct {p0, v0, v1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(DLjava/nio/ByteBuffer;)V

    .line 94
    .end local v0    # "val":D
    goto :goto_7a

    :cond_65
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_7b

    .line 95
    const/4 v0, 0x0

    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mNativeType:I

    invoke-static {v0, v1}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeTypeEquals(II)I

    .line 96
    move-object v0, p1

    check-cast v0, Ljava/lang/Byte;

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    .line 97
    .local v0, "val":B
    invoke-direct {p0, v0, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->marshalPrimitive(BLjava/nio/ByteBuffer;)V

    .line 98
    .end local v0    # "val":B
    nop

    .line 102
    :goto_7a
    return-void

    .line 99
    :cond_7b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t marshal managed type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mTypeReference:Landroid/hardware/camera2/utils/TypeReference;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 4
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")TT;"
        }
    .end annotation

    .line 65
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>.MarshalerPrimitive;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->mClass:Ljava/lang/Class;

    invoke-direct {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;->unmarshalObject(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
