.class public Lcom/arcsoft/avatar/d/h;
.super Ljava/lang/Object;
.source "MediaUriManager.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field private static final c:I = 0x64


# instance fields
.field private a:Landroid/content/Context;

.field private e:Ljava/lang/String;

.field private eS:Landroid/media/MediaScannerConnection;

.field private ej:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    iput-object p1, p0, Lcom/arcsoft/avatar/d/h;->a:Landroid/content/Context;

    new-instance p1, Landroid/media/MediaScannerConnection;

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->a:Landroid/content/Context;

    invoke-direct {p1, v0, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object p1, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    return-void
.end method


# virtual methods
.method public R()Landroid/net/Uri;
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    return-object v0
.end method

.method public S()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    return-object v0
.end method

.method public a(Landroid/net/Uri;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/d/h;->e:Ljava/lang/String;

    iget-object p1, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    invoke-virtual {p1}, Landroid/media/MediaScannerConnection;->connect()V

    return-void
.end method

.method public onMediaScannerConnected()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lcom/arcsoft/avatar/d/h;->e:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteFullException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1

    :try_start_0
    iget-object p1, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/16 v0, 0x64

    if-le p1, v0, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_0
    iget-object p1, p0, Lcom/arcsoft/avatar/d/h;->ej:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    invoke-virtual {p1}, Landroid/media/MediaScannerConnection;->disconnect()V

    nop

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    invoke-virtual {p2}, Landroid/media/MediaScannerConnection;->disconnect()V

    throw p1
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/d/h;->eS:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    :cond_0
    return-void
.end method
