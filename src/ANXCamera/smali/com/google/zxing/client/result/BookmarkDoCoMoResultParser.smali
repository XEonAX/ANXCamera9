.class public final Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "BookmarkDoCoMoResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;

    move-result-object p1

    return-object p1
.end method

.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    .locals 6
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 28
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "rawText":Ljava/lang/String;
    const-string v1, "MEBKM:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 30
    return-object v2

    .line 32
    :cond_0
    const-string v1, "TITLE:"

    const/4 v3, 0x1

    invoke-static {v1, v0, v3}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "title":Ljava/lang/String;
    const-string v4, "URL:"

    invoke-static {v4, v0, v3}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v3

    .line 34
    .local v3, "rawUri":[Ljava/lang/String;
    if-nez v3, :cond_1

    .line 35
    return-object v2

    .line 37
    :cond_1
    const/4 v4, 0x0

    aget-object v4, v3, v4

    .line 38
    .local v4, "uri":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/zxing/client/result/URIResultParser;->isBasicallyValidURI(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    new-instance v2, Lcom/google/zxing/client/result/URIParsedResult;

    invoke-direct {v2, v4, v1}, Lcom/google/zxing/client/result/URIParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    nop

    :cond_2
    return-object v2
.end method
