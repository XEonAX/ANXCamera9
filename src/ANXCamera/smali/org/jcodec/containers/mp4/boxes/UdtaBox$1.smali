.class Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;
.super Ljava/lang/Object;
.source "UdtaBox.java"

# interfaces
.implements Lorg/jcodec/containers/mp4/IBoxFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jcodec/containers/mp4/boxes/UdtaBox;->setFactory(Lorg/jcodec/containers/mp4/IBoxFactory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jcodec/containers/mp4/boxes/UdtaBox;

.field final synthetic val$_factory:Lorg/jcodec/containers/mp4/IBoxFactory;


# direct methods
.method constructor <init>(Lorg/jcodec/containers/mp4/boxes/UdtaBox;Lorg/jcodec/containers/mp4/IBoxFactory;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;->this$0:Lorg/jcodec/containers/mp4/boxes/UdtaBox;

    iput-object p2, p0, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;->val$_factory:Lorg/jcodec/containers/mp4/IBoxFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newBox(Lorg/jcodec/containers/mp4/boxes/Header;)Lorg/jcodec/containers/mp4/boxes/Box;
    .locals 2

    .line 24
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;

    invoke-direct {v0, p1}, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 26
    iget-object p1, p0, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;->val$_factory:Lorg/jcodec/containers/mp4/IBoxFactory;

    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;->setFactory(Lorg/jcodec/containers/mp4/IBoxFactory;)V

    .line 27
    return-object v0

    .line 30
    :cond_0
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UdtaBox$1;->val$_factory:Lorg/jcodec/containers/mp4/IBoxFactory;

    invoke-interface {v0, p1}, Lorg/jcodec/containers/mp4/IBoxFactory;->newBox(Lorg/jcodec/containers/mp4/boxes/Header;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p1

    return-object p1
.end method
