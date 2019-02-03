.class public final Lcom/bytedance/frameworks/baselib/log/LogLib;
.super Ljava/lang/Object;
.source "LogLib.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/baselib/log/LogLib$DefaultLogDelegateImpl;,
        Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;
    }
.end annotation


# static fields
.field public static final CHARSET_NAME:Ljava/lang/String; = "UTF-8"

.field private static sInited:Z

.field private static sLogDelegateImpl:Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    new-instance v0, Lcom/bytedance/frameworks/baselib/log/LogLib$DefaultLogDelegateImpl;

    invoke-direct {v0}, Lcom/bytedance/frameworks/baselib/log/LogLib$DefaultLogDelegateImpl;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/baselib/log/LogLib;->sLogDelegateImpl:Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init(Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;)V
    .locals 1

    .line 32
    sget-boolean v0, Lcom/bytedance/frameworks/baselib/log/LogLib;->sInited:Z

    if-eqz v0, :cond_0

    .line 33
    return-void

    .line 35
    :cond_0
    if-eqz p0, :cond_1

    .line 36
    sput-object p0, Lcom/bytedance/frameworks/baselib/log/LogLib;->sLogDelegateImpl:Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;

    .line 38
    :cond_1
    const/4 p0, 0x1

    sput-boolean p0, Lcom/bytedance/frameworks/baselib/log/LogLib;->sInited:Z

    .line 39
    return-void
.end method

.method static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 1

    .line 42
    sget-object v0, Lcom/bytedance/frameworks/baselib/log/LogLib;->sLogDelegateImpl:Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;

    invoke-interface {v0, p0}, Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static safeGetBytes(Ljava/lang/String;)[B
    .locals 1

    .line 46
    nop

    .line 48
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 49
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    goto :goto_1

    .line 53
    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object p0, v0

    .line 54
    :goto_1
    return-object p0
.end method
