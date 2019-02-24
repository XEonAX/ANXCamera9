.class public Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "MediaInfoBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 24
    return-void
.end method

.method public static createMediaInfoBox()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;
    .locals 3

    .line 19
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 15
    const-string v0, "minf"

    return-object v0
.end method


# virtual methods
.method public getDinf()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;
    .locals 2

    .line 27
    const-class v0, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    const-string v1, "dinf"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    return-object v0
.end method

.method public getStbl()Lorg/jcodec/containers/mp4/boxes/NodeBox;
    .locals 2

    .line 31
    const-class v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    const-string v1, "stbl"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    return-object v0
.end method
