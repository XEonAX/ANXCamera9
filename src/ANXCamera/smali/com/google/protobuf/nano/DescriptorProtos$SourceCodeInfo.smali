.class public final Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SourceCodeInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;


# instance fields
.field public location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6324
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 6325
    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->clear()Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    .line 6326
    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
    .locals 2

    .line 6308
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    if-nez v0, :cond_1

    .line 6309
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 6311
    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    if-nez v1, :cond_0

    .line 6312
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    .line 6314
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 6316
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6411
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 6405
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
    .locals 1

    .line 6329
    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    .line 6330
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 6331
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->cachedSize:I

    .line 6332
    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 4

    .line 6351
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 6352
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    array-length v1, v1

    if-lez v1, :cond_1

    .line 6353
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 6354
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    aget-object v2, v2, v1

    .line 6355
    if-eqz v2, :cond_0

    .line 6356
    nop

    .line 6357
    const/4 v3, 0x1

    invoke-static {v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v2

    add-int/2addr v0, v2

    .line 6353
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 6361
    :cond_1
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6369
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 6370
    if-eqz v0, :cond_5

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    .line 6374
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_4

    .line 6375
    return-object p0

    .line 6380
    :cond_0
    nop

    .line 6381
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 6382
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 6383
    move v1, v2

    goto :goto_1

    .line 6382
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    array-length v1, v1

    .line 6383
    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    .line 6385
    if-eqz v1, :cond_2

    .line 6386
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6388
    :cond_2
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_3

    .line 6389
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;-><init>()V

    aput-object v2, v0, v1

    .line 6390
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 6391
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 6388
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 6394
    :cond_3
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;-><init>()V

    aput-object v2, v0, v1

    .line 6395
    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 6396
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    .line 6397
    nop

    .line 6400
    :cond_4
    goto :goto_0

    .line 6372
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

    .line 6019
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;

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

    .line 6338
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    array-length v0, v0

    if-lez v0, :cond_1

    .line 6339
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 6340
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo;->location:[Lcom/google/protobuf/nano/DescriptorProtos$SourceCodeInfo$Location;

    aget-object v1, v1, v0

    .line 6341
    if-eqz v1, :cond_0

    .line 6342
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 6339
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 6346
    :cond_1
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 6347
    return-void
.end method
