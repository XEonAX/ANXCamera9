.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;
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

    .line 1270
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    iput-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1308
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1284
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->canProvide()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1285
    return-void

    .line 1287
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_2

    .line 1288
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    if-eqz v2, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    move v2, v1

    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1290
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1291
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1293
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    if-nez p1, :cond_5

    .line 1294
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1296
    :cond_5
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    if-eqz p1, :cond_7

    .line 1297
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1298
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1299
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1301
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1303
    :cond_7
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1313
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1273
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->val$start:Z

    if-nez p1, :cond_1

    .line 1274
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1275
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1277
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1278
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1280
    :cond_1
    return-void
.end method
