.class public final Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "EnumDescriptorProto"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;


# instance fields
.field public name:Ljava/lang/String;

.field public options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

.field public reservedName:[Ljava/lang/String;

.field public reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

.field public value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1942
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 1943
    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->clear()Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    .line 1944
    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
    .locals 2

    .line 1914
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    if-nez v0, :cond_1

    .line 1915
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 1917
    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    if-nez v1, :cond_0

    .line 1918
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    .line 1920
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1922
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2134
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 2128
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
    .locals 2

    .line 1947
    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    .line 1948
    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    .line 1949
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    .line 1950
    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    move-result-object v1

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    .line 1951
    sget-object v1, Lcom/google/protobuf/nano/WireFormatNano;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    .line 1952
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 1953
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->cachedSize:I

    .line 1954
    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 6

    .line 1995
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 1996
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1997
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    .line 1998
    invoke-static {v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 2000
    :cond_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    array-length v1, v1

    if-lez v1, :cond_3

    .line 2001
    move v1, v0

    move v0, v3

    :goto_0
    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    array-length v4, v4

    if-ge v0, v4, :cond_2

    .line 2002
    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    aget-object v4, v4, v0

    .line 2003
    if-eqz v4, :cond_1

    .line 2004
    const/4 v5, 0x2

    .line 2005
    invoke-static {v5, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v4

    add-int/2addr v1, v4

    .line 2001
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2009
    :cond_2
    move v0, v1

    :cond_3
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    if-eqz v1, :cond_4

    .line 2010
    const/4 v1, 0x3

    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    .line 2011
    invoke-static {v1, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    .line 2013
    :cond_4
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    array-length v1, v1

    if-lez v1, :cond_7

    .line 2014
    move v1, v0

    move v0, v3

    :goto_1
    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    array-length v4, v4

    if-ge v0, v4, :cond_6

    .line 2015
    iget-object v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    aget-object v4, v4, v0

    .line 2016
    if-eqz v4, :cond_5

    .line 2017
    const/4 v5, 0x4

    .line 2018
    invoke-static {v5, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v4

    add-int/2addr v1, v4

    .line 2014
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2022
    :cond_6
    move v0, v1

    :cond_7
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    array-length v1, v1

    if-lez v1, :cond_a

    .line 2023
    nop

    .line 2024
    nop

    .line 2025
    move v1, v3

    move v4, v1

    :goto_2
    iget-object v5, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    array-length v5, v5

    if-ge v3, v5, :cond_9

    .line 2026
    iget-object v5, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    aget-object v5, v5, v3

    .line 2027
    if-eqz v5, :cond_8

    .line 2028
    add-int/lit8 v4, v4, 0x1

    .line 2029
    nop

    .line 2030
    invoke-static {v5}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSizeNoTag(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v1, v5

    .line 2025
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2033
    :cond_9
    add-int/2addr v0, v1

    .line 2034
    mul-int/2addr v2, v4

    add-int/2addr v0, v2

    .line 2036
    :cond_a
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2044
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 2045
    if-eqz v0, :cond_10

    const/16 v1, 0xa

    if-eq v0, v1, :cond_e

    const/16 v1, 0x12

    const/4 v2, 0x0

    if-eq v0, v1, :cond_a

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_8

    const/16 v1, 0x22

    if-eq v0, v1, :cond_4

    const/16 v1, 0x2a

    if-eq v0, v1, :cond_0

    .line 2049
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_f

    .line 2050
    return-object p0

    .line 2106
    :cond_0
    nop

    .line 2107
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 2108
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    if-nez v1, :cond_1

    .line 2109
    move v1, v2

    goto :goto_1

    .line 2108
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    array-length v1, v1

    .line 2109
    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/String;

    .line 2110
    if-eqz v1, :cond_2

    .line 2111
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2113
    :cond_2
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_3

    .line 2114
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 2115
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 2113
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2118
    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 2119
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    .line 2120
    goto/16 :goto_7

    .line 2086
    :cond_4
    nop

    .line 2087
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 2088
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    if-nez v1, :cond_5

    .line 2089
    move v1, v2

    goto :goto_3

    .line 2088
    :cond_5
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    array-length v1, v1

    .line 2089
    :goto_3
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    .line 2091
    if-eqz v1, :cond_6

    .line 2092
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2094
    :cond_6
    :goto_4
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_7

    .line 2095
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;-><init>()V

    aput-object v2, v0, v1

    .line 2096
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 2097
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 2094
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 2100
    :cond_7
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;-><init>()V

    aput-object v2, v0, v1

    .line 2101
    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 2102
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    .line 2103
    goto :goto_7

    .line 2079
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    if-nez v0, :cond_9

    .line 2080
    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    .line 2082
    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 2083
    goto :goto_7

    .line 2059
    :cond_a
    nop

    .line 2060
    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    .line 2061
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    if-nez v1, :cond_b

    .line 2062
    move v1, v2

    goto :goto_5

    .line 2061
    :cond_b
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    array-length v1, v1

    .line 2062
    :goto_5
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    .line 2064
    if-eqz v1, :cond_c

    .line 2065
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2067
    :cond_c
    :goto_6
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_d

    .line 2068
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    .line 2069
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 2070
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    .line 2067
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 2073
    :cond_d
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    .line 2074
    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 2075
    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    .line 2076
    goto :goto_7

    .line 2055
    :cond_e
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    .line 2056
    nop

    .line 2123
    :cond_f
    :goto_7
    goto/16 :goto_0

    .line 2047
    :cond_10
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1806
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;

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

    .line 1960
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1961
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->name:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    .line 1963
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    array-length v0, v0

    if-lez v0, :cond_2

    .line 1964
    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 1965
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->value:[Lcom/google/protobuf/nano/DescriptorProtos$EnumValueDescriptorProto;

    aget-object v2, v2, v0

    .line 1966
    if-eqz v2, :cond_1

    .line 1967
    const/4 v3, 0x2

    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 1964
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1971
    :cond_2
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    if-eqz v0, :cond_3

    .line 1972
    const/4 v0, 0x3

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$EnumOptions;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 1974
    :cond_3
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    array-length v0, v0

    if-lez v0, :cond_5

    .line 1975
    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    array-length v2, v2

    if-ge v0, v2, :cond_5

    .line 1976
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedRange:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    aget-object v2, v2, v0

    .line 1977
    if-eqz v2, :cond_4

    .line 1978
    const/4 v3, 0x4

    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    .line 1975
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1982
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_7

    .line 1983
    :goto_2
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    array-length v0, v0

    if-ge v1, v0, :cond_7

    .line 1984
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;->reservedName:[Ljava/lang/String;

    aget-object v0, v0, v1

    .line 1985
    if-eqz v0, :cond_6

    .line 1986
    const/4 v2, 0x5

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    .line 1983
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1990
    :cond_7
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 1991
    return-void
.end method
