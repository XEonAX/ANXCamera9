.class public final Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OneofDescriptorProto"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;


# instance fields
.field public name:Ljava/lang/String;

.field public options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1726
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 1727
    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->clear()Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    .line 1728
    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
    .locals 2

    .line 1707
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    if-nez v0, :cond_1

    .line 1708
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 1710
    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    if-nez v1, :cond_0

    .line 1711
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    .line 1713
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1715
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1802
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 1796
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
    .locals 1

    .line 1731
    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    .line 1732
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    .line 1733
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 1734
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->cachedSize:I

    .line 1735
    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 3

    .line 1752
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 1753
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1754
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    .line 1755
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 1757
    :cond_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    if-eqz v1, :cond_1

    .line 1758
    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    .line 1759
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    .line 1761
    :cond_1
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1769
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 1770
    if-eqz v0, :cond_4

    const/16 v1, 0xa

    if-eq v0, v1, :cond_2

    const/16 v1, 0x12

    if-eq v0, v1, :cond_0

    .line 1774
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1775
    return-object p0

    .line 1784
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    if-nez v0, :cond_1

    .line 1785
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    .line 1787
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    goto :goto_1

    .line 1780
    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    .line 1781
    nop

    .line 1791
    :cond_3
    :goto_1
    goto :goto_0

    .line 1772
    :cond_4
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1701
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1741
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1742
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    .line 1744
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    if-eqz v0, :cond_1

    .line 1745
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$OneofDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$OneofOptions;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 1747
    :cond_1
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 1748
    return-void
.end method
