.class public Lorg/jcodec/containers/mp4/boxes/MovieBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "MovieBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 16
    return-void
.end method

.method public static createMovieBox()Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 3

    .line 23
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/MovieBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 19
    const-string v0, "moov"

    return-object v0
.end method

.method private getMovieHeader()Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;
    .locals 2

    .line 39
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;

    const-string v1, "mvhd"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;

    return-object v0
.end method


# virtual methods
.method public getTimescale()I
    .locals 1

    .line 31
    invoke-direct {p0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getMovieHeader()Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->getTimescale()I

    move-result v0

    return v0
.end method

.method public getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;
    .locals 2

    .line 27
    const-class v0, Lorg/jcodec/containers/mp4/boxes/TrakBox;

    const-string v1, "trak"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->findAll(Lorg/jcodec/containers/mp4/boxes/Box;Ljava/lang/Class;Ljava/lang/String;)[Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, [Lorg/jcodec/containers/mp4/boxes/TrakBox;

    return-object v0
.end method

.method public isPureRefMovie()Z
    .locals 4

    .line 43
    nop

    .line 44
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object v0

    .line 45
    const/4 v1, 0x1

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 46
    aget-object v3, v0, v2

    .line 47
    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->isPureRef()Z

    move-result v3

    and-int/2addr v1, v3

    .line 45
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    :cond_0
    return v1
.end method

.method public rescale(JJ)J
    .locals 2

    .line 35
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTimescale()I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr p1, v0

    div-long/2addr p1, p3

    return-wide p1
.end method
