.class public Lcom/android/camera/fragment/RecyclerAdapterWrapper;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "RecyclerAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v7/widget/RecyclerView$Adapter;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final FOOTER_VIEW_TYPE:I = -0x7d0

.field private static final HEADER_VIEW_TYPE:I = -0x3e8


# instance fields
.field private final mBase:Landroid/support/v7/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final mBaseHolderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mFooters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private o:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    .line 44
    iput-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 46
    iget-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object p1

    .line 47
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_1

    .line 48
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    .line 49
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 50
    check-cast p1, Ljava/lang/Class;

    iput-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    goto :goto_0

    .line 52
    :cond_0
    const-class p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iput-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    goto :goto_0

    .line 55
    :cond_1
    const-class p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iput-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    .line 59
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    new-instance v0, Lcom/android/camera/fragment/RecyclerAdapterWrapper$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/RecyclerAdapterWrapper$1;-><init>(Lcom/android/camera/fragment/RecyclerAdapterWrapper;)V

    iput-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->o:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 86
    return-void
.end method

.method private isFooter(I)Z
    .locals 2

    .line 189
    const/16 v0, -0x7d0

    if-lt p1, v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isHeader(I)Z
    .locals 2

    .line 185
    const/16 v0, -0x3e8

    if-lt p1, v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public addFooter(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 134
    if-eqz p1, :cond_0

    .line 137
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    return-void

    .line 135
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null footer!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addHeader(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 106
    if-eqz p1, :cond_0

    .line 109
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    return-void

    .line 107
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null header!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public detach()V
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->o:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->o:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 150
    :cond_0
    return-void
.end method

.method public getFooter(I)Landroid/view/View;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getFooterCount()I
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getHeader(I)Landroid/view/View;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getHeaderCount()I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 2

    .line 227
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 232
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 233
    const/16 v0, -0x3e8

    add-int/2addr v0, p1

    return v0

    .line 235
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_1

    .line 236
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result p1

    return p1

    .line 239
    :cond_1
    const/16 v0, -0x7d0

    add-int/2addr v0, p1

    iget-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr v0, p1

    iget-object p1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public getWrappedAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method public isContainsFooter(Landroid/view/View;)Z
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 124
    if-eqz p1, :cond_0

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 125
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null footer!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public isContainsHeader(Landroid/view/View;)Z
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 96
    if-eqz p1, :cond_0

    .line 99
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 97
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null footer!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 279
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    .line 213
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    goto :goto_0

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p2, v0, :cond_1

    .line 218
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 223
    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 194
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    add-int/lit16 p2, p2, 0x3e8

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    .line 196
    iget-object p2, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 197
    new-instance p2, Lcom/android/camera/fragment/RecyclerAdapterWrapper$2;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/RecyclerAdapterWrapper$2;-><init>(Lcom/android/camera/fragment/RecyclerAdapterWrapper;Landroid/view/View;)V

    return-object p2

    .line 199
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->isFooter(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    add-int/lit16 p2, p2, 0x7d0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    .line 201
    iget-object p2, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 202
    new-instance p2, Lcom/android/camera/fragment/RecyclerAdapterWrapper$3;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/RecyclerAdapterWrapper$3;-><init>(Lcom/android/camera/fragment/RecyclerAdapterWrapper;Landroid/view/View;)V

    return-object p2

    .line 206
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    .line 283
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 284
    return-void
.end method

.method public onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 2

    .line 254
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p1

    return p1

    .line 257
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p1

    return p1
.end method

.method public onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 266
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 2

    .line 271
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 274
    :cond_0
    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBase:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mBaseHolderClass:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 249
    :cond_0
    return-void
.end method

.method public removeAllFooter()V
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 154
    return-void
.end method

.method public removeAllHeader()V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 121
    return-void
.end method

.method public removeFooter(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 141
    if-eqz p1, :cond_0

    .line 144
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mFooters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 145
    return-void

    .line 142
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null header!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeHeader(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 113
    if-eqz p1, :cond_0

    .line 116
    iget-object v0, p0, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    return-void

    .line 114
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You can\'t have a null header!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
