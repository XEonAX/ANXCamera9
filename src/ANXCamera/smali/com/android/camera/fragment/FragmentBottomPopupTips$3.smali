.class Lcom/android/camera/fragment/FragmentBottomPopupTips$3;
.super Ljava/lang/Object;
.source "FragmentBottomPopupTips.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

.field final synthetic val$tipDuration:I

.field final synthetic val$tipType:I

.field final synthetic val$tipsResId:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;III)V
    .locals 0

    .line 593
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    iput p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipType:I

    iput p3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipsResId:I

    iput p4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipDuration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 596
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipType:I

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipsResId:I

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->val$tipDuration:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    .line 597
    return-void
.end method
