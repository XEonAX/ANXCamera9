.class public final Lcom/google/zxing/client/result/TelParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "TelParsedResult.java"


# instance fields
.field private final number:Ljava/lang/String;

.field private final telURI:Ljava/lang/String;

.field private final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "telURI"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->TEL:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    .line 30
    iput-object p1, p0, Lcom/google/zxing/client/result/TelParsedResult;->number:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/google/zxing/client/result/TelParsedResult;->telURI:Ljava/lang/String;

    .line 32
    iput-object p3, p0, Lcom/google/zxing/client/result/TelParsedResult;->title:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public getDisplayResult()Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 50
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/zxing/client/result/TelParsedResult;->number:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/TelParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 51
    iget-object v1, p0, Lcom/google/zxing/client/result/TelParsedResult;->title:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/TelParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNumber()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/google/zxing/client/result/TelParsedResult;->number:Ljava/lang/String;

    return-object v0
.end method

.method public getTelURI()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/google/zxing/client/result/TelParsedResult;->telURI:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/google/zxing/client/result/TelParsedResult;->title:Ljava/lang/String;

    return-object v0
.end method
