.class public Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentMimoji.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MimojiItemAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private adapterLongSelectIndex:I

.field private adapterSelectIndex:I

.field private datas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field mListener:Landroid/widget/AdapterView$OnItemClickListener;

.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/content/Context;IILandroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mContext:Landroid/content/Context;

    iput p3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterSelectIndex:I

    iput p4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterLongSelectIndex:I

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    iput-object p5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->datas:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addItem(Lcom/android/camera/fragment/mimoji/MimojiInfo;)I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    return p1
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemObject(I)Lcom/android/camera/fragment/mimoji/MimojiInfo;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;I)V
    .locals 6

    const v0, 0x7f0d00ae

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0d00af

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getView(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0d00b0

    invoke-virtual {p1, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getView(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->datas:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/bumptech/glide/c;->h(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object p1

    iget-object v3, v3, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/bumptech/glide/i;->y(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    new-instance v3, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    const/16 v4, 0xa

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;-><init>(II)V

    invoke-static {v3}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterSelectIndex:I

    const/16 v0, 0x8

    const/4 v3, 0x0

    if-ne p2, p1, :cond_0

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterLongSelectIndex:I

    if-ne p2, p1, :cond_1

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;
    .locals 2

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f040030

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public setLongSelectIndex(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterLongSelectIndex:I

    return-void
.end method

.method public setMimojiInfoList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->datas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->datas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSelectIndex(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->adapterSelectIndex:I

    return-void
.end method
