.class Lcom/android/camera/fragment/BaseFragmentDelegate$2;
.super Ljava/lang/Object;
.source "BaseFragmentDelegate.java"

# interfaces
.implements Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/BaseFragmentDelegate;->bindLifeCircle(Landroid/support/v4/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 773
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLifeAlive()V
    .locals 0

    .line 788
    return-void
.end method

.method public onLifeDestroy(Ljava/lang/String;)V
    .locals 0

    .line 798
    return-void
.end method

.method public onLifeStart(Ljava/lang/String;)V
    .locals 0

    .line 783
    return-void
.end method

.method public onLifeStop(Ljava/lang/String;)V
    .locals 0

    .line 793
    return-void
.end method

.method public setBlockingLifeCycles(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 778
    return-void
.end method
