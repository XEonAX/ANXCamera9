.class Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;
.super Landroid/support/v4/hardware/display/DisplayManagerCompat;
.source "DisplayManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/hardware/display/DisplayManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LegacyImpl"
.end annotation


# instance fields
.field private final mWindowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .line 108
    invoke-direct {p0}, Landroid/support/v4/hardware/display/DisplayManagerCompat;-><init>()V

    .line 109
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;->mWindowManager:Landroid/view/WindowManager;

    .line 110
    return-void
.end method


# virtual methods
.method public getDisplay(I)Landroid/view/Display;
    .registers 4
    .param p1, "displayId"    # I

    .line 114
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 115
    .local v0, "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    move-result v1

    if-ne v1, p1, :cond_d

    .line 116
    return-object v0

    .line 118
    :cond_d
    const/4 v1, 0x0

    return-object v1
.end method

.method public getDisplays()[Landroid/view/Display;
    .registers 4

    .line 123
    const/4 v0, 0x1

    new-array v0, v0, [Landroid/view/Display;

    iget-object v1, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    return-object v0
.end method

.method public getDisplays(Ljava/lang/String;)[Landroid/view/Display;
    .registers 3
    .param p1, "category"    # Ljava/lang/String;

    .line 128
    if-nez p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;->getDisplays()[Landroid/view/Display;

    move-result-object v0

    goto :goto_a

    :cond_7
    const/4 v0, 0x0

    new-array v0, v0, [Landroid/view/Display;

    :goto_a
    return-object v0
.end method
