.class Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryablePair.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerPair"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/util/Pair<",
        "TT1;TT2;>;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "-",
            "Landroid/util/Pair<",
            "TT1;TT2;>;>;"
        }
    .end annotation
.end field

.field private final mConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "Landroid/util/Pair<",
            "TT1;TT2;>;>;"
        }
    .end annotation
.end field

.field private final mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "TT1;>;"
        }
    .end annotation
.end field

.field private final mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "TT2;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 9
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/util/Pair<",
            "TT1;TT2;>;>;I)V"
        }
    .end annotation

    .line 46
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/util/Pair<TT1;TT2;>;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair;

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 49
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getRawType()Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mClass:Ljava/lang/Class;

    .line 57
    :try_start_b
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object p1

    check-cast p1, Ljava/lang/reflect/ParameterizedType;
    :try_end_11
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_11} :catch_57

    .line 60
    .local p1, "paramType":Ljava/lang/reflect/ParameterizedType;
    nop

    .line 59
    nop

    .line 64
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 66
    .local v0, "actualTypeArgument":Ljava/lang/reflect/Type;
    nop

    .line 67
    invoke-static {v0}, Landroid/hardware/camera2/utils/TypeReference;->createSpecializedTypeReference(Ljava/lang/reflect/Type;)Landroid/hardware/camera2/utils/TypeReference;

    move-result-object v2

    .line 69
    .local v2, "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    iget v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNativeType:I

    invoke-static {v2, v3}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->getMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;

    move-result-object v3

    iput-object v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;

    .line 74
    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    .end local v2    # "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    .line 76
    .restart local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    nop

    .line 77
    invoke-static {v0}, Landroid/hardware/camera2/utils/TypeReference;->createSpecializedTypeReference(Ljava/lang/reflect/Type;)Landroid/hardware/camera2/utils/TypeReference;

    move-result-object v3

    .line 79
    .local v3, "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    iget v4, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNativeType:I

    invoke-static {v3, v4}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->getMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;

    move-result-object v4

    iput-object v4, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;

    .line 83
    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    .end local v3    # "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    :try_start_3b
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mClass:Ljava/lang/Class;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/Object;

    aput-object v4, v3, v1

    const-class v1, Ljava/lang/Object;

    aput-object v1, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    iput-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mConstructor:Ljava/lang/reflect/Constructor;
    :try_end_4e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3b .. :try_end_4e} :catch_50

    .line 87
    nop

    .line 88
    return-void

    .line 85
    :catch_50
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 58
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local p1    # "paramType":Ljava/lang/reflect/ParameterizedType;
    :catch_57
    move-exception p1

    .line 59
    .local p1, "e":Ljava/lang/ClassCastException;
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Raw use of Pair is not supported"

    invoke-direct {v0, v1, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public calculateMarshalSize(Landroid/util/Pair;)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "TT1;TT2;>;)I"
        }
    .end annotation

    .line 134
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    .local p1, "value":Landroid/util/Pair;, "Landroid/util/Pair<TT1;TT2;>;"
    invoke-virtual {p0}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->getNativeSize()I

    move-result v0

    .line 136
    .local v0, "nativeSize":I
    sget v1, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->NATIVE_SIZE_DYNAMIC:I

    if-eq v0, v1, :cond_9

    .line 137
    return v0

    .line 139
    :cond_9
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;

    iget-object v2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/marshal/Marshaler;->calculateMarshalSize(Ljava/lang/Object;)I

    move-result v1

    .line 140
    .local v1, "firstSize":I
    iget-object v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;

    iget-object v3, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/marshal/Marshaler;->calculateMarshalSize(Ljava/lang/Object;)I

    move-result v2

    .line 142
    .local v2, "secondSize":I
    add-int v3, v1, v2

    return v3
.end method

.method public bridge synthetic calculateMarshalSize(Ljava/lang/Object;)I
    .registers 2

    .line 36
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->calculateMarshalSize(Landroid/util/Pair;)I

    move-result p1

    return p1
.end method

.method public getNativeSize()I
    .registers 4

    .line 122
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v0}, Landroid/hardware/camera2/marshal/Marshaler;->getNativeSize()I

    move-result v0

    .line 123
    .local v0, "firstSize":I
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v1}, Landroid/hardware/camera2/marshal/Marshaler;->getNativeSize()I

    move-result v1

    .line 125
    .local v1, "secondSize":I
    sget v2, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->NATIVE_SIZE_DYNAMIC:I

    if-eq v0, v2, :cond_17

    sget v2, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->NATIVE_SIZE_DYNAMIC:I

    if-eq v1, v2, :cond_17

    .line 126
    add-int v2, v0, v1

    return v2

    .line 128
    :cond_17
    sget v2, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->NATIVE_SIZE_DYNAMIC:I

    return v2
.end method

.method public marshal(Landroid/util/Pair;Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "TT1;TT2;>;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation

    .line 92
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    .local p1, "value":Landroid/util/Pair;, "Landroid/util/Pair<TT1;TT2;>;"
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-eqz v0, :cond_1f

    .line 94
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v0, :cond_17

    .line 98
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;

    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v0, v1, p2}, Landroid/hardware/camera2/marshal/Marshaler;->marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 99
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;

    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v0, v1, p2}, Landroid/hardware/camera2/marshal/Marshaler;->marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 100
    return-void

    .line 95
    :cond_17
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Pair#second must not be null"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_1f
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Pair#first must not be null"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 36
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->marshal(Landroid/util/Pair;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Pair;
    .registers 7
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")",
            "Landroid/util/Pair<",
            "TT1;TT2;>;"
        }
    .end annotation

    .line 104
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerFirst:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/marshal/Marshaler;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 105
    .local v0, "first":Ljava/lang/Object;, "TT1;"
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mNestedTypeMarshalerSecond:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v1, p1}, Landroid/hardware/camera2/marshal/Marshaler;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 108
    .local v1, "second":Ljava/lang/Object;, "TT2;"
    :try_start_c
    iget-object v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->mConstructor:Ljava/lang/reflect/Constructor;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;
    :try_end_1d
    .catch Ljava/lang/InstantiationException; {:try_start_c .. :try_end_1d} :catch_33
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_1d} :catch_2c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_1d} :catch_25
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_1d} :catch_1e

    return-object v2

    .line 115
    :catch_1e
    move-exception v2

    .line 116
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 113
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_25
    move-exception v2

    .line 114
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 111
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_2c
    move-exception v2

    .line 112
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 109
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_33
    move-exception v2

    .line 110
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 36
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair<TT1;TT2;>.MarshalerPair;"
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePair$MarshalerPair;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method
