.class public Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;
.super Landroid/support/v4/app/Fragment;
.source "BaseLifeCircleBindFragment.java"


# static fields
.field public static final FRAGMENT_TAG:Ljava/lang/String; = "com.android.camera.bind"


# instance fields
.field private final mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    new-instance v0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    invoke-direct {v0}, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;-><init>()V

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;-><init>(Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ValidFragment"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;->mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    .line 24
    return-void
.end method


# virtual methods
.method public getLifecycle()Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;->mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .line 44
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 45
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;->mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    const-string v1, "com.android.camera.bind"

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->onDestroy(Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 32
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 33
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;->mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    const-string v1, "com.android.camera.bind"

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->onStart(Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 38
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 39
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseLifeCircleBindFragment;->mLifecycle:Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;

    const-string v1, "com.android.camera.bind"

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->onStop(Ljava/lang/String;)V

    .line 40
    return-void
.end method
