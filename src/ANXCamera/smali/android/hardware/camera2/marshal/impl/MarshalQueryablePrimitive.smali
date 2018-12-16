.class public final Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;
.super Ljava/lang/Object;
.source "MarshalQueryablePrimitive.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 49
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>;"
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
            "TT;>;I)",
            "Landroid/hardware/camera2/marshal/Marshaler<",
            "TT;>;"
        }
    .end annotation

    .line 159
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>;"
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive$MarshalerPrimitive;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 7
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)Z"
        }
    .end annotation

    .line 164
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryablePrimitive<TT;>;"
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Class;

    const/4 v1, 0x0

    if-eqz v0, :cond_63

    .line 165
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 167
    .local v0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x1

    if-eq v0, v2, :cond_5e

    const-class v2, Ljava/lang/Byte;

    if-ne v0, v2, :cond_19

    goto :goto_5e

    .line 169
    :cond_19
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v0, v2, :cond_59

    const-class v2, Ljava/lang/Integer;

    if-ne v0, v2, :cond_22

    goto :goto_59

    .line 171
    :cond_22
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq v0, v2, :cond_53

    const-class v2, Ljava/lang/Float;

    if-ne v0, v2, :cond_2b

    goto :goto_53

    .line 173
    :cond_2b
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq v0, v2, :cond_4d

    const-class v2, Ljava/lang/Long;

    if-ne v0, v2, :cond_34

    goto :goto_4d

    .line 175
    :cond_34
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v0, v2, :cond_47

    const-class v2, Ljava/lang/Double;

    if-ne v0, v2, :cond_3d

    goto :goto_47

    .line 177
    :cond_3d
    const-class v2, Landroid/util/Rational;

    if-ne v0, v2, :cond_63

    .line 178
    const/4 v2, 0x5

    if-ne p2, v2, :cond_46

    move v1, v3

    nop

    :cond_46
    return v1

    .line 176
    :cond_47
    :goto_47
    const/4 v2, 0x4

    if-ne p2, v2, :cond_4c

    move v1, v3

    nop

    :cond_4c
    return v1

    .line 174
    :cond_4d
    :goto_4d
    const/4 v2, 0x3

    if-ne p2, v2, :cond_52

    move v1, v3

    nop

    :cond_52
    return v1

    .line 172
    :cond_53
    :goto_53
    const/4 v2, 0x2

    if-ne p2, v2, :cond_58

    move v1, v3

    nop

    :cond_58
    return v1

    .line 170
    :cond_59
    :goto_59
    if-ne p2, v3, :cond_5d

    move v1, v3

    nop

    :cond_5d
    return v1

    .line 168
    :cond_5e
    :goto_5e
    if-nez p2, :cond_62

    move v1, v3

    nop

    :cond_62
    return v1

    .line 181
    .end local v0    # "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_63
    return v1
.end method
