.class public Lcom/bumptech/glide/load/resource/a/a;
.super Ljava/lang/Object;
.source "ByteBufferRewinder.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/a/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/e<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/a/a;->buffer:Ljava/nio/ByteBuffer;

    .line 17
    return-void
.end method


# virtual methods
.method public synthetic ag()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/a/a;->cw()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public cleanup()V
    .locals 0

    .line 29
    return-void
.end method

.method public cw()Ljava/nio/ByteBuffer;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/a/a;->buffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 23
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/a/a;->buffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method
