.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect$MarshalerRect;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableRect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerRect"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/graphics/Rect;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/graphics/Rect;",
            ">;I)V"
        }
    .end annotation

    .line 36
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/graphics/Rect;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect$MarshalerRect;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect;

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 38
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 63
    const/16 v0, 0x10

    return v0
.end method

.method public marshal(Landroid/graphics/Rect;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Landroid/graphics/Rect;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 42
    iget v0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 43
    iget v0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 44
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 45
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 46
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 34
    check-cast p1, Landroid/graphics/Rect;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect$MarshalerRect;->marshal(Landroid/graphics/Rect;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/graphics/Rect;
    .registers 9
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 51
    .local v0, "left":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 52
    .local v1, "top":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 53
    .local v2, "width":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 55
    .local v3, "height":I
    add-int v4, v0, v2

    .line 56
    .local v4, "right":I
    add-int v5, v1, v3

    .line 58
    .local v5, "bottom":I
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v0, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v6
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 34
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRect$MarshalerRect;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/graphics/Rect;

    move-result-object p1

    return-object p1
.end method
