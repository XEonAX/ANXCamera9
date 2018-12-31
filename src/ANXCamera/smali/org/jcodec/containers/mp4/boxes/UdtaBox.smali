.class public Lorg/jcodec/containers/mp4/boxes/UdtaBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "UdtaBox.java"


# static fields
.field private static final FOURCC:Ljava/lang/String; = "udta"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 37
    return-void
.end method

.method public static createUdtaBox()Lorg/jcodec/containers/mp4/boxes/UdtaBox;
    .locals 4

    .line 16
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/UdtaBox;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/UdtaBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/UdtaBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "udta"

    return-object v0
.end method


# virtual methods
.method public meta()Lorg/jcodec/containers/mp4/boxes/MetaBox;
    .locals 2

    .line 40
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/UdtaBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MetaBox;

    return-object v0
.end method

.method public setFactory(Lorg/jcodec/containers/mp4/IBoxFactory;)V
    .locals 1

    .line 21
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;

    invoke-direct {v0, p0, p1}, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;-><init>(Lorg/jcodec/containers/mp4/boxes/UdtaBox;Lorg/jcodec/containers/mp4/IBoxFactory;)V

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UdtaBox;->factory:Lorg/jcodec/containers/mp4/IBoxFactory;

    .line 33
    return-void
.end method
