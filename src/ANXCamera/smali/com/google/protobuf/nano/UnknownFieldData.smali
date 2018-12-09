.class final Lcom/google/protobuf/nano/UnknownFieldData;
.super Ljava/lang/Object;
.source "UnknownFieldData.java"


# instance fields
.field final bytes:[B

.field final tag:I


# direct methods
.method constructor <init>(I[B)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput p1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    .line 53
    iput-object p2, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    .line 54
    return-void
.end method


# virtual methods
.method computeSerializedSize()I
    .locals 2

    .line 57
    nop

    .line 58
    iget v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    invoke-static {v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v0

    const/4 v1, 0x0

    add-int/2addr v1, v0

    .line 59
    iget-object v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    array-length v0, v0

    add-int/2addr v1, v0

    .line 60
    return v1
.end method

.method computeSerializedSizeAsMessageSet()I
    .locals 2

    .line 69
    iget v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    iget-object v1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawMessageSetExtensionSize(I[B)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 78
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 79
    return v0

    .line 81
    :cond_0
    instance-of v1, p1, Lcom/google/protobuf/nano/UnknownFieldData;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 82
    return v2

    .line 85
    :cond_1
    check-cast p1, Lcom/google/protobuf/nano/UnknownFieldData;

    .line 86
    iget v1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    iget v3, p1, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    iget-object p1, p1, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-static {v1, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 91
    nop

    .line 92
    iget v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    .line 93
    const/16 v0, 0x1f

    mul-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    add-int/2addr v0, v1

    .line 94
    return v0
.end method

.method writeAsMessageSetTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    iget v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    iget-object v1, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawMessageSetExtension(I[B)V

    .line 74
    return-void
.end method

.method writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->tag:I

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 65
    iget-object v0, p0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawBytes([B)V

    .line 66
    return-void
.end method
