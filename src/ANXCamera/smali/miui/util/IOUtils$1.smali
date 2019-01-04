.class Lmiui/util/IOUtils$1;
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
        "Ljava/io/ByteArrayOutputStream;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Lmiui/util/Pools$Manager;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/io/ByteArrayOutputStream;)V
    .registers 2

    .line 50
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 51
    return-void
.end method

.method public synthetic createInstance()Ljava/lang/Object;
    .registers 2

    .line 42
    invoke-virtual {p0}, Lmiui/util/IOUtils$1;->dv()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public dv()Ljava/io/ByteArrayOutputStream;
    .registers 2

    .line 45
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-object v0
.end method

.method public synthetic onRelease(Ljava/lang/Object;)V
    .registers 2

    .line 42
    check-cast p1, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0, p1}, Lmiui/util/IOUtils$1;->a(Ljava/io/ByteArrayOutputStream;)V

    return-void
.end method
