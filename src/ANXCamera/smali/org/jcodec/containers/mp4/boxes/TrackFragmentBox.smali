.class public Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "TrackFragmentBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 18
    return-void
.end method

.method public static createTrackFragmentBox()Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;
    .locals 3

    .line 32
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 21
    const-string v0, "traf"

    return-object v0
.end method


# virtual methods
.method public getTrackId()I
    .locals 2

    .line 25
    const-class v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    .line 26
    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->getTrackId()I

    move-result v0

    return v0

    .line 27
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Corrupt track fragment, no header atom found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
