.class Lcom/android/camera/fragment/top/ExtraAdapter$1;
.super Ljava/lang/Object;
.source "ExtraAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/top/ExtraAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/ExtraAdapter;

.field final synthetic val$holder:Lcom/android/camera/fragment/CommonRecyclerViewHolder;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/ExtraAdapter;Lcom/android/camera/fragment/CommonRecyclerViewHolder;)V
    .locals 0

    .line 229
    iput-object p1, p0, Lcom/android/camera/fragment/top/ExtraAdapter$1;->this$0:Lcom/android/camera/fragment/top/ExtraAdapter;

    iput-object p2, p0, Lcom/android/camera/fragment/top/ExtraAdapter$1;->val$holder:Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 232
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter$1;->val$holder:Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 233
    return-void
.end method
