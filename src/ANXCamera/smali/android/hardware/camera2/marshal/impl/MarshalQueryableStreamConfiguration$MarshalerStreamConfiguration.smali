.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration$MarshalerStreamConfiguration;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableStreamConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerStreamConfiguration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/StreamConfiguration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;I)V"
        }
    .end annotation

    .line 40
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/StreamConfiguration;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration$MarshalerStreamConfiguration;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration;

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 42
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 64
    const/16 v0, 0x10

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/StreamConfiguration;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "value"    # Landroid/hardware/camera2/params/StreamConfiguration;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 46
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfiguration;->getFormat()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 47
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 48
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfiguration;->getHeight()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 49
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfiguration;->isInput()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 50
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 38
    check-cast p1, Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration$MarshalerStreamConfiguration;->marshal(Landroid/hardware/camera2/params/StreamConfiguration;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/StreamConfiguration;
    .registers 7
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 54
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 55
    .local v0, "format":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 56
    .local v1, "width":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 57
    .local v2, "height":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    if-eqz v3, :cond_14

    const/4 v3, 0x1

    goto :goto_15

    :cond_14
    const/4 v3, 0x0

    .line 59
    .local v3, "input":Z
    :goto_15
    new-instance v4, Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-direct {v4, v0, v1, v2, v3}, Landroid/hardware/camera2/params/StreamConfiguration;-><init>(IIIZ)V

    return-object v4
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 38
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfiguration$MarshalerStreamConfiguration;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/StreamConfiguration;

    move-result-object p1

    return-object p1
.end method
