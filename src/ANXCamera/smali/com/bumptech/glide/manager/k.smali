.class public Lcom/bumptech/glide/manager/k;
.super Landroid/app/Fragment;
.source "RequestManagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/manager/k$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RMFragment"


# instance fields
.field private Z:Lcom/bumptech/glide/i;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final mn:Lcom/bumptech/glide/manager/a;

.field private final mo:Lcom/bumptech/glide/manager/m;

.field private final mp:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/manager/k;",
            ">;"
        }
    .end annotation
.end field

.field private mq:Lcom/bumptech/glide/manager/k;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mr:Landroid/app/Fragment;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    new-instance v0, Lcom/bumptech/glide/manager/a;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/a;-><init>()V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/manager/k;-><init>(Lcom/bumptech/glide/manager/a;)V

    .line 46
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/manager/a;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/manager/a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ValidFragment"
        }
    .end annotation

    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 50
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 33
    new-instance v0, Lcom/bumptech/glide/manager/k$a;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/manager/k$a;-><init>(Lcom/bumptech/glide/manager/k;)V

    iput-object v0, p0, Lcom/bumptech/glide/manager/k;->mo:Lcom/bumptech/glide/manager/m;

    .line 35
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/manager/k;->mp:Ljava/util/Set;

    .line 51
    iput-object p1, p0, Lcom/bumptech/glide/manager/k;->mn:Lcom/bumptech/glide/manager/a;

    .line 52
    return-void
.end method

.method private a(Lcom/bumptech/glide/manager/k;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mp:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 87
    return-void
.end method

.method private b(Landroid/app/Activity;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 163
    invoke-direct {p0}, Lcom/bumptech/glide/manager/k;->cW()V

    .line 164
    nop

    .line 165
    invoke-static {p1}, Lcom/bumptech/glide/c;->b(Landroid/content/Context;)Lcom/bumptech/glide/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/c;->k()Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/manager/l;->e(Landroid/app/Activity;)Lcom/bumptech/glide/manager/k;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    .line 166
    iget-object p1, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/manager/k;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 167
    iget-object p1, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    invoke-direct {p1, p0}, Lcom/bumptech/glide/manager/k;->a(Lcom/bumptech/glide/manager/k;)V

    .line 169
    :cond_0
    return-void
.end method

.method private b(Lcom/bumptech/glide/manager/k;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mp:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method private c(Landroid/app/Fragment;)Z
    .locals 2
    .param p1    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 150
    invoke-virtual {p0}, Lcom/bumptech/glide/manager/k;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    .line 152
    :goto_0
    invoke-virtual {p1}, Landroid/app/Fragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 153
    invoke-virtual {v1, v0}, Landroid/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    const/4 p1, 0x1

    return p1

    .line 156
    :cond_0
    invoke-virtual {p1}, Landroid/app/Fragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object p1

    goto :goto_0

    .line 158
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private cV()Landroid/app/Fragment;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 137
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lcom/bumptech/glide/manager/k;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    goto :goto_0

    .line 140
    :cond_0
    const/4 v0, 0x0

    .line 142
    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mr:Landroid/app/Fragment;

    :goto_1
    return-object v0
.end method

.method private cW()V
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/manager/k;->b(Lcom/bumptech/glide/manager/k;)V

    .line 174
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    .line 176
    :cond_0
    return-void
.end method


# virtual methods
.method b(Landroid/app/Fragment;)V
    .locals 1
    .param p1    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 127
    iput-object p1, p0, Lcom/bumptech/glide/manager/k;->mr:Landroid/app/Fragment;

    .line 128
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/bumptech/glide/manager/k;->b(Landroid/app/Activity;)V

    .line 131
    :cond_0
    return-void
.end method

.method public c(Lcom/bumptech/glide/i;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/i;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 60
    iput-object p1, p0, Lcom/bumptech/glide/manager/k;->Z:Lcom/bumptech/glide/i;

    .line 61
    return-void
.end method

.method cR()Lcom/bumptech/glide/manager/a;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mn:Lcom/bumptech/glide/manager/a;

    return-object v0
.end method

.method public cS()Lcom/bumptech/glide/i;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->Z:Lcom/bumptech/glide/i;

    return-object v0
.end method

.method public cT()Lcom/bumptech/glide/manager/m;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mo:Lcom/bumptech/glide/manager/m;

    return-object v0
.end method

.method cU()Ljava/util/Set;
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/manager/k;",
            ">;"
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/manager/k;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mp:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    if-eqz v0, :cond_4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-ge v0, v1, :cond_1

    goto :goto_1

    .line 111
    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 112
    iget-object v1, p0, Lcom/bumptech/glide/manager/k;->mq:Lcom/bumptech/glide/manager/k;

    .line 113
    invoke-virtual {v1}, Lcom/bumptech/glide/manager/k;->cU()Ljava/util/Set;

    move-result-object v1

    .line 112
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/manager/k;

    .line 114
    invoke-virtual {v2}, Lcom/bumptech/glide/manager/k;->getParentFragment()Landroid/app/Fragment;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/bumptech/glide/manager/k;->c(Landroid/app/Fragment;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 115
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    :cond_2
    goto :goto_0

    .line 118
    :cond_3
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 109
    :cond_4
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2

    .line 181
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 183
    :try_start_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/manager/k;->b(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    goto :goto_0

    .line 184
    :catch_0
    move-exception p1

    .line 186
    const-string v0, "RMFragment"

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    const-string v0, "RMFragment"

    const-string v1, "Unable to register fragment with root"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 190
    :cond_0
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 212
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 213
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mn:Lcom/bumptech/glide/manager/a;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/a;->onDestroy()V

    .line 214
    invoke-direct {p0}, Lcom/bumptech/glide/manager/k;->cW()V

    .line 215
    return-void
.end method

.method public onDetach()V
    .locals 0

    .line 194
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 195
    invoke-direct {p0}, Lcom/bumptech/glide/manager/k;->cW()V

    .line 196
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 200
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 201
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mn:Lcom/bumptech/glide/manager/a;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/a;->onStart()V

    .line 202
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 206
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 207
    iget-object v0, p0, Lcom/bumptech/glide/manager/k;->mn:Lcom/bumptech/glide/manager/a;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/a;->onStop()V

    .line 208
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Landroid/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{parent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/bumptech/glide/manager/k;->cV()Landroid/app/Fragment;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
