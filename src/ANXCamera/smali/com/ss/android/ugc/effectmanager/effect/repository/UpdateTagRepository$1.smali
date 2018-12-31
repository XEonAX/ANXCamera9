.class Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;
.super Ljava/lang/Object;
.source "UpdateTagRepository.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->requestWriteTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

.field final synthetic val$listener:Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;->this$0:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;->val$listener:Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinally()V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;->val$listener:Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;->val$listener:Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    .line 54
    :cond_0
    return-void
.end method
