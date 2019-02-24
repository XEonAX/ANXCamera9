.class Lcom/android/camera/ui/GLTextureView$LogWriter;
.super Ljava/io/Writer;
.source "GLTextureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LogWriter"
.end annotation


# instance fields
.field private mBuilder:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1559
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 1588
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    return-void
.end method

.method private flushBuilder()V
    .locals 3

    .line 1582
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 1583
    const-string v0, "C_"

    iget-object v1, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1584
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 1586
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1562
    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView$LogWriter;->flushBuilder()V

    .line 1563
    return-void
.end method

.method public flush()V
    .locals 0

    .line 1566
    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView$LogWriter;->flushBuilder()V

    .line 1567
    return-void
.end method

.method public write([CII)V
    .locals 3

    .line 1570
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    .line 1571
    add-int v1, p2, v0

    aget-char v1, p1, v1

    .line 1572
    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 1573
    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView$LogWriter;->flushBuilder()V

    goto :goto_1

    .line 1576
    :cond_0
    iget-object v2, p0, Lcom/android/camera/ui/GLTextureView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1570
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1579
    :cond_1
    return-void
.end method
