.class public final enum Lmiui/external/SdkConstants$SdkError;
.super Ljava/lang/Enum;
.source "SdkConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/external/SdkConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SdkError"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lmiui/external/SdkConstants$SdkError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lmiui/external/SdkConstants$SdkError;

.field public static final enum GENERIC:Lmiui/external/SdkConstants$SdkError;

.field public static final INTENT_EXTRA_KEY:Ljava/lang/String; = "com.miui.sdk.error"

.field public static final enum LOW_SDK_VERSION:Lmiui/external/SdkConstants$SdkError;

.field public static final enum NO_SDK:Lmiui/external/SdkConstants$SdkError;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 22
    new-instance v0, Lmiui/external/SdkConstants$SdkError;

    const-string v1, "GENERIC"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lmiui/external/SdkConstants$SdkError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmiui/external/SdkConstants$SdkError;->GENERIC:Lmiui/external/SdkConstants$SdkError;

    new-instance v0, Lmiui/external/SdkConstants$SdkError;

    const-string v1, "NO_SDK"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lmiui/external/SdkConstants$SdkError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmiui/external/SdkConstants$SdkError;->NO_SDK:Lmiui/external/SdkConstants$SdkError;

    new-instance v0, Lmiui/external/SdkConstants$SdkError;

    const-string v1, "LOW_SDK_VERSION"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lmiui/external/SdkConstants$SdkError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmiui/external/SdkConstants$SdkError;->LOW_SDK_VERSION:Lmiui/external/SdkConstants$SdkError;

    .line 21
    const/4 v0, 0x3

    new-array v0, v0, [Lmiui/external/SdkConstants$SdkError;

    sget-object v1, Lmiui/external/SdkConstants$SdkError;->GENERIC:Lmiui/external/SdkConstants$SdkError;

    aput-object v1, v0, v2

    sget-object v1, Lmiui/external/SdkConstants$SdkError;->NO_SDK:Lmiui/external/SdkConstants$SdkError;

    aput-object v1, v0, v3

    sget-object v1, Lmiui/external/SdkConstants$SdkError;->LOW_SDK_VERSION:Lmiui/external/SdkConstants$SdkError;

    aput-object v1, v0, v4

    sput-object v0, Lmiui/external/SdkConstants$SdkError;->$VALUES:[Lmiui/external/SdkConstants$SdkError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmiui/external/SdkConstants$SdkError;
    .locals 1

    .line 21
    const-class v0, Lmiui/external/SdkConstants$SdkError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmiui/external/SdkConstants$SdkError;

    return-object p0
.end method

.method public static values()[Lmiui/external/SdkConstants$SdkError;
    .locals 1

    .line 21
    sget-object v0, Lmiui/external/SdkConstants$SdkError;->$VALUES:[Lmiui/external/SdkConstants$SdkError;

    invoke-virtual {v0}, [Lmiui/external/SdkConstants$SdkError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmiui/external/SdkConstants$SdkError;

    return-object v0
.end method
