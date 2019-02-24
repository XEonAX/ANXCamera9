.class Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;
.super Ljava/lang/Object;
.source "TaskManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/common/TaskManager;

.field final synthetic val$task:Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/common/TaskManager;Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;->this$0:Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;->val$task:Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/TaskManager$1;->val$task:Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;->execute()V

    .line 75
    return-void
.end method
