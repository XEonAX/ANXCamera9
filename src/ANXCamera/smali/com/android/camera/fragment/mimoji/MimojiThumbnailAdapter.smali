.class public Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;
.super Landroid/widget/BaseAdapter;
.source "MimojiThumbnailAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectItem:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mSelectItem:I

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSelectItme()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mSelectItem:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/arcsoft/avatar/AvatarConfig$c;

    nop

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040046

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;)V

    const v1, 0x7f0d00ec

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->imageView:Landroid/widget/ImageView;

    const v1, 0x7f0d00ed

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->selectView:Landroid/widget/ImageView;

    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;

    :goto_0
    iget-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->imageView:Landroid/widget/ImageView;

    iget-object p3, p3, Lcom/arcsoft/avatar/AvatarConfig$c;->an:Landroid/graphics/Bitmap;

    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p3, v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->selectView:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mSelectItem:I

    if-ne v0, p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    const/4 p1, 0x4

    :goto_1
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-object p2
.end method

.method public refreshData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mData:Ljava/util/List;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->notifyDataSetChanged()V

    return-void
.end method
