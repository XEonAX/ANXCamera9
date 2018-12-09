.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

.field final synthetic val$start:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V
    .locals 0

    .line 1306
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    iput-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1344
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1320
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->canProvide()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1321
    return-void

    .line 1323
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_2

    .line 1324
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v2, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    move v2, v1

    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1326
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1327
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1329
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-nez p1, :cond_5

    .line 1330
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1332
    :cond_5
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz p1, :cond_7

    .line 1333
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1334
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1335
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1337
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1339
    :cond_7
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1349
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1309
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-nez p1, :cond_1

    .line 1310
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1311
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1313
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1314
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1316
    :cond_1
    return-void
.end method
