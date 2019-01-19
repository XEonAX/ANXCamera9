.class public Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigUltraPixel.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCloseTipString:Ljava/lang/String;

.field private mMenuDrawable:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field private mMenuString:Ljava/lang/String;

.field private mOpenTipString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 19
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mOpenTipString:Ljava/lang/String;

    .line 20
    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mCloseTipString:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuString:Ljava/lang/String;

    .line 22
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuDrawable:I

    .line 26
    return-void
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 41
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 30
    const/4 v0, 0x0

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 46
    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 35
    const/4 p1, 0x0

    return-object p1
.end method

.method public getMenuDrawable()I
    .locals 1
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 81
    iget v0, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuDrawable:I

    return v0
.end method

.method public getMenuString()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuString:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraPixelCloseTip()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mCloseTipString:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraPixelOpenTip()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mOpenTipString:Ljava/lang/String;

    return-object v0
.end method

.method public initUltraPixelResource(I)V
    .locals 3

    .line 50
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 51
    const v1, 0x1ec7b00

    if-eq p1, v1, :cond_1

    const v1, 0x2dc6c00

    if-eq p1, v1, :cond_0

    .line 67
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ultra pixel size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 60
    :cond_0
    const p1, 0x7f020122

    iput p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuDrawable:I

    .line 61
    const p1, 0x7f090253

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mOpenTipString:Ljava/lang/String;

    .line 62
    const p1, 0x7f090254

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mCloseTipString:Ljava/lang/String;

    .line 63
    const p1, 0x7f090264

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuString:Ljava/lang/String;

    .line 64
    goto :goto_0

    .line 53
    :cond_1
    const p1, 0x7f020121

    iput p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuDrawable:I

    .line 54
    const p1, 0x7f09027a

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mOpenTipString:Ljava/lang/String;

    .line 55
    const p1, 0x7f09027b

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mCloseTipString:Ljava/lang/String;

    .line 56
    const p1, 0x7f090279

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->mMenuString:Ljava/lang/String;

    .line 57
    nop

    .line 70
    :goto_0
    return-void
.end method
