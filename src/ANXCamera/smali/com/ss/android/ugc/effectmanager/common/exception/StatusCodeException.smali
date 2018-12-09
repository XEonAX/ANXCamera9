.class public Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;
.super Ljava/lang/Exception;
.source "StatusCodeException.java"


# instance fields
.field private mStatusCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;->mStatusCode:I

    .line 15
    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    .line 18
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;->mStatusCode:I

    return v0
.end method

.method public setStatusCode(I)V
    .locals 0

    .line 22
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;->mStatusCode:I

    .line 23
    return-void
.end method
