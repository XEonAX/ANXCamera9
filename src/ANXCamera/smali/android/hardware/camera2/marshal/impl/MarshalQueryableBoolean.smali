.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableBoolean;
.super Ljava/lang/Object;
.source "MarshalQueryableBoolean.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableBoolean$MarshalerBoolean;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 30
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
            "Ljava/lang/Boolean;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 57
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/Boolean;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableBoolean$MarshalerBoolean;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableBoolean$MarshalerBoolean;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableBoolean;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 5
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Ljava/lang/Boolean;",
            ">;I)Z"
        }
    .end annotation

    .line 62
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Ljava/lang/Boolean;>;"
    const-class v0, Ljava/lang/Boolean;

    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 63
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    :cond_18
    if-nez p2, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    .line 62
    :goto_1d
    return v0
.end method
