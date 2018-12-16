.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableHighSpeedVideoConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerHighSpeedVideoConfiguration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
            ">;I)V"
        }
    .end annotation

    .line 42
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 44
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 68
    const/16 v0, 0x14

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 48
    invoke-virtual {p1}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 49
    invoke-virtual {p1}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;->getHeight()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 50
    invoke-virtual {p1}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;->getFpsMin()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 51
    invoke-virtual {p1}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;->getFpsMax()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 52
    invoke-virtual {p1}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;->getBatchSizeMax()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 53
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 38
    check-cast p1, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;->marshal(Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;
    .registers 14
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 57
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    .line 58
    .local v6, "width":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    .line 59
    .local v7, "height":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    .line 60
    .local v8, "fpsMin":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v9

    .line 61
    .local v9, "fpsMax":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    .line 63
    .local v10, "batchSizeMax":I
    new-instance v11, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;

    move-object v0, v11

    move v1, v6

    move v2, v7

    move v3, v8

    move v4, v9

    move v5, v10

    invoke-direct/range {v0 .. v5}, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;-><init>(IIIII)V

    return-object v11
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 38
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;

    move-result-object p1

    return-object p1
.end method
