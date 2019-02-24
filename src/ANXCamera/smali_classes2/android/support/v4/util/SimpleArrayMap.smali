.class public Landroid/support/v4/util/SimpleArrayMap;
.super Ljava/lang/Object;
.source "SimpleArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final BASE_SIZE:I = 0x4

.field private static final CACHE_SIZE:I = 0xa

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "ArrayMap"

.field static mBaseCache:[Ljava/lang/Object;

.field static mBaseCacheSize:I

.field static mTwiceBaseCache:[Ljava/lang/Object;

.field static mTwiceBaseCacheSize:I


# instance fields
.field mArray:[Ljava/lang/Object;

.field mHashes:[I

.field mSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 208
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 210
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 211
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 212
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .line 217
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    if-nez p1, :cond_e

    .line 219
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 220
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    goto :goto_11

    .line 222
    :cond_e
    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 224
    :goto_11
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 225
    return-void
.end method

.method public constructor <init>(Landroid/support/v4/util/SimpleArrayMap;)V
    .registers 2
    .param p1, "map"    # Landroid/support/v4/util/SimpleArrayMap;

    .line 231
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    .line 232
    if-eqz p1, :cond_8

    .line 233
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V

    .line 235
    :cond_8
    return-void
.end method

.method private allocArrays(I)V
    .registers 8
    .param p1, "size"    # I

    .line 138
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_32

    .line 139
    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    .line 140
    :try_start_a
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_2d

    .line 141
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 142
    .local v4, "array":[Ljava/lang/Object;
    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 143
    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 144
    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 145
    aput-object v0, v4, v2

    aput-object v0, v4, v1

    .line 146
    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    .line 149
    monitor-exit v3

    return-void

    .line 151
    .end local v4    # "array":[Ljava/lang/Object;
    :cond_2d
    monitor-exit v3

    goto :goto_60

    :catchall_2f
    move-exception v0

    monitor-exit v3
    :try_end_31
    .catchall {:try_start_a .. :try_end_31} :catchall_2f

    throw v0

    .line 152
    :cond_32
    const/4 v3, 0x4

    if-ne p1, v3, :cond_60

    .line 153
    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    .line 154
    :try_start_38
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_5b

    .line 155
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 156
    .restart local v4    # "array":[Ljava/lang/Object;
    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 157
    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 158
    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 159
    aput-object v0, v4, v2

    aput-object v0, v4, v1

    .line 160
    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    .line 163
    monitor-exit v3

    return-void

    .line 165
    .end local v4    # "array":[Ljava/lang/Object;
    :cond_5b
    monitor-exit v3

    goto :goto_60

    :catchall_5d
    move-exception v0

    monitor-exit v3
    :try_end_5f
    .catchall {:try_start_38 .. :try_end_5f} :catchall_5d

    throw v0

    .line 168
    :cond_60
    :goto_60
    new-array v0, p1, [I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 169
    shl-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 170
    return-void
.end method

.method private static freeArrays([I[Ljava/lang/Object;I)V
    .registers 10
    .param p0, "hashes"    # [I
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "size"    # I

    .line 173
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/16 v4, 0xa

    const/4 v5, 0x1

    const/16 v6, 0x8

    if-ne v0, v6, :cond_2e

    .line 174
    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    .line 175
    :try_start_e
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    if-ge v6, v4, :cond_29

    .line 176
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    .line 177
    aput-object p0, p1, v5

    .line 178
    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    .local v3, "i":I
    :goto_1b
    if-lt v3, v2, :cond_22

    .line 179
    aput-object v1, p1, v3

    .line 178
    add-int/lit8 v3, v3, -0x1

    goto :goto_1b

    .line 181
    .end local v3    # "i":I
    :cond_22
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 182
    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    .line 186
    :cond_29
    monitor-exit v0

    goto :goto_55

    :catchall_2b
    move-exception v1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_e .. :try_end_2d} :catchall_2b

    throw v1

    .line 187
    :cond_2e
    array-length v0, p0

    const/4 v6, 0x4

    if-ne v0, v6, :cond_55

    .line 188
    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    .line 189
    :try_start_35
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    if-ge v6, v4, :cond_50

    .line 190
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    .line 191
    aput-object p0, p1, v5

    .line 192
    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    .restart local v3    # "i":I
    :goto_42
    if-lt v3, v2, :cond_49

    .line 193
    aput-object v1, p1, v3

    .line 192
    add-int/lit8 v3, v3, -0x1

    goto :goto_42

    .line 195
    .end local v3    # "i":I
    :cond_49
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 196
    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    .line 200
    :cond_50
    monitor-exit v0

    goto :goto_55

    :catchall_52
    move-exception v1

    monitor-exit v0
    :try_end_54
    .catchall {:try_start_35 .. :try_end_54} :catchall_52

    throw v1

    .line 202
    :cond_55
    :goto_55
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 4

    .line 241
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-eqz v0, :cond_18

    .line 242
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 243
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 244
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 245
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 247
    :cond_18
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 273
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .line 313
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfValue(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public ensureCapacity(I)V
    .registers 7
    .param p1, "minimumCapacity"    # I

    .line 254
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v0, v0

    if-ge v0, p1, :cond_26

    .line 255
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 256
    .local v0, "ohashes":[I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 257
    .local v1, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 258
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lez v2, :cond_21

    .line 259
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/lit8 v3, v3, 0x1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 262
    :cond_21
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 264
    .end local v0    # "ohashes":[I
    .end local v1    # "oarray":[Ljava/lang/Object;
    :cond_26
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "object"    # Ljava/lang/Object;

    .line 532
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    .line 533
    return v0

    .line 535
    :cond_4
    instance-of v1, p1, Ljava/util/Map;

    const/4 v2, 0x0

    if-eqz v1, :cond_43

    .line 536
    move-object v1, p1

    check-cast v1, Ljava/util/Map;

    .line 537
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v3

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    if-eq v3, v4, :cond_17

    .line 538
    return v2

    .line 542
    :cond_17
    move v3, v2

    .local v3, "i":I
    :goto_18
    :try_start_18
    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v3, v4, :cond_3d

    .line 543
    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 544
    .local v4, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    .line 545
    .local v5, "mine":Ljava/lang/Object;, "TV;"
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 546
    .local v6, "theirs":Ljava/lang/Object;
    if-nez v5, :cond_33

    .line 547
    if-nez v6, :cond_32

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3a

    .line 548
    :cond_32
    return v2

    .line 550
    :cond_33
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_37
    .catch Ljava/lang/NullPointerException; {:try_start_18 .. :try_end_37} :catch_41
    .catch Ljava/lang/ClassCastException; {:try_start_18 .. :try_end_37} :catch_3f

    if-nez v7, :cond_3a

    .line 551
    return v2

    .line 542
    .end local v4    # "key":Ljava/lang/Object;, "TK;"
    .end local v5    # "mine":Ljava/lang/Object;, "TV;"
    .end local v6    # "theirs":Ljava/lang/Object;
    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 558
    .end local v3    # "i":I
    :cond_3d
    nop

    .line 559
    return v0

    .line 556
    :catch_3f
    move-exception v0

    .line 557
    .local v0, "ignored":Ljava/lang/ClassCastException;
    return v2

    .line 554
    .end local v0    # "ignored":Ljava/lang/ClassCastException;
    :catch_41
    move-exception v0

    .line 555
    .local v0, "ignored":Ljava/lang/NullPointerException;
    return v2

    .line 561
    .end local v0    # "ignored":Ljava/lang/NullPointerException;
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_43
    return v2
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 323
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    .line 324
    .local v0, "index":I
    if-ltz v0, :cond_f

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v2, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    return-object v1
.end method

.method public hashCode()I
    .registers 10

    .line 569
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 570
    .local v0, "hashes":[I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 571
    .local v1, "array":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 572
    .local v2, "result":I
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x1

    .local v4, "v":I
    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .local v5, "s":I
    :goto_9
    if-ge v3, v5, :cond_1e

    .line 573
    aget-object v6, v1, v4

    .line 574
    .local v6, "value":Ljava/lang/Object;
    aget v7, v0, v3

    if-nez v6, :cond_13

    const/4 v8, 0x0

    goto :goto_17

    :cond_13
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v8

    :goto_17
    xor-int/2addr v7, v8

    add-int/2addr v2, v7

    .line 572
    .end local v6    # "value":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x2

    goto :goto_9

    .line 576
    .end local v3    # "i":I
    .end local v4    # "v":I
    .end local v5    # "s":I
    :cond_1e
    return v2
.end method

.method indexOf(Ljava/lang/Object;I)I
    .registers 9
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .line 62
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 65
    .local v0, "N":I
    if-nez v0, :cond_6

    .line 66
    const/4 v1, -0x1

    return v1

    .line 69
    :cond_6
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v1, v0, p2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    .line 72
    .local v1, "index":I
    if-gez v1, :cond_f

    .line 73
    return v1

    .line 77
    :cond_f
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 78
    return v1

    .line 83
    :cond_1c
    add-int/lit8 v2, v1, 0x1

    .local v2, "end":I
    :goto_1e
    if-ge v2, v0, :cond_36

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-ne v3, p2, :cond_36

    .line 84
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_33

    return v2

    .line 83
    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    .line 88
    :cond_36
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_38
    if-ltz v3, :cond_50

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-ne v4, p2, :cond_50

    .line 89
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d

    return v3

    .line 88
    :cond_4d
    add-int/lit8 v3, v3, -0x1

    goto :goto_38

    .line 96
    .end local v3    # "i":I
    :cond_50
    not-int v3, v2

    return v3
.end method

.method public indexOfKey(Ljava/lang/Object;)I
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 283
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    if-nez p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v0

    goto :goto_f

    :cond_7
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v0

    :goto_f
    return v0
.end method

.method indexOfNull()I
    .registers 7

    .line 100
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 103
    .local v0, "N":I
    if-nez v0, :cond_6

    .line 104
    const/4 v1, -0x1

    return v1

    .line 107
    :cond_6
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    .line 110
    .local v1, "index":I
    if-gez v1, :cond_10

    .line 111
    return v1

    .line 115
    :cond_10
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    if-nez v2, :cond_19

    .line 116
    return v1

    .line 121
    :cond_19
    add-int/lit8 v2, v1, 0x1

    .local v2, "end":I
    :goto_1b
    if-ge v2, v0, :cond_2f

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-nez v3, :cond_2f

    .line 122
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    if-nez v3, :cond_2c

    return v2

    .line 121
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 126
    :cond_2f
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_31
    if-ltz v3, :cond_45

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-nez v4, :cond_45

    .line 127
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    if-nez v4, :cond_42

    return v3

    .line 126
    :cond_42
    add-int/lit8 v3, v3, -0x1

    goto :goto_31

    .line 134
    .end local v3    # "i":I
    :cond_45
    not-int v3, v2

    return v3
.end method

.method indexOfValue(Ljava/lang/Object;)I
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;

    .line 287
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v0, v0, 0x2

    .line 288
    .local v0, "N":I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 289
    .local v1, "array":[Ljava/lang/Object;
    const/4 v2, 0x1

    if-nez p1, :cond_16

    .line 290
    nop

    .local v2, "i":I
    :goto_a
    if-ge v2, v0, :cond_27

    .line 291
    aget-object v3, v1, v2

    if-nez v3, :cond_13

    .line 292
    shr-int/lit8 v3, v2, 0x1

    return v3

    .line 290
    :cond_13
    add-int/lit8 v2, v2, 0x2

    goto :goto_a

    .line 296
    .end local v2    # "i":I
    :cond_16
    nop

    .restart local v2    # "i":I
    :goto_17
    if-ge v2, v0, :cond_27

    .line 297
    aget-object v3, v1, v2

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 298
    shr-int/lit8 v3, v2, 0x1

    return v3

    .line 296
    :cond_24
    add-int/lit8 v2, v2, 0x2

    goto :goto_17

    .line 302
    .end local v2    # "i":I
    :cond_27
    const/4 v2, -0x1

    return v2
.end method

.method public isEmpty()Z
    .registers 2

    .line 362
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public keyAt(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 333
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 376
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p1, :cond_8

    .line 377
    const/4 v0, 0x0

    .line 378
    .local v0, "hash":I
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v1

    .local v1, "index":I
    goto :goto_10

    .line 380
    .end local v0    # "hash":I
    .end local v1    # "index":I
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 381
    .restart local v0    # "hash":I
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v1

    .line 383
    .restart local v1    # "index":I
    :goto_10
    if-ltz v1, :cond_1f

    .line 384
    shl-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, 0x1

    .line 385
    .end local v1    # "index":I
    .local v2, "index":I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v1, v1, v2

    .line 386
    .local v1, "old":Ljava/lang/Object;, "TV;"
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aput-object p2, v3, v2

    .line 387
    return-object v1

    .line 390
    .end local v2    # "index":I
    .local v1, "index":I
    :cond_1f
    not-int v1, v1

    .line 391
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v3, v3

    if-lt v2, v3, :cond_5b

    .line 392
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v3, 0x4

    const/16 v4, 0x8

    if-lt v2, v4, :cond_36

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shr-int/lit8 v3, v3, 0x1

    add-int/2addr v3, v2

    goto :goto_3c

    :cond_36
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lt v2, v3, :cond_3c

    move v3, v4

    nop

    :cond_3c
    :goto_3c
    move v2, v3

    .line 397
    .local v2, "n":I
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 398
    .local v3, "ohashes":[I
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 399
    .local v4, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, v2}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 401
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v5, v5

    if-lez v5, :cond_56

    .line 403
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v6, v3

    const/4 v7, 0x0

    invoke-static {v3, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 404
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    :cond_56
    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v3, v4, v5}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 410
    .end local v2    # "n":I
    .end local v3    # "ohashes":[I
    .end local v4    # "oarray":[Ljava/lang/Object;
    :cond_5b
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_7d

    .line 413
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v4, v1, 0x1

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, v1

    invoke-static {v2, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 414
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    add-int/lit8 v5, v1, 0x1

    shl-int/lit8 v5, v5, 0x1

    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, v1

    shl-int/lit8 v6, v6, 0x1

    invoke-static {v2, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 417
    :cond_7d
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aput v0, v2, v1

    .line 418
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aput-object p1, v2, v3

    .line 419
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    add-int/lit8 v3, v3, 0x1

    aput-object p2, v2, v3

    .line 420
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 421
    const/4 v2, 0x0

    return-object v2
.end method

.method public putAll(Landroid/support/v4/util/SimpleArrayMap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/SimpleArrayMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 429
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p1, "array":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<+TK;+TV;>;"
    iget v0, p1, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 430
    .local v0, "N":I
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->ensureCapacity(I)V

    .line 431
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v2, 0x0

    if-nez v1, :cond_22

    .line 432
    if-lez v0, :cond_34

    .line 433
    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v1, v2, v3, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 434
    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v0, 0x1

    invoke-static {v1, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 435
    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto :goto_34

    .line 438
    :cond_22
    nop

    .local v2, "i":I
    :goto_23
    move v1, v2

    .end local v2    # "i":I
    .local v1, "i":I
    if-ge v1, v0, :cond_34

    .line 439
    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_23

    .line 442
    .end local v2    # "i":I
    :cond_34
    :goto_34
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 451
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    .line 452
    .local v0, "index":I
    if-ltz v0, :cond_b

    .line 453
    invoke-virtual {p0, v0}, Landroid/support/v4/util/SimpleArrayMap;->removeAt(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 456
    :cond_b
    const/4 v1, 0x0

    return-object v1
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 11
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 465
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    .line 466
    .local v0, "old":Ljava/lang/Object;
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v3, 0x0

    if-gt v1, v2, :cond_22

    .line 469
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v1, v2, v4}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 470
    sget-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 471
    sget-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 472
    iput v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto/16 :goto_ab

    .line 474
    :cond_22
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v1, v1

    const/16 v4, 0x8

    if-le v1, v4, :cond_76

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v5, v5

    div-int/lit8 v5, v5, 0x3

    if-ge v1, v5, :cond_76

    .line 478
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-le v1, v4, :cond_3d

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shr-int/2addr v4, v2

    add-int/2addr v4, v1

    nop

    :cond_3d
    move v1, v4

    .line 482
    .local v1, "n":I
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 483
    .local v4, "ohashes":[I
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 484
    .local v5, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 486
    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, v2

    iput v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 487
    if-lez p1, :cond_58

    .line 489
    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v4, v3, v6, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 490
    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    invoke-static {v5, v3, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 492
    :cond_58
    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v3, :cond_75

    .line 495
    add-int/lit8 v3, p1, 0x1

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v7, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v7, p1

    invoke-static {v4, v3, v6, p1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 496
    add-int/lit8 v3, p1, 0x1

    shl-int/2addr v3, v2

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    iget v8, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v8, p1

    shl-int/lit8 v2, v8, 0x1

    invoke-static {v5, v3, v6, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 499
    .end local v1    # "n":I
    .end local v4    # "ohashes":[I
    .end local v5    # "oarray":[Ljava/lang/Object;
    :cond_75
    goto :goto_ab

    .line 500
    :cond_76
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 501
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v1, :cond_9b

    .line 504
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v3, p1, 0x1

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, p1

    invoke-static {v1, v3, v4, p1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 505
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    shl-int/2addr v3, v2

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, p1, 0x1

    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, p1

    shl-int/2addr v6, v2

    invoke-static {v1, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 508
    :cond_9b
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/2addr v3, v2

    const/4 v4, 0x0

    aput-object v4, v1, v3

    .line 509
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/2addr v3, v2

    add-int/2addr v3, v2

    aput-object v4, v1, v3

    .line 512
    :goto_ab
    return-object v0
.end method

.method public setValueAt(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 352
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    shl-int/lit8 v0, p1, 0x1

    add-int/lit8 v0, v0, 0x1

    .line 353
    .end local p1    # "index":I
    .local v0, "index":I
    iget-object p1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object p1, p1, v0

    .line 354
    .local p1, "old":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aput-object p2, v1, v0

    .line 355
    return-object p1
.end method

.method public size()I
    .registers 2

    .line 519
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 588
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 589
    const-string v0, "{}"

    return-object v0

    .line 592
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 593
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 594
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_18
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_49

    .line 595
    if-lez v1, :cond_23

    .line 596
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    :cond_23
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 599
    .local v2, "key":Ljava/lang/Object;
    if-eq v2, p0, :cond_2d

    .line 600
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 602
    :cond_2d
    const-string v3, "(this Map)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    :goto_32
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 605
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    .line 606
    .local v3, "value":Ljava/lang/Object;
    if-eq v3, p0, :cond_41

    .line 607
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 609
    :cond_41
    const-string v4, "(this Map)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    .end local v2    # "key":Ljava/lang/Object;
    .end local v3    # "value":Ljava/lang/Object;
    :goto_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 612
    .end local v1    # "i":I
    :cond_49
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 613
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public valueAt(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 342
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method
