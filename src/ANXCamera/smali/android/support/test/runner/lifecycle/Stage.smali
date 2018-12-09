.class public final enum Landroid/support/test/runner/lifecycle/Stage;
.super Ljava/lang/Enum;
.source "Stage.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/support/test/runner/lifecycle/Stage;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum CREATED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum DESTROYED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum PAUSED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum PRE_ON_CREATE:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum RESTARTED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum RESUMED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum STARTED:Landroid/support/test/runner/lifecycle/Stage;

.field public static final enum STOPPED:Landroid/support/test/runner/lifecycle/Stage;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 26
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "PRE_ON_CREATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->PRE_ON_CREATE:Landroid/support/test/runner/lifecycle/Stage;

    .line 28
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "CREATED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->CREATED:Landroid/support/test/runner/lifecycle/Stage;

    .line 30
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "STARTED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->STARTED:Landroid/support/test/runner/lifecycle/Stage;

    .line 32
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "RESUMED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->RESUMED:Landroid/support/test/runner/lifecycle/Stage;

    .line 34
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "PAUSED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->PAUSED:Landroid/support/test/runner/lifecycle/Stage;

    .line 36
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "STOPPED"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->STOPPED:Landroid/support/test/runner/lifecycle/Stage;

    .line 38
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "RESTARTED"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->RESTARTED:Landroid/support/test/runner/lifecycle/Stage;

    .line 40
    new-instance v0, Landroid/support/test/runner/lifecycle/Stage;

    const-string v1, "DESTROYED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Landroid/support/test/runner/lifecycle/Stage;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->DESTROYED:Landroid/support/test/runner/lifecycle/Stage;

    .line 24
    const/16 v0, 0x8

    new-array v0, v0, [Landroid/support/test/runner/lifecycle/Stage;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->PRE_ON_CREATE:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v2

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->CREATED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v3

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->STARTED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v4

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->RESUMED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v5

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->PAUSED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v6

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->STOPPED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v7

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->RESTARTED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v8

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->DESTROYED:Landroid/support/test/runner/lifecycle/Stage;

    aput-object v1, v0, v9

    sput-object v0, Landroid/support/test/runner/lifecycle/Stage;->$VALUES:[Landroid/support/test/runner/lifecycle/Stage;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/support/test/runner/lifecycle/Stage;
    .locals 1

    .line 24
    const-class v0, Landroid/support/test/runner/lifecycle/Stage;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/support/test/runner/lifecycle/Stage;

    return-object p0
.end method

.method public static values()[Landroid/support/test/runner/lifecycle/Stage;
    .locals 1

    .line 24
    sget-object v0, Landroid/support/test/runner/lifecycle/Stage;->$VALUES:[Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0}, [Landroid/support/test/runner/lifecycle/Stage;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/test/runner/lifecycle/Stage;

    return-object v0
.end method
