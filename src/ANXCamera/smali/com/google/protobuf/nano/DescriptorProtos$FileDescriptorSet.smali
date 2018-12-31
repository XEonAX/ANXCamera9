.class public final Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FileDescriptorSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;


# instance fields
.field public file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 34
    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->clear()Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    .line 35
    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
    .locals 2

    .line 17
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    if-nez v0, :cond_1

    .line 18
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 20
    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    if-nez v1, :cond_0

    .line 21
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    .line 23
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 25
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 114
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
    .locals 1

    .line 38
    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->cachedSize:I

    .line 41
    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 4

    .line 60
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 61
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    array-length v1, v1

    if-lez v1, :cond_1

    .line 62
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 63
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    aget-object v2, v2, v1

    .line 64
    if-eqz v2, :cond_0

    .line 65
    nop

    .line 66
    const/4 v3, 0x1

    invoke-static {v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v2

    add-int/2addr v0, v2

    .line 62
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_1
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 79
    if-eqz v0, :cond_5

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    .line 83
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_4

    .line 84
    return-object p0

    .line 89
    :cond_0
    nop

    .line 90
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 91
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 92
    move v1, v2

    goto :goto_1

    .line 91
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    array-length v1, v1

    .line 92
    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    .line 94
    if-eqz v1, :cond_2

    .line 95
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    :cond_2
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_3

    .line 98
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    .line 99
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 100
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 103
    :cond_3
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    .line 104
    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 105
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    .line 106
    nop

    .line 109
    :cond_4
    goto :goto_0

    .line 81
    :cond_5
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    array-length v0, v0

    if-lez v0, :cond_1

    .line 48
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 49
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorSet;->file:[Lcom/google/protobuf/nano/DescriptorProtos$FileDescriptorProto;

    aget-object v1, v1, v0

    .line 50
    if-eqz v1, :cond_0

    .line 51
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 55
    :cond_1
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 56
    return-void
.end method
