.class Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "EyeLightSingleCheckAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SingleCheckViewHolder"
.end annotation


# instance fields
.field private itemView:Landroid/view/View;

.field private mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

.field private mBase:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)V
    .locals 1

    .line 97
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 98
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 99
    iput-object p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 100
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->itemView:Landroid/view/View;

    .line 101
    const p3, 0x7f0d0014

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    .line 102
    iget-object p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    .line 103
    invoke-virtual {p3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 104
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$100(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 105
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$100(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 106
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)Landroid/view/View;
    .locals 0

    .line 91
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->itemView:Landroid/view/View;

    return-object p0
.end method

.method private colorAnimate(Landroid/widget/ImageView;II)V
    .locals 3

    .line 149
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    .line 150
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x1

    aput-object p2, v1, p3

    invoke-static {v0, v1}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object p2

    .line 151
    const-wide/16 v0, 0xc8

    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 152
    new-instance p3, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder$1;

    invoke-direct {p3, p0, p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder$1;-><init>(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;Landroid/widget/ImageView;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 160
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 161
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 126
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result p1

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 128
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$602(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I

    .line 131
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$302(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I

    .line 132
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 133
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$700(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$600(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    .line 134
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 135
    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$700(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    .line 136
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$200(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 137
    if-eqz p1, :cond_1

    .line 138
    iget-object v1, p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$400(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$500(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->colorAnimate(Landroid/widget/ImageView;II)V

    .line 140
    :cond_1
    iget-object v0, v0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$500(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$400(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->colorAnimate(Landroid/widget/ImageView;II)V

    .line 142
    if-nez p1, :cond_2

    .line 143
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$600(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 145
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p1, p0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemHolderClick(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)V

    .line 146
    return-void
.end method

.method public setDataToView(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 111
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$200(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 112
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->itemView:Landroid/view/View;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v2

    if-ne p2, v2, :cond_0

    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v3, 0x7f0b00f0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 115
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v3, 0x7f0b00f1

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getImageResource()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 119
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->mBase:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result v0

    if-ne p2, v0, :cond_2

    .line 120
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$400(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result p2

    goto :goto_1

    .line 121
    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->access$500(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I

    move-result p2

    .line 119
    :goto_1
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 122
    return-void
.end method
