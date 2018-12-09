.class public Lcom/android/camera/data/data/config/TopConfigItem;
.super Ljava/lang/Object;
.source "TopConfigItem.java"


# instance fields
.field public bindViewPosition:I

.field public configItem:I

.field public enable:Z

.field public gravity:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/16 v0, 0xc6

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 9
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 13
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 14
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/16 v0, 0xc6

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 9
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 17
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 18
    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 19
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/16 v0, 0xc6

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 9
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 22
    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    .line 23
    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 24
    iput p3, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    .line 25
    return-void
.end method
