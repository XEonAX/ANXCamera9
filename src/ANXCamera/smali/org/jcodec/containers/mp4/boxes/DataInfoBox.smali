.class public Lorg/jcodec/containers/mp4/boxes/DataInfoBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "DataInfoBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 24
    return-void
.end method

.method public static createDataInfoBox()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;
    .locals 3

    .line 19
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 15
    const-string v0, "dinf"

    return-object v0
.end method


# virtual methods
.method public getDref()Lorg/jcodec/containers/mp4/boxes/DataRefBox;
    .locals 2

    .line 27
    const-class v0, Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    const-string v1, "dref"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    return-object v0
.end method
