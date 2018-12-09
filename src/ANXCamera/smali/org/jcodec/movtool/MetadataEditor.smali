.class public Lorg/jcodec/movtool/MetadataEditor;
.super Ljava/lang/Object;
.source "MetadataEditor.java"


# instance fields
.field private itunesMeta:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;"
        }
    .end annotation
.end field

.field private keyedMeta:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;"
        }
    .end annotation
.end field

.field private source:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/jcodec/movtool/MetadataEditor;->source:Ljava/io/File;

    .line 34
    iput-object p2, p0, Lorg/jcodec/movtool/MetadataEditor;->keyedMeta:Ljava/util/Map;

    .line 35
    iput-object p3, p0, Lorg/jcodec/movtool/MetadataEditor;->itunesMeta:Ljava/util/Map;

    .line 36
    return-void
.end method

.method static synthetic access$000(Lorg/jcodec/movtool/MetadataEditor;)Ljava/util/Map;
    .locals 0

    .line 27
    iget-object p0, p0, Lorg/jcodec/movtool/MetadataEditor;->keyedMeta:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$100(Lorg/jcodec/movtool/MetadataEditor;)Ljava/util/Map;
    .locals 0

    .line 27
    iget-object p0, p0, Lorg/jcodec/movtool/MetadataEditor;->itunesMeta:Ljava/util/Map;

    return-object p0
.end method

.method public static createFrom(Ljava/io/File;)Lorg/jcodec/movtool/MetadataEditor;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-static {p0}, Lorg/jcodec/common/JCodecUtil;->detectFormat(Ljava/io/File;)Lorg/jcodec/common/Format;

    move-result-object v0

    .line 40
    sget-object v1, Lorg/jcodec/common/Format;->MOV:Lorg/jcodec/common/Format;

    if-ne v0, v1, :cond_2

    .line 44
    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseFullMovie(Ljava/io/File;)Lorg/jcodec/containers/mp4/MP4Util$Movie;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->fourcc()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    .line 46
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v0

    const-class v2, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "udta"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    .line 47
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->fourcc()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 46
    invoke-static {v0, v2, v3}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    .line 49
    new-instance v2, Lorg/jcodec/movtool/MetadataEditor;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->getKeyedMeta()Ljava/util/Map;

    move-result-object v1

    :goto_0
    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->getItunesMeta()Ljava/util/Map;

    move-result-object v0

    :goto_1
    invoke-direct {v2, p0, v1, v0}, Lorg/jcodec/movtool/MetadataEditor;-><init>(Ljava/io/File;Ljava/util/Map;Ljava/util/Map;)V

    return-object v2

    .line 41
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public getItunesMeta()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;"
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/jcodec/movtool/MetadataEditor;->itunesMeta:Ljava/util/Map;

    return-object v0
.end method

.method public getKeyedMeta()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/jcodec/containers/mp4/boxes/MetaValue;",
            ">;"
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lorg/jcodec/movtool/MetadataEditor;->keyedMeta:Ljava/util/Map;

    return-object v0
.end method

.method public save(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    nop

    .line 56
    new-instance v0, Lorg/jcodec/movtool/MetadataEditor$1;

    invoke-direct {v0, p0, p0}, Lorg/jcodec/movtool/MetadataEditor$1;-><init>(Lorg/jcodec/movtool/MetadataEditor;Lorg/jcodec/movtool/MetadataEditor;)V

    .line 87
    if-eqz p1, :cond_0

    .line 88
    new-instance p1, Lorg/jcodec/movtool/RelocateMP4Editor;

    invoke-direct {p1}, Lorg/jcodec/movtool/RelocateMP4Editor;-><init>()V

    iget-object v1, p0, Lorg/jcodec/movtool/MetadataEditor;->source:Ljava/io/File;

    invoke-virtual {p1, v1, v0}, Lorg/jcodec/movtool/RelocateMP4Editor;->modifyOrRelocate(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)V

    goto :goto_0

    .line 90
    :cond_0
    new-instance p1, Lorg/jcodec/movtool/ReplaceMP4Editor;

    invoke-direct {p1}, Lorg/jcodec/movtool/ReplaceMP4Editor;-><init>()V

    iget-object v1, p0, Lorg/jcodec/movtool/MetadataEditor;->source:Ljava/io/File;

    invoke-virtual {p1, v1, v0}, Lorg/jcodec/movtool/ReplaceMP4Editor;->modifyOrReplace(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)V

    .line 92
    :goto_0
    return-void
.end method
