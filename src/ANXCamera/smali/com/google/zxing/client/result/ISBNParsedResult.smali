.class public final Lcom/google/zxing/client/result/ISBNParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "ISBNParsedResult.java"


# instance fields
.field private final isbn:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "isbn"    # Ljava/lang/String;

    .line 27
    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->ISBN:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    .line 28
    iput-object p1, p0, Lcom/google/zxing/client/result/ISBNParsedResult;->isbn:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public getDisplayResult()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/google/zxing/client/result/ISBNParsedResult;->isbn:Ljava/lang/String;

    return-object v0
.end method

.method public getISBN()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/google/zxing/client/result/ISBNParsedResult;->isbn:Ljava/lang/String;

    return-object v0
.end method
