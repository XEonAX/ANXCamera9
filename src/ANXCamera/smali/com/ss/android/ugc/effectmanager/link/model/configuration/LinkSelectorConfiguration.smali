.class public Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;
.super Ljava/lang/Object;
.source "LinkSelectorConfiguration.java"


# static fields
.field public static final MS_OF_ONE_MIN:I = 0xea60

.field public static final MS_OF_ONE_SEC:I = 0x3e8


# instance fields
.field private mContext:Landroid/content/Context;

.field private mEnableLinkSelector:Z

.field private mIsLazy:Z

.field private mIsNetworkChangeMonitor:Z

.field private mOriginHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;"
        }
    .end annotation
.end field

.field private mRepeatTime:I

.field private mSpeedApi:Ljava/lang/String;

.field private mSpeedTimeOut:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/16 v0, 0x7d0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    .line 47
    const/4 v0, 0x2

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 49
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mContext:Landroid/content/Context;

    .line 50
    const-string v1, "/ies/speed/"

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    .line 51
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    .line 52
    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    .line 53
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mContext:Landroid/content/Context;

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

    .line 74
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mOriginHosts:Ljava/util/List;

    return-object v0
.end method

.method public getRepeatTime()I
    .locals 1

    .line 66
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    return v0
.end method

.method public getSpeedApi()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    return-object v0
.end method

.method public getSpeedTimeOut()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    return v0
.end method

.method public isEnableLinkSelector()Z
    .locals 1

    .line 70
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    return v0
.end method

.method public isLazy()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    return v0
.end method

.method public isNetworkChangeMonitor()Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    return v0
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mContext:Landroid/content/Context;

    .line 114
    return-void
.end method

.method public setLazy(Z)V
    .locals 1

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 89
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    .line 90
    return-void
.end method

.method public setNetworkChangeMonitor(Z)V
    .locals 1

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 98
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    .line 99
    return-void
.end method

.method public setOriginHosts(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;)V"
        }
    .end annotation

    .line 122
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 123
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mOriginHosts:Ljava/util/List;

    .line 124
    return-void
.end method

.method public setRepeatTime(I)V
    .locals 1

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 108
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    .line 109
    return-void
.end method

.method public setSpeedApi(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 118
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setSpeedTimeOut(I)V
    .locals 1

    .line 102
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 103
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    .line 104
    return-void
.end method
