.class public Lcom/bumptech/glide/request/a/c$a;
.super Ljava/lang/Object;
.source "DrawableCrossFadeFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/request/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final oU:I = 0x12c


# instance fields
.field private final durationMillis:I

.field private oS:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    const/16 v0, 0x12c

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/a/c$a;-><init>(I)V

    .line 52
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput p1, p0, Lcom/bumptech/glide/request/a/c$a;->durationMillis:I

    .line 59
    return-void
.end method


# virtual methods
.method public ey()Lcom/bumptech/glide/request/a/c;
    .locals 3

    .line 79
    new-instance v0, Lcom/bumptech/glide/request/a/c;

    iget v1, p0, Lcom/bumptech/glide/request/a/c$a;->durationMillis:I

    iget-boolean v2, p0, Lcom/bumptech/glide/request/a/c$a;->oS:Z

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/request/a/c;-><init>(IZ)V

    return-object v0
.end method

.method public l(Z)Lcom/bumptech/glide/request/a/c$a;
    .locals 0

    .line 74
    iput-boolean p1, p0, Lcom/bumptech/glide/request/a/c$a;->oS:Z

    .line 75
    return-object p0
.end method
