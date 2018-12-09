.class public final Lcom/google/protobuf/nano/InternalNano;
.super Ljava/lang/Object;
.source "InternalNano.java"


# static fields
.field protected static final ISO_8859_1:Ljava/nio/charset/Charset;

.field public static final LAZY_INIT_LOCK:Ljava/lang/Object;

.field protected static final UTF_8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/protobuf/nano/InternalNano;->UTF_8:Ljava/nio/charset/Charset;

    .line 49
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/protobuf/nano/InternalNano;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 61
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesDefaultValue(Ljava/lang/String;)[B
    .locals 1

    .line 104
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    return-object p0
.end method

.method public static cloneUnknownFieldData(Lcom/google/protobuf/nano/ExtendableMessageNano;Lcom/google/protobuf/nano/ExtendableMessageNano;)V
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v0, :cond_0

    .line 322
    iget-object p0, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {p0}, Lcom/google/protobuf/nano/FieldArray;->clone()Lcom/google/protobuf/nano/FieldArray;

    move-result-object p0

    iput-object p0, p1, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 324
    :cond_0
    return-void
.end method

.method public static copyFromUtf8(Ljava/lang/String;)[B
    .locals 1

    .line 112
    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    return-object p0
.end method

.method public static equals([D[D)Z
    .locals 1

    .line 156
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([D[D)Z

    move-result p0

    return p0

    .line 157
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    array-length p0, p1

    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method public static equals([F[F)Z
    .locals 1

    .line 144
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 147
    :cond_0
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result p0

    return p0

    .line 145
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    array-length p0, p1

    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method public static equals([I[I)Z
    .locals 1

    .line 120
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p0

    return p0

    .line 121
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    array-length p0, p1

    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method public static equals([J[J)Z
    .locals 1

    .line 132
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 135
    :cond_0
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([J[J)Z

    move-result p0

    return p0

    .line 133
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    array-length p0, p1

    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method public static equals([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .locals 8

    .line 217
    nop

    .line 218
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 219
    move v1, v0

    goto :goto_0

    .line 218
    :cond_0
    array-length v1, p0

    .line 219
    :goto_0
    nop

    .line 220
    if-nez p1, :cond_1

    .line 222
    move v2, v0

    goto :goto_1

    .line 220
    :cond_1
    array-length v2, p1

    .line 222
    :goto_1
    move v3, v0

    move v4, v3

    :goto_2
    if-ge v3, v1, :cond_2

    aget-object v5, p0, v3

    if-nez v5, :cond_2

    .line 223
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 225
    :cond_2
    :goto_3
    if-ge v4, v2, :cond_3

    aget-object v5, p1, v4

    if-nez v5, :cond_3

    .line 226
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 228
    :cond_3
    const/4 v5, 0x1

    if-lt v3, v1, :cond_4

    .line 229
    move v6, v5

    goto :goto_4

    .line 228
    :cond_4
    nop

    .line 229
    move v6, v0

    :goto_4
    if-lt v4, v2, :cond_5

    .line 230
    move v7, v5

    goto :goto_5

    .line 229
    :cond_5
    nop

    .line 230
    move v7, v0

    :goto_5
    if-eqz v6, :cond_6

    if-eqz v7, :cond_6

    .line 232
    return v5

    .line 233
    :cond_6
    if-eq v6, v7, :cond_7

    .line 235
    return v0

    .line 236
    :cond_7
    aget-object v5, p0, v3

    aget-object v6, p1, v4

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 238
    return v0

    .line 240
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 241
    add-int/lit8 v4, v4, 0x1

    .line 242
    goto :goto_2
.end method

.method public static equals([Z[Z)Z
    .locals 1

    .line 168
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 171
    :cond_0
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Z[Z)Z

    move-result p0

    return p0

    .line 169
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    array-length p0, p1

    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p0, 0x1

    :goto_2
    return p0
.end method

.method public static equals([[B[[B)Z
    .locals 8

    .line 182
    nop

    .line 183
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 184
    move v1, v0

    goto :goto_0

    .line 183
    :cond_0
    array-length v1, p0

    .line 184
    :goto_0
    nop

    .line 185
    if-nez p1, :cond_1

    .line 187
    move v2, v0

    goto :goto_1

    .line 185
    :cond_1
    array-length v2, p1

    .line 187
    :goto_1
    move v3, v0

    move v4, v3

    :goto_2
    if-ge v3, v1, :cond_2

    aget-object v5, p0, v3

    if-nez v5, :cond_2

    .line 188
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 190
    :cond_2
    :goto_3
    if-ge v4, v2, :cond_3

    aget-object v5, p1, v4

    if-nez v5, :cond_3

    .line 191
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 193
    :cond_3
    const/4 v5, 0x1

    if-lt v3, v1, :cond_4

    .line 194
    move v6, v5

    goto :goto_4

    .line 193
    :cond_4
    nop

    .line 194
    move v6, v0

    :goto_4
    if-lt v4, v2, :cond_5

    .line 195
    move v7, v5

    goto :goto_5

    .line 194
    :cond_5
    nop

    .line 195
    move v7, v0

    :goto_5
    if-eqz v6, :cond_6

    if-eqz v7, :cond_6

    .line 197
    return v5

    .line 198
    :cond_6
    if-eq v6, v7, :cond_7

    .line 200
    return v0

    .line 201
    :cond_7
    aget-object v5, p0, v3

    aget-object v6, p1, v4

    invoke-static {v5, v6}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_8

    .line 203
    return v0

    .line 205
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 206
    add-int/lit8 v4, v4, 0x1

    .line 207
    goto :goto_2
.end method

.method public static hashCode([D)I
    .locals 1

    .line 274
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([D)I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static hashCode([F)I
    .locals 1

    .line 266
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([F)I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static hashCode([I)I
    .locals 1

    .line 250
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([I)I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static hashCode([J)I
    .locals 1

    .line 258
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([J)I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static hashCode([Ljava/lang/Object;)I
    .locals 5

    .line 308
    nop

    .line 309
    const/4 v0, 0x0

    if-nez p0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    array-length v1, p0

    :goto_0
    move v2, v0

    :goto_1
    if-ge v0, v1, :cond_2

    .line 310
    aget-object v3, p0, v0

    .line 311
    if-eqz v3, :cond_1

    .line 312
    const/16 v4, 0x1f

    mul-int/2addr v4, v2

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v4, v2

    .line 309
    move v2, v4

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 315
    :cond_2
    return v2
.end method

.method public static hashCode([Z)I
    .locals 1

    .line 282
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Z)I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static hashCode([[B)I
    .locals 5

    .line 291
    nop

    .line 292
    const/4 v0, 0x0

    if-nez p0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    array-length v1, p0

    :goto_0
    move v2, v0

    :goto_1
    if-ge v0, v1, :cond_2

    .line 293
    aget-object v3, p0, v0

    .line 294
    if-eqz v3, :cond_1

    .line 295
    const/16 v4, 0x1f

    mul-int/2addr v4, v2

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v4, v2

    .line 292
    move v2, v4

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 298
    :cond_2
    return v2
.end method

.method public static stringDefaultValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 92
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/google/protobuf/nano/InternalNano;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    sget-object v1, Lcom/google/protobuf/nano/InternalNano;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method
