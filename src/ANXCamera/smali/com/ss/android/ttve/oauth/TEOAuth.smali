.class public Lcom/ss/android/ttve/oauth/TEOAuth;
.super Ljava/lang/Object;
.source "TEOAuth.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 18
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget-object v2, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 26
    const-string v3, "Android"

    .line 27
    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 32
    move-object v0, p1

    move-object v1, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/ss/android/ttve/oauth/TEOAuth;->nativeActivate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    .line 33
    invoke-static {p0}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->from(I)Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object p0

    return-object p0
.end method

.method public static getActivationCode()Ljava/lang/String;
    .locals 1

    .line 37
    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuth;->nativeGetActivationCode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isPermitted()Z
    .locals 1

    .line 41
    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuth;->nativePermitted()Z

    move-result v0

    return v0
.end method

.method private static native nativeActivate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method private static native nativeGetActivationCode()Ljava/lang/String;
.end method

.method private static native nativePermitted()Z
.end method
