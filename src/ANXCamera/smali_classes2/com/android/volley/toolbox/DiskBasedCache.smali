.class public Lcom/android/volley/toolbox/DiskBasedCache;
.super Ljava/lang/Object;
.source "DiskBasedCache.java"

# interfaces
.implements Lcom/android/volley/Cache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;,
        Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    }
.end annotation


# static fields
.field private static final CACHE_MAGIC:I = 0x20140623

.field private static final DEFAULT_DISK_USAGE_BYTES:I = 0x500000

.field private static final HYSTERESIS_FACTOR:F = 0.9f


# instance fields
.field private final mEntries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;",
            ">;"
        }
    .end annotation
.end field

.field private final mMaxCacheSizeInBytes:I

.field private final mRootDirectory:Ljava/io/File;

.field private mTotalSize:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "rootDirectory"    # Ljava/io/File;

    .line 82
    const/high16 v0, 0x500000

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;-><init>(Ljava/io/File;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .registers 7
    .param p1, "rootDirectory"    # Ljava/io/File;
    .param p2, "maxCacheSizeInBytes"    # I

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    .line 49
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    .line 72
    iput-object p1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    .line 73
    iput p2, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mMaxCacheSizeInBytes:I

    .line 74
    return-void
.end method

.method private getFilenameForKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .line 237
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 238
    .local v0, "firstHalfLength":I
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 239
    .local v1, "localFilename":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 240
    return-object v1
.end method

.method private pruneIfNeeded(I)V
    .registers 20
    .param p1, "neededSpace"    # I

    move-object/from16 v0, p0

    .line 255
    move/from16 v1, p1

    iget-wide v2, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    int-to-long v4, v1

    add-long/2addr v2, v4

    iget v4, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mMaxCacheSizeInBytes:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_10

    .line 256
    return-void

    .line 258
    :cond_10
    sget-boolean v2, Lcom/android/volley/VolleyLog;->DEBUG:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1c

    .line 259
    const-string v2, "Pruning old cache entries."

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 262
    :cond_1c
    iget-wide v4, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    .line 263
    .local v4, "before":J
    const/4 v2, 0x0

    .line 264
    .local v2, "prunedFiles":I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 266
    .local v6, "startTime":J
    iget-object v8, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 267
    .local v8, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;>;>;"
    :goto_2d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v9, :cond_88

    .line 268
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 269
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    .line 270
    .local v12, "e":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    iget-object v13, v12, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->key:Ljava/lang/String;

    invoke-virtual {v0, v13}, Lcom/android/volley/toolbox/DiskBasedCache;->getFileForKey(Ljava/lang/String;)Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->delete()Z

    move-result v13

    .line 271
    .local v13, "deleted":Z
    if-eqz v13, :cond_57

    .line 272
    iget-wide v14, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    move-wide/from16 v16, v4

    iget-wide v3, v12, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    .end local v4    # "before":J
    .local v16, "before":J
    sub-long/2addr v14, v3

    iput-wide v14, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    goto :goto_6d

    .line 274
    .end local v16    # "before":J
    .restart local v4    # "before":J
    :cond_57
    move-wide/from16 v16, v4

    .end local v4    # "before":J
    .restart local v16    # "before":J
    const-string v3, "Could not delete cache entry for key=%s, filename=%s"

    new-array v4, v10, [Ljava/lang/Object;

    iget-object v5, v12, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->key:Ljava/lang/String;

    const/4 v14, 0x0

    aput-object v5, v4, v14

    iget-object v5, v12, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->key:Ljava/lang/String;

    invoke-direct {v0, v5}, Lcom/android/volley/toolbox/DiskBasedCache;->getFilenameForKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v11

    invoke-static {v3, v4}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 277
    :goto_6d
    invoke-interface {v8}, Ljava/util/Iterator;->remove()V

    .line 278
    add-int/lit8 v2, v2, 0x1

    .line 280
    iget-wide v3, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    int-to-long v14, v1

    add-long/2addr v3, v14

    long-to-float v3, v3

    iget v4, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mMaxCacheSizeInBytes:I

    int-to-float v4, v4

    const v5, 0x3f666666    # 0.9f

    mul-float/2addr v4, v5

    cmpg-float v3, v3, v4

    if-gez v3, :cond_83

    .line 281
    goto :goto_8a

    .line 283
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;>;"
    .end local v12    # "e":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    .end local v13    # "deleted":Z
    :cond_83
    nop

    .line 266
    move-wide/from16 v4, v16

    const/4 v3, 0x0

    goto :goto_2d

    .line 285
    .end local v16    # "before":J
    .restart local v4    # "before":J
    :cond_88
    move-wide/from16 v16, v4

    .end local v4    # "before":J
    .restart local v16    # "before":J
    :goto_8a
    sget-boolean v3, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v3, :cond_b2

    .line 286
    const-string v3, "pruned %d files, %d bytes, %d ms"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v9, 0x0

    aput-object v5, v4, v9

    iget-wide v12, v0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    sub-long v12, v12, v16

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v11

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    sub-long/2addr v11, v6

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v10

    invoke-static {v3, v4}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 289
    :cond_b2
    return-void
.end method

.method private putEntry(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    .registers 10
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    .line 297
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 298
    iget-wide v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    iget-wide v2, p2, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    goto :goto_22

    .line 300
    :cond_10
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    .line 301
    .local v0, "oldEntry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    iget-wide v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    iget-wide v3, p2, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    iget-wide v5, v0, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    sub-long/2addr v3, v5

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    .line 303
    .end local v0    # "oldEntry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    :goto_22
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    return-void
.end method

.method private static read(Ljava/io/InputStream;)I
    .registers 3
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 476
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 477
    .local v0, "b":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    .line 480
    return v0

    .line 478
    :cond_8
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method static readInt(Ljava/io/InputStream;)I
    .registers 3
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 491
    const/4 v0, 0x0

    .line 492
    .local v0, "n":I
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v1

    shl-int/lit8 v1, v1, 0x0

    or-int/2addr v0, v1

    .line 493
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 494
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 495
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 496
    return v0
.end method

.method static readLong(Ljava/io/InputStream;)J
    .registers 8
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 511
    const-wide/16 v0, 0x0

    .line 512
    .local v0, "n":J
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    const/4 v6, 0x0

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 513
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x8

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 514
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x10

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 515
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x18

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 516
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x20

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 517
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x28

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 518
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v6, 0x30

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 519
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->read(Ljava/io/InputStream;)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v4

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 520
    return-wide v0
.end method

.method static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 530
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->readLong(Ljava/io/InputStream;)J

    move-result-wide v0

    long-to-int v0, v0

    .line 531
    .local v0, "n":I
    invoke-static {p0, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->streamToBytes(Ljava/io/InputStream;I)[B

    move-result-object v1

    .line 532
    .local v1, "b":[B
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v2
.end method

.method static readStringStringMap(Ljava/io/InputStream;)Ljava/util/Map;
    .registers 6
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 548
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->readInt(Ljava/io/InputStream;)I

    move-result v0

    .line 549
    .local v0, "size":I
    if-nez v0, :cond_b

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    goto :goto_10

    :cond_b
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 552
    .local v1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_10
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v0, :cond_29

    .line 553
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    .line 554
    .local v3, "key":Ljava/lang/String;
    invoke-static {p0}, Lcom/android/volley/toolbox/DiskBasedCache;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    .line 555
    .local v4, "value":Ljava/lang/String;
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 557
    .end local v2    # "i":I
    :cond_29
    return-object v1
.end method

.method private removeEntry(Ljava/lang/String;)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;

    .line 310
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    .line 311
    .local v0, "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    if-eqz v0, :cond_16

    .line 312
    iget-wide v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    iget-wide v3, v0, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    .line 313
    iget-object v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    :cond_16
    return-void
.end method

.method private static streamToBytes(Ljava/io/InputStream;I)[B
    .registers 7
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 321
    new-array v0, p1, [B

    .line 323
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 324
    .local v1, "pos":I
    :goto_3
    if-ge v1, p1, :cond_11

    sub-int v2, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    move v3, v2

    .local v3, "count":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_11

    .line 325
    add-int/2addr v1, v3

    goto :goto_3

    .line 327
    .end local v3    # "count":I
    :cond_11
    if-ne v1, p1, :cond_14

    .line 330
    return-object v0

    .line 328
    :cond_14
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " bytes, read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " bytes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static writeInt(Ljava/io/OutputStream;I)V
    .registers 3
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 484
    shr-int/lit8 v0, p1, 0x0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 485
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 486
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 487
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 488
    return-void
.end method

.method static writeLong(Ljava/io/OutputStream;J)V
    .registers 5
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 500
    const/4 v0, 0x0

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 501
    const/16 v0, 0x8

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 502
    const/16 v0, 0x10

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 503
    const/16 v0, 0x18

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 504
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 505
    const/16 v0, 0x28

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 506
    const/16 v0, 0x30

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 507
    const/16 v0, 0x38

    ushr-long v0, p1, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 508
    return-void
.end method

.method static writeString(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 5
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 524
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 525
    .local v0, "b":[B
    array-length v1, v0

    int-to-long v1, v1

    invoke-static {p0, v1, v2}, Lcom/android/volley/toolbox/DiskBasedCache;->writeLong(Ljava/io/OutputStream;J)V

    .line 526
    array-length v1, v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 527
    return-void
.end method

.method static writeStringStringMap(Ljava/util/Map;Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 536
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_30

    .line 537
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->writeInt(Ljava/io/OutputStream;I)V

    .line 538
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 539
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/android/volley/toolbox/DiskBasedCache;->writeString(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 540
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/android/volley/toolbox/DiskBasedCache;->writeString(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 541
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_11

    .line 543
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_30
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->writeInt(Ljava/io/OutputStream;I)V

    .line 545
    :cond_34
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 7

    monitor-enter p0

    .line 90
    :try_start_1
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 91
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 92
    move-object v2, v0

    .local v2, "arr$":[Ljava/io/File;
    array-length v3, v2

    .local v3, "len$":I
    move v4, v1

    .local v4, "i$":I
    :goto_d
    if-ge v4, v3, :cond_17

    aget-object v5, v2, v4

    .line 93
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 92
    .end local v5    # "file":Ljava/io/File;
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 96
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v3    # "len$":I
    .end local v4    # "i$":I
    :cond_17
    iget-object v2, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 97
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mTotalSize:J

    .line 98
    const-string v2, "Cache cleared."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v2, v1}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_1 .. :try_end_27} :catchall_29

    .line 99
    monitor-exit p0

    return-void

    .line 89
    .end local v0    # "files":[Ljava/io/File;
    :catchall_29
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;
    .registers 11
    .param p1, "key"    # Ljava/lang/String;

    monitor-enter p0

    .line 106
    :try_start_1
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mEntries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_6a

    .line 108
    .local v0, "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    const/4 v1, 0x0

    if-nez v0, :cond_e

    .line 109
    monitor-exit p0

    return-object v1

    .line 112
    :cond_e
    :try_start_e
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->getFileForKey(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2
    :try_end_12
    .catchall {:try_start_e .. :try_end_12} :catchall_6a

    .line 113
    .local v2, "file":Ljava/io/File;
    move-object v3, v1

    .line 115
    .local v3, "cis":Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;
    :try_start_13
    new-instance v4, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5, v1}, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;-><init>(Ljava/io/InputStream;Lcom/android/volley/toolbox/DiskBasedCache$1;)V

    move-object v3, v4

    .line 116
    invoke-static {v3}, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->readHeader(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    .line 117
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v4

    # getter for: Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;->bytesRead:I
    invoke-static {v3}, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;->access$100(Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;)I

    move-result v6

    int-to-long v6, v6

    sub-long/2addr v4, v6

    long-to-int v4, v4

    invoke-static {v3, v4}, Lcom/android/volley/toolbox/DiskBasedCache;->streamToBytes(Ljava/io/InputStream;I)[B

    move-result-object v4

    .line 118
    .local v4, "data":[B
    invoke-virtual {v0, v4}, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->toCacheEntry([B)Lcom/android/volley/Cache$Entry;

    move-result-object v5
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_34} :catch_40
    .catchall {:try_start_13 .. :try_end_34} :catchall_3e

    .line 124
    nop

    .line 126
    :try_start_35
    invoke-virtual {v3}, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_39
    .catchall {:try_start_35 .. :try_end_38} :catchall_6a

    .line 129
    goto :goto_3c

    .line 127
    :catch_39
    move-exception v5

    .line 128
    .end local v0    # "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "cis":Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;
    .end local v4    # "data":[B
    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    .end local p1    # "key":Ljava/lang/String;
    :cond_3a
    :goto_3a
    monitor-exit p0

    return-object v1

    .restart local v0    # "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "cis":Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;
    .restart local v4    # "data":[B
    .restart local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    .restart local p1    # "key":Ljava/lang/String;
    :goto_3c
    monitor-exit p0

    return-object v5

    .line 124
    .end local v4    # "data":[B
    :catchall_3e
    move-exception v4

    goto :goto_61

    .line 119
    :catch_40
    move-exception v4

    .line 120
    .local v4, "e":Ljava/io/IOException;
    :try_start_41
    const-string v5, "%s: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->remove(Ljava/lang/String;)V
    :try_end_5a
    .catchall {:try_start_41 .. :try_end_5a} :catchall_3e

    .line 122
    nop

    .line 124
    if-eqz v3, :cond_3a

    .line 126
    :try_start_5d
    invoke-virtual {v3}, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;->close()V
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_60} :catch_39
    .catchall {:try_start_5d .. :try_end_60} :catchall_6a

    .line 129
    goto :goto_3a

    .line 124
    .end local v4    # "e":Ljava/io/IOException;
    :goto_61
    if-eqz v3, :cond_69

    .line 126
    :try_start_63
    invoke-virtual {v3}, Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;->close()V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_66} :catch_67
    .catchall {:try_start_63 .. :try_end_66} :catchall_6a

    .line 129
    goto :goto_69

    .line 127
    :catch_67
    move-exception v4

    .local v4, "ioe":Ljava/io/IOException;
    goto :goto_3a

    .line 128
    .end local v4    # "ioe":Ljava/io/IOException;
    :cond_69
    :goto_69
    :try_start_69
    throw v4
    :try_end_6a
    .catchall {:try_start_69 .. :try_end_6a} :catchall_6a

    .line 105
    .end local v0    # "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "cis":Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;
    .end local p1    # "key":Ljava/lang/String;
    :catchall_6a
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw p1
.end method

.method public getFileForKey(Ljava/lang/String;)Ljava/io/File;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .line 247
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->getFilenameForKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized initialize()V
    .registers 10

    monitor-enter p0

    .line 140
    :try_start_1
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_24

    .line 141
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_22

    .line 142
    const-string v0, "Unable to create cache dir %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_70

    .line 144
    :cond_22
    monitor-exit p0

    return-void

    .line 147
    :cond_24
    :try_start_24
    iget-object v0, p0, Lcom/android/volley/toolbox/DiskBasedCache;->mRootDirectory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0
    :try_end_2a
    .catchall {:try_start_24 .. :try_end_2a} :catchall_70

    .line 148
    .local v0, "files":[Ljava/io/File;
    if-nez v0, :cond_2e

    .line 149
    monitor-exit p0

    return-void

    .line 151
    :cond_2e
    move-object v2, v0

    .local v2, "arr$":[Ljava/io/File;
    :try_start_2f
    array-length v3, v2

    .local v1, "i$":I
    .local v3, "len$":I
    :goto_30
    if-ge v1, v3, :cond_6e

    aget-object v4, v2, v1
    :try_end_34
    .catchall {:try_start_2f .. :try_end_34} :catchall_70

    .line 152
    .local v4, "file":Ljava/io/File;
    const/4 v5, 0x0

    .line 154
    .local v5, "fis":Ljava/io/FileInputStream;
    :try_start_35
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v5, v6

    .line 155
    invoke-static {v5}, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->readHeader(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    move-result-object v6

    .line 156
    .local v6, "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v7

    iput-wide v7, v6, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->size:J

    .line 157
    iget-object v7, v6, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->key:Ljava/lang/String;

    invoke-direct {p0, v7, v6}, Lcom/android/volley/toolbox/DiskBasedCache;->putEntry(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_4a} :catch_51
    .catchall {:try_start_35 .. :try_end_4a} :catchall_4f

    .line 164
    .end local v6    # "entry":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    nop

    .line 165
    :try_start_4b
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_4e} :catch_68
    .catchall {:try_start_4b .. :try_end_4e} :catchall_70

    goto :goto_6a

    .line 163
    :catchall_4f
    move-exception v6

    goto :goto_58

    .line 158
    :catch_51
    move-exception v6

    .line 159
    .local v6, "e":Ljava/io/IOException;
    if-eqz v4, :cond_62

    .line 160
    :try_start_54
    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_57
    .catchall {:try_start_54 .. :try_end_57} :catchall_4f

    .end local v6    # "e":Ljava/io/IOException;
    goto :goto_62

    .line 163
    :goto_58
    nop

    .line 164
    if-eqz v5, :cond_61

    .line 165
    :try_start_5b
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_5f
    .catchall {:try_start_5b .. :try_end_5e} :catchall_70

    goto :goto_61

    .line 167
    :catch_5f
    move-exception v7

    nop

    :cond_61
    :goto_61
    :try_start_61
    throw v6
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_70

    .line 164
    :cond_62
    :goto_62
    if-eqz v5, :cond_6a

    .line 165
    :try_start_64
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_68
    .catchall {:try_start_64 .. :try_end_67} :catchall_70

    goto :goto_6a

    .line 167
    :catch_68
    move-exception v6

    .line 168
    goto :goto_6b

    .line 167
    :cond_6a
    :goto_6a
    nop

    .line 151
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "fis":Ljava/io/FileInputStream;
    :goto_6b
    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 170
    .end local v1    # "i$":I
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v3    # "len$":I
    :cond_6e
    monitor-exit p0

    return-void

    .line 139
    .end local v0    # "files":[Ljava/io/File;
    :catchall_70
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw v0
.end method

.method public declared-synchronized invalidate(Ljava/lang/String;Z)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fullExpire"    # Z

    monitor-enter p0

    .line 179
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 180
    .local v0, "entry":Lcom/android/volley/Cache$Entry;
    if-eqz v0, :cond_12

    .line 181
    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 182
    if-eqz p2, :cond_f

    .line 183
    iput-wide v1, v0, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 185
    :cond_f
    invoke-virtual {p0, p1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 188
    :cond_12
    monitor-exit p0

    return-void

    .line 178
    .end local v0    # "entry":Lcom/android/volley/Cache$Entry;
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "fullExpire":Z
    :catchall_14
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw p1
.end method

.method public declared-synchronized put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    .registers 12
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/android/volley/Cache$Entry;

    monitor-enter p0

    .line 195
    :try_start_1
    iget-object v0, p2, Lcom/android/volley/Cache$Entry;->data:[B

    array-length v0, v0

    invoke-direct {p0, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->pruneIfNeeded(I)V

    .line 196
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->getFileForKey(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_56

    .line 198
    .local v0, "file":Ljava/io/File;
    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_d
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 199
    .local v3, "fos":Ljava/io/FileOutputStream;
    new-instance v4, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;

    invoke-direct {v4, p1, p2}, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;-><init>(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V

    .line 200
    .local v4, "e":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    invoke-virtual {v4, v3}, Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;->writeHeader(Ljava/io/OutputStream;)Z

    move-result v5

    .line 201
    .local v5, "success":Z
    if-eqz v5, :cond_2a

    .line 206
    iget-object v6, p2, Lcom/android/volley/Cache$Entry;->data:[B

    invoke-virtual {v3, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 207
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 208
    invoke-direct {p0, p1, v4}, Lcom/android/volley/toolbox/DiskBasedCache;->putEntry(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_28} :catch_40
    .catchall {:try_start_d .. :try_end_28} :catchall_56

    .line 209
    monitor-exit p0

    return-void

    .line 202
    :cond_2a
    :try_start_2a
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 203
    const-string v6, "Failed to write header for %s"

    new-array v7, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v1

    invoke-static {v6, v7}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 204
    new-instance v6, Ljava/io/IOException;

    invoke-direct {v6}, Ljava/io/IOException;-><init>()V

    throw v6
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_40} :catch_40
    .catchall {:try_start_2a .. :try_end_40} :catchall_56

    .line 210
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "e":Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    .end local v5    # "success":Z
    :catch_40
    move-exception v3

    .line 212
    :try_start_41
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v3

    .line 213
    .local v3, "deleted":Z
    if-nez v3, :cond_54

    .line 214
    const-string v4, "Could not clean up file %s"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v1

    invoke-static {v4, v2}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_54
    .catchall {:try_start_41 .. :try_end_54} :catchall_56

    .line 216
    :cond_54
    monitor-exit p0

    return-void

    .line 194
    .end local v0    # "file":Ljava/io/File;
    .end local v3    # "deleted":Z
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "entry":Lcom/android/volley/Cache$Entry;
    :catchall_56
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw p1
.end method

.method public declared-synchronized remove(Ljava/lang/String;)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;

    monitor-enter p0

    .line 223
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->getFileForKey(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 224
    .local v0, "deleted":Z
    invoke-direct {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->removeEntry(Ljava/lang/String;)V

    .line 225
    if-nez v0, :cond_20

    .line 226
    const-string v1, "Could not delete cache entry for key=%s, filename=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-direct {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->getFilenameForKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 229
    :cond_20
    monitor-exit p0

    return-void

    .line 222
    .end local v0    # "deleted":Z
    .end local p1    # "key":Ljava/lang/String;
    :catchall_22
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/DiskBasedCache;
    throw p1
.end method
