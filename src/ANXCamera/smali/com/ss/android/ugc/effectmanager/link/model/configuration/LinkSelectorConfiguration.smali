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

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/16 v0, 0x7d0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    .line 48
    const/4 v0, 0x2

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 50
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mContext:Landroid/content/Context;

    .line 51
    const-string v1, "/ies/speed/"

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    .line 52
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    .line 53
    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    .line 54
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .line 81
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

    .line 75
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mOriginHosts:Ljava/util/List;

    return-object v0
.end method

.method public getRepeatTime()I
    .locals 1

    .line 67
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    return v0
.end method

.method public getSpeedApi()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    return-object v0
.end method

.method public getSpeedTimeOut()I
    .locals 1

    .line 63
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    return v0
.end method

.method public isEnableLinkSelector()Z
    .locals 1

    .line 71
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    return v0
.end method

.method public isLazy()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    return v0
.end method

.method public isNetworkChangeMonitor()Z
    .locals 1

    .line 94
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    return v0
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 114
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mContext:Landroid/content/Context;

    .line 115
    return-void
.end method

.method public setLazy(Z)V
    .locals 1

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 90
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsLazy:Z

    .line 91
    return-void
.end method

.method public setNetworkChangeMonitor(Z)V
    .locals 1

    .line 98
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 99
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mIsNetworkChangeMonitor:Z

    .line 100
    return-void
.end method

.method public setOriginHosts(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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

    .line 123
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 124
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mOriginHosts:Ljava/util/List;

    .line 125
    return-void
.end method

.method public setRepeatTime(I)V
    .locals 1

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 109
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mRepeatTime:I

    .line 110
    return-void
.end method

.method public setSpeedApi(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 119
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedApi:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setSpeedTimeOut(I)V
    .locals 1

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mEnableLinkSelector:Z

    .line 104
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->mSpeedTimeOut:I

    .line 105
    return-void
.end method
