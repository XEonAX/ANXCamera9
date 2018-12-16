.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector$MarshalerRggbChannelVector;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableRggbChannelVector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerRggbChannelVector"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/RggbChannelVector;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/RggbChannelVector;",
            ">;I)V"
        }
    .end annotation

    .line 36
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/RggbChannelVector;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector$MarshalerRggbChannelVector;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector;

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 38
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 59
    const/16 v0, 0x10

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/RggbChannelVector;Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "value"    # Landroid/hardware/camera2/params/RggbChannelVector;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 42
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_e

    .line 43
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/params/RggbChannelVector;->getComponent(I)F

    move-result v1

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 45
    .end local v0    # "i":I
    :cond_e
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 34
    check-cast p1, Landroid/hardware/camera2/params/RggbChannelVector;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector$MarshalerRggbChannelVector;->marshal(Landroid/hardware/camera2/params/RggbChannelVector;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/RggbChannelVector;
    .registers 7
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 49
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    .line 50
    .local v0, "red":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    .line 51
    .local v1, "gEven":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v2

    .line 52
    .local v2, "gOdd":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v3

    .line 54
    .local v3, "blue":F
    new-instance v4, Landroid/hardware/camera2/params/RggbChannelVector;

    invoke-direct {v4, v0, v1, v2, v3}, Landroid/hardware/camera2/params/RggbChannelVector;-><init>(FFFF)V

    return-object v4
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 34
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableRggbChannelVector$MarshalerRggbChannelVector;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/RggbChannelVector;

    move-result-object p1

    return-object p1
.end method
