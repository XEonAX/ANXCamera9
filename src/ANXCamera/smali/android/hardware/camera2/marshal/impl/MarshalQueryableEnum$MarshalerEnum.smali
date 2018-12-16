.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableEnum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerEnum"
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

.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)V"
        }
    .end annotation

    .line 52
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 55
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getRawType()Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mClass:Ljava/lang/Class;

    .line 56
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 97
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    iget v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mNativeType:I

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalHelpers;->getPrimitiveTypeSize(I)I

    move-result v0

    return v0
.end method

.method public marshal(Ljava/lang/Enum;Ljava/nio/ByteBuffer;)V
    .registers 8
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation

    .line 60
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    .local p1, "value":Ljava/lang/Enum;, "TT;"
    # invokes: Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->getEnumValue(Ljava/lang/Enum;)I
    invoke-static {p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->access$000(Ljava/lang/Enum;)I

    move-result v0

    .line 62
    .local v0, "enumValue":I
    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mNativeType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_d

    .line 63
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_1b

    .line 64
    :cond_d
    iget v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mNativeType:I

    if-nez v1, :cond_31

    .line 65
    if-ltz v0, :cond_1c

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1c

    .line 69
    int-to-byte v1, v0

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 73
    :goto_1b
    return-void

    .line 66
    :cond_1c
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 67
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 66
    const-string v3, "Enum value %x too large to fit into unsigned byte"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_31
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 47
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->marshal(Ljava/lang/Enum;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Enum;
    .registers 4
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")TT;"
        }
    .end annotation

    .line 79
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    iget v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mNativeType:I

    packed-switch v0, :pswitch_data_22

    .line 88
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unexpected native type; impossible since its not supported"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 81
    :pswitch_d
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 82
    .local v0, "enumValue":I
    goto :goto_19

    .line 85
    .end local v0    # "enumValue":I
    :pswitch_12
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    .line 86
    .restart local v0    # "enumValue":I
    nop

    .line 88
    :goto_19
    nop

    .line 92
    iget-object v1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->mClass:Ljava/lang/Class;

    # invokes: Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->getEnumFromValue(Ljava/lang/Class;I)Ljava/lang/Enum;
    invoke-static {v1, v0}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->access$100(Ljava/lang/Class;I)Ljava/lang/Enum;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 47
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>.MarshalerEnum;"
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Enum;

    move-result-object p1

    return-object p1
.end method
