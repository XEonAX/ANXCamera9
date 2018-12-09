.class public final Lcom/bumptech/glide/load/model/j$a;
.super Ljava/lang/Object;
.source "LazyHeaders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field private static final jg:Ljava/lang/String; = "User-Agent"

.field private static final jh:Ljava/lang/String;

.field private static final ji:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/i;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/i;",
            ">;>;"
        }
    .end annotation
.end field

.field private jj:Z

.field private jk:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 106
    invoke-static {}, Lcom/bumptech/glide/load/model/j$a;->getSanitizedUserAgent()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/model/j$a;->jh:Ljava/lang/String;

    .line 113
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 115
    sget-object v1, Lcom/bumptech/glide/load/model/j$a;->jh:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 116
    const-string v1, "User-Agent"

    new-instance v2, Lcom/bumptech/glide/load/model/j$b;

    sget-object v3, Lcom/bumptech/glide/load/model/j$a;->jh:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/j$b;-><init>(Ljava/lang/String;)V

    .line 117
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 116
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/model/j$a;->ji:Ljava/util/Map;

    .line 121
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jj:Z

    .line 124
    sget-object v1, Lcom/bumptech/glide/load/model/j$a;->ji:Ljava/util/Map;

    iput-object v1, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    .line 125
    iput-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jk:Z

    return-void
.end method

.method private bY()V
    .locals 1

    .line 206
    iget-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jj:Z

    if-eqz v0, :cond_0

    .line 207
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jj:Z

    .line 208
    invoke-direct {p0}, Lcom/bumptech/glide/load/model/j$a;->ca()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    .line 210
    :cond_0
    return-void
.end method

.method private ca()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/i;",
            ">;>;"
        }
    .end annotation

    .line 221
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 222
    iget-object v1, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 224
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 225
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    goto :goto_0

    .line 227
    :cond_0
    return-object v0
.end method

.method static getSanitizedUserAgent()Ljava/lang/String;
    .locals 6
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 237
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 238
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 239
    return-object v0

    .line 242
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 243
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 244
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 245
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 246
    const/16 v5, 0x1f

    if-gt v4, v5, :cond_1

    const/16 v5, 0x9

    if-ne v4, v5, :cond_2

    :cond_1
    const/16 v5, 0x7f

    if-ge v4, v5, :cond_2

    .line 247
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 249
    :cond_2
    const/16 v4, 0x3f

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 244
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 252
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private o(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/i;",
            ">;"
        }
    .end annotation

    .line 197
    iget-object v0, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 198
    if-nez v0, :cond_0

    .line 199
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 200
    iget-object v1, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    :cond_0
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/bumptech/glide/load/model/i;)Lcom/bumptech/glide/load/model/j$a;
    .locals 1

    .line 150
    iget-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jk:Z

    if-eqz v0, :cond_0

    const-string v0, "User-Agent"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/load/model/j$a;->b(Ljava/lang/String;Lcom/bumptech/glide/load/model/i;)Lcom/bumptech/glide/load/model/j$a;

    move-result-object p1

    return-object p1

    .line 154
    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/model/j$a;->bY()V

    .line 155
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/model/j$a;->o(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    return-object p0
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)Lcom/bumptech/glide/load/model/j$a;
    .locals 1

    .line 136
    new-instance v0, Lcom/bumptech/glide/load/model/j$b;

    invoke-direct {v0, p2}, Lcom/bumptech/glide/load/model/j$b;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/load/model/j$a;->a(Ljava/lang/String;Lcom/bumptech/glide/load/model/i;)Lcom/bumptech/glide/load/model/j$a;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/String;Lcom/bumptech/glide/load/model/i;)Lcom/bumptech/glide/load/model/j$a;
    .locals 1

    .line 180
    invoke-direct {p0}, Lcom/bumptech/glide/load/model/j$a;->bY()V

    .line 181
    if-nez p2, :cond_0

    .line 182
    iget-object p2, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 184
    :cond_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/model/j$a;->o(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 185
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 186
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    :goto_0
    iget-boolean p2, p0, Lcom/bumptech/glide/load/model/j$a;->jk:Z

    if-eqz p2, :cond_1

    const-string p2, "User-Agent"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 190
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/bumptech/glide/load/model/j$a;->jk:Z

    .line 193
    :cond_1
    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)Lcom/bumptech/glide/load/model/j$a;
    .locals 1

    .line 170
    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/bumptech/glide/load/model/j$b;

    invoke-direct {v0, p2}, Lcom/bumptech/glide/load/model/j$b;-><init>(Ljava/lang/String;)V

    move-object p2, v0

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/load/model/j$a;->b(Ljava/lang/String;Lcom/bumptech/glide/load/model/i;)Lcom/bumptech/glide/load/model/j$a;

    move-result-object p1

    return-object p1
.end method

.method public bZ()Lcom/bumptech/glide/load/model/j;
    .locals 2

    .line 216
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/model/j$a;->jj:Z

    .line 217
    new-instance v0, Lcom/bumptech/glide/load/model/j;

    iget-object v1, p0, Lcom/bumptech/glide/load/model/j$a;->headers:Ljava/util/Map;

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/model/j;-><init>(Ljava/util/Map;)V

    return-object v0
.end method
