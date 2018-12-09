.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "LensServiceEventData.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;


# instance fields
.field private bitField0_:I

.field private serviceApiVersion_:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 47
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->clear()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    .line 48
    return-void
.end method

.method public static emptyArray()[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 2

    .line 12
    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->_emptyArray:[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    if-nez v0, :cond_1

    .line 13
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 15
    :try_start_0
    sget-object v1, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->_emptyArray:[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    if-nez v1, :cond_0

    .line 16
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    sput-object v1, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->_emptyArray:[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    .line 18
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 20
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->_emptyArray:[Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    new-instance v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    invoke-direct {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    .line 114
    new-instance v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    invoke-direct {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 1

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    .line 52
    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->cachedSize:I

    .line 55
    return-object p0
.end method

.method public clearServiceApiVersion()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 1

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    .line 35
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    .line 36
    return-object p0
.end method

.method public clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 2

    .line 61
    :try_start_0
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->clone()Lcom/google/protobuf/nano/ExtendableMessageNano;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    nop

    .line 65
    return-object v0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/ExtendableMessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    move-result-object v0

    return-object v0
.end method

.method protected computeSerializedSize()I
    .locals 3

    .line 80
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 81
    iget v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    .line 82
    iget v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    .line 83
    invoke-static {v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 85
    :cond_0
    return v0
.end method

.method public getServiceApiVersion()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    return v0
.end method

.method public hasServiceApiVersion()Z
    .locals 2

    .line 31
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 94
    if-eqz v0, :cond_2

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 98
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    return-object p0

    .line 104
    :cond_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    .line 105
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    .line 109
    :cond_1
    goto :goto_0

    .line 96
    :cond_2
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    move-result-object p1

    return-object p1
.end method

.method public setServiceApiVersion(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;
    .locals 1

    .line 39
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    .line 40
    iput p1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    .line 41
    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->bitField0_:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 73
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->serviceApiVersion_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    .line 75
    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 76
    return-void
.end method
