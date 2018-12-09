.class Lcom/ss/android/ugc/effectmanager/EffectManager$2;
.super Ljava/lang/Object;
.source "EffectManager.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/EffectManager;->initRepository()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$2;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public updateEffectListStatus(Ljava/lang/String;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$2;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;)Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->updateEffectListDownloadStatus(Ljava/lang/String;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 173
    return-void
.end method

.method public updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager$2;->this$0:Lcom/ss/android/ugc/effectmanager/EffectManager;

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;)Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->updateEffectDownloadStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 168
    return-void
.end method
