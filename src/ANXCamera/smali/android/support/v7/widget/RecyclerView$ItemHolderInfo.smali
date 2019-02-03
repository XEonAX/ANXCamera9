.class Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ItemHolderInfo"
.end annotation


# instance fields
.field bottom:I

.field holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field left:I

.field right:I

.field top:I


# direct methods
.method constructor <init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V
    .registers 6
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 10220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10221
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 10222
    iput p2, p0, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    .line 10223
    iput p3, p0, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    .line 10224
    iput p4, p0, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->right:I

    .line 10225
    iput p5, p0, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->bottom:I

    .line 10226
    return-void
.end method
