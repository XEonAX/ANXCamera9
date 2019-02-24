.class public Lcom/android/camera/ChangeManager;
.super Ljava/lang/Object;
.source "ChangeManager.java"


# static fields
.field public static final TYPE_CHANGE_LAYOUT_MODE:I = 0x7

.field public static final TYPE_NONE:I = 0x0

.field public static final TYPE_NORMAL:I = 0x1

.field public static final TYPE_RESTORED:I = 0x3


# instance fields
.field private mStatus:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    return-void
.end method


# virtual methods
.method public check(I)Z
    .locals 1

    .line 17
    iget v0, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public clear(I)V
    .locals 1

    .line 21
    iget v0, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    not-int p1, p1

    and-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    .line 22
    return-void
.end method

.method public clearAll()V
    .locals 1

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    .line 26
    return-void
.end method

.method public request(I)V
    .locals 1

    .line 13
    iget v0, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ChangeManager;->mStatus:I

    .line 14
    return-void
.end method
