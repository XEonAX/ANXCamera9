.class public abstract Lorg/jcodec/common/io/StringReader;
.super Ljava/lang/Object;
.source "StringReader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static _sureRead(Ljava/io/InputStream;I)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    new-array v0, p1, [B

    .line 23
    array-length v1, v0

    invoke-static {p0, v0, v1}, Lorg/jcodec/common/io/StringReader;->sureRead(Ljava/io/InputStream;[BI)I

    move-result p0

    if-ne p0, p1, :cond_0

    .line 24
    return-object v0

    .line 25
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static readString(Ljava/io/InputStream;I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    invoke-static {p0, p1}, Lorg/jcodec/common/io/StringReader;->_sureRead(Ljava/io/InputStream;I)[B

    move-result-object p0

    .line 18
    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lorg/jcodec/platform/Platform;->stringFromBytes([B)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static sureRead(Ljava/io/InputStream;[BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    nop

    .line 30
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    .line 31
    sub-int v1, p2, v0

    invoke-virtual {p0, p1, v0, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 32
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    add-int/2addr v0, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    return v0
.end method

.method public static sureSkip(Ljava/io/InputStream;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 41
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    sub-long/2addr p1, v0

    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method
