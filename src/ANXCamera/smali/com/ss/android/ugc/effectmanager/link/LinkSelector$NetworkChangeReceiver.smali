.class Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "LinkSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ugc/effectmanager/link/LinkSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NetworkChangeReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V
    .locals 0

    .line 268
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;->this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 272
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;->this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->access$000(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 273
    const-string p1, "HostSelector"

    const-string p2, "network state change"

    invoke-static {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;->this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->access$100(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;->this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->access$200(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 275
    return-void

    .line 277
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;->this$0:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->startOptHosts()V

    .line 280
    :cond_1
    return-void
.end method
