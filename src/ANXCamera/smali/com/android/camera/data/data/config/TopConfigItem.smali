.class public Lcom/android/camera/data/data/config/TopConfigItem;
.super Ljava/lang/Object;
.source "TopConfigItem.java"


# instance fields
.field public bindViewPosition:I

.field public configItem:I

.field public enable:Z

.field public gravity:I

.field public index:I

.field public margin:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 24
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 25
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 28
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 29
    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 30
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 33
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    .line 34
    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 35
    iput p3, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 36
    return-void
.end method
