.class Lcom/android/camera/fragment/FragmentFilter$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "FragmentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentFilter;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFilter;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentFilter;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$1;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0

    .line 105
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 106
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$1;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera/fragment/FragmentFilter;->access$002(Lcom/android/camera/fragment/FragmentFilter;Z)Z

    .line 107
    return-void
.end method
