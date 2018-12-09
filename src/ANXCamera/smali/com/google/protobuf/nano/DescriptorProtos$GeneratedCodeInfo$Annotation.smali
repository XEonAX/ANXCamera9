.class public final Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Annotation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;


# instance fields
.field public begin:I

.field public end:I

.field public path:[I

.field public sourceFile:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6449
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 6450
    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->clear()Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    .line 6451
    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
    .locals 2

    .line 6424
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    if-nez v0, :cond_1

    .line 6425
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 6427
    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    if-nez v1, :cond_0

    .line 6428
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    .line 6430
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 6432
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6600
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 6594
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
    .locals 1

    .line 6454
    sget-object v0, Lcom/google/protobuf/nano/WireFormatNano;->EMPTY_INT_ARRAY:[I

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    .line 6455
    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    .line 6456
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    .line 6457
    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    .line 6458
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 6459
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->cachedSize:I

    .line 6460
    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 4

    .line 6493
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 6494
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v1, v1

    if-lez v1, :cond_1

    .line 6495
    nop

    .line 6496
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 6497
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    aget v3, v3, v1

    .line 6498
    nop

    .line 6499
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32SizeNoTag(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 6496
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 6501
    :cond_0
    add-int/2addr v0, v2

    .line 6502
    add-int/lit8 v0, v0, 0x1

    .line 6503
    nop

    .line 6504
    invoke-static {v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 6506
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 6507
    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    .line 6508
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 6510
    :cond_2
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    if-eqz v1, :cond_3

    .line 6511
    const/4 v1, 0x3

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    .line 6512
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 6514
    :cond_3
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    if-eqz v1, :cond_4

    .line 6515
    const/4 v1, 0x4

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    .line 6516
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 6518
    :cond_4
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6526
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 6527
    if-eqz v0, :cond_d

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eq v0, v1, :cond_8

    const/16 v1, 0xa

    if-eq v0, v1, :cond_3

    const/16 v1, 0x12

    if-eq v0, v1, :cond_2

    const/16 v1, 0x18

    if-eq v0, v1, :cond_1

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    .line 6531
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_c

    .line 6532
    return-object p0

    .line 6585
    :cond_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    goto/16 :goto_6

    .line 6581
    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    .line 6582
    goto/16 :goto_6

    .line 6577
    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    .line 6578
    goto/16 :goto_6

    .line 6554
    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readRawVarint32()I

    move-result v0

    .line 6555
    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->pushLimit(I)I

    move-result v0

    .line 6557
    nop

    .line 6558
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    .line 6559
    move v3, v2

    :goto_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getBytesUntilLimit()I

    move-result v4

    if-lez v4, :cond_4

    .line 6560
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    .line 6561
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 6563
    :cond_4
    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    .line 6564
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    if-nez v1, :cond_5

    .line 6565
    move v1, v2

    goto :goto_2

    .line 6564
    :cond_5
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v1, v1

    .line 6565
    :goto_2
    add-int/2addr v3, v1

    new-array v3, v3, [I

    .line 6566
    if-eqz v1, :cond_6

    .line 6567
    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    invoke-static {v4, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6569
    :cond_6
    :goto_3
    array-length v2, v3

    if-ge v1, v2, :cond_7

    .line 6570
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    aput v2, v3, v1

    .line 6569
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 6572
    :cond_7
    iput-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    .line 6573
    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->popLimit(I)V

    .line 6574
    goto :goto_6

    .line 6537
    :cond_8
    nop

    .line 6538
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 6539
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    if-nez v1, :cond_9

    .line 6540
    move v1, v2

    goto :goto_4

    .line 6539
    :cond_9
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v1, v1

    .line 6540
    :goto_4
    add-int/2addr v0, v1

    new-array v0, v0, [I

    .line 6541
    if-eqz v1, :cond_a

    .line 6542
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6544
    :cond_a
    :goto_5
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_b

    .line 6545
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    aput v2, v0, v1

    .line 6546
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 6544
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 6549
    :cond_b
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    aput v2, v0, v1

    .line 6550
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    .line 6551
    nop

    .line 6589
    :cond_c
    :goto_6
    goto/16 :goto_0

    .line 6529
    :cond_d
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6418
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6466
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v0, v0

    if-lez v0, :cond_1

    .line 6467
    nop

    .line 6468
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 6469
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    aget v3, v3, v1

    .line 6470
    nop

    .line 6471
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32SizeNoTag(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 6468
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 6473
    :cond_0
    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 6474
    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 6475
    :goto_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 6476
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->path:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32NoTag(I)V

    .line 6475
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 6479
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 6480
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->sourceFile:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    .line 6482
    :cond_2
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    if-eqz v0, :cond_3

    .line 6483
    const/4 v0, 0x3

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->begin:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    .line 6485
    :cond_3
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    if-eqz v0, :cond_4

    .line 6486
    const/4 v0, 0x4

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$GeneratedCodeInfo$Annotation;->end:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    .line 6488
    :cond_4
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 6489
    return-void
.end method
