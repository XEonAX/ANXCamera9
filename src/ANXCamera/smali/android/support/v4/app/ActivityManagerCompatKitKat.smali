.class Landroid/support/v4/app/ActivityManagerCompatKitKat;
.super Ljava/lang/Object;
.source "ActivityManagerCompatKitKat.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isLowRamDevice(Landroid/app/ActivityManager;)Z
    .registers 2
    .param p0, "am"    # Landroid/app/ActivityManager;

    .line 23
    invoke-virtual {p0}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v0

    return v0
.end method
