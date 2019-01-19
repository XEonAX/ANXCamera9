.class public Lcom/bumptech/glide/e/c;
.super Ljava/lang/Object;
.source "MediaStoreSignature.java"

# interfaces
.implements Lcom/bumptech/glide/load/c;


# instance fields
.field private final mimeType:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final orientation:I

.field private final pd:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JI)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/e/c;->mimeType:Ljava/lang/String;

    .line 32
    iput-wide p2, p0, Lcom/bumptech/glide/e/c;->pd:J

    .line 33
    iput p4, p0, Lcom/bumptech/glide/e/c;->orientation:I

    .line 34
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 39
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 40
    return v0

    .line 42
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 46
    :cond_1
    check-cast p1, Lcom/bumptech/glide/e/c;

    .line 48
    iget-wide v2, p0, Lcom/bumptech/glide/e/c;->pd:J

    iget-wide v4, p1, Lcom/bumptech/glide/e/c;->pd:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 49
    return v1

    .line 51
    :cond_2
    iget v2, p0, Lcom/bumptech/glide/e/c;->orientation:I

    iget v3, p1, Lcom/bumptech/glide/e/c;->orientation:I

    if-eq v2, v3, :cond_3

    .line 52
    return v1

    .line 54
    :cond_3
    iget-object v2, p0, Lcom/bumptech/glide/e/c;->mimeType:Ljava/lang/String;

    iget-object p1, p1, Lcom/bumptech/glide/e/c;->mimeType:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 55
    return v1

    .line 57
    :cond_4
    return v0

    .line 43
    :cond_5
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 7

    .line 62
    iget-object v0, p0, Lcom/bumptech/glide/e/c;->mimeType:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 63
    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lcom/bumptech/glide/e/c;->pd:J

    iget-wide v4, p0, Lcom/bumptech/glide/e/c;->pd:J

    const/16 v6, 0x20

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    .line 64
    mul-int/2addr v1, v0

    iget v0, p0, Lcom/bumptech/glide/e/c;->orientation:I

    add-int/2addr v1, v0

    .line 65
    return v1
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 3
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 70
    const/16 v0, 0xc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-wide v1, p0, Lcom/bumptech/glide/e/c;->pd:J

    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget v1, p0, Lcom/bumptech/glide/e/c;->orientation:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 72
    iget-object v0, p0, Lcom/bumptech/glide/e/c;->mimeType:Ljava/lang/String;

    sget-object v1, Lcom/bumptech/glide/e/c;->cT:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 73
    return-void
.end method
