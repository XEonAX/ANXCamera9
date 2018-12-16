.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;
.super Ljava/lang/Object;
.source "MarshalQueryableHighSpeedVideoConfiguration.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
        ">;"
    }
.end annotation


# static fields
.field private static final SIZE:I = 0x14


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 34
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
            "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
            ">;"
        }
    .end annotation

    .line 76
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration$MarshalerHighSpeedVideoConfiguration;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableHighSpeedVideoConfiguration;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 6
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;",
            ">;I)Z"
        }
    .end annotation

    .line 82
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;>;"
    const/4 v0, 0x1

    if-ne p2, v0, :cond_10

    .line 83
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    const-class v2, Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    .line 82
    :goto_11
    return v0
.end method
