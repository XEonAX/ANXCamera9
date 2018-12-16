.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration$MarshalerStreamConfigurationDuration;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableStreamConfigurationDuration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerStreamConfigurationDuration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Landroid/hardware/camera2/params/StreamConfigurationDuration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/StreamConfigurationDuration;",
            ">;I)V"
        }
    .end annotation

    .line 49
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/StreamConfigurationDuration;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration$MarshalerStreamConfigurationDuration;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration;

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 51
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .registers 2

    .line 73
    const/16 v0, 0x20

    return v0
.end method

.method public marshal(Landroid/hardware/camera2/params/StreamConfigurationDuration;Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "value"    # Landroid/hardware/camera2/params/StreamConfigurationDuration;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 55
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfigurationDuration;->getFormat()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 56
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfigurationDuration;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p2, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 57
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfigurationDuration;->getHeight()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p2, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 58
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfigurationDuration;->getDuration()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 59
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 45
    check-cast p1, Landroid/hardware/camera2/params/StreamConfigurationDuration;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration$MarshalerStreamConfigurationDuration;->marshal(Landroid/hardware/camera2/params/StreamConfigurationDuration;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/StreamConfigurationDuration;
    .registers 14
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 63
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    long-to-int v0, v0

    .line 64
    .local v0, "format":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v1

    long-to-int v1, v1

    .line 65
    .local v1, "width":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    long-to-int v8, v2

    .line 66
    .local v8, "height":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v9

    .line 68
    .local v9, "durationNs":J
    new-instance v11, Landroid/hardware/camera2/params/StreamConfigurationDuration;

    move-object v2, v11

    move v3, v0

    move v4, v1

    move v5, v8

    move-wide v6, v9

    invoke-direct/range {v2 .. v7}, Landroid/hardware/camera2/params/StreamConfigurationDuration;-><init>(IIIJ)V

    return-object v11
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 45
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableStreamConfigurationDuration$MarshalerStreamConfigurationDuration;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/hardware/camera2/params/StreamConfigurationDuration;

    move-result-object p1

    return-object p1
.end method
