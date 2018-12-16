.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableSize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerSize"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/util/Size;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 35
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/util/Size;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 37
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 55
    const/16 v0, 0x8

    return v0
.end method

.method public marshal(Landroid/util/Size;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Landroid/util/Size;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 41
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 42
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 43
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 34
    check-cast p1, Landroid/util/Size;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;->marshal(Landroid/util/Size;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Size;
    .registers 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 47
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 48
    .local v0, "width":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 50
    .local v1, "height":I
    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object v2
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 34
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/util/Size;

    move-result-object p1

    return-object p1
.end method
