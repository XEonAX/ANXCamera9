.class public final Lcom/google/zxing/client/result/WifiResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "WifiResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/WifiResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;

    move-result-object p1

    return-object p1
.end method

.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;
    .locals 7
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 35
    invoke-static {p1}, Lcom/google/zxing/client/result/WifiResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "rawText":Ljava/lang/String;
    const-string v1, "WIFI:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 37
    return-object v2

    .line 39
    :cond_0
    const-string v1, "S:"

    const/4 v3, 0x0

    const/16 v4, 0x3b

    invoke-static {v1, v0, v4, v3}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "ssid":Ljava/lang/String;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_0

    .line 43
    :cond_1
    const-string v2, "P:"

    invoke-static {v2, v0, v4, v3}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "pass":Ljava/lang/String;
    const-string v5, "T:"

    invoke-static {v5, v0, v4, v3}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v5

    .line 45
    .local v5, "type":Ljava/lang/String;
    if-nez v5, :cond_2

    .line 46
    const-string v5, "nopass"

    .line 48
    :cond_2
    const-string v6, "H:"

    invoke-static {v6, v0, v4, v3}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 49
    .local v3, "hidden":Z
    new-instance v4, Lcom/google/zxing/client/result/WifiParsedResult;

    invoke-direct {v4, v5, v1, v2, v3}, Lcom/google/zxing/client/result/WifiParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v4

    .line 41
    .end local v2    # "pass":Ljava/lang/String;
    .end local v3    # "hidden":Z
    .end local v5    # "type":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v2
.end method
