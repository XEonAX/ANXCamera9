.class Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
.super Ljava/lang/Object;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/DefaultItemAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MoveInfo"
.end annotation


# instance fields
.field public fromX:I

.field public fromY:I

.field public holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field public toX:I

.field public toY:I


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 46
    iput p2, p0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->fromX:I

    .line 47
    iput p3, p0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->fromY:I

    .line 48
    iput p4, p0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->toX:I

    .line 49
    iput p5, p0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->toY:I

    .line 50
    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIIILcom/android/camera/fragment/DefaultItemAnimator$1;)V
    .locals 0

    .line 40
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V

    return-void
.end method
