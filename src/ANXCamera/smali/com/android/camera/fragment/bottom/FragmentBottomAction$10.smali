.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;
.super Landroid/view/animation/DecelerateInterpolator;
.source "FragmentBottomAction.java"


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

    .line 1203
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    iput-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    invoke-direct {p0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 4

    .line 1206
    invoke-super {p0, p1}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result p1

    .line 1207
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v1, :cond_0

    sub-float v1, v3, p1

    goto :goto_0

    .line 1208
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    .line 1207
    move v1, p1

    goto :goto_0

    .line 1208
    :cond_1
    nop

    .line 1207
    move v1, v3

    :goto_0
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1209
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1210
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v1, :cond_2

    sub-float v1, v3, p1

    goto :goto_1

    .line 1211
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_3

    .line 1210
    move v1, p1

    goto :goto_1

    .line 1211
    :cond_3
    nop

    .line 1210
    move v1, v3

    :goto_1
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1213
    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v1, :cond_5

    sub-float v1, v3, p1

    goto :goto_2

    .line 1214
    :cond_5
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_6

    .line 1213
    move v1, p1

    goto :goto_2

    .line 1214
    :cond_6
    nop

    .line 1213
    move v1, v3

    :goto_2
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1216
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1217
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v1, :cond_7

    move v1, p1

    goto :goto_3

    :cond_7
    sub-float v1, v3, p1

    :goto_3
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1220
    :cond_8
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1221
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v1, :cond_9

    move v1, p1

    goto :goto_4

    :cond_9
    sub-float v1, v3, p1

    :goto_4
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1224
    :cond_a
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1225
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;->val$start:Z

    if-eqz v1, :cond_b

    move v1, p1

    goto :goto_5

    :cond_b
    sub-float v1, v3, p1

    :goto_5
    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1230
    :cond_c
    return p1
.end method
