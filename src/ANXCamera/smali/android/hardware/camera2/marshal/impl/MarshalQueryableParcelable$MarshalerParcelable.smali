.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "MarshalQueryableParcelable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerParcelable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mCreator:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable;


# direct methods
.method protected constructor <init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 6
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)V"
        }
    .end annotation

    .line 48
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->this$0:Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable;

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 51
    invoke-virtual {p2}, Landroid/hardware/camera2/utils/TypeReference;->getRawType()Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->mClass:Ljava/lang/Class;

    .line 54
    :try_start_b
    iget-object p1, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->mClass:Ljava/lang/Class;

    const-string v0, "CREATOR"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldException; {:try_start_b .. :try_end_13} :catch_2e

    .line 58
    .local p1, "creatorField":Ljava/lang/reflect/Field;
    nop

    .line 57
    nop

    .line 61
    const/4 v0, 0x0

    :try_start_16
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable$Creator;

    iput-object v0, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->mCreator:Landroid/os/Parcelable$Creator;
    :try_end_1e
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_1e} :catch_27
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_1e} :catch_20

    .line 68
    nop

    .line 69
    return-void

    .line 65
    :catch_20
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 62
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_27
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 55
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local p1    # "creatorField":Ljava/lang/reflect/Field;
    :catch_2e
    move-exception p1

    .line 57
    .local p1, "e":Ljava/lang/NoSuchFieldException;
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method public calculateMarshalSize(Landroid/os/Parcelable;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 163
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    .local p1, "value":Landroid/os/Parcelable;, "TT;"
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 165
    .local v0, "parcel":Landroid/os/Parcel;
    const/4 v1, 0x0

    :try_start_5
    invoke-interface {p1, v0, v1}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 166
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v1

    array-length v1, v1
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_12

    .line 173
    .local v1, "length":I
    nop

    .line 175
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 173
    return v1

    .line 175
    .end local v1    # "length":I
    :catchall_12
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public bridge synthetic calculateMarshalSize(Ljava/lang/Object;)I
    .registers 2

    .line 41
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->calculateMarshalSize(Landroid/os/Parcelable;)I

    move-result p1

    return p1
.end method

.method public getNativeSize()I
    .registers 2

    .line 158
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    sget v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->NATIVE_SIZE_DYNAMIC:I

    return v0
.end method

.method public marshal(Landroid/os/Parcelable;Ljava/nio/ByteBuffer;)V
    .registers 8
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation

    .line 77
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    .local p1, "value":Landroid/os/Parcelable;, "TT;"
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 81
    .local v0, "parcel":Landroid/os/Parcel;
    const/4 v1, 0x0

    :try_start_5
    invoke-interface {p1, v0, v1}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 83
    invoke-virtual {v0}, Landroid/os/Parcel;->hasFileDescriptors()Z

    move-result v1

    if-nez v1, :cond_35

    .line 88
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v1
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_51

    .line 91
    .local v1, "parcelContents":[B
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 92
    nop

    .line 91
    nop

    .line 94
    array-length v2, v1

    if-eqz v2, :cond_1e

    .line 98
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 99
    return-void

    .line 95
    :cond_1e
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No data marshaled for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 84
    .end local v1    # "parcelContents":[B
    :cond_35
    :try_start_35
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parcelable "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " must not have file descriptors"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_51
    .catchall {:try_start_35 .. :try_end_51} :catchall_51

    .line 91
    :catchall_51
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .registers 3

    .line 41
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->marshal(Landroid/os/Parcelable;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Landroid/os/Parcelable;
    .registers 10
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")TT;"
        }
    .end annotation

    .line 122
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 124
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 126
    .local v0, "parcel":Landroid/os/Parcel;
    :try_start_7
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 128
    .local v1, "maxLength":I
    new-array v2, v1, [B

    .line 129
    .local v2, "remaining":[B
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 131
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 132
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 134
    iget-object v3, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->mCreator:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Parcelable;

    .line 135
    .local v3, "value":Landroid/os/Parcelable;, "TT;"
    invoke-virtual {v0}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    .line 137
    .local v4, "actualLength":I
    if-eqz v4, :cond_3c

    .line 142
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 143
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 150
    iget-object v5, p0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->mClass:Ljava/lang/Class;

    invoke-virtual {v5, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/Parcelable;
    :try_end_38
    .catchall {:try_start_7 .. :try_end_38} :catchall_53

    .line 152
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 150
    return-object v5

    .line 138
    :cond_3c
    :try_start_3c
    new-instance v5, Ljava/lang/AssertionError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No data marshaled for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5
    :try_end_53
    .catchall {:try_start_3c .. :try_end_53} :catchall_53

    .line 152
    .end local v1    # "maxLength":I
    .end local v2    # "remaining":[B
    .end local v3    # "value":Landroid/os/Parcelable;, "TT;"
    .end local v4    # "actualLength":I
    :catchall_53
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .registers 2

    .line 41
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable<TT;>.MarshalerParcelable;"
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableParcelable$MarshalerParcelable;->unmarshal(Ljava/nio/ByteBuffer;)Landroid/os/Parcelable;

    move-result-object p1

    return-object p1
.end method
