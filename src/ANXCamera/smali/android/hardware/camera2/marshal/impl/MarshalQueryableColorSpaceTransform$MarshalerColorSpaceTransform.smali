.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableColorSpaceTransform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerColorSpaceTransform"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/ColorSpaceTransform;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/ColorSpaceTransform;",
            ">;I)V"
        }
    .end annotation

    .line 40
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/ColorSpaceTransform;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 42
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 67
    const/16 v0, 0x48

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/ColorSpaceTransform;Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "value"    # Landroid/hardware/camera2/params/ColorSpaceTransform;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 46
    const/16 v0, 0x12

    new-array v1, v0, [I

    .line 47
    .local v1, "transformAsArray":[I
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/params/ColorSpaceTransform;->copyElements([II)V

    .line 49
    nop

    .local v2, "i":I
    :goto_9
    if-ge v2, v0, :cond_13

    .line 50
    aget v3, v1, v2

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 52
    .end local v2    # "i":I
    :cond_13
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 38
    check-cast p1, Landroid/hardware/camera2/params/ColorSpaceTransform;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;->marshal(Landroid/hardware/camera2/params/ColorSpaceTransform;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/ColorSpaceTransform;
    .registers 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 56
    const/16 v0, 0x12

    new-array v1, v0, [I

    .line 58
    .local v1, "transformAsArray":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v0, :cond_10

    .line 59
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    aput v3, v1, v2

    .line 58
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 62
    .end local v2    # "i":I
    :cond_10
    new-instance v0, Landroid/hardware/camera2/params/ColorSpaceTransform;

    invoke-direct {v0, v1}, Landroid/hardware/camera2/params/ColorSpaceTransform;-><init>([I)V

    return-object v0
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 38
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/ColorSpaceTransform;

    move-result-object p1

    return-object p1
.end method
