.class public Lcom/bumptech/glide/load/model/f$e;
.super Lcom/bumptech/glide/load/model/f$a;
.source "FileLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/model/f$a<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 136
    new-instance v0, Lcom/bumptech/glide/load/model/f$e$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/f$e$1;-><init>()V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/model/f$a;-><init>(Lcom/bumptech/glide/load/model/f$d;)V

    .line 152
    return-void
.end method
