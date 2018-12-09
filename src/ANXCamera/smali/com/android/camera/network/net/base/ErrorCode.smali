.class public final enum Lcom/android/camera/network/net/base/ErrorCode;
.super Ljava/lang/Enum;
.source "ErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/camera/network/net/base/ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum DATA_BIND_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum HANDLE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum NET_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

.field public static final enum SUCCESS:Lcom/android/camera/network/net/base/ErrorCode;


# instance fields
.field public CODE:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->SUCCESS:Lcom/android/camera/network/net/base/ErrorCode;

    .line 8
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "PARSE_ERROR"

    const/4 v3, 0x1

    const/4 v4, -0x1

    invoke-direct {v0, v1, v3, v4}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    .line 12
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "NET_ERROR"

    const/4 v4, 0x2

    const/4 v5, -0x2

    invoke-direct {v0, v1, v4, v5}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NET_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    .line 16
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "HANDLE_ERROR"

    const/4 v5, 0x3

    const/4 v6, -0x3

    invoke-direct {v0, v1, v5, v6}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->HANDLE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    .line 20
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "BODY_EMPTY"

    const/4 v6, 0x4

    const/4 v7, -0x4

    invoke-direct {v0, v1, v6, v7}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    .line 24
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "DATA_BIND_ERROR"

    const/4 v7, 0x5

    const/4 v8, -0x5

    invoke-direct {v0, v1, v7, v8}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->DATA_BIND_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    .line 28
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "SERVER_ERROR"

    const/4 v8, 0x6

    const/4 v9, -0x6

    invoke-direct {v0, v1, v8, v9}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    .line 32
    new-instance v0, Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "NETWORK_NOT_CONNECTED"

    const/4 v9, 0x7

    const/4 v10, -0x7

    invoke-direct {v0, v1, v9, v10}, Lcom/android/camera/network/net/base/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

    .line 3
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/android/camera/network/net/base/ErrorCode;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SUCCESS:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->NET_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->HANDLE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->DATA_BIND_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v8

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

    aput-object v1, v0, v9

    sput-object v0, Lcom/android/camera/network/net/base/ErrorCode;->$VALUES:[Lcom/android/camera/network/net/base/ErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    iput p3, p0, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    .line 38
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/camera/network/net/base/ErrorCode;
    .locals 1

    .line 3
    const-class v0, Lcom/android/camera/network/net/base/ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/camera/network/net/base/ErrorCode;

    return-object p0
.end method

.method public static values()[Lcom/android/camera/network/net/base/ErrorCode;
    .locals 1

    .line 3
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->$VALUES:[Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {v0}, [Lcom/android/camera/network/net/base/ErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/camera/network/net/base/ErrorCode;

    return-object v0
.end method
