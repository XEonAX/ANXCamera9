.class public Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "EyeLightSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;,
        Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mBackgroundColorNormal:I

.field private mBackgroundColorPressed:I

.field private mContext:Landroid/content/Context;

.field private mItemHorizontalMargin:I

.field private mPreSelectedItem:I

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mSelectedItem:I

.field private mSingleCheckList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;",
            ">;"
        }
    .end annotation
.end field

.field private onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;",
            ">;I)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    .line 26
    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    .line 27
    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    .line 38
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    .line 40
    iput p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    .line 42
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a005f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorPressed:I

    .line 44
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    .line 45
    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a005d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a005e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    .line 50
    :goto_1
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/content/Context;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    return p0
.end method

.method static synthetic access$302(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I
    .locals 0

    .line 22
    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorPressed:I

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I
    .locals 0

    .line 22
    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    .line 54
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 56
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 57
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 22
    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onBindViewHolder(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;I)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 70
    :try_start_0
    invoke-virtual {p1, v0, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->setDataToView(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    goto :goto_0

    .line 71
    :catch_0
    move-exception p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 74
    :goto_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;
    .locals 2

    .line 61
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 62
    const v0, 0x7f040005

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 63
    new-instance p2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    invoke-direct {p2, p0, p1, p0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;-><init>(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)V

    return-object p2
.end method

.method public onItemHolderClick(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)V
    .locals 7

    .line 86
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    .line 87
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->access$000(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)Landroid/view/View;

    move-result-object v3

    .line 88
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->getItemId()J

    move-result-wide v5

    .line 87
    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 89
    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 83
    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0

    .line 165
    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    .line 166
    return-void
.end method
