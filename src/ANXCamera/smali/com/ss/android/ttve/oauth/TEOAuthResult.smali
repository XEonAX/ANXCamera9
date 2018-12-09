.class public final enum Lcom/ss/android/ttve/oauth/TEOAuthResult;
.super Ljava/lang/Enum;
.source "TEOAuthResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/ttve/oauth/TEOAuthResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field public static final enum EXPIRED:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field public static final enum FAIL:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field public static final enum NOT_MATCH:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field public static final enum OK:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field public static final enum TBD:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field private static valueMaps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/ss/android/ttve/oauth/TEOAuthResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private ordinal:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 12
    new-instance v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/ss/android/ttve/oauth/TEOAuthResult;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->OK:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 13
    new-instance v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    const-string v1, "TBD"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/ss/android/ttve/oauth/TEOAuthResult;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->TBD:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 14
    new-instance v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    const-string v1, "EXPIRED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/ss/android/ttve/oauth/TEOAuthResult;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->EXPIRED:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 15
    new-instance v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    const-string v1, "FAIL"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/ss/android/ttve/oauth/TEOAuthResult;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->FAIL:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 16
    new-instance v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    const-string v1, "NOT_MATCH"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/ss/android/ttve/oauth/TEOAuthResult;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->NOT_MATCH:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 11
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/ss/android/ttve/oauth/TEOAuthResult;

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->OK:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->TBD:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->EXPIRED:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->FAIL:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->NOT_MATCH:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    aput-object v1, v0, v6

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->$VALUES:[Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->valueMaps:Ljava/util/Map;

    .line 27
    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->values()[Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 28
    sget-object v4, Lcom/ss/android/ttve/oauth/TEOAuthResult;->valueMaps:Ljava/util/Map;

    iget v5, v3, Lcom/ss/android/ttve/oauth/TEOAuthResult;->ordinal:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 21
    iput p3, p0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->ordinal:I

    .line 22
    return-void
.end method

.method public static from(I)Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 2

    .line 33
    sget-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->valueMaps:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    sget-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->valueMaps:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    return-object p0

    .line 36
    :cond_0
    sget-object p0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->FAIL:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 1

    .line 11
    const-class v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ttve/oauth/TEOAuthResult;

    return-object p0
.end method

.method public static values()[Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 1

    .line 11
    sget-object v0, Lcom/ss/android/ttve/oauth/TEOAuthResult;->$VALUES:[Lcom/ss/android/ttve/oauth/TEOAuthResult;

    invoke-virtual {v0}, [Lcom/ss/android/ttve/oauth/TEOAuthResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ss/android/ttve/oauth/TEOAuthResult;

    return-object v0
.end method
