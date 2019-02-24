.class public final enum Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;
.super Ljava/lang/Enum;
.source "MonitorNetUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum MOBILE_2G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum MOBILE_3G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum MOBILE_4G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

.field public static final enum WIFI:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;


# instance fields
.field final nativeInt:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 49
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 50
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "MOBILE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 51
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "MOBILE_2G"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_2G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 52
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "MOBILE_3G"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_3G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 53
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "WIFI"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->WIFI:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 54
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    const-string v1, "MOBILE_4G"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v7}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_4G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    .line 48
    const/4 v0, 0x6

    new-array v0, v0, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v2

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v3

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_2G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v4

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_3G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v5

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->WIFI:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v6

    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_4G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    aput-object v1, v0, v7

    sput-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->$VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 57
    iput p3, p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->nativeInt:I

    .line 58
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;
    .locals 1

    .line 48
    const-class v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0
.end method

.method public static values()[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;
    .locals 1

    .line 48
    sget-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->$VALUES:[Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    invoke-virtual {v0}, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .line 61
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->nativeInt:I

    return v0
.end method
