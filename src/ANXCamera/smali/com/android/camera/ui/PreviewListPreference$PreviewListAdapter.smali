.class Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;
.super Ljava/lang/Object;
.source "PreviewListPreference.java"

# interfaces
.implements Landroid/widget/ListAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/PreviewListPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewListAdapter"
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mPaddingEnd:I

.field final synthetic this$0:Lcom/android/camera/ui/PreviewListPreference;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/PreviewListPreference;Landroid/widget/ListAdapter;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->this$0:Lcom/android/camera/ui/PreviewListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p2, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    .line 168
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 202
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 203
    iget p2, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mPaddingEnd:I

    if-nez p2, :cond_0

    .line 204
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingEnd()I

    move-result p2

    iget-object p3, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->this$0:Lcom/android/camera/ui/PreviewListPreference;

    invoke-static {p3}, Lcom/android/camera/ui/PreviewListPreference;->access$000(Lcom/android/camera/ui/PreviewListPreference;)I

    move-result p3

    add-int/2addr p2, p3

    iput p2, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mPaddingEnd:I

    .line 206
    :cond_0
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 207
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingStart()I

    move-result p2

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingTop()I

    move-result p3

    iget v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mPaddingEnd:I

    .line 208
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v1

    .line 207
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 209
    return-object p1
.end method

.method public getViewTypeCount()I
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p1

    return p1
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 173
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 178
    return-void
.end method
