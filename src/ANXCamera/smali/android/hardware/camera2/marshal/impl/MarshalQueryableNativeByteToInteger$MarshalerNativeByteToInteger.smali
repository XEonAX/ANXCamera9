.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger$MarshalerNativeByteToInteger;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableNativeByteToInteger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerNativeByteToInteger"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 36
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/Integer;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger$MarshalerNativeByteToInteger;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger;

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 38
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method public marshal(Ljava/lang/Integer;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Integer;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 42
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 43
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 34
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger$MarshalerNativeByteToInteger;->marshal(Ljava/lang/Integer;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Integer;
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 48
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 34
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableNativeByteToInteger$MarshalerNativeByteToInteger;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
