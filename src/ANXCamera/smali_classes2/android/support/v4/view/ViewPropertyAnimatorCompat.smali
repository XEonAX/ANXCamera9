.class public Landroid/support/v4/view/ViewPropertyAnimatorCompat;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$LollipopViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$KitKatViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBMr2ViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;,
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

.field static final LISTENER_TAG_ID:I = 0x7e000000

.field private static final TAG:Ljava/lang/String; = "ViewAnimatorCompat"


# instance fields
.field private mEndAction:Ljava/lang/Runnable;

.field private mOldLayerType:I

.field private mStartAction:Ljava/lang/Runnable;

.field private mView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 645
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 646
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 647
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$LollipopViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$LollipopViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    goto :goto_45

    .line 648
    :cond_e
    const/16 v1, 0x13

    if-lt v0, v1, :cond_1a

    .line 649
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$KitKatViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$KitKatViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    goto :goto_45

    .line 650
    :cond_1a
    const/16 v1, 0x12

    if-lt v0, v1, :cond_26

    .line 651
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBMr2ViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBMr2ViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    goto :goto_45

    .line 652
    :cond_26
    const/16 v1, 0x10

    if-lt v0, v1, :cond_32

    .line 653
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$JBViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    goto :goto_45

    .line 654
    :cond_32
    const/16 v1, 0xe

    if-lt v0, v1, :cond_3e

    .line 655
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    goto :goto_45

    .line 657
    :cond_3e
    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    .line 659
    .end local v0    # "version":I
    :goto_45
    return-void
.end method

.method constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mStartAction:Ljava/lang/Runnable;

    .line 28
    iput-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mEndAction:Ljava/lang/Runnable;

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mOldLayerType:I

    .line 36
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    .line 37
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 24
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mEndAction:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$002(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .line 24
    iput-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mEndAction:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$100(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 24
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mStartAction:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$102(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .line 24
    iput-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mStartAction:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$400(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 24
    iget v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mOldLayerType:I

    return v0
.end method

.method static synthetic access$402(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .param p1, "x1"    # I

    .line 24
    iput p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mOldLayerType:I

    return p1
.end method


# virtual methods
.method public alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 691
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 692
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->alpha(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 694
    :cond_10
    return-object p0
.end method

.method public alphaBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 708
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 709
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->alphaBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 711
    :cond_10
    return-object p0
.end method

.method public cancel()V
    .registers 3

    .line 1048
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1049
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->cancel(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    .line 1051
    :cond_10
    return-void
.end method

.method public getDuration()J
    .registers 5

    .line 795
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_12

    .line 796
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->getDuration(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)J

    move-result-wide v2

    return-wide v2

    .line 798
    :cond_12
    const-wide/16 v2, 0x0

    return-wide v2
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 3

    .line 829
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_12

    .line 830
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->getInterpolator(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)Landroid/view/animation/Interpolator;

    move-result-object v0

    return-object v0

    .line 832
    :cond_12
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStartDelay()J
    .registers 5

    .line 866
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_12

    .line 867
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->getStartDelay(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)J

    move-result-wide v2

    return-wide v2

    .line 869
    :cond_12
    const-wide/16 v2, 0x0

    return-wide v2
.end method

.method public rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 884
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 885
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotation(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 887
    :cond_10
    return-object p0
.end method

.method public rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 901
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 902
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotationBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 904
    :cond_10
    return-object p0
.end method

.method public rotationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 918
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 919
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotationX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 921
    :cond_10
    return-object p0
.end method

.method public rotationXBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 935
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 936
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotationXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 938
    :cond_10
    return-object p0
.end method

.method public rotationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 952
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 953
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotationY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 955
    :cond_10
    return-object p0
.end method

.method public rotationYBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 969
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 970
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->rotationYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 972
    :cond_10
    return-object p0
.end method

.method public scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 986
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 987
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->scaleX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 989
    :cond_10
    return-object p0
.end method

.method public scaleXBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1003
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1004
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->scaleXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1006
    :cond_10
    return-object p0
.end method

.method public scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1020
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1021
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->scaleY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1023
    :cond_10
    return-object p0
.end method

.method public scaleYBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1037
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1038
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->scaleYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1040
    :cond_10
    return-object p0
.end method

.method public setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 5
    .param p1, "value"    # J

    .line 674
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 675
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->setDuration(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;J)V

    .line 677
    :cond_10
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # Landroid/view/animation/Interpolator;

    .line 814
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 815
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->setInterpolator(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/view/animation/Interpolator;)V

    .line 817
    :cond_10
    return-object p0
.end method

.method public setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "listener"    # Landroid/support/v4/view/ViewPropertyAnimatorListener;

    .line 1314
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1315
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    .line 1317
    :cond_10
    return-object p0
.end method

.method public setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 5
    .param p1, "value"    # J

    .line 848
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 849
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->setStartDelay(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;J)V

    .line 851
    :cond_10
    return-object p0
.end method

.method public setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "listener"    # Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    .line 1333
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1334
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)V

    .line 1336
    :cond_10
    return-object p0
.end method

.method public start()V
    .registers 3

    .line 1234
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1235
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->start(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    .line 1237
    :cond_10
    return-void
.end method

.method public translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 725
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 726
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 728
    :cond_10
    return-object p0
.end method

.method public translationXBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1132
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1133
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1135
    :cond_10
    return-object p0
.end method

.method public translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 742
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 743
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 745
    :cond_10
    return-object p0
.end method

.method public translationYBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1149
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1150
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1152
    :cond_10
    return-object p0
.end method

.method public translationZ(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1183
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1184
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationZ(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1186
    :cond_10
    return-object p0
.end method

.method public translationZBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1166
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1167
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->translationZBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1169
    :cond_10
    return-object p0
.end method

.method public withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 777
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 778
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->withEndAction(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 780
    :cond_10
    return-object p0
.end method

.method public withLayer()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 3

    .line 1271
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1272
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->withLayer(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    .line 1274
    :cond_10
    return-object p0
.end method

.method public withStartAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 1296
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1297
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->withStartAction(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1299
    :cond_10
    return-object p0
.end method

.method public x(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1064
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1065
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->x(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1067
    :cond_10
    return-object p0
.end method

.method public xBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1081
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1082
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->xBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1084
    :cond_10
    return-object p0
.end method

.method public y(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1098
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1099
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->y(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1101
    :cond_10
    return-object p0
.end method

.method public yBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1115
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1116
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->yBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1118
    :cond_10
    return-object p0
.end method

.method public z(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1200
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1201
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->z(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1203
    :cond_10
    return-object p0
.end method

.method public zBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4
    .param p1, "value"    # F

    .line 1217
    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v1, v0

    .local v1, "view":Landroid/view/View;
    if-eqz v0, :cond_10

    .line 1218
    sget-object v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->IMPL:Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;

    invoke-interface {v0, p0, v1, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;->zBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V

    .line 1220
    :cond_10
    return-object p0
.end method
