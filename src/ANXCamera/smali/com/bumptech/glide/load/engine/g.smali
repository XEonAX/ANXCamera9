.class public abstract Lcom/bumptech/glide/load/engine/g;
.super Ljava/lang/Object;
.source "DiskCacheStrategy.java"


# static fields
.field public static final fk:Lcom/bumptech/glide/load/engine/g;

.field public static final fl:Lcom/bumptech/glide/load/engine/g;

.field public static final fm:Lcom/bumptech/glide/load/engine/g;

.field public static final fn:Lcom/bumptech/glide/load/engine/g;

.field public static final fo:Lcom/bumptech/glide/load/engine/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    new-instance v0, Lcom/bumptech/glide/load/engine/g$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/g$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/g;->fk:Lcom/bumptech/glide/load/engine/g;

    .line 41
    new-instance v0, Lcom/bumptech/glide/load/engine/g$2;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/g$2;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/g;->fl:Lcom/bumptech/glide/load/engine/g;

    .line 67
    new-instance v0, Lcom/bumptech/glide/load/engine/g$3;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/g$3;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/g;->fm:Lcom/bumptech/glide/load/engine/g;

    .line 93
    new-instance v0, Lcom/bumptech/glide/load/engine/g$4;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/g$4;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/g;->fn:Lcom/bumptech/glide/load/engine/g;

    .line 123
    new-instance v0, Lcom/bumptech/glide/load/engine/g$5;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/g$5;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/g;->fo:Lcom/bumptech/glide/load/engine/g;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z
.end method

.method public abstract aO()Z
.end method

.method public abstract aP()Z
.end method

.method public abstract b(Lcom/bumptech/glide/load/DataSource;)Z
.end method
