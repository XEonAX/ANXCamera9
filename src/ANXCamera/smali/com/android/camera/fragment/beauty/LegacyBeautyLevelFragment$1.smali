.class Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment$1;
.super Ljava/lang/Object;
.source "LegacyBeautyLevelFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;->onLevelClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 43
    return-void
.end method
