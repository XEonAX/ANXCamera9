.class public final Landroid/support/test/internal/util/LogUtil;
.super Ljava/lang/Object;
.source "LogUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/test/internal/util/LogUtil$Supplier;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isLoggable(Ljava/lang/String;I)Z
    .locals 2

    .line 69
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x17

    if-le v0, v1, :cond_0

    .line 72
    const/4 v0, 0x0

    const/16 v1, 0x16

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 74
    :cond_0
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method static final synthetic lambda$logDebug$0$LogUtil(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 39
    return-object p0
.end method

.method static final synthetic lambda$logDebugWithProcess$1$LogUtil(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 56
    invoke-static {}, Landroid/support/test/InstrumentationRegistry;->getTargetContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/test/internal/util/ProcessUtil;->getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    add-int/2addr v2, v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v2, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " in "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static varargs logDebug(Ljava/lang/String;Landroid/support/test/internal/util/LogUtil$Supplier;[Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/support/test/internal/util/LogUtil$Supplier<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 43
    const/4 v0, 0x3

    invoke-static {p0, v0}, Landroid/support/test/internal/util/LogUtil;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    invoke-interface {p1}, Landroid/support/test/internal/util/LogUtil$Supplier;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    :cond_0
    return-void
.end method

.method public static varargs logDebug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 39
    new-instance v0, Landroid/support/test/internal/util/LogUtil$$Lambda$0;

    invoke-direct {v0, p1}, Landroid/support/test/internal/util/LogUtil$$Lambda$0;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, p2}, Landroid/support/test/internal/util/LogUtil;->logDebug(Ljava/lang/String;Landroid/support/test/internal/util/LogUtil$Supplier;[Ljava/lang/Object;)V

    .line 40
    return-void
.end method

.method public static varargs logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 54
    new-instance v0, Landroid/support/test/internal/util/LogUtil$$Lambda$1;

    invoke-direct {v0, p1}, Landroid/support/test/internal/util/LogUtil$$Lambda$1;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, p2}, Landroid/support/test/internal/util/LogUtil;->logDebug(Ljava/lang/String;Landroid/support/test/internal/util/LogUtil$Supplier;[Ljava/lang/Object;)V

    .line 58
    return-void
.end method
