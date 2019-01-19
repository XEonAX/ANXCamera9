.class public Lcom/android/camera/fragment/top/ExpandAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ExpandAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/CommonRecyclerViewHolder;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mExpandListener:Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/ComponentData;Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    .line 39
    iput-object p2, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mExpandListener:Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;

    .line 41
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 42
    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentMode:I

    .line 43
    iget-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget p2, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentMode:I

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentValue:Ljava/lang/String;

    .line 44
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 24
    check-cast p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/top/ExpandAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
    .locals 3

    .line 55
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/data/data/ComponentDataItem;

    .line 57
    iget-object v0, p2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 58
    iget-object v1, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v1, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 61
    const v0, 0x7f0d00c5

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 62
    iget-object v1, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p2, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentValue:Ljava/lang/String;

    iget-object p2, p2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    .line 65
    const/4 p2, 0x0

    invoke-virtual {v0, v1, v1, v1, p2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 66
    const p2, 0x7f02000e

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 67
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 68
    iget-object p1, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0900ee

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 69
    new-instance p2, Lcom/android/camera/fragment/top/ExpandAdapter$1;

    invoke-direct {p2, p0, v0, p1}, Lcom/android/camera/fragment/top/ExpandAdapter$1;-><init>(Lcom/android/camera/fragment/top/ExpandAdapter;Landroid/widget/TextView;Ljava/lang/String;)V

    const-wide/16 v1, 0x64

    invoke-virtual {v0, p2, v1, v2}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    goto :goto_0

    .line 78
    :cond_0
    const/high16 p1, 0x40800000    # 4.0f

    const/high16 p2, -0x40000000    # -2.0f

    invoke-virtual {v0, p1, v1, v1, p2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 79
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 91
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iput-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentValue:Ljava/lang/String;

    .line 93
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mCurrentMode:I

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 95
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/ExpandAdapter;->notifyDataSetChanged()V

    .line 97
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mExpandListener:Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mExpandListener:Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;

    iget-object v1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    invoke-interface {v0, v1, p1}, Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;->onExpandValueChange(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;)V

    .line 99
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter;->mExpandListener:Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;

    .line 102
    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/top/ExpandAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .locals 2

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040038

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 50
    new-instance p2, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-direct {p2, p1}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
