.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableReprocessFormatsMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerReprocessFormatsMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/ReprocessFormatsMap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/ReprocessFormatsMap;",
            ">;I)V"
        }
    .end annotation

    .line 39
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/ReprocessFormatsMap;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap;

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 41
    return-void
.end method


# virtual methods
.method public calculateMarshalSize(Landroid/hardware/camera2/params/ReprocessFormatsMap;)I
    .registers 9
    .param p1, "value"    # Landroid/hardware/camera2/params/ReprocessFormatsMap;

    .line 104
    const/4 v0, 0x0

    .line 106
    .local v0, "length":I
    invoke-virtual {p1}, Landroid/hardware/camera2/params/ReprocessFormatsMap;->getInputs()[I

    move-result-object v1

    .line 107
    .local v1, "inputs":[I
    array-length v2, v1

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v2, :cond_18

    aget v4, v1, v3

    .line 109
    .local v4, "input":I
    add-int/lit8 v0, v0, 0x1

    .line 110
    add-int/lit8 v0, v0, 0x1

    .line 112
    invoke-virtual {p1, v4}, Landroid/hardware/camera2/params/ReprocessFormatsMap;->getOutputs(I)[I

    move-result-object v5

    .line 113
    .local v5, "outputs":[I
    array-length v6, v5

    add-int/2addr v0, v6

    .line 107
    .end local v4    # "input":I
    .end local v5    # "outputs":[I
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 116
    :cond_18
    mul-int/lit8 v2, v0, 0x4

    return v2
.end method

.method public bridge synthetic calculateMarshalSize(Ljava/lang/Object;)I
    .registers 2

    .line 37
    check-cast p1, Landroid/hardware/camera2/params/ReprocessFormatsMap;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;->calculateMarshalSize(Landroid/hardware/camera2/params/ReprocessFormatsMap;)I

    move-result p1

    return p1
.end method

.method public getNativeSize()I
    .registers 2

    .line 90
    sget v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;->NATIVE_SIZE_DYNAMIC:I

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/ReprocessFormatsMap;Ljava/nio/ByteBuffer;)V
    .registers 12
    .param p1, "value"    # Landroid/hardware/camera2/params/ReprocessFormatsMap;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 54
    invoke-virtual {p1}, Landroid/hardware/camera2/params/ReprocessFormatsMap;->getInputs()[I

    move-result-object v0

    invoke-static {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->imageFormatToInternal([I)[I

    move-result-object v0

    .line 55
    .local v0, "inputs":[I
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_b
    if-ge v3, v1, :cond_2e

    aget v4, v0, v3

    .line 57
    .local v4, "input":I
    invoke-virtual {p2, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 59
    nop

    .line 60
    invoke-virtual {p1, v4}, Landroid/hardware/camera2/params/ReprocessFormatsMap;->getOutputs(I)[I

    move-result-object v5

    invoke-static {v5}, Landroid/hardware/camera2/params/StreamConfigurationMap;->imageFormatToInternal([I)[I

    move-result-object v5

    .line 62
    .local v5, "outputs":[I
    array-length v6, v5

    invoke-virtual {p2, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 65
    array-length v6, v5

    move v7, v2

    :goto_21
    if-ge v7, v6, :cond_2b

    aget v8, v5, v7

    .line 66
    .local v8, "output":I
    invoke-virtual {p2, v8}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 65
    .end local v8    # "output":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_21

    .line 55
    .end local v4    # "input":I
    .end local v5    # "outputs":[I
    :cond_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 69
    :cond_2e
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 37
    check-cast p1, Landroid/hardware/camera2/params/ReprocessFormatsMap;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;->marshal(Landroid/hardware/camera2/params/ReprocessFormatsMap;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/ReprocessFormatsMap;
    .registers 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 73
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    .line 74
    .local v0, "len":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    rem-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_1d

    .line 78
    new-array v1, v0, [I

    .line 80
    .local v1, "entries":[I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v2

    .line 81
    .local v2, "intBuffer":Ljava/nio/IntBuffer;
    invoke-virtual {v2, v1}, Ljava/nio/IntBuffer;->get([I)Ljava/nio/IntBuffer;

    .line 85
    new-instance v3, Landroid/hardware/camera2/params/ReprocessFormatsMap;

    invoke-direct {v3, v1}, Landroid/hardware/camera2/params/ReprocessFormatsMap;-><init>([I)V

    return-object v3

    .line 75
    .end local v1    # "entries":[I
    .end local v2    # "intBuffer":Ljava/nio/IntBuffer;
    :cond_1d
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "ReprocessFormatsMap was not TYPE_INT32"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 37
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableReprocessFormatsMap$MarshalerReprocessFormatsMap;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/ReprocessFormatsMap;

    move-result-object p1

    return-object p1
.end method
