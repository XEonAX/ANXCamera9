.class Landroid/support/v4/view/ViewConfigurationCompat$HoneycombViewConfigurationVersionImpl;
.super Landroid/support/v4/view/ViewConfigurationCompat$FroyoViewConfigurationVersionImpl;
.source "ViewConfigurationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewConfigurationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HoneycombViewConfigurationVersionImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 63
    invoke-direct {p0}, Landroid/support/v4/view/ViewConfigurationCompat$FroyoViewConfigurationVersionImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public hasPermanentMenuKey(Landroid/view/ViewConfiguration;)Z
    .registers 3
    .param p1, "config"    # Landroid/view/ViewConfiguration;

    .line 67
    const/4 v0, 0x0

    return v0
.end method
