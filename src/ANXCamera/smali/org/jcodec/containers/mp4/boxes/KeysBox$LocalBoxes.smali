.class Lorg/jcodec/containers/mp4/boxes/KeysBox$LocalBoxes;
.super Lorg/jcodec/containers/mp4/Boxes;
.source "KeysBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/boxes/KeysBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalBoxes"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 3

    .line 20
    invoke-direct {p0}, Lorg/jcodec/containers/mp4/Boxes;-><init>()V

    .line 21
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/KeysBox$LocalBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MdtaBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/MdtaBox;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    return-void
.end method
