.class public Lcom/ss/android/ugc/effectmanager/link/LinkSelector;
.super Ljava/lang/Object;
.source "LinkSelector.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HostSelector"

.field private static final TASK_FLAG:Ljava/lang/String; = "SpeedMeasure"


# instance fields
.field private volatile isRun:Z

.field private mBestHostUrl:Ljava/lang/String;

.field private mBlackRoom:Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;

.field private mContext:Landroid/content/Context;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mHandler:Landroid/os/Handler;

.field private mIsEnableLinkSelector:Z

.field private mIsLazy:Z

.field private mIsNetworkChangeMonitor:Z

.field private mOptedHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation
.end field

.field private mOriginHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

.field private mRepeatTime:I

.field private mSpeedApi:Ljava/lang/String;

.field private mSpeedTimeOut:I


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isRun:Z

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    .line 74
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;

    invoke-direct {v0, p0}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;-><init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mHandler:Landroid/os/Handler;

    .line 75
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 76
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBlackRoom:Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;

    .line 77
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 78
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Z
    .locals 0

    .line 31
    iget-boolean p0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsEnableLinkSelector:Z

    return p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Ljava/util/List;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)Z
    .locals 0

    .line 31
    iget-boolean p0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsLazy:Z

    return p0
.end method

.method private lockToBlackRoom(Ljava/lang/String;)V
    .locals 3

    .line 179
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, " "

    const-string v2, "%20"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object p1

    .line 180
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 182
    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->hostEquals(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 183
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBlackRoom:Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;

    invoke-virtual {p1, v1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->lock(Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;)V

    .line 184
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateBestHost()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    goto :goto_1

    .line 187
    :cond_0
    goto :goto_0

    .line 190
    :cond_1
    :goto_1
    goto :goto_2

    .line 188
    :catch_0
    move-exception p1

    .line 189
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 193
    :goto_2
    return-void
.end method

.method private setNetworkChangeOpt()V
    .locals 3

    .line 218
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsNetworkChangeMonitor:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLinkSelectorAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 220
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    invoke-direct {v0, p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;-><init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    .line 221
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 222
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 223
    return-void

    .line 219
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mReceiver:Lcom/ss/android/ugc/effectmanager/link/LinkSelector$NetworkChangeReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 302
    :cond_0
    return-void
.end method

.method public getBestHostUrl()Ljava/lang/String;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBestHostUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getOriginHosts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    return-object v0
.end method

.method public getRepeatTime()I
    .locals 1

    .line 104
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mRepeatTime:I

    return v0
.end method

.method public getSpeedApi()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mSpeedApi:Ljava/lang/String;

    return-object v0
.end method

.method public getSpeedTimeOut()I
    .locals 1

    .line 100
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mSpeedTimeOut:I

    return v0
.end method

.method public handleMsg(Landroid/os/Message;)V
    .locals 3

    .line 234
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x1f

    if-ne v0, v1, :cond_1

    .line 235
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;

    if-eqz v0, :cond_1

    .line 236
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;

    .line 238
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->getExceptionResult()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v0

    .line 239
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/task/result/HostListStatusUpdateTaskResult;->getHosts()Ljava/util/List;

    move-result-object p1

    .line 240
    if-nez v0, :cond_0

    .line 241
    const-string v0, "HostSelector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "on sort done = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " selector:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " thread:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 243
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 244
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateBestHost()V

    .line 246
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isRun:Z

    .line 249
    :cond_1
    return-void
.end method

.method public isLazy()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsLazy:Z

    return v0
.end method

.method public isLinkSelectorAvailable()Z
    .locals 2

    .line 108
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsEnableLinkSelector:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isNetworkAvailable()Z
    .locals 3

    .line 256
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 258
    :cond_0
    nop

    .line 259
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 260
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 261
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1

    .line 262
    :catch_0
    move-exception v0

    .line 265
    return v1
.end method

.method public linkSelectorConfigure(Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;)V
    .locals 2
    .param p1    # Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 85
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getSpeedTimeOut()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mSpeedTimeOut:I

    .line 86
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getRepeatTime()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mRepeatTime:I

    .line 87
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->isEnableLinkSelector()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsEnableLinkSelector:Z

    .line 88
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mContext:Landroid/content/Context;

    .line 89
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getSpeedApi()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mSpeedApi:Ljava/lang/String;

    .line 90
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 91
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 92
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getItemName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBestHostUrl:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->isNetworkChangeMonitor()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsNetworkChangeMonitor:Z

    .line 94
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->isLazy()Z

    move-result p1

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mIsLazy:Z

    .line 95
    const-string p1, "HostSelector"

    const-string v0, "link selector configure"

    invoke-static {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->setNetworkChangeOpt()V

    .line 97
    return-void
.end method

.method public onApiError(Ljava/lang/String;)V
    .locals 3

    .line 286
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isNetworkAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 287
    :cond_0
    const-string v0, "HostSelector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "on link api error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->lockToBlackRoom(Ljava/lang/String;)V

    .line 289
    return-void
.end method

.method public onApiSuccess(Ljava/lang/String;)V
    .locals 3

    .line 295
    const-string v0, "HostSelector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "on link api success:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public startOptHosts()V
    .locals 4

    .line 199
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLinkSelectorAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isRun:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isNetworkAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 202
    :cond_0
    const-string v0, "HostSelector"

    const-string v1, "hosts measure start"

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    new-instance v1, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mHandler:Landroid/os/Handler;

    const-string v3, "SpeedMeasure"

    invoke-direct {v1, p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;-><init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;Landroid/os/Handler;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 205
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isRun:Z

    .line 206
    return-void

    .line 200
    :cond_1
    :goto_0
    return-void
.end method

.method public updateBestHost()V
    .locals 5

    .line 152
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLinkSelectorAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 153
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getItemName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBestHostUrl:Ljava/lang/String;

    .line 154
    return-void

    .line 156
    :cond_0
    const/4 v0, 0x0

    .line 157
    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 158
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOptedHosts:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 159
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBlackRoom:Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;

    invoke-virtual {v4, v3}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->checkHostAvailable(Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 160
    nop

    .line 161
    nop

    .line 164
    move-object v0, v3

    goto :goto_1

    .line 157
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 164
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 165
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    .line 166
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->startOptHosts()V

    .line 168
    :cond_3
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getItemName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mBestHostUrl:Ljava/lang/String;

    .line 169
    return-void
.end method

.method public updateHosts(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;Z)V"
        }
    .end annotation

    .line 137
    if-eqz p2, :cond_0

    .line 138
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 139
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 141
    :cond_0
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->mOriginHosts:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 143
    :goto_0
    return-void
.end method
