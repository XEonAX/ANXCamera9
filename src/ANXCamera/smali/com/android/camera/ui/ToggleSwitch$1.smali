.class Lcom/android/camera/ui/ToggleSwitch$1;
.super Ljava/lang/Object;
.source "ToggleSwitch.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/ToggleSwitch;->animateToCheckedState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/ToggleSwitch;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/ToggleSwitch;)V
    .locals 0

    .line 446
    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 449
    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {v0, p1}, Lcom/android/camera/ui/ToggleSwitch;->access$002(Lcom/android/camera/ui/ToggleSwitch;F)F

    .line 450
    iget-object p1, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p1}, Lcom/android/camera/ui/ToggleSwitch;->invalidate()V

    .line 451
    return-void
.end method
