.class public abstract Landroid/hardware/camera2/marshal/Marshaler;
.super Ljava/lang/Object;
.source "Marshaler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static NATIVE_SIZE_DYNAMIC:I


# instance fields
.field protected final mNativeType:I

.field protected final mTypeReference:Landroid/hardware/camera2/utils/TypeReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 119
    const/4 v0, -0x1

    sput v0, Landroid/hardware/camera2/marshal/Marshaler;->NATIVE_SIZE_DYNAMIC:I

    return-void
.end method

.method protected constructor <init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V
    .registers 7
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/marshal/MarshalQueryable<",
            "TT;>;",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)V"
        }
    .end annotation

    .line 56
    .local p0, "this":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    .local p1, "query":Landroid/hardware/camera2/marshal/MarshalQueryable;, "Landroid/hardware/camera2/marshal/MarshalQueryable<TT;>;"
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const-string/jumbo v0, "typeReference must not be null"

    invoke-static {p2, v0}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/utils/TypeReference;

    iput-object v0, p0, Landroid/hardware/camera2/marshal/Marshaler;->mTypeReference:Landroid/hardware/camera2/utils/TypeReference;

    .line 58
    invoke-static {p3}, Landroid/hardware/camera2/marshal/MarshalHelpers;->checkNativeType(I)I

    move-result v0

    iput v0, p0, Landroid/hardware/camera2/marshal/Marshaler;->mNativeType:I

    .line 60
    invoke-interface {p1, p2, p3}, Landroid/hardware/camera2/marshal/MarshalQueryable;->isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 66
    return-void

    .line 61
    :cond_1b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type marshaling for managed type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " and native type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-static {p3}, Landroid/hardware/camera2/marshal/MarshalHelpers;->toStringNativeType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public calculateMarshalSize(Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 93
    .local p0, "this":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Landroid/hardware/camera2/marshal/Marshaler;->getNativeSize()I

    move-result v0

    .line 95
    .local v0, "nativeSize":I
    sget v1, Landroid/hardware/camera2/marshal/Marshaler;->NATIVE_SIZE_DYNAMIC:I

    if-eq v0, v1, :cond_9

    .line 99
    return v0

    .line 96
    :cond_9
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Override this function for dynamically-sized objects"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public abstract getNativeSize()I
.end method

.method public getNativeType()I
    .registers 2

    .line 146
    .local p0, "this":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    iget v0, p0, Landroid/hardware/camera2/marshal/Marshaler;->mNativeType:I

    return v0
.end method

.method public getTypeReference()Landroid/hardware/camera2/utils/TypeReference;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;"
        }
    .end annotation

    .line 141
    .local p0, "this":Landroid/hardware/camera2/marshal/Marshaler;, "Landroid/hardware/camera2/marshal/Marshaler<TT;>;"
    iget-object v0, p0, Landroid/hardware/camera2/marshal/Marshaler;->mTypeReference:Landroid/hardware/camera2/utils/TypeReference;

    return-object v0
.end method

.method public abstract marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/nio/ByteBuffer;",
            ")V"
        }
    .end annotation
.end method

.method public abstract unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")TT;"
        }
    .end annotation
.end method
