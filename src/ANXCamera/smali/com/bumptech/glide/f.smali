.class public Lcom/bumptech/glide/f;
.super Ljava/lang/Object;
.source "ListPreloader.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/f$c;,
        Lcom/bumptech/glide/f$d;,
        Lcom/bumptech/glide/f$b;,
        Lcom/bumptech/glide/f$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/widget/AbsListView$OnScrollListener;"
    }
.end annotation


# instance fields
.field private final V:I

.field private final W:Lcom/bumptech/glide/f$d;

.field private final X:Lcom/bumptech/glide/i;

.field private final Z:Lcom/bumptech/glide/f$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/f$a<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final aa:Lcom/bumptech/glide/f$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/f$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field private ab:I

.field private ac:I

.field private ad:I

.field private ae:I

.field private af:Z


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/i;Lcom/bumptech/glide/f$a;Lcom/bumptech/glide/f$b;I)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/f$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/f$b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/i;",
            "Lcom/bumptech/glide/f$a<",
            "TT;>;",
            "Lcom/bumptech/glide/f$b<",
            "TT;>;I)V"
        }
    .end annotation

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/f;->ad:I

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/f;->af:Z

    .line 125
    iput-object p1, p0, Lcom/bumptech/glide/f;->X:Lcom/bumptech/glide/i;

    .line 126
    iput-object p2, p0, Lcom/bumptech/glide/f;->Z:Lcom/bumptech/glide/f$a;

    .line 127
    iput-object p3, p0, Lcom/bumptech/glide/f;->aa:Lcom/bumptech/glide/f$b;

    .line 128
    iput p4, p0, Lcom/bumptech/glide/f;->V:I

    .line 129
    new-instance p1, Lcom/bumptech/glide/f$d;

    add-int/2addr p4, v0

    invoke-direct {p1, p4}, Lcom/bumptech/glide/f$d;-><init>(I)V

    iput-object p1, p0, Lcom/bumptech/glide/f;->W:Lcom/bumptech/glide/f$d;

    .line 130
    return-void
.end method

.method private a(II)V
    .locals 4

    .line 160
    if-ge p1, p2, :cond_0

    .line 161
    iget v0, p0, Lcom/bumptech/glide/f;->ab:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 162
    nop

    .line 167
    move v1, v0

    move v0, p2

    goto :goto_0

    .line 164
    :cond_0
    nop

    .line 165
    iget v0, p0, Lcom/bumptech/glide/f;->ac:I

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 167
    move v1, p2

    :goto_0
    iget v2, p0, Lcom/bumptech/glide/f;->ae:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 168
    iget v2, p0, Lcom/bumptech/glide/f;->ae:I

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 170
    if-ge p1, p2, :cond_1

    .line 172
    move p1, v1

    :goto_1
    if-ge p1, v0, :cond_2

    .line 173
    iget-object p2, p0, Lcom/bumptech/glide/f;->Z:Lcom/bumptech/glide/f$a;

    invoke-interface {p2, p1}, Lcom/bumptech/glide/f$a;->c(I)Ljava/util/List;

    move-result-object p2

    const/4 v2, 0x1

    invoke-direct {p0, p2, p1, v2}, Lcom/bumptech/glide/f;->a(Ljava/util/List;IZ)V

    .line 172
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 177
    :cond_1
    add-int/lit8 p1, v0, -0x1

    :goto_2
    if-lt p1, v1, :cond_2

    .line 178
    iget-object p2, p0, Lcom/bumptech/glide/f;->Z:Lcom/bumptech/glide/f$a;

    invoke-interface {p2, p1}, Lcom/bumptech/glide/f$a;->c(I)Ljava/util/List;

    move-result-object p2

    invoke-direct {p0, p2, p1, v3}, Lcom/bumptech/glide/f;->a(Ljava/util/List;IZ)V

    .line 177
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    .line 182
    :cond_2
    iput v1, p0, Lcom/bumptech/glide/f;->ac:I

    .line 183
    iput v0, p0, Lcom/bumptech/glide/f;->ab:I

    .line 184
    return-void
.end method

.method private a(IZ)V
    .locals 1

    .line 150
    iget-boolean v0, p0, Lcom/bumptech/glide/f;->af:Z

    if-eq v0, p2, :cond_0

    .line 151
    iput-boolean p2, p0, Lcom/bumptech/glide/f;->af:Z

    .line 152
    invoke-direct {p0}, Lcom/bumptech/glide/f;->cancelAll()V

    .line 154
    :cond_0
    if-eqz p2, :cond_1

    iget p2, p0, Lcom/bumptech/glide/f;->V:I

    goto :goto_0

    :cond_1
    iget p2, p0, Lcom/bumptech/glide/f;->V:I

    neg-int p2, p2

    :goto_0
    add-int/2addr p2, p1

    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/f;->a(II)V

    .line 155
    return-void
.end method

.method private a(Ljava/lang/Object;II)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)V"
        }
    .end annotation

    .line 201
    if-nez p1, :cond_0

    .line 202
    return-void

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/f;->aa:Lcom/bumptech/glide/f$b;

    .line 205
    invoke-interface {v0, p1, p2, p3}, Lcom/bumptech/glide/f$b;->b(Ljava/lang/Object;II)[I

    move-result-object p2

    .line 206
    if-nez p2, :cond_1

    .line 207
    return-void

    .line 209
    :cond_1
    iget-object p3, p0, Lcom/bumptech/glide/f;->Z:Lcom/bumptech/glide/f$a;

    .line 210
    invoke-interface {p3, p1}, Lcom/bumptech/glide/f$a;->a(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    .line 211
    if-nez p1, :cond_2

    .line 212
    return-void

    .line 215
    :cond_2
    iget-object p3, p0, Lcom/bumptech/glide/f;->W:Lcom/bumptech/glide/f$d;

    const/4 v0, 0x0

    aget v0, p2, v0

    const/4 v1, 0x1

    aget p2, p2, v1

    invoke-virtual {p3, v0, p2}, Lcom/bumptech/glide/f$d;->b(II)Lcom/bumptech/glide/f$c;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;

    .line 216
    return-void
.end method

.method private a(Ljava/util/List;IZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;IZ)V"
        }
    .end annotation

    .line 187
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 188
    if-eqz p3, :cond_0

    .line 189
    const/4 p3, 0x0

    :goto_0
    if-ge p3, v0, :cond_1

    .line 190
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1, p2, p3}, Lcom/bumptech/glide/f;->a(Ljava/lang/Object;II)V

    .line 189
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 193
    :cond_0
    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_1

    .line 194
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-direct {p0, p3, p2, v0}, Lcom/bumptech/glide/f;->a(Ljava/lang/Object;II)V

    .line 193
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 197
    :cond_1
    return-void
.end method

.method private cancelAll()V
    .locals 4

    .line 219
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget v2, p0, Lcom/bumptech/glide/f;->V:I

    if-ge v1, v2, :cond_0

    .line 220
    iget-object v2, p0, Lcom/bumptech/glide/f;->X:Lcom/bumptech/glide/i;

    iget-object v3, p0, Lcom/bumptech/glide/f;->W:Lcom/bumptech/glide/f$d;

    invoke-virtual {v3, v0, v0}, Lcom/bumptech/glide/f$d;->b(II)Lcom/bumptech/glide/f$c;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 219
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 222
    :cond_0
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 140
    iput p4, p0, Lcom/bumptech/glide/f;->ae:I

    .line 141
    iget p1, p0, Lcom/bumptech/glide/f;->ad:I

    if-le p2, p1, :cond_0

    .line 142
    add-int/2addr p3, p2

    const/4 p1, 0x1

    invoke-direct {p0, p3, p1}, Lcom/bumptech/glide/f;->a(IZ)V

    goto :goto_0

    .line 143
    :cond_0
    iget p1, p0, Lcom/bumptech/glide/f;->ad:I

    if-ge p2, p1, :cond_1

    .line 144
    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lcom/bumptech/glide/f;->a(IZ)V

    .line 146
    :cond_1
    :goto_0
    iput p2, p0, Lcom/bumptech/glide/f;->ad:I

    .line 147
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 135
    return-void
.end method
