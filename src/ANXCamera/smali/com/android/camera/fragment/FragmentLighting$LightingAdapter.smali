.class Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentLighting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentLighting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LightingAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/CommonRecyclerViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mBgAlpha:I

.field private mBgNormal:Landroid/graphics/drawable/Drawable;

.field private mBgSelected:Landroid/graphics/drawable/Drawable;

.field private mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

.field private mContent:[Ljava/lang/String;

.field private mCount:I

.field private mCurrentMode:I

.field private mMargin:I

.field private mOnClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/view/View$OnClickListener;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V
    .locals 1

    .line 218
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 210
    const/16 v0, 0xff

    iput v0, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgAlpha:I

    .line 219
    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCurrentMode:I

    .line 220
    iput-object p3, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 221
    iput-object p4, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    .line 222
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCount:I

    .line 223
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a00c5

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mMargin:I

    .line 225
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f020003

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgNormal:Landroid/graphics/drawable/Drawable;

    .line 226
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f020004

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgSelected:Landroid/graphics/drawable/Drawable;

    .line 227
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->updateContent(Landroid/content/Context;)V

    .line 229
    return-void
.end method

.method private updateContent(Landroid/content/Context;)V
    .locals 3

    .line 239
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 240
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCount:I

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mContent:[Ljava/lang/String;

    .line 241
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCount:I

    if-ge v0, v1, :cond_1

    .line 242
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 243
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mContent:[Ljava/lang/String;

    iget v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 241
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 246
    :cond_1
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 299
    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCount:I

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 203
    check-cast p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
    .locals 5

    .line 267
    iget-object v0, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 268
    const v1, 0x7f0d0059

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    .line 269
    const v2, 0x7f0d005a

    invoke-virtual {p1, v2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/ColorImageView;

    .line 270
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v3, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCurrentMode:I

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 271
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/data/data/ComponentDataItem;

    .line 272
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 273
    :cond_0
    iget-object v4, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mContent:[Ljava/lang/String;

    aget-object v4, v4, p2

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/ColorImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 277
    :cond_1
    iget-object v4, v3, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 278
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgSelected:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 279
    iget v2, v3, Lcom/android/camera/data/data/ComponentDataItem;->mIconSelectedRes:I

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    goto :goto_0

    .line 281
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgNormal:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 282
    iget v2, v3, Lcom/android/camera/data/data/ComponentDataItem;->mIconRes:I

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 285
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mMargin:I

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 286
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->getItemCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-ge p2, p1, :cond_3

    .line 287
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    goto :goto_1

    .line 289
    :cond_3
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mMargin:I

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 292
    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/ColorImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/ColorImageView;->setTag(Ljava/lang/Object;)V

    .line 295
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 203
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .locals 2

    .line 261
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f04001c

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 262
    new-instance p2, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-direct {p2, p1}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public setBgMode(Z)V
    .locals 1

    .line 249
    if-eqz p1, :cond_0

    .line 250
    const/16 p1, 0x66

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgAlpha:I

    goto :goto_0

    .line 252
    :cond_0
    const/16 p1, 0xff

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgAlpha:I

    .line 255
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgNormal:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mBgAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 257
    return-void
.end method

.method public updateLightingData(Landroid/content/Context;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V
    .locals 0

    .line 232
    iput-object p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    .line 233
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->mCount:I

    .line 234
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->updateContent(Landroid/content/Context;)V

    .line 235
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyDataSetChanged()V

    .line 236
    return-void
.end method
