.class public abstract Lcom/bumptech/glide/request/target/ViewTarget;
.super Lcom/bumptech/glide/request/target/b;
.source "ViewTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        "Z:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/b<",
        "TZ;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ViewTarget"

.field private static oD:Z

.field private static oE:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private final oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

.field private oG:Landroid/view/View$OnAttachStateChangeListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private oH:Z

.field private oI:Z

.field protected final view:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/b;-><init>()V

    .line 61
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    .line 62
    new-instance v0, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Z)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 80
    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/target/ViewTarget;-><init>(Landroid/view/View;)V

    .line 81
    if-eqz p2, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->eq()Lcom/bumptech/glide/request/target/ViewTarget;

    .line 84
    :cond_0
    return-void
.end method

.method public static Q(I)V
    .locals 1

    .line 316
    sget-object v0, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/bumptech/glide/request/target/ViewTarget;->oD:Z

    if-nez v0, :cond_0

    .line 320
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    sput-object p0, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    .line 321
    return-void

    .line 317
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "You cannot set the tag id more than once or change the tag id after the first request has been made"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private er()V
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oI:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    iget-object v1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oI:Z

    .line 184
    return-void

    .line 179
    :cond_1
    :goto_0
    return-void
.end method

.method private es()V
    .locals 2

    .line 187
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oI:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    iget-object v1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 192
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oI:Z

    .line 193
    return-void

    .line 188
    :cond_1
    :goto_0
    return-void
.end method

.method private getTag()Ljava/lang/Object;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 288
    sget-object v0, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    sget-object v1, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private setTag(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 278
    sget-object v0, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 279
    const/4 v0, 0x1

    sput-boolean v0, Lcom/bumptech/glide/request/target/ViewTarget;->oD:Z

    .line 280
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    sget-object v1, Lcom/bumptech/glide/request/target/ViewTarget;->oE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 284
    :goto_0
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/request/target/m;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .line 215
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->a(Lcom/bumptech/glide/request/target/m;)V

    .line 216
    return-void
.end method

.method public b(Lcom/bumptech/glide/request/target/m;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->b(Lcom/bumptech/glide/request/target/m;)V

    .line 222
    return-void
.end method

.method public d(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .line 227
    invoke-super {p0, p1}, Lcom/bumptech/glide/request/target/b;->d(Landroid/graphics/drawable/Drawable;)V

    .line 228
    iget-object p1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-virtual {p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->eu()V

    .line 230
    iget-boolean p1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oH:Z

    if-nez p1, :cond_0

    .line 231
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->es()V

    .line 233
    :cond_0
    return-void
.end method

.method public dj()Lcom/bumptech/glide/request/c;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 259
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 260
    nop

    .line 261
    if-eqz v0, :cond_1

    .line 262
    instance-of v1, v0, Lcom/bumptech/glide/request/c;

    if-eqz v1, :cond_0

    .line 263
    check-cast v0, Lcom/bumptech/glide/request/c;

    goto :goto_0

    .line 265
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must not call setTag() on a view Glide is targeting"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 269
    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public e(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .line 173
    invoke-super {p0, p1}, Lcom/bumptech/glide/request/target/b;->e(Landroid/graphics/drawable/Drawable;)V

    .line 174
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->er()V

    .line 175
    return-void
.end method

.method public final en()Lcom/bumptech/glide/request/target/ViewTarget;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/target/ViewTarget<",
            "TT;TZ;>;"
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    if-eqz v0, :cond_0

    .line 109
    return-object p0

    .line 111
    :cond_0
    new-instance v0, Lcom/bumptech/glide/request/target/ViewTarget$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/request/target/ViewTarget$1;-><init>(Lcom/bumptech/glide/request/target/ViewTarget;)V

    iput-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oG:Landroid/view/View$OnAttachStateChangeListener;

    .line 122
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->er()V

    .line 123
    return-object p0
.end method

.method eo()V
    .locals 2

    .line 128
    invoke-virtual {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->dj()Lcom/bumptech/glide/request/c;

    move-result-object v0

    .line 129
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isPaused()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    .line 132
    :cond_0
    return-void
.end method

.method ep()V
    .locals 2

    .line 136
    invoke-virtual {p0}, Lcom/bumptech/glide/request/target/ViewTarget;->dj()Lcom/bumptech/glide/request/c;

    move-result-object v0

    .line 137
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isPaused()Z

    move-result v1

    if-nez v1, :cond_0

    .line 138
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oH:Z

    .line 139
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    .line 140
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oH:Z

    .line 142
    :cond_0
    return-void
.end method

.method public final eq()Lcom/bumptech/glide/request/target/ViewTarget;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/target/ViewTarget<",
            "TT;TZ;>;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->oF:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->oL:Z

    .line 167
    return-object p0
.end method

.method public getView()Landroid/view/View;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    return-object v0
.end method

.method public j(Lcom/bumptech/glide/request/c;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 242
    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/target/ViewTarget;->setTag(Ljava/lang/Object;)V

    .line 243
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Target for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
