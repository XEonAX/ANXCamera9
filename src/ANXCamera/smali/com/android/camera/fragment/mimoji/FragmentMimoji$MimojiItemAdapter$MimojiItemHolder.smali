.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;
.super Lcom/android/camera/fragment/CommonRecyclerViewHolder;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MimojiItemHolder"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getAdapterPosition()I

    move-result v6

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$100(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)I

    move-result v0

    if-ne v6, v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$100(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)I

    move-result v7

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0, v6}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$102(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getItemId()J

    move-result-wide v4

    move-object v2, p1

    move v3, v6

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setLongSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, v6}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getAdapterPosition()I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$202(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$102(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setLongSelectIndex(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectIndex(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$400(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)V

    const/4 p1, 0x0

    return p1
.end method
