.class public Lcom/bumptech/glide/load/engine/Engine$b;
.super Ljava/lang/Object;
.source "Engine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final fG:Lcom/bumptech/glide/load/engine/EngineJob;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;"
        }
    .end annotation
.end field

.field private final fH:Lcom/bumptech/glide/request/g;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/request/g;Lcom/bumptech/glide/load/engine/EngineJob;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/g;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;)V"
        }
    .end annotation

    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 352
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/Engine$b;->fH:Lcom/bumptech/glide/request/g;

    .line 353
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/Engine$b;->fG:Lcom/bumptech/glide/load/engine/EngineJob;

    .line 354
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 357
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$b;->fG:Lcom/bumptech/glide/load/engine/EngineJob;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine$b;->fH:Lcom/bumptech/glide/request/g;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->b(Lcom/bumptech/glide/request/g;)V

    .line 358
    return-void
.end method
