.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;
.super Ljava/lang/Object;
.source "MarshalQueryableColorSpaceTransform.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "Landroid/hardware/camera2/params/ColorSpaceTransform;",
        ">;"
    }
.end annotation


# static fields
.field private static final ELEMENTS_INT32:I = 0x12

.field private static final SIZE:I = 0x48


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
            "Landroid/hardware/camera2/params/ColorSpaceTransform;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "Landroid/hardware/camera2/params/ColorSpaceTransform;",
            ">;"
        }
    .end annotation

    .line 74
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/ColorSpaceTransform;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform$MarshalerColorSpaceTransform;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableColorSpaceTransform;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 5
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/ColorSpaceTransform;",
            ">;I)Z"
        }
    .end annotation

    .line 80
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/ColorSpaceTransform;>;"
    const/4 v0, 0x5

    if-ne p2, v0, :cond_11

    const-class v0, Landroid/hardware/camera2/params/ColorSpaceTransform;

    .line 81
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    .line 80
    :goto_12
    return v0
.end method
