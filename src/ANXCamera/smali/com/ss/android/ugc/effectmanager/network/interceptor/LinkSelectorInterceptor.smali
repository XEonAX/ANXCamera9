.class public Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;
.super Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;
.source "LinkSelectorInterceptor.java"


# instance fields
.field private mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    .line 13
    return-void
.end method


# virtual methods
.method public intercept(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)Z
    .locals 1

    .line 17
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;

    if-eqz v0, :cond_0

    .line 18
    check-cast p1, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;

    .line 19
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->getType()Ljava/lang/String;

    move-result-object p1

    const-string v0, "NETWORK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 20
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateBestHost()V

    .line 23
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
