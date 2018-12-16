.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableString.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerString"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 4
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 43
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/String;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 45
    return-void
.end method


# virtual methods
.method public bridge synthetic calculateMarshalSize(Ljava/lang/Object;)I
    .registers 2

    .line 41
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;->calculateMarshalSize(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public calculateMarshalSize(Ljava/lang/String;)I
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .line 57
    sget-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 59
    .local v0, "arr":[B
    array-length v1, v0

    add-int/lit8 v1, v1, 0x1

    return v1
.end method

.method public getNativeSize()I
    .registers 2

    .line 98
    sget v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;->NATIVE_SIZE_DYNAMIC:I

    return v0
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 41
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;->marshal(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public marshal(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .line 49
    sget-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 51
    .local v0, "arr":[B
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 52
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 53
    return-void
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 41
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$MarshalerString;->unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .registers 8
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 64
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 66
    const/4 v0, 0x0

    .line 67
    .local v0, "foundNull":Z
    const/4 v1, 0x0

    move v2, v1

    .line 68
    .local v2, "stringLength":I
    :goto_6
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 69
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    if-nez v3, :cond_14

    .line 70
    const/4 v0, 0x1

    .line 71
    goto :goto_17

    .line 74
    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 83
    :cond_17
    :goto_17
    if-eqz v0, :cond_2d

    .line 87
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 89
    add-int/lit8 v3, v2, 0x1

    new-array v3, v3, [B

    .line 90
    .local v3, "strBytes":[B
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v3, v1, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 93
    new-instance v4, Ljava/lang/String;

    sget-object v5, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v4, v3, v1, v2, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v4

    .line 84
    .end local v3    # "strBytes":[B
    :cond_2d
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v3, "Strings must be null-terminated"

    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
