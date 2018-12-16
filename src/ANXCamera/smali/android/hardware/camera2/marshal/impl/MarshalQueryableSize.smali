.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;
.super Ljava/lang/Object;
.source "MarshalQueryableSize.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "Landroid/util/Size;",
        ">;"
    }
.end annotation


# static fields
.field private static final SIZE:I = 0x8


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;
    .registers 4
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/util/Size;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 61
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/util/Size;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize$MarshalerSize;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableSize;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 6
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/util/Size;",
            ">;I)Z"
        }
    .end annotation

    .line 66
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/util/Size;>;"
    const/4 v0, 0x1

    if-ne p2, v0, :cond_10

    const-class v1, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method
