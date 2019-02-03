.class public final enum Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;
.super Ljava/lang/Enum;
.source "MonitorNetUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CompressType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

.field public static final enum DEFLATER:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

.field public static final enum GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

.field public static final enum NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;


# instance fields
.field final nativeInt:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 37
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    .line 38
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    const-string v1, "GZIP"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    .line 39
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    const-string v1, "DEFLATER"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->DEFLATER:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    .line 36
    const/4 v0, 0x3

    new-array v0, v0, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    aput-object v1, v0, v2

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    aput-object v1, v0, v3

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->DEFLATER:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    aput-object v1, v0, v4

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->$VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 42
    iput p3, p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->nativeInt:I

    .line 43
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;
    .locals 1

    .line 36
    const-class v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    return-object p0
.end method

.method public static values()[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;
    .locals 1

    .line 36
    sget-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->$VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    invoke-virtual {v0}, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    return-object v0
.end method
