.class public Lcom/android/camera/SceneManager;
.super Ljava/lang/Object;
.source "SceneManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/SceneManager$SceneType;
    }
.end annotation


# static fields
.field public static final SCENE_BURST:I = 0x4

.field public static final SCENE_HDR:I = 0x2

.field public static final SCENE_HHT:I = 0x3

.field public static final SCENE_NORMAL:I = 0x1


# instance fields
.field private mSceneStacks:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    return-void
.end method


# virtual methods
.method public getCurrentScene()I
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    array-length v0, v0

    .line 81
    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 82
    iget-object v0, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0

    .line 84
    :cond_0
    return v1
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/SceneManager;->getCurrentScene()I

    move-result v0

    .line 91
    packed-switch v0, :pswitch_data_0

    .line 97
    const-string v0, ""

    return-object v0

    .line 95
    :pswitch_0
    const-string v0, "_HHT"

    return-object v0

    .line 93
    :pswitch_1
    const-string v0, "_HDR"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public popStacks()I
    .locals 5

    .line 58
    nop

    .line 59
    iget-object v0, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    array-length v0, v0

    .line 68
    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 69
    iget-object v1, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    add-int/lit8 v0, v0, -0x2

    aget v1, v1, v0

    .line 70
    new-array v2, v0, [I

    .line 71
    iget-object v3, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    iput-object v2, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    .line 75
    :cond_0
    return v1
.end method

.method public pushStacks(I)V
    .locals 7

    .line 37
    iget-object v0, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    array-length v0, v0

    .line 38
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lt v0, v2, :cond_1

    .line 39
    move v3, v1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 40
    iget-object v4, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    aget v4, v4, v3

    if-ne v4, p1, :cond_0

    .line 41
    new-array v4, v0, [I

    .line 42
    iget-object v5, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    invoke-static {v5, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    iget-object v1, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    add-int/lit8 v5, v3, 0x1

    sub-int v6, v0, v3

    sub-int/2addr v6, v2

    invoke-static {v1, v5, v4, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    sub-int/2addr v0, v2

    aput p1, v4, v0

    .line 45
    iput-object v4, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    .line 46
    return-void

    .line 39
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 50
    :cond_1
    add-int/lit8 v2, v0, 0x1

    new-array v2, v2, [I

    .line 51
    iget-object v3, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    aput p1, v2, v0

    .line 53
    iput-object v2, p0, Lcom/android/camera/SceneManager;->mSceneStacks:[I

    .line 54
    return-void
.end method
