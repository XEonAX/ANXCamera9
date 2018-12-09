.class Lcom/android/camera/fragment/top/ExpandAdapter$1;
.super Ljava/lang/Object;
.source "ExpandAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/top/ExpandAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/ExpandAdapter;

.field final synthetic val$selectedStr:Ljava/lang/String;

.field final synthetic val$textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/ExpandAdapter;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->this$0:Lcom/android/camera/fragment/top/ExpandAdapter;

    iput-object p2, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$textView:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$selectedStr:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$textView:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$textView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$selectedStr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExpandAdapter$1;->val$textView:Landroid/widget/TextView;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->sendAccessibilityEvent(I)V

    .line 74
    return-void
.end method
