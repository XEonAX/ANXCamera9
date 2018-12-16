.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerRange"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/util/Range<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "-",
            "Landroid/util/Range<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "Landroid/util/Range<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 10
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/util/Range<",
            "TT;>;>;I)V"
        }
    .end annotation

    .line 45
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/util/Range<TT;>;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange;

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 48
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getRawType()Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mClass:Ljava/lang/Class;

    .line 56
    :try_start_b
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object p1

    check-cast p1, Ljava/lang/reflect/ParameterizedType;
    :try_end_11
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_11} :catch_44

    .line 59
    .local p1, "paramType":Ljava/lang/reflect/ParameterizedType;
    nop

    .line 58
    nop

    .line 60
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 62
    .local v0, "actualTypeArgument":Ljava/lang/reflect/Type;
    nop

    .line 63
    invoke-static {v0}, Landroid/hardware/camera2/utils/TypeReference;->createSpecializedTypeReference(Ljava/lang/reflect/Type;)Landroid/hardware/camera2/utils/TypeReference;

    move-result-object v2

    .line 65
    .local v2, "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    iget v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNativeType:I

    invoke-static {v2, v3}, Landroid/hardware/camera2/marshal/MarshalRegistryANX;->getMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;

    move-result-object v3

    iput-object v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    .line 68
    :try_start_27
    iget-object v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mClass:Ljava/lang/Class;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Comparable;

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-class v5, Ljava/lang/Comparable;

    aput-object v5, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    iput-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mConstructor:Ljava/lang/reflect/Constructor;
    :try_end_3b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_27 .. :try_end_3b} :catch_3d

    .line 72
    nop

    .line 73
    return-void

    .line 70
    :catch_3d
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 57
    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "actualTypeArgToken":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<*>;"
    .end local p1    # "paramType":Ljava/lang/reflect/ParameterizedType;
    :catch_44
    move-exception p1

    .line 58
    .local p1, "e":Ljava/lang/ClassCastException;
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Raw use of Range is not supported"

    invoke-direct {v0, v1, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public calculateMarshalSize(Landroid/util/Range;)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "TT;>;)I"
        }
    .end annotation

    .line 112
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    .local p1, "value":Landroid/util/Range;, "Landroid/util/Range<TT;>;"
    invoke-virtual {p0}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->getNativeSize()I

    move-result v0

    .line 114
    .local v0, "nativeSize":I
    sget v1, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->NATIVE_SIZE_DYNAMIC:I

    if-eq v0, v1, :cond_9

    .line 115
    return v0

    .line 117
    :cond_9
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/marshal/Marshaler;->calculateMarshalSize(Ljava/lang/Object;)I

    move-result v1

    .line 118
    .local v1, "lowerSize":I
    iget-object v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/marshal/Marshaler;->calculateMarshalSize(Ljava/lang/Object;)I

    move-result v2

    .line 120
    .local v2, "upperSize":I
    add-int v3, v1, v2

    return v3
.end method

.method public bridge synthetic calculateMarshalSize(Ljava/lang/Object;)I
    .registers 2

    .line 37
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    check-cast p1, Landroid/util/Range;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->calculateMarshalSize(Landroid/util/Range;)I

    move-result p1

    return p1
.end method

.method public getNativeSize()I
    .registers 3

    .line 101
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v0}, Landroid/hardware/camera2/marshal/Marshaler;->getNativeSize()I

    move-result v0

    .line 103
    .local v0, "nestedSize":I
    sget v1, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->NATIVE_SIZE_DYNAMIC:I

    if-eq v0, v1, :cond_d

    .line 104
    mul-int/lit8 v1, v0, 0x2

    return v1

    .line 106
    :cond_d
    sget v1, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->NATIVE_SIZE_DYNAMIC:I

    return v1
.end method

.method public marshal(Landroid/util/Range;Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "TT;>;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation

    .line 77
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    .local p1, "value":Landroid/util/Range;, "Landroid/util/Range<TT;>;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/hardware/camera2/marshal/Marshaler;->marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 78
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/hardware/camera2/marshal/Marshaler;->marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 79
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 37
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    check-cast p1, Landroid/util/Range;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->marshal(Landroid/util/Range;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Range;
    .registers 7
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")",
            "Landroid/util/Range<",
            "TT;>;"
        }
    .end annotation

    .line 83
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/marshal/Marshaler;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Comparable;

    .line 84
    .local v0, "lower":Ljava/lang/Comparable;, "TT;"
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mNestedTypeMarshaler:Landroid/hardware/camera2/marshal/Marshaler;

    invoke-virtual {v1, p1}, Landroid/hardware/camera2/marshal/Marshaler;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Comparable;

    .line 87
    .local v1, "upper":Ljava/lang/Comparable;, "TT;"
    :try_start_10
    iget-object v2, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->mConstructor:Ljava/lang/reflect/Constructor;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Range;
    :try_end_21
    .catch Ljava/lang/InstantiationException; {:try_start_10 .. :try_end_21} :catch_37
    .catch Ljava/lang/IllegalAccessException; {:try_start_10 .. :try_end_21} :catch_30
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_21} :catch_29
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_10 .. :try_end_21} :catch_22

    return-object v2

    .line 94
    :catch_22
    move-exception v2

    .line 95
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 92
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_29
    move-exception v2

    .line 93
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 90
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_30
    move-exception v2

    .line 91
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 88
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_37
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 37
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange<TT;>.MarshalerRange;"
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRange$MarshalerRange;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Range;

    move-result-object p1

    return-object p1
.end method
