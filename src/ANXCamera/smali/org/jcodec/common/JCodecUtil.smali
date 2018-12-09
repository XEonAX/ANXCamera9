.class public Lorg/jcodec/common/JCodecUtil;
.super Ljava/lang/Object;
.source "JCodecUtil.java"


# static fields
.field private static final demuxers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/jcodec/common/Format;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jcodec/common/JCodecUtil;->demuxers:Ljava/util/Map;

    .line 27
    sget-object v0, Lorg/jcodec/common/JCodecUtil;->demuxers:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/Format;->MOV:Lorg/jcodec/common/Format;

    const-class v2, Lorg/jcodec/containers/mp4/demuxer/MP4Demuxer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asciiString(Ljava/lang/String;)[B
    .locals 3

    .line 48
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    .line 49
    array-length v0, p0

    new-array v0, v0, [B

    .line 50
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 51
    aget-char v2, p0, v1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 53
    :cond_0
    return-object v0
.end method

.method public static detectFormat(Ljava/io/File;)Lorg/jcodec/common/Format;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    const v0, 0x32000

    invoke-static {p0, v0}, Lorg/jcodec/common/io/NIOUtils;->fetchFromFileL(Ljava/io/File;I)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-static {p0}, Lorg/jcodec/common/JCodecUtil;->detectFormatBuffer(Ljava/nio/ByteBuffer;)Lorg/jcodec/common/Format;

    move-result-object p0

    return-object p0
.end method

.method public static detectFormatBuffer(Ljava/nio/ByteBuffer;)Lorg/jcodec/common/Format;
    .locals 6

    .line 35
    nop

    .line 36
    nop

    .line 37
    sget-object v0, Lorg/jcodec/common/JCodecUtil;->demuxers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 38
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    invoke-static {v4, v5}, Lorg/jcodec/common/JCodecUtil;->probe(Ljava/nio/ByteBuffer;Ljava/lang/Class;)I

    move-result v4

    .line 39
    if-le v4, v1, :cond_0

    .line 40
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/common/Format;

    .line 41
    nop

    .line 43
    move-object v2, v1

    move v1, v4

    :cond_0
    goto :goto_0

    .line 44
    :cond_1
    return-object v2
.end method

.method private static probe(Ljava/nio/ByteBuffer;Ljava/lang/Class;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 58
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "probe"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v0

    invoke-static {p1, v1, v2}, Lorg/jcodec/platform/Platform;->invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 59
    :catch_0
    move-exception p0

    .line 61
    return v0
.end method
