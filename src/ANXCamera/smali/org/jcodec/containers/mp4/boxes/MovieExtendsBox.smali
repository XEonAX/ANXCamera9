.class public Lorg/jcodec/containers/mp4/boxes/MovieExtendsBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "MovieExtendsBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 13
    return-void
.end method

.method public static createMovieExtendsBox()Lorg/jcodec/containers/mp4/boxes/MovieExtendsBox;
    .locals 3

    .line 20
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MovieExtendsBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieExtendsBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 16
    const-string v0, "mvex"

    return-object v0
.end method
