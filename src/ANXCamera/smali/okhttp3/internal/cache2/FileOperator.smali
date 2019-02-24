.class final Lokhttp3/internal/cache2/FileOperator;
.super Ljava/lang/Object;
.source "FileOperator.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# instance fields
.field private final byteArray:[B

.field private final byteBuffer:Ljava/nio/ByteBuffer;

.field private final fileChannel:Ljava/nio/channels/FileChannel;


# direct methods
.method constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    .line 41
    iget-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 45
    iput-object p1, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 46
    return-void
.end method


# virtual methods
.method public read(JLokio/Buffer;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_2

    .line 80
    :goto_0
    cmp-long v2, p4, v0

    if-lez v2, :cond_1

    .line 83
    :try_start_0
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    const-wide/16 v3, 0x2000

    invoke-static {v3, v4, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 84
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3, p1, p2}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 85
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 88
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    const/4 v4, 0x0

    invoke-virtual {p3, v3, v4, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    int-to-long v2, v2

    add-long/2addr p1, v2

    .line 90
    sub-long/2addr p4, v2

    .line 92
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 93
    goto :goto_0

    .line 84
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :catchall_0
    move-exception p1

    iget-object p2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    throw p1

    .line 95
    :cond_1
    return-void

    .line 78
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public write(JLokio/Buffer;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_2

    invoke-virtual {p3}, Lokio/Buffer;->size()J

    move-result-wide v2

    cmp-long v2, p4, v2

    if-gtz v2, :cond_2

    .line 52
    :goto_0
    cmp-long v2, p4, v0

    if-lez v2, :cond_1

    .line 55
    const-wide/16 v2, 0x2000

    :try_start_0
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 56
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    const/4 v4, 0x0

    invoke-virtual {p3, v3, v4, v2}, Lokio/Buffer;->read([BII)I

    .line 57
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 61
    :cond_0
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v4, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4, p1, p2}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;J)I

    move-result v3

    .line 62
    int-to-long v3, v3

    add-long/2addr p1, v3

    .line 63
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    .line 65
    int-to-long v2, v2

    sub-long/2addr p4, v2

    .line 67
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 68
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p1

    iget-object p2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    throw p1

    .line 70
    :cond_1
    return-void

    .line 50
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method
