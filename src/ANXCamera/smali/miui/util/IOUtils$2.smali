.class Lmiui/util/IOUtils$2;
.super Lmiui/util/Pools$Manager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/IOUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lmiui/util/Pools$Manager<",
        "Ljava/io/CharArrayWriter;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 55
    invoke-direct {p0}, Lmiui/util/Pools$Manager;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/io/CharArrayWriter;)V
    .registers 2

    .line 63
    invoke-virtual {p1}, Ljava/io/CharArrayWriter;->reset()V

    .line 64
    return-void
.end method

.method public synthetic createInstance()Ljava/lang/Object;
    .registers 2

    .line 55
    invoke-virtual {p0}, Lmiui/util/IOUtils$2;->dw()Ljava/io/CharArrayWriter;

    move-result-object v0

    return-object v0
.end method

.method public dw()Ljava/io/CharArrayWriter;
    .registers 2

    .line 58
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    return-object v0
.end method

.method public synthetic onRelease(Ljava/lang/Object;)V
    .registers 2

    .line 55
    check-cast p1, Ljava/io/CharArrayWriter;

    invoke-virtual {p0, p1}, Lmiui/util/IOUtils$2;->a(Ljava/io/CharArrayWriter;)V

    return-void
.end method
