.class public Lcom/ss/android/ttve/common/TELogUtil;
.super Ljava/lang/Object;
.source "TELogUtil.java"


# static fields
.field private static APPNAME:Ljava/lang/String;

.field private static DEBUG_LEVEL:B

.field public static DEBUG_LEVEL_D:B

.field public static DEBUG_LEVEL_E:B

.field public static DEBUG_LEVEL_I:B

.field public static DEBUG_LEVEL_N:B

.field public static DEBUG_LEVEL_V:B

.field public static DEBUG_LEVEL_W:B

.field private static LOGD:B

.field private static LOGE:B

.field private static LOGI:B

.field private static LOGV:B

.field private static LOGW:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 23
    const-string v0, "VE-"

    sput-object v0, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    .line 25
    const/4 v0, 0x1

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGE:B

    .line 26
    const/4 v1, 0x2

    sput-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->LOGW:B

    .line 27
    const/4 v1, 0x4

    sput-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->LOGI:B

    .line 28
    const/16 v1, 0x8

    sput-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->LOGD:B

    .line 29
    const/16 v1, 0x10

    sput-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->LOGV:B

    .line 37
    const/4 v1, 0x0

    sput-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_N:B

    .line 38
    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_E:B

    .line 39
    const/4 v0, 0x3

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_W:B

    .line 40
    const/4 v0, 0x7

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_I:B

    .line 41
    const/16 v0, 0xf

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_D:B

    .line 42
    const/16 v0, 0x1f

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL_V:B

    .line 44
    const/4 v0, -0x1

    sput-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 108
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGD:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 110
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 66
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGD:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 68
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 129
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGE:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 131
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 136
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGE:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 138
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 140
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 87
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGE:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 89
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 59
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGI:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 61
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_0
    return-void
.end method

.method public static setUp(Ljava/lang/String;B)V
    .locals 1

    .line 47
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    .line 49
    :cond_0
    sput-byte p1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    .line 50
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 101
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGV:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 103
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 94
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGV:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 96
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 115
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGW:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 117
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 122
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGW:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 124
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 126
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 73
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGW:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 75
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 80
    sget-byte v0, Lcom/ss/android/ttve/common/TELogUtil;->LOGW:B

    sget-byte v1, Lcom/ss/android/ttve/common/TELogUtil;->DEBUG_LEVEL:B

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ss/android/ttve/common/TELogUtil;->APPNAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 82
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    :cond_0
    return-void
.end method
