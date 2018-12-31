.class public Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.super Ljava/lang/Object;
.source "BaseTaskResult.java"


# instance fields
.field private taskID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTaskID()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;->taskID:Ljava/lang/String;

    return-object v0
.end method

.method public setTaskID(Ljava/lang/String;)V
    .locals 0

    .line 11
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;->taskID:Ljava/lang/String;

    .line 12
    return-void
.end method
