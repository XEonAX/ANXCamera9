.class public final Landroid/hardware/camera2/marshal/MarshalHelpers;
.super Ljava/lang/Object;
.source "MarshalHelpers.java"


# static fields
.field public static final SIZEOF_BYTE:I = 0x1

.field public static final SIZEOF_DOUBLE:I = 0x8

.field public static final SIZEOF_FLOAT:I = 0x4

.field public static final SIZEOF_INT32:I = 0x4

.field public static final SIZEOF_INT64:I = 0x8

.field public static final SIZEOF_RATIONAL:I = 0x8


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static checkNativeType(I)I
    .registers 4
    .param p0, "nativeType"    # I

    .line 208
    packed-switch p0, :pswitch_data_1c

    .line 218
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown nativeType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 215
    :pswitch_1a
    return p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
    .end packed-switch
.end method

.method public static checkNativeTypeEquals(II)I
    .registers 6
    .param p0, "expectedNativeType"    # I
    .param p1, "actualNativeType"    # I

    .line 231
    if-ne p0, p1, :cond_3

    .line 237
    return p1

    .line 232
    :cond_3
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 234
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 233
    const-string v2, "Expected native type %d, but got %d"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkPrimitiveClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 87
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string/jumbo v0, "klass must not be null"

    invoke-static {p0, v0}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    invoke-static {p0}, Landroid/hardware/camera2/marshal/MarshalHelpers;->isPrimitiveClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 90
    return-object p0

    .line 93
    :cond_d
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported class \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\'; expected a metadata primitive class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getPrimitiveTypeSize(I)I
    .registers 4
    .param p0, "nativeType"    # I

    .line 55
    const/4 v0, 0x4

    const/16 v1, 0x8

    packed-switch p0, :pswitch_data_24

    .line 70
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type, can\'t get size for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :pswitch_1d
    return v1

    .line 65
    :pswitch_1e
    return v1

    .line 63
    :pswitch_1f
    return v1

    .line 61
    :pswitch_20
    return v0

    .line 59
    :pswitch_21
    return v0

    .line 57
    :pswitch_22
    const/4 v0, 0x1

    return v0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
    .end packed-switch
.end method

.method public static isPrimitiveClass(Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)Z"
        }
    .end annotation

    .line 118
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 119
    return v0

    .line 122
    :cond_4
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x1

    if-eq p0, v1, :cond_3c

    const-class v1, Ljava/lang/Byte;

    if-ne p0, v1, :cond_e

    goto :goto_3c

    .line 124
    :cond_e
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_3b

    const-class v1, Ljava/lang/Integer;

    if-ne p0, v1, :cond_17

    goto :goto_3b

    .line 126
    :cond_17
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_3a

    const-class v1, Ljava/lang/Float;

    if-ne p0, v1, :cond_20

    goto :goto_3a

    .line 128
    :cond_20
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_39

    const-class v1, Ljava/lang/Long;

    if-ne p0, v1, :cond_29

    goto :goto_39

    .line 130
    :cond_29
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_38

    const-class v1, Ljava/lang/Double;

    if-ne p0, v1, :cond_32

    goto :goto_38

    .line 132
    :cond_32
    const-class v1, Landroid/util/Rational;

    if-ne p0, v1, :cond_37

    .line 133
    return v2

    .line 136
    :cond_37
    return v0

    .line 131
    :cond_38
    :goto_38
    return v2

    .line 129
    :cond_39
    :goto_39
    return v2

    .line 127
    :cond_3a
    :goto_3a
    return v2

    .line 125
    :cond_3b
    :goto_3b
    return v2

    .line 123
    :cond_3c
    :goto_3c
    return v2
.end method

.method public static toStringNativeType(I)Ljava/lang/String;
    .registers 3
    .param p0, "nativeType"    # I

    .line 179
    packed-switch p0, :pswitch_data_2c

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNKNOWN("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 191
    :pswitch_1a
    const-string v0, "TYPE_RATIONAL"

    return-object v0

    .line 189
    :pswitch_1d
    const-string v0, "TYPE_DOUBLE"

    return-object v0

    .line 187
    :pswitch_20
    const-string v0, "TYPE_INT64"

    return-object v0

    .line 185
    :pswitch_23
    const-string v0, "TYPE_FLOAT"

    return-object v0

    .line 183
    :pswitch_26
    const-string v0, "TYPE_INT32"

    return-object v0

    .line 181
    :pswitch_29
    const-string v0, "TYPE_BYTE"

    return-object v0

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
    .end packed-switch
.end method

.method public static wrapClassIfPrimitive(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 154
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_7

    .line 155
    const-class v0, Ljava/lang/Byte;

    return-object v0

    .line 156
    :cond_7
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_e

    .line 157
    const-class v0, Ljava/lang/Integer;

    return-object v0

    .line 158
    :cond_e
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_15

    .line 159
    const-class v0, Ljava/lang/Float;

    return-object v0

    .line 160
    :cond_15
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1c

    .line 161
    const-class v0, Ljava/lang/Long;

    return-object v0

    .line 162
    :cond_1c
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_23

    .line 163
    const-class v0, Ljava/lang/Double;

    return-object v0

    .line 166
    :cond_23
    return-object p0
.end method
