.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "WriteTagTaskResult.java"


# instance fields
.field private mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mId:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 13
    return-void
.end method


# virtual methods
.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    .line 21
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->mId:Ljava/lang/String;

    .line 29
    return-void
.end method
