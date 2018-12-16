.class public Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;
.super Ljava/lang/Object;
.source "MarshalQueryableEnum.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String;

.field private static final UINT8_MASK:I = 0xff

.field private static final UINT8_MAX:I = 0xff

.field private static final UINT8_MIN:I

.field private static final sEnumValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/Enum;",
            ">;[I>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 40
    const-class v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->TAG:Ljava/lang/String;

    .line 137
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->sEnumValues:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 38
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Enum;)I
    .registers 2
    .param p0, "x0"    # Ljava/lang/Enum;

    .line 38
    invoke-static {p0}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->getEnumValue(Ljava/lang/Enum;)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Ljava/lang/Class;I)Ljava/lang/Enum;
    .registers 3
    .param p0, "x0"    # Ljava/lang/Class;
    .param p1, "x1"    # I

    .line 38
    invoke-static {p0, p1}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->getEnumFromValue(Ljava/lang/Class;I)Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method private static getEnumFromValue(Ljava/lang/Class;I)Ljava/lang/Enum;
    .registers 10
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(",
            "Ljava/lang/Class<",
            "TT;>;I)TT;"
        }
    .end annotation

    .line 193
    .local p0, "enumType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->sEnumValues:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 194
    .local v0, "registeredValues":[I
    const/4 v1, 0x0

    if-eqz v0, :cond_19

    .line 195
    const/4 v2, -0x1

    .line 197
    .local v2, "ordinal":I
    move v3, v1

    .local v3, "i":I
    :goto_d
    array-length v4, v0

    if-ge v3, v4, :cond_1a

    .line 198
    aget v4, v0, v3

    if-ne v4, p1, :cond_16

    .line 199
    move v2, v3

    .line 200
    goto :goto_1a

    .line 197
    :cond_16
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 204
    .end local v2    # "ordinal":I
    .end local v3    # "i":I
    :cond_19
    move v2, p1

    .line 207
    .restart local v2    # "ordinal":I
    :cond_1a
    :goto_1a
    invoke-virtual {p0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Enum;

    .line 209
    .local v3, "values":[Ljava/lang/Enum;, "[TT;"
    if-ltz v2, :cond_29

    array-length v4, v3

    if-lt v2, v4, :cond_26

    goto :goto_29

    .line 218
    :cond_26
    aget-object v1, v3, v2

    return-object v1

    .line 210
    :cond_29
    :goto_29
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    .line 214
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v7, 0x2

    if-eqz v0, :cond_3c

    .line 215
    move v1, v6

    goto :goto_3d

    .line 214
    :cond_3c
    nop

    .line 215
    :goto_3d
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v5, v7

    .line 211
    const-string v1, "Argument \'value\' (%d) was not a valid enum value for type %s (registered? %b)"

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static getEnumValue(Ljava/lang/Enum;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(TT;)I"
        }
    .end annotation

    .line 173
    .local p0, "enumValue":Ljava/lang/Enum;, "TT;"
    sget-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->sEnumValues:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 175
    .local v0, "values":[I
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    .line 176
    .local v1, "ordinal":I
    if-eqz v0, :cond_15

    .line 177
    aget v2, v0, v1

    return v2

    .line 180
    :cond_15
    return v1
.end method

.method public static registerEnumValues(Ljava/lang/Class;[I)V
    .registers 5
    .param p1, "values"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(",
            "Ljava/lang/Class<",
            "TT;>;[I)V"
        }
    .end annotation

    .line 149
    .local p0, "enumType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Enum;

    array-length v0, v0

    array-length v1, p1

    if-ne v0, v1, :cond_10

    .line 158
    sget-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->sEnumValues:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    return-void

    .line 150
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected values array to be the same size as the enumTypes values "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " for type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
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

    .line 103
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>;"
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    new-instance v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;

    invoke-direct {v0, p0, p1, p2}, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum$MarshalerEnum;-><init>(Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .registers 9
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "TT;>;I)Z"
        }
    .end annotation

    .line 108
    .local p0, "this":Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;, "Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum<TT;>;"
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p2, v1, :cond_6

    if-nez p2, :cond_63

    .line 109
    :cond_6
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Class;

    if-eqz v2, :cond_63

    .line 110
    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 112
    .local v2, "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isEnum()Z

    move-result v3

    if-eqz v3, :cond_63

    .line 120
    const/4 v3, 0x2

    :try_start_1b
    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    aput-object v4, v3, v0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_28
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1b .. :try_end_28} :catch_46
    .catch Ljava/lang/SecurityException; {:try_start_1b .. :try_end_28} :catch_29

    .line 121
    return v1

    .line 125
    :catch_29
    move-exception v1

    .line 127
    .local v1, "e":Ljava/lang/SecurityException;
    sget-object v3, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t marshal class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, "; not accessible"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v1    # "e":Ljava/lang/SecurityException;
    .end local v2    # "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_63

    .line 122
    .restart local v2    # "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_46
    move-exception v1

    .line 124
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    sget-object v3, Landroid/hardware/camera2/marshal/impl/MarshalQueryableEnum;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t marshal class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, "; no default constructor"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    nop

    .line 133
    .end local v2    # "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_63
    :goto_63
    return v0
.end method
