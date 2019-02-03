.class public Lcom/ss/android/vesdk/runtime/hardware/MTKKit;
.super Ljava/lang/Object;
.source "MTKKit.java"


# static fields
.field private static sNoZsdPlatforms:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sPlatform:Ljava/lang/String;

.field private static sZsdModeSupport:Z


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sNoZsdPlatforms:Ljava/util/List;

    .line 20
    const-string v0, "android.os.SystemProperties"

    const-string v1, "get"

    const-string v2, "ro.mediatek.platform"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/utils/ReflectUtil;->invokeStatic(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sPlatform:Ljava/lang/String;

    .line 23
    sget-object v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sNoZsdPlatforms:Ljava/util/List;

    const-string v1, "MT6571"

    const-string v2, "MT6595"

    const-string v3, "MT6795"

    const-string v4, "MT6572"

    const-string v5, "MT6752"

    const-string v6, "MT6582"

    const-string v7, "MT6735"

    const-string v8, "MT6592"

    const-string v9, "MT6753"

    const-string v10, "MT6589"

    const-string v11, "MT6755"

    const-string v12, "MT6735m"

    const-string v13, "MT6737T"

    const-string v14, "MT6580"

    const-string v15, "MT6750"

    const-string v16, "MT6750S"

    const-string v17, "MT6737"

    const-string v18, "MT6739"

    const-string v19, "MT6570"

    const-string v20, "MT6761"

    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isMTKPlatform()Z
    .locals 1

    .line 46
    sget-object v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sPlatform:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isSupportZsdMode()Z
    .locals 2

    .line 51
    sget-boolean v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sZsdModeSupport:Z

    if-nez v0, :cond_1

    .line 52
    sget-object v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sNoZsdPlatforms:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 54
    sget-object v1, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sPlatform:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sZsdModeSupport:Z

    .line 56
    :cond_1
    sget-boolean v0, Lcom/ss/android/vesdk/runtime/hardware/MTKKit;->sZsdModeSupport:Z

    return v0
.end method
