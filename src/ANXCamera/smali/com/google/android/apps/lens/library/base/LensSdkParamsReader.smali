.class public Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;
.super Ljava/lang/Object;
.source "LensSdkParamsReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;,
        Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;
    }
.end annotation


# static fields
.field public static final AGSA_AUTHORITY:Ljava/lang/String; = "com.google.android.googlequicksearchbox.GsaPublicContentProvider"

.field private static final DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

.field public static final LENS_AR_STICKERS_ACTIVITY:Ljava/lang/String; = "com.google.vr.apps.ornament.app.MainActivity"

.field public static final LENS_AR_STICKERS_PACKAGE:Ljava/lang/String; = "com.google.ar.lens"

.field public static final LENS_AVAILABILITY_PROVIDER_URI:Ljava/lang/String;

.field private static final LENS_SDK_VERSION:Ljava/lang/String; = "0.1.0"

.field private static final MIN_AR_CORE_VERSION:I = 0x18

.field private static final TAG:Ljava/lang/String; = "LensSdkParamsReader"


# instance fields
.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

.field private lensSdkParamsReady:Z

.field private final packageManager:Landroid/content/pm/PackageManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 28
    const-string v0, "content://%s/publicvalue/lens_oem_availability"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "com.google.android.googlequicksearchbox.GsaPublicContentProvider"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->LENS_AVAILABILITY_PROVIDER_URI:Ljava/lang/String;

    .line 33
    new-instance v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-direct {v0}, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;-><init>()V

    sput-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    .line 99
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const-string v1, "0.1.0"

    iput-object v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensSdkVersion:Ljava/lang/String;

    .line 100
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const-string v1, ""

    iput-object v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->agsaVersionName:Ljava/lang/String;

    .line 101
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const/4 v1, -0x1

    iput v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus:I

    .line 102
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iput v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;-><init>(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    .line 42
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/content/pm/PackageManager;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/pm/PackageManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    .line 47
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->context:Landroid/content/Context;

    .line 48
    iput-object p2, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    .line 49
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->updateParams()V

    .line 50
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Landroid/content/Context;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method static synthetic access$302(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Z)Z
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Ljava/util/List;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    return-object p0
.end method

.method private updateParams()V
    .locals 4

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    .line 74
    sget-object v1, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v1}, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->clone()Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    .line 77
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    const-string v2, "com.google.android.googlequicksearchbox"

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 78
    if-eqz v1, :cond_0

    .line 79
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v1, v2, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->agsaVersionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :cond_0
    goto :goto_0

    .line 81
    :catch_0
    move-exception v1

    .line 82
    const-string v1, "LensSdkParamsReader"

    const-string v2, "Unable to find agsa package: com.google.android.googlequicksearchbox"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :goto_0
    iget-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const/4 v2, 0x1

    iput v2, v1, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    .line 86
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    .line 87
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 88
    const-string v2, "com.google.ar.lens"

    const-string v3, "com.google.vr.apps.ornament.app.MainActivity"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v1, v0}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 90
    iget-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iput v0, v1, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    .line 94
    :cond_1
    new-instance v1, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;-><init>(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$1;)V

    .line 95
    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 96
    return-void
.end method


# virtual methods
.method public getAgsaVersionName()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget-object v0, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->agsaVersionName:Ljava/lang/String;

    return-object v0
.end method

.method public getArStickersAvailability()I
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget v0, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    return v0
.end method

.method public getLensSdkVersion()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget-object v0, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensSdkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getParams(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;)V
    .locals 1
    .param p1    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 65
    iget-boolean v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-interface {p1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;->onLensSdkParamsAvailable(Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;)V

    goto :goto_0

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    :goto_0
    return-void
.end method
