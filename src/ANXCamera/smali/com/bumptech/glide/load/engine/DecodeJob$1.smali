.class synthetic Lcom/bumptech/glide/load/engine/DecodeJob$1;
.super Ljava/lang/Object;
.source "DecodeJob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/DecodeJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic eL:[I

.field static final synthetic eM:[I

.field static final synthetic eN:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 559
    invoke-static {}, Lcom/bumptech/glide/load/EncodeStrategy;->values()[Lcom/bumptech/glide/load/EncodeStrategy;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eN:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eN:[I

    sget-object v2, Lcom/bumptech/glide/load/EncodeStrategy;->cD:Lcom/bumptech/glide/load/EncodeStrategy;

    invoke-virtual {v2}, Lcom/bumptech/glide/load/EncodeStrategy;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    const/4 v1, 0x2

    :try_start_1
    sget-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eN:[I

    sget-object v3, Lcom/bumptech/glide/load/EncodeStrategy;->cE:Lcom/bumptech/glide/load/EncodeStrategy;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/EncodeStrategy;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    .line 283
    :goto_1
    invoke-static {}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->values()[Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [I

    sput-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    :try_start_2
    sget-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->eZ:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v2

    :goto_2
    :try_start_3
    sget-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->fa:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v2

    :goto_3
    const/4 v2, 0x3

    :try_start_4
    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    sget-object v4, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->fb:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v3

    :goto_4
    :try_start_5
    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    sget-object v4, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->fd:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v4

    const/4 v5, 0x4

    aput v5, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v3

    :goto_5
    :try_start_6
    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eM:[I

    sget-object v4, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->eY:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v4

    const/4 v5, 0x5

    aput v5, v3, v4
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v3

    .line 265
    :goto_6
    invoke-static {}, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->values()[Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eL:[I

    :try_start_7
    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eL:[I

    sget-object v4, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->eU:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    :goto_7
    :try_start_8
    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eL:[I

    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->eV:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->ordinal()I

    move-result v3

    aput v1, v0, v3
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v0

    :goto_8
    :try_start_9
    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->eL:[I

    sget-object v1, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->eW:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v0

    :goto_9
    return-void
.end method
