.class final Lcom/bumptech/glide/load/engine/GlideException$a;
.super Ljava/lang/Object;
.source "GlideException.java"

# interfaces
.implements Ljava/lang/Appendable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/GlideException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field private static final INDENT:Ljava/lang/String; = "  "

.field private static final gb:Ljava/lang/String; = ""


# instance fields
.field private final gc:Ljava/lang/Appendable;

.field private gd:Z


# direct methods
.method constructor <init>(Ljava/lang/Appendable;)V
    .locals 1

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    .line 213
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gc:Ljava/lang/Appendable;

    .line 214
    return-void
.end method

.method private a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 248
    if-nez p1, :cond_0

    .line 249
    const-string p1, ""

    return-object p1

    .line 251
    :cond_0
    return-object p1
.end method


# virtual methods
.method public append(C)Ljava/lang/Appendable;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 219
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    .line 220
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gc:Ljava/lang/Appendable;

    const-string v2, "  "

    invoke-interface {v0, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 222
    :cond_0
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    .line 223
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gc:Ljava/lang/Appendable;

    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 224
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/GlideException$a;->a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 230
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/bumptech/glide/load/engine/GlideException$a;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 3
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/GlideException$a;->a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 237
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 238
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    .line 239
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gc:Ljava/lang/Appendable;

    const-string v2, "  "

    invoke-interface {v0, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 241
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    add-int/lit8 v0, p3, -0x1

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v2, 0xa

    if-ne v0, v2, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gd:Z

    .line 242
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/GlideException$a;->gc:Ljava/lang/Appendable;

    invoke-interface {v0, p1, p2, p3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 243
    return-object p0
.end method
