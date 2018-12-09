.class public Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
.super Ljava/lang/Object;
.source "ExceptionResult.java"


# instance fields
.field private errorCode:I

.field private exception:Ljava/lang/Exception;

.field private msg:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 56
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 57
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/ErrorConstants;->APIErrorHandle(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    .line 58
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    .line 59
    return-void
.end method

.method public constructor <init>(ILjava/lang/Exception;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 50
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 51
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/ErrorConstants;->APIErrorHandle(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 2

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 62
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    .line 63
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/common/model/NetException;

    if-eqz v0, :cond_0

    .line 64
    move-object v0, p1

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/model/NetException;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/common/model/NetException;->getStatus_code()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 65
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto/16 :goto_1

    .line 66
    :cond_0
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    if-eqz v0, :cond_1

    .line 67
    move-object v0, p1

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;->getStatusCode()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 68
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto/16 :goto_1

    .line 69
    :cond_1
    instance-of v0, p1, Lorg/json/JSONException;

    if-eqz v0, :cond_2

    .line 70
    const/16 v0, 0x2718

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 71
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 72
    :cond_2
    instance-of v0, p1, Landroid/accounts/NetworkErrorException;

    if-eqz v0, :cond_3

    .line 73
    const/16 v0, 0x2712

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 74
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 75
    :cond_3
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/common/exception/UnzipException;

    if-eqz v0, :cond_4

    .line 76
    const/16 v0, 0x271d

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 77
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 78
    :cond_4
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/common/exception/MD5Exception;

    if-eqz v0, :cond_5

    .line 79
    const/16 v0, 0x271a

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 80
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 81
    :cond_5
    instance-of v0, p1, Ljava/io/IOException;

    if-eqz v0, :cond_6

    .line 82
    const/16 v0, 0x271c

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 83
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 84
    :cond_6
    if-eqz p1, :cond_8

    .line 85
    const-string v0, "network unavailable"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 86
    const/16 v0, 0x271b

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    goto :goto_0

    .line 88
    :cond_7
    const/16 v0, 0x2715

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 90
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    goto :goto_1

    .line 92
    :cond_8
    const/4 p1, 0x1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 93
    iget p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/ErrorConstants;->APIErrorHandle(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    .line 95
    :goto_1
    return-void
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .line 42
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    return v0
.end method

.method public getException()Ljava/lang/Exception;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getMsg()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public setErrorCode(I)V
    .locals 0

    .line 46
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    .line 47
    return-void
.end method

.method public setException(Ljava/lang/Exception;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    .line 38
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 99
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    const/16 v1, 0x7d

    if-eqz v0, :cond_0

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ExceptionResult{errorCode="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", msg=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x27

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", exception="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->exception:Ljava/lang/Exception;

    .line 103
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    return-object v0

    .line 106
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ExceptionResult{errorCode="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->errorCode:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", msg=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->msg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
