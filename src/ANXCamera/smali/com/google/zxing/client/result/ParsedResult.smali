.class public abstract Lcom/google/zxing/client/result/ParsedResult;
.super Ljava/lang/Object;
.source "ParsedResult.java"


# instance fields
.field private final type:Lcom/google/zxing/client/result/ParsedResultType;


# direct methods
.method protected constructor <init>(Lcom/google/zxing/client/result/ParsedResultType;)V
    .registers 2
    .param p1, "type"    # Lcom/google/zxing/client/result/ParsedResultType;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/google/zxing/client/result/ParsedResult;->type:Lcom/google/zxing/client/result/ParsedResultType;

    .line 36
    return-void
.end method

.method public static maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .line 50
    if-eqz p0, :cond_16

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_13

    .line 53
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    :cond_13
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    :cond_16
    return-void
.end method

.method public static maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .registers 5
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .line 60
    if-eqz p0, :cond_f

    .line 61
    array-length v0, p0

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v0, :cond_7

    goto :goto_f

    :cond_7
    aget-object v2, p0, v1

    .line 62
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2, p1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 61
    .end local v2    # "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 65
    :cond_f
    :goto_f
    return-void
.end method


# virtual methods
.method public abstract getDisplayResult()Ljava/lang/String;
.end method

.method public final getType()Lcom/google/zxing/client/result/ParsedResultType;
    .registers 2

    .line 39
    iget-object v0, p0, Lcom/google/zxing/client/result/ParsedResult;->type:Lcom/google/zxing/client/result/ParsedResultType;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .line 46
    invoke-virtual {p0}, Lcom/google/zxing/client/result/ParsedResult;->getDisplayResult()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
